
//#include "pic.h"
//#include "pic16f685.h"
#include "syscfg.h"


#include "LT8988drv.h"
#include "ble_8988.h"

#define LED			RA6
#define LED2		RA7


#ifndef _XTAL_FREQ
// Unless already defined assume 4MHz system frequency
// This definition is required to calibrate __delay_us() and __delay_ms()
#define _XTAL_FREQ 4000000
#endif

extern unsigned char _RegH, _RegL;

// 与状态机相关参数
enum LT8988_STATUS {SCAN, RXBLE, RX625};
enum LT8988_STATUS  lt8988_work_sta;  // 状态机

unsigned short rxtimeout;  // RX状态超时计数
unsigned char rxflag;  // RX接收到数据标志

// BLE PDU	=  TYPE(2)	+MAC(6)+ADSTRUCTE(n)+CRC(3)
//unsigned char PDUDATA[27]={0x02,0x16,  0x00,0x00,0x00,0x00,0x00,0x00,   0x0f,0xFF, 0x05,0x20, 0x03,0x00,0x01,0x48,0x1c,0x72,  0x01,0xbe,0x00,0xff,0x00, 0xb2,		0x00,0x00,0x00};;
unsigned char PDUDATA[26] = {0X02, 0X15,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x02, 0x01, 0x05, 0x03, 0x19, 0xc1, 0x03, 0x07, 0x16, 0x11, 0x11, 0x11, 0xb0, 0xb0, 0xb0,   0x00, 0x00, 0x00};
void  lt8988_ble_tx(void);
void  lt8988_ble_rx(void);
unsigned char RXADVDATA[13]; 	// len>10(user)+3(sys)



unsigned char ledsta; // 存放当前命令序列



//*****************************************
//**************中断处理*******************
void interrupt ISR(void)//PIC_HI-TECH使用
{
    GIE = 0;
    //if(INTE && INTF)//
    //{
    //  INTF = 0;  //清PA2 INT 标志位
    //}
    if(TMR1IE && TMR1IF)//
    {
        TMR1IF = 0;
        TMR1L = 0X2F;  //(FFFF-F82F)*0.125uS=1000uS
        TMR1H = 0XF8;

        rxtimeout++;

        if(rxtimeout > 4000) //1s未收到数据，退出接收模式，进入扫描模式SCAN
        {
            rxtimeout = 0;
            lt8988_work_sta = SCAN;

        }

    }

    GIE = 1;
}


void Init(void)
{

    //OSCCON = 0x35;      //1MHz
    //TRISA = 0x8F;		// output mode
    //WPUA4 = 1;
    //WPUA7 = 0;
    //RA7 = 0;
    //RA4 = 1;
    //RA2 = 0;

    //------------- PORT --------------
    OSCCON = 0B01110001;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
    //OSCCON = 0B01010001;//WDT 32KHZ IRCF=111=4MHZ/4=1MHZ,1US/T

    INTCON = 0;  //暂禁止所有中断
    PORTA = 0B00000000;
    TRISA = 0B00000000;//1:Input 0:Output
    PORTC = 0B00000011;
    TRISC = 0B00000000;//1:Input 0:Output

    WPUA = 0B00000111;    //禁止所有PA口上拉
    WPUC = 0B00000000;    //禁止所有PC口上拉
    OPTION = 0B10001000;//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    //Bit7(RAPU)=0 ENABLED PULL UP PA
    MSCKCON = 0B00000000;//6B->0,禁止PA4，PC5稳压输出
    //5B->0,TIMER2时钟为Fosc
    //4B->0,禁止LVR
    CMCON0 = 0B00000111; //关闭比较器，CxIN为数字IO口

    //------------- Timer --------------
    //需要在中断里重新赋初始值
    T1CON = 0B00000000; //B[5:4]=00,T2时钟分频 1:1
    //B1=0,T1时钟源选择内部时钟
    //T1SYNC=16M/4T=4M=0.25US
    TMR1L = 0XBF;  //定时2MS=>TMR1=8000*0.25US=2000US
    //初值=65535-8000=57535=>0XE0BF
    TMR1H = 0XE0;  //赋初值=>TMR1H=0XE0;TMR1L=0XBF
    TMR1IE = 1;//使能TMER1的中断
    TMR1ON = 1;//使能TMER1启动
    PEIE = 1;  //使能外设中断
    GIE = 1;   //使能全局中断

    //------------- ADC --------------
    ADCON1 = 0B00010000; //DIVS=0,时钟选FOSC
    //ADCS[2:0]=001,分频FOSC/8
    ADCON1 = 0B01010000; //DIVS=0,时钟选FOSC
    //ADCS[2:0]=101,分频FOSC/16
    ADCON0 = 0B10001001; //ADFM=1,结果右对齐
    //VCFG=00,参考电压VDD
    //CHS=010,选择AN2通道
    //ADON=1,ADC使能
    ANSEL = 0;//B00111111;   //使能AN2为模拟输入
}



/** demonstration of various built-in delay mechanisms */
void main(void)
{
    Init();

    LT8988_INIT();
    write_sync();



    // 测试模式  循环广播 PDU 数据
    //while(1){

    //LED=!LED;
    //LED2=!LED2;

    //8988_ble_tx_enable();
    //8988_ble_tx_start(37,PDUDATA,26);
    //DelayMs(3);
    //8988_ble_tx_start(38,PDUDATA,26);
    //DelayMs(3);
    //8988_ble_tx_start(39,PDUDATA,26);
    //DelayMs(3);

    //}



    lt8988_work_sta = SCAN;

    while(1)
    {

        if(lt8988_work_sta == SCAN) //扫描到数据后，跳出扫描模式，进入对应接收模式
        {

            rxflag = 0;

            lt8988_ble_tx(); // 播报身份信息1
            lt8988_ble_rx();
            if(rxflag == 1) // ble设备正在工作
            {
                rxflag = 0;
                rxtimeout = 0;
                lt8988_work_sta = RXBLE; // 进入接收模式 ===>

            }

        }
        else if(lt8988_work_sta == RXBLE)
        {
            // 接收超时自动退出当前接收模式
            lt8988_ble_rx();

        }


    }



}





//*********************************

// BLE 操作相关
//*********************************


// 三个频点 依次广播
void  lt8988_ble_tx(void)
{

    LT8988_ble_tx_enable();
    LT8988_ble_tx_start(37, PDUDATA, 26);
    DelayMs(3);
    LT8988_ble_tx_start(38, PDUDATA, 26);
    DelayMs(3);
    LT8988_ble_tx_start(39, PDUDATA, 26);
    DelayMs(3);
    LED = !LED; // RA6 闪烁

}


// 扫描单个频点数据 约占用时长
void ble_chanel_scan(unsigned char chanel)
{
    unsigned char i;

    LT8988_ble_rx_start(chanel);  //启动当前频点接收

    for(i = 0; i < 8; i++)
    {
        LT8988_ReadReg(3); // 读取接收标志位
        if(_RegH & 0x20)
        {
            LT8988_read_ble_fifo(chanel, RXADVDATA, 13); // 读取数据到数组

            if(check_sum(RXADVDATA, 10) == 1) // 计算校验和
            {
                // 命令认证与解析￥￥￥
                if(RXADVDATA[5] == 0x02)
                {
                    LED2 = 1;

                }
                else if(RXADVDATA[5] == 0x01)
                {
                    LED2 = 0;

                }
                else if(RXADVDATA[5] == 0x04)
                {

                    if(	ledsta != RXADVDATA[6])
                    {
                        LED2 = !LED2;
                    }
                }
                ledsta = RXADVDATA[6]; // 命令序列刷新
            }

            i = 9; //跳出当前频点

            rxflag = 1; // rx接收标志置位	控制状态切由scan换到BLERX
            rxtimeout = 0; // 超时清零	   超时退出BLERX

        }
        else
        {
            DelayMs(2);
        }


    }

}


// 连续扫描三个频点
void  lt8988_ble_rx(void)
{

    unsigned char i;

    LT8988_ble_rx_enable();

    for(i = 0; i < 5; i++) // 占用时长 16ms*3*i=240ms
    {
        ble_chanel_scan(37);
        ble_chanel_scan(38);
        ble_chanel_scan(39);
    }

}




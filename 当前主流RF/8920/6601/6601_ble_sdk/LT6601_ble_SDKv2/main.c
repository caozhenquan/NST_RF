
//#include "pic.h"
//#include "pic16f685.h"
#include "syscfg.h"
#include "LT89XXdrvSPI.h"
#include "rx_ble.h"
#define LED		RC5
#define LED2	RC4
//#define Frequency 70 //0-80

#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 4000000
#endif

#define DATALENTH 26
#define RXADVDATALENTH 29   // 移动端回包长度决定



// BLE PDU	=  TYPE(2)	+MAC(6)+ADSTRUCTE(n)+CRC(3)
//unsigned char PDUDATA[27]={0x02,0x16,  0x00,0x00,0x00,0x00,0x00,0x00,   0x0f,0xFF, 0x05,0x20, 0x03,0x00,0x01,0x48,0x1c,0x72,  0x01,0xbe,0x00,0xff,0x00, 0xb2,		0x00,0x00,0x00};;
unsigned char PDUDATA[26] = {0X02, 0X15,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x02, 0x01, 0x05, 0x03, 0x19, 0xc1, 0x03, 0x07, 0x16, 0x11, 0x11, 0x11, 0xb0, 0xb0, 0xb0,   0x00, 0x00, 0x00};
unsigned char RXADVDATA[RXADVDATALENTH];

// 与状态机相关参数
enum LT8920_STATUS {SCAN, RXBLE, RX625};
enum LT8920_STATUS  LT8920_work_sta;  // 状态机

unsigned short rxtimeout;  // RX状态超时计数
unsigned char rxflag;  // RX接收到数据标志

void  LT8920_ble_tx(void);
void  LT8920_ble_rx(void);

unsigned char ledsta; // 存放当前命令序列
unsigned char check_sum(unsigned char *buf, unsigned char len);



//bit BZ,CtrlState/*0:Pairing 1:Normal*/;


//*****************************************
//**************中断处理*******************
unsigned char GEN,T250uS;
void interrupt ISR(void)//PIC_HI-TECH使用
{
  GIE=0;
  //if(INTE && INTF)//
  //{
  //  INTF = 0;  //清PA2 INT 标志位
  //}
	if(TMR1IE && TMR1IF)//
	{
		TMR1IF = 0;
		TMR1L = 0X2F;  //(FFFF-F82F)*0.125uS=1000uS
		TMR1H = 0XF8;  
		T250uS++;
		

		rxtimeout++;

        if(rxtimeout > 4000) //1s未收到数据，退出接收模式，进入扫描模式SCAN
        {
            rxtimeout = 0;
            LT8920_work_sta = SCAN;

        }

		

	}
  GIE=1;
}


void Init(void){

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
	TRISA = 0B01011111;//1:Input 0:Output	
	PORTC = 0B00000000; 
	TRISC = 0B00000011;//1:Input 0:Output	
	
	WPUA = 0;    //禁止所有PA口上拉
	WPUC = 0;    //禁止所有PC口上拉
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
	PEIE=1;    //使能外设中断
	GIE = 1;   //使能全局中断	
	
	//------------- ADC --------------
	//ADCON1 = 0B00010000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=001,分频FOSC/8
	ADCON1 = 0B01010000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=101,分频FOSC/16
	ADCON0 = 0B10001001; //ADFM=1,结果右对齐                     
					   //VCFG=00,参考电压VDD
					   //CHS=010,选择AN2通道
					   //ADON=1,ADC使能
	ANSEL = 0;//B00111111;   //使能AN2为模拟输入	
}


//*****************************************



/** demonstration of various built-in delay mechanisms */
void main(void)
{
	unsigned char I;
	Init(); 
	LT89XX_INIT();
	LT89xx_ModeSet(LT8920_SPAN_1M);
	//write_sync();	

    LT8920_work_sta = SCAN;

    while(1)
    {


        if(LT8920_work_sta == SCAN) //扫描到数据后，跳出扫描模式，进入对应接收模式
        {

            rxflag = 0;

            LT8920_ble_tx(); // 播报身份信息1
            LT8920_ble_rx();
            if(rxflag == 1) // ble设备正在工作
            {
                rxflag = 0;
                rxtimeout = 0;
                LT8920_work_sta = RXBLE; // 进入接收模式 ===>

            }

        }
        else if(LT8920_work_sta == RXBLE)
        {
            // 接收超时自动退出当前接收模式
            LT8920_ble_rx();

        }


    }	
	

		
}




//-----------------------------------------------------//


// 三个频点 依次广播
void  LT8920_ble_tx(void)
{

    LT8920_ble_tx_enable();
    LT8920_ble_tx_start(37, PDUDATA, 26);
	DELAY_MS(4);
    LT8920_ble_tx_start(38, PDUDATA, 26);
	DELAY_MS(4);
    LT8920_ble_tx_start(39, PDUDATA, 26);
	DELAY_MS(4);
    LED2 = !LED2; //

}

// 扫描单个频点数据 约占用时长
void ble_chanel_scan(unsigned char chanel)
{
    unsigned char i;

    LT8920_ble_rx_start(chanel);  //启动当前频点接收
	//  DELAY_MS(1);

    for(i = 0; i < 8; i++)
    {
	LT_ReadReg(48);

	if(RegL&0X40){	//PKT=1	
              
		LT8920_read_ble_fifo(chanel, RXADVDATA,RXADVDATALENTH);
		
		if((RXADVDATA[17]==0x11)&&(RXADVDATA[18]==0x11)&&(RXADVDATA[19]==0x11)){ // 设备ID认证


            if(check_sum(RXADVDATA+17, 10) == 1) // 数据校验


            {

                // 命令认证与解析￥￥￥
                if(RXADVDATA[5+17] == 0x02)
                {
                    LED = 1;

                }
                else if(RXADVDATA[5+17] == 0x01)
                {
                    LED = 0;

                }
                else if(RXADVDATA[5+17] == 0x04)
                {

                    if(	ledsta != RXADVDATA[6+17])
                    {
                        LED = !LED;
                    }
                }
                ledsta = RXADVDATA[6+17]; // 命令序列刷新
				
				
				
            }

            i = 9; //跳出当前频点

            rxflag = 1; // rx接收标志置位	控制状态切由scan换到BLERX
            rxtimeout = 0; // 超时清零	   超时退出BLERX
		}
        }
        else
        {
            DELAY_MS(1);
        }


    }

}


// 连续扫描三个频点
void  LT8920_ble_rx(void)
{

    unsigned char i;

    LT8920_ble_rx_enable();

    for(i = 0; i < 5; i++) // 占用时长 16ms*3*i=240ms
    {
        ble_chanel_scan(37);
        ble_chanel_scan(38);
        ble_chanel_scan(39);
    }

}


// 校验和审查 通过返回1 失败返回0
unsigned char check_sum(unsigned char *buf, unsigned char len)
{

    unsigned char sum, i;
    sum = 0;
    i = 0;
    for(i = 0; i < len - 1; i++)
    {

        sum = buf[i] + sum;
    }
    if(buf[len - 1] == sum)
    {
        return 1;
    }
    return 0;
}






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

// ��״̬����ز���
enum LT8988_STATUS {SCAN, RXBLE, RX625};
enum LT8988_STATUS  lt8988_work_sta;  // ״̬��

unsigned short rxtimeout;  // RX״̬��ʱ����
unsigned char rxflag;  // RX���յ����ݱ�־

// BLE PDU	=  TYPE(2)	+MAC(6)+ADSTRUCTE(n)+CRC(3)
//unsigned char PDUDATA[27]={0x02,0x16,  0x00,0x00,0x00,0x00,0x00,0x00,   0x0f,0xFF, 0x05,0x20, 0x03,0x00,0x01,0x48,0x1c,0x72,  0x01,0xbe,0x00,0xff,0x00, 0xb2,		0x00,0x00,0x00};;
unsigned char PDUDATA[26] = {0X02, 0X15,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x02, 0x01, 0x05, 0x03, 0x19, 0xc1, 0x03, 0x07, 0x16, 0x11, 0x11, 0x11, 0xb0, 0xb0, 0xb0,   0x00, 0x00, 0x00};
void  lt8988_ble_tx(void);
void  lt8988_ble_rx(void);
unsigned char RXADVDATA[13]; 	// len>10(user)+3(sys)



unsigned char ledsta; // ��ŵ�ǰ��������



//*****************************************
//**************�жϴ���*******************
void interrupt ISR(void)//PIC_HI-TECHʹ��
{
    GIE = 0;
    //if(INTE && INTF)//
    //{
    //  INTF = 0;  //��PA2 INT ��־λ
    //}
    if(TMR1IE && TMR1IF)//
    {
        TMR1IF = 0;
        TMR1L = 0X2F;  //(FFFF-F82F)*0.125uS=1000uS
        TMR1H = 0XF8;

        rxtimeout++;

        if(rxtimeout > 4000) //1sδ�յ����ݣ��˳�����ģʽ������ɨ��ģʽSCAN
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

    INTCON = 0;  //�ݽ�ֹ�����ж�
    PORTA = 0B00000000;
    TRISA = 0B00000000;//1:Input 0:Output
    PORTC = 0B00000011;
    TRISC = 0B00000000;//1:Input 0:Output

    WPUA = 0B00000111;    //��ֹ����PA������
    WPUC = 0B00000000;    //��ֹ����PC������
    OPTION = 0B10001000;//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    //Bit7(RAPU)=0 ENABLED PULL UP PA
    MSCKCON = 0B00000000;//6B->0,��ֹPA4��PC5��ѹ���
    //5B->0,TIMER2ʱ��ΪFosc
    //4B->0,��ֹLVR
    CMCON0 = 0B00000111; //�رձȽ�����CxINΪ����IO��

    //------------- Timer --------------
    //��Ҫ���ж������¸���ʼֵ
    T1CON = 0B00000000; //B[5:4]=00,T2ʱ�ӷ�Ƶ 1:1
    //B1=0,T1ʱ��Դѡ���ڲ�ʱ��
    //T1SYNC=16M/4T=4M=0.25US
    TMR1L = 0XBF;  //��ʱ2MS=>TMR1=8000*0.25US=2000US
    //��ֵ=65535-8000=57535=>0XE0BF
    TMR1H = 0XE0;  //����ֵ=>TMR1H=0XE0;TMR1L=0XBF
    TMR1IE = 1;//ʹ��TMER1���ж�
    TMR1ON = 1;//ʹ��TMER1����
    PEIE = 1;  //ʹ�������ж�
    GIE = 1;   //ʹ��ȫ���ж�

    //------------- ADC --------------
    ADCON1 = 0B00010000; //DIVS=0,ʱ��ѡFOSC
    //ADCS[2:0]=001,��ƵFOSC/8
    ADCON1 = 0B01010000; //DIVS=0,ʱ��ѡFOSC
    //ADCS[2:0]=101,��ƵFOSC/16
    ADCON0 = 0B10001001; //ADFM=1,����Ҷ���
    //VCFG=00,�ο���ѹVDD
    //CHS=010,ѡ��AN2ͨ��
    //ADON=1,ADCʹ��
    ANSEL = 0;//B00111111;   //ʹ��AN2Ϊģ������
}



/** demonstration of various built-in delay mechanisms */
void main(void)
{
    Init();

    LT8988_INIT();
    write_sync();



    // ����ģʽ  ѭ���㲥 PDU ����
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

        if(lt8988_work_sta == SCAN) //ɨ�赽���ݺ�����ɨ��ģʽ�������Ӧ����ģʽ
        {

            rxflag = 0;

            lt8988_ble_tx(); // ���������Ϣ1
            lt8988_ble_rx();
            if(rxflag == 1) // ble�豸���ڹ���
            {
                rxflag = 0;
                rxtimeout = 0;
                lt8988_work_sta = RXBLE; // �������ģʽ ===>

            }

        }
        else if(lt8988_work_sta == RXBLE)
        {
            // ���ճ�ʱ�Զ��˳���ǰ����ģʽ
            lt8988_ble_rx();

        }


    }



}





//*********************************

// BLE �������
//*********************************


// ����Ƶ�� ���ι㲥
void  lt8988_ble_tx(void)
{

    LT8988_ble_tx_enable();
    LT8988_ble_tx_start(37, PDUDATA, 26);
    DelayMs(3);
    LT8988_ble_tx_start(38, PDUDATA, 26);
    DelayMs(3);
    LT8988_ble_tx_start(39, PDUDATA, 26);
    DelayMs(3);
    LED = !LED; // RA6 ��˸

}


// ɨ�赥��Ƶ������ Լռ��ʱ��
void ble_chanel_scan(unsigned char chanel)
{
    unsigned char i;

    LT8988_ble_rx_start(chanel);  //������ǰƵ�����

    for(i = 0; i < 8; i++)
    {
        LT8988_ReadReg(3); // ��ȡ���ձ�־λ
        if(_RegH & 0x20)
        {
            LT8988_read_ble_fifo(chanel, RXADVDATA, 13); // ��ȡ���ݵ�����

            if(check_sum(RXADVDATA, 10) == 1) // ����У���
            {
                // ������֤�����������
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
                ledsta = RXADVDATA[6]; // ��������ˢ��
            }

            i = 9; //������ǰƵ��

            rxflag = 1; // rx���ձ�־��λ	����״̬����scan����BLERX
            rxtimeout = 0; // ��ʱ����	   ��ʱ�˳�BLERX

        }
        else
        {
            DelayMs(2);
        }


    }

}


// ����ɨ������Ƶ��
void  lt8988_ble_rx(void)
{

    unsigned char i;

    LT8988_ble_rx_enable();

    for(i = 0; i < 5; i++) // ռ��ʱ�� 16ms*3*i=240ms
    {
        ble_chanel_scan(37);
        ble_chanel_scan(38);
        ble_chanel_scan(39);
    }

}




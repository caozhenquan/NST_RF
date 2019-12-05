
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
#define RXADVDATALENTH 29   // �ƶ��˻ذ����Ⱦ���



// BLE PDU	=  TYPE(2)	+MAC(6)+ADSTRUCTE(n)+CRC(3)
//unsigned char PDUDATA[27]={0x02,0x16,  0x00,0x00,0x00,0x00,0x00,0x00,   0x0f,0xFF, 0x05,0x20, 0x03,0x00,0x01,0x48,0x1c,0x72,  0x01,0xbe,0x00,0xff,0x00, 0xb2,		0x00,0x00,0x00};;
unsigned char PDUDATA[26] = {0X02, 0X15,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x02, 0x01, 0x05, 0x03, 0x19, 0xc1, 0x03, 0x07, 0x16, 0x11, 0x11, 0x11, 0xb0, 0xb0, 0xb0,   0x00, 0x00, 0x00};
unsigned char RXADVDATA[RXADVDATALENTH];

// ��״̬����ز���
enum LT8920_STATUS {SCAN, RXBLE, RX625};
enum LT8920_STATUS  LT8920_work_sta;  // ״̬��

unsigned short rxtimeout;  // RX״̬��ʱ����
unsigned char rxflag;  // RX���յ����ݱ�־

void  LT8920_ble_tx(void);
void  LT8920_ble_rx(void);

unsigned char ledsta; // ��ŵ�ǰ��������
unsigned char check_sum(unsigned char *buf, unsigned char len);



//bit BZ,CtrlState/*0:Pairing 1:Normal*/;


//*****************************************
//**************�жϴ���*******************
unsigned char GEN,T250uS;
void interrupt ISR(void)//PIC_HI-TECHʹ��
{
  GIE=0;
  //if(INTE && INTF)//
  //{
  //  INTF = 0;  //��PA2 INT ��־λ
  //}
	if(TMR1IE && TMR1IF)//
	{
		TMR1IF = 0;
		TMR1L = 0X2F;  //(FFFF-F82F)*0.125uS=1000uS
		TMR1H = 0XF8;  
		T250uS++;
		

		rxtimeout++;

        if(rxtimeout > 4000) //1sδ�յ����ݣ��˳�����ģʽ������ɨ��ģʽSCAN
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

	INTCON = 0;  //�ݽ�ֹ�����ж�
	PORTA = 0B00000000; 
	TRISA = 0B01011111;//1:Input 0:Output	
	PORTC = 0B00000000; 
	TRISC = 0B00000011;//1:Input 0:Output	
	
	WPUA = 0;    //��ֹ����PA������
	WPUC = 0;    //��ֹ����PC������
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
	PEIE=1;    //ʹ�������ж�
	GIE = 1;   //ʹ��ȫ���ж�	
	
	//------------- ADC --------------
	//ADCON1 = 0B00010000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=001,��ƵFOSC/8
	ADCON1 = 0B01010000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=101,��ƵFOSC/16
	ADCON0 = 0B10001001; //ADFM=1,����Ҷ���                     
					   //VCFG=00,�ο���ѹVDD
					   //CHS=010,ѡ��AN2ͨ��
					   //ADON=1,ADCʹ��
	ANSEL = 0;//B00111111;   //ʹ��AN2Ϊģ������	
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


        if(LT8920_work_sta == SCAN) //ɨ�赽���ݺ�����ɨ��ģʽ�������Ӧ����ģʽ
        {

            rxflag = 0;

            LT8920_ble_tx(); // ���������Ϣ1
            LT8920_ble_rx();
            if(rxflag == 1) // ble�豸���ڹ���
            {
                rxflag = 0;
                rxtimeout = 0;
                LT8920_work_sta = RXBLE; // �������ģʽ ===>

            }

        }
        else if(LT8920_work_sta == RXBLE)
        {
            // ���ճ�ʱ�Զ��˳���ǰ����ģʽ
            LT8920_ble_rx();

        }


    }	
	

		
}




//-----------------------------------------------------//


// ����Ƶ�� ���ι㲥
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

// ɨ�赥��Ƶ������ Լռ��ʱ��
void ble_chanel_scan(unsigned char chanel)
{
    unsigned char i;

    LT8920_ble_rx_start(chanel);  //������ǰƵ�����
	//  DELAY_MS(1);

    for(i = 0; i < 8; i++)
    {
	LT_ReadReg(48);

	if(RegL&0X40){	//PKT=1	
              
		LT8920_read_ble_fifo(chanel, RXADVDATA,RXADVDATALENTH);
		
		if((RXADVDATA[17]==0x11)&&(RXADVDATA[18]==0x11)&&(RXADVDATA[19]==0x11)){ // �豸ID��֤


            if(check_sum(RXADVDATA+17, 10) == 1) // ����У��


            {

                // ������֤�����������
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
                ledsta = RXADVDATA[6+17]; // ��������ˢ��
				
				
				
            }

            i = 9; //������ǰƵ��

            rxflag = 1; // rx���ձ�־��λ	����״̬����scan����BLERX
            rxtimeout = 0; // ��ʱ����	   ��ʱ�˳�BLERX
		}
        }
        else
        {
            DELAY_MS(1);
        }


    }

}


// ����ɨ������Ƶ��
void  LT8920_ble_rx(void)
{

    unsigned char i;

    LT8920_ble_rx_enable();

    for(i = 0; i < 5; i++) // ռ��ʱ�� 16ms*3*i=240ms
    {
        ble_chanel_scan(37);
        ble_chanel_scan(38);
        ble_chanel_scan(39);
    }

}


// У������ ͨ������1 ʧ�ܷ���0
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





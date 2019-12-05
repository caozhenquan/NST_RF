
#include "pic.h"
#include "pic16f685.h"
#include "LT89XXdrvSPI.h"

#define LED		RC5
#define BZ_A	RC4
#define Frequency 70 //0-80

#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 4000000
#endif

unsigned char txdata[12]={0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,0xaa,0xbb,0xcc};
unsigned char rxdata[12];
bit BZ,CtrlState/*0:Pairing 1:Normal*/;


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
	LT89xx_ModeSet(LT8920_SPAN_62K);
	write_sync();


LT_WriteReg(7,0,0);
LT89xx_ModeSet(CLEAR_FIFO);
LT_WriteReg(7,0x00,Frequency|0X80);
DELAY_MS(1);

while(1){

LT_ReadReg(48);

if(RegL&0X40){	//PKT=1	
	
	if(!(RegH&0X80)){ // CRC
			if(LT_ReadBUF(50,rxdata)==12){

				LED=!LED;
			}

		}

LT_WriteReg(7,0,0);
LT89xx_ModeSet(CLEAR_FIFO);
LT_WriteReg(7,0x00,Frequency|0X80);
DELAY_MS(1);


	}

if(T250uS>200) //��ʱ 50msδ�յ�
{
// ��ʱδ���ܵ�������rx״̬
LT_WriteReg(7,0,0);
LT89xx_ModeSet(CLEAR_FIFO);
LT_WriteReg(7,0x00,Frequency|0X80);
DELAY_MS(1);

}

}




		
}


#include "LT89XXdrvSPI.h"

unsigned char RegH,RegL;



void DELAY_MS(unsigned char Tms)
{
	
	unsigned int dly;
	while(Tms)
	{
		Tms--;
		dly=650;
		while(dly)	dly--;
	}
	
}

//----------------------------------------------------------


void SPI_SendByte(unsigned char buf)
{
	unsigned char mcnt;
	for(mcnt=0;mcnt<8;mcnt++)
	{
	RF_CLK=0; 	//Bus ready;

	if(buf&0x80)   	RF_MOSI=1;
				else  	 	RF_MOSI=0;

	RF_CLK=1;	//Send bit;	

	buf<<=1;

	}
	RF_CLK=0; 	//Bus ready;
	RF_MOSI=0;	
}


unsigned char SPI_ReadByte(void)
{
	unsigned char retvalue=0;
	unsigned char mcnt;
	RF_CLK=0;		//Bus ready
	for (mcnt=0;mcnt<8;mcnt++)
	{
 	RF_CLK=1;	//Slaver Chip OutPut Data

	retvalue<<=1;
	RF_CLK=0;		//Bus ready	
 	
	
	if(RF_MISO)	retvalue|=1;
	else		retvalue&=0xfe;

	}
	RF_CLK=0;		//Bus ready	
	return retvalue;
}




void LT_ReadReg(unsigned char reg)
{
	RF_SS=0;
	SPI_SendByte(reg|0x80);	//Read MSB.7=1;	
	RegH=SPI_ReadByte(); 
	RegL=SPI_ReadByte(); 
	RF_SS=1;

}

void LT_WriteReg(unsigned char reg, unsigned char H, unsigned char L)
{
	RF_SS=0;
	SPI_SendByte(reg); 	
	SPI_SendByte(H);
	SPI_SendByte(L);
	RF_SS=1;
}



void LT_WriteBUF(unsigned char reg, unsigned char *pBuf, unsigned char len)
{
	unsigned char i;

	RF_SS=0;
	SPI_SendByte(reg); 	
	SPI_SendByte(len);	//Lenth
	for(i=0; i<len; i++)
		SPI_SendByte(pBuf[i]);


	RF_SS=1;
}

unsigned char LT_ReadBUF(unsigned char reg, unsigned char *pBuf)
{
	unsigned char i,len;

	RF_SS=0;
	SPI_SendByte(reg|0X80); 	
	len=SPI_ReadByte();
	for(i=0; i<len; i++)
	{
		pBuf[i] = SPI_ReadByte();
	}

	RF_SS=1;
	
	return len;
}

///---------------------------------------------------

#define CFG_LEN  34//+4
const unsigned char LDT8900config[CFG_LEN][3]=
{
	{0, 0x6F, 0xE0},
	{1, 0x56, 0x81},
	{2, 0x66, 0x17},
	{4, 0x9C, 0xC9},
	{5, 0x66, 0x37},
	{7, 0x00, 0x30},	//channel freq and Start/Stop Tx,Rx
	{8, 0x6C, 0x90},

	{9, 0x48, 0x00},	//0x4800(max:6dBm)

	{10, 0x7F, 0xFD},
	{11, 0x00, 0x08},	//RSSI on
	{12, 0x00, 0x00},
	{13, 0x48, 0xBD},

	{22, 0x00, 0xff},
	{23, 0x80, 0x05},
	{24, 0x00, 0x67},

	{25, 0x16, 0xdb},
	{26, 0x19, 0xE0},
	{27, 0x13, 0x00},
	
	{28, 0x18, 0x00},
	
	{32, 0x48, 0x08},

	{33, 0x3f, 0xC7},
	{34, 0x20, 0x00},
	{35, 0x03, 0x00},//auto_times=3	Scs=1 Miso=Hiz
	
	{36,0xaa, 0xaa},	//Sync Word
	{37,0xaa, 0xaa},
	{38,0xaa, 0xaa},
	{39,0xaa, 0xaa},	


	{40, 0x44, 0x02},
	{41, 0xB0, 0x00},  	//CRC_ON=1;SCRAMBLE_ON=1(DEF=0);PACK_LENGTH_EN=1;
	{42, 0xFD, 0xB0},
	{43, 0x00, 0x0F},

	{44, 0x01, 0x01},
	{45, 0x01, 0x52},	//1mbps

	{52, 0x80, 0x80},
};


void LT89XX_INIT(void)
{
	unsigned char CFG_CNT;


	while(1)
	{

		RF_RST = 0; 	DELAY_MS(10);
		RF_RST = 1; 	DELAY_MS(100);

		//RF_CLK=0;
		for(CFG_CNT=0;CFG_CNT<CFG_LEN;CFG_CNT++)
		{
			LT_WriteReg(LDT8900config[CFG_CNT][0],LDT8900config[CFG_CNT][1],LDT8900config[CFG_CNT][2]);
			//DELAY_MS(1);
		}

		LT_ReadReg(0);
		if(RegH==0x6F&&RegL==0XE0)	
			break;
	}
}


void LT89xx_ModeSet(unsigned char dat1){


    switch(dat1)
    {
   case LT8920_SLEEP:
        LT_WriteReg(7, 0x00, 0x00);
        LT_WriteReg(27, 0x13, 0x00);
        LT_WriteReg(35, 0x43, 0x00);
        break;
    case LT8920_WARKUP:
        //LT_WriteReg(0x38, 0xbc, 0xde);
		//		delay_MS(2);
       // LT_WriteReg(0x38, 0xbc, 0xdf);
        //delay_MS(1);
        break;
    case CLEAR_FIFO:
        LT_WriteReg(52, 0x80, 0x80);
        break;
    case LT8920_IDLE:
        LT_WriteReg(7, 0x00, 0x00);
        break;
    case LT8920_SPAN_1M:
        LT_WriteReg(44, 0x01, 0x01);   //
        LT_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8920_SPAN_512K:
        LT_WriteReg(44, 0x02, 0x01);   //
        LT_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8920_SPAN_250K:
        LT_WriteReg(44, 0x04, 0x01);   //
        LT_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8920_SPAN_125K:
        LT_WriteReg(44, 0x08, 0x01);     //
        LT_WriteReg(45, 0x05, 0x52);	   //
        break;
    case LT8920_SPAN_62K:
        LT_WriteReg(44, 0x10, 0x01);        //
        LT_WriteReg(45, 0x05, 0x52);	 //
        break;
    }



}

void write_sync(){
	//用户自定义
	LT_WriteReg(36, 0x33, 0x33); 
	LT_WriteReg(37, 0xaa, 0xaa);  
	LT_WriteReg(38, 0x55, 0x01); 
	LT_WriteReg(39, 0x10, 0x01);  	 
	
	
}

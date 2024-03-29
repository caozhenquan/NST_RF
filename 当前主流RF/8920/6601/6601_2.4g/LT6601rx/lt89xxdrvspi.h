#ifndef _LT8910drv_SPI_H__
#define _LT89XXdrv_SPI_H__
//user dir
#include "pic.h"
#include "pic16f685.h"


#define LT89XX_FrequencyMHz(x)	(2402-x)

#define	RF_MOSI 	RA5
#define	RF_MISO 	RA6
#define	RF_CLK  	RC3
#define	RF_SS		RC2
#define RF_RST		RA7

#define LT8920_SLEEP     0x12 //LT8920??��??��??
#define LT8920_WARKUP    0x14 //LT8920 ??D?
#define CLEAR_FIFO      0x0e //??fifo
#define LT8920_IDLE      0x13 //LT8920??��?IDLE
#define LT8920_SPAN_1M   0x15 //LT8920��??������???a1M
#define LT8920_SPAN_512K   0x16
#define LT8920_SPAN_250K   0x17 //LT8920��??������???a250K
#define LT8920_SPAN_125K   0x18 //LT8920��??������???a125K
#define LT8920_SPAN_62K   0x19 //LT8920��??������???a62.5K



extern unsigned char RegH,RegL;

void DELAY_MS(unsigned char Tms);
void LT89XX_INIT(void);
void LT_ReadReg(unsigned char reg);
void LT_WriteReg(unsigned char reg, unsigned char H, unsigned char L);
void LT_WriteBUF(unsigned char reg, unsigned char *pBuf, unsigned char len);
unsigned char LT_ReadBUF(unsigned char reg, unsigned char *pBuf);

void LT89xx_ModeSet(unsigned char dat1);
void write_sync();
//#define SYNC_TEST

#endif
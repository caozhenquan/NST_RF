#ifndef _LT8910drv_SPI_H__
#define _LT89XXdrv_SPI_H__
//user dir
//#include "pic.h"
//#include "pic16f685.h"
#include "syscfg.h"


#define LT89XX_FrequencyMHz(x)	(2402-x)

#define	RF_MOSI 	RA5
#define	RF_MISO 	RA6
#define	RF_CLK  	RC3
#define	RF_SS		RC2
#define RF_RST		RA7

#define LT8920_SLEEP     0x12 //LT8920??ии??бе??
#define LT8920_WARKUP    0x14 //LT8920 ??D?
#define CLEAR_FIFO      0x0e //??fifo
#define LT8920_IDLE      0x13 //LT8920??ии?IDLE
#define LT8920_SPAN_1M   0x15 //LT8920бф??икижии???a1M
#define LT8920_SPAN_512K   0x16
#define LT8920_SPAN_250K   0x17 //LT8920бф??икижии???a250K
#define LT8920_SPAN_125K   0x18 //LT8920бф??икижии???a125K
#define LT8920_SPAN_62K   0x19 //LT8920бф??икижии???a62.5K



extern unsigned char RegH,RegL;

unsigned char LT_ReadBUF_ble(unsigned char reg, unsigned char *pBuf,unsigned char lenth);
void DELAY_MS(unsigned char Tms);
void LT89XX_INIT(void);
void LT_ReadReg(unsigned char reg);
void LT_WriteReg(unsigned char reg, unsigned char H, unsigned char L);
void LT_WriteBUF(unsigned char reg, unsigned char *pBuf, unsigned char len);
unsigned char LT_ReadBUF(unsigned char reg, unsigned char *pBuf);
void LT_WriteBUF_ble(unsigned char reg, unsigned char *pBuf, unsigned char len);
void LT89xx_ModeSet(unsigned char dat1);
void write_sync();
//#define SYNC_TEST

#endif
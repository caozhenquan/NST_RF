#ifndef __LT8988drv_H
#define __LT8988drv_H


#define LT8988_SLEEP     0x12 //LT8988??¨¨??¡¥??
#define LT8988_WARKUP    0x14 //LT8988 ??D?
#define CLEAR_FIFO      0x0e //??fifo
#define LT8988_IDLE      0x13 //LT8988??¨¨?IDLE
#define LT8988_SPAN_1M   0x15 //LT8988¡ä??¨ª¨¦¨¨???a1M
#define LT8988_SPAN_512K   0x16
#define LT8988_SPAN_250K   0x17 //LT8988¡ä??¨ª¨¦¨¨???a250K
#define LT8988_SPAN_125K   0x18 //LT8988¡ä??¨ª¨¦¨¨???a125K
#define LT8988_SPAN_62K   0x19 //LT8988¡ä??¨ª¨¦¨¨???a62.5K
#define CPU_POWER_DOWN    0x20 // MCUµôµçÄ£Ê½





extern unsigned char _RegH, _RegL;

void DelayMs(unsigned char Tms);

void LT8988_start(void);
void LT8988_stop(void);
void ack(void);
void nack(void);


void Send_Byte(unsigned char DATA);
unsigned char Read_Byte(void);
void LT8988_WriteReg(unsigned char reg, unsigned char H, unsigned char L);
void LT8988_ReadReg(unsigned char reg);
void LT8988_WriteBUF(unsigned char reg, unsigned char *pBuf, unsigned char len);
unsigned char LT8988_ReadBUF(unsigned char *pBuf);

void LT8988_INIT(void);
void LT8988_regset(unsigned char dat1);
void write_sync(void);

unsigned char check_sum(unsigned char *buf, unsigned char len);
void crc_sum(unsigned char *buf, unsigned char len);


//void LT8988_INIT(unsigned char TypeInit);

#endif

#include "LT8988drv.h"
void LT8988_ble_write_reg(unsigned char reg,unsigned char first,unsigned char second){

LT8988_WriteReg(reg, first,second);
	
};

void  ble_read_fifo(unsigned char *buf){

LT8988_ReadBUF(buf);


};

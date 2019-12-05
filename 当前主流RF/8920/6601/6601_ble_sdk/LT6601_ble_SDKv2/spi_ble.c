#include "LT89XXdrvSPI.h"
void LT8920_ble_write_reg(unsigned char reg,unsigned char first,unsigned char second){

LT_WriteReg(reg, first, second);

	
};



void LT8920_write_ble_fifo(unsigned char *txdata, unsigned char len) //len长度不能大于28
{
   LT_WriteBUF_ble(50, txdata,len);
 
}
void  ble_read_fifo(unsigned char *buf,unsigned char len){

LT_ReadBUF_ble(50, buf,len);



};


#ifndef __BLE_IIC_H__
#define __BLE_IIC_H__

void LT8920_ble_write_reg(unsigned char reg, unsigned char first, unsigned char second);
void  ble_read_fifo(unsigned char *buf,unsigned char len);
void LT8920_write_ble_fifo(unsigned char *txdata, unsigned char len);



#endif

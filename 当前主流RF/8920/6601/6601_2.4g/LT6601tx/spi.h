#ifndef __BLE_IIC_H__
#define __BLE_IIC_H__

void LT8988_ble_write_reg(unsigned char reg, unsigned char first, unsigned char second);

void  ble_read_fifo(unsigned char *buf);

#endif

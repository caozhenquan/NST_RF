
#ifndef _ble_8988_H_
#define _ble_8988_H_

#include <stdio.h>


/********************************
*描述 单字节滚码操作
*输入 滚码字节
*输出 滚码结果
**********************************/

unsigned char roll_data(unsigned char roll_in);


/***********************************
 *描述 获取crc校验值
 *输入  PDU数据
 *依赖   初始 crc 0x55 0x55 0x55
 *输出  数组的最后三字节会被填充为crc校验数值,设置数组时请预留后三字节
 * *********************************/

void get_crc(unsigned char *user_data_buf, unsigned char lenth);

/********************************
*描述 将PDU数值进行加密处理
*输入 BLE信道37/38/39 PDU数据素组 数组长度
*输出 加密后的PDU数据 到 TX_BUF
**********************************/
void LT8988_pdudata_white(unsigned char chanel, unsigned char *PDUDATA, unsigned char len);


/********************************
*描述 RXBUF数值进行解密处理
*输入 BLE信道37/38/39  RX数据数组 数组长度  ADVDATA  解码偏移参数和移动端配置有关
*输出 加密后的RXBUF数据 到 ADVDATA
**********************************/
void LT8988_ble_to_localdata(unsigned char chanel, unsigned char *ADVDATA, unsigned char len, unsigned char adv_offset);

void LT8988_ble_tx_enable(void);

void LT8988_ble_tx_start(unsigned char chanel, unsigned char *PDUDATA, unsigned char len);

void LT8988_ble_rx_enable(void);

void LT8988_ble_rx_start(unsigned char chanel);

void LT8988_ble_rx_restart(unsigned char chanel);

void LT8988_read_ble_fifo(unsigned char chanel, unsigned char *RXADVDATA, unsigned char len);

#endif

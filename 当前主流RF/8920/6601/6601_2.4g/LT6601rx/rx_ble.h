
#ifndef _ble_8988_H_
#define _ble_8988_H_

#include <stdio.h>


/********************************
*���� ���ֽڹ������
*���� �����ֽ�
*��� ������
**********************************/

unsigned char roll_data(unsigned char roll_in);


/***********************************
 *���� ��ȡcrcУ��ֵ
 *����  PDU����
 *����   ��ʼ crc 0x55 0x55 0x55
 *���  �����������ֽڻᱻ���ΪcrcУ����ֵ,��������ʱ��Ԥ�������ֽ�
 * *********************************/

void get_crc(unsigned char *user_data_buf, unsigned char lenth);

/********************************
*���� ��PDU��ֵ���м��ܴ���
*���� BLE�ŵ�37/38/39 PDU�������� ���鳤��
*��� ���ܺ��PDU���� �� TX_BUF
**********************************/
void LT8988_pdudata_white(unsigned char chanel, unsigned char *PDUDATA, unsigned char len);


/********************************
*���� RXBUF��ֵ���н��ܴ���
*���� BLE�ŵ�37/38/39  RX�������� ���鳤��  ADVDATA  ����ƫ�Ʋ������ƶ��������й�
*��� ���ܺ��RXBUF���� �� ADVDATA
**********************************/
void LT8988_ble_to_localdata(unsigned char chanel, unsigned char *ADVDATA, unsigned char len, unsigned char adv_offset);

void LT8988_ble_tx_enable(void);

void LT8988_ble_tx_start(unsigned char chanel, unsigned char *PDUDATA, unsigned char len);

void LT8988_ble_rx_enable(void);

void LT8988_ble_rx_start(unsigned char chanel);

void LT8988_ble_rx_restart(unsigned char chanel);

void LT8988_read_ble_fifo(unsigned char chanel, unsigned char *RXADVDATA, unsigned char len);

#endif

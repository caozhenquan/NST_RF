
#ifndef _ble_8988_H_
#define _ble_8988_H_

#include <stdio.h>



void LT8920_ble_tx_enable(void);

void LT8920_ble_tx_start(unsigned char chanel, unsigned char *PDUDATA, unsigned char len);

void LT8920_ble_rx_enable(void);

void LT8920_ble_rx_start(unsigned char chanel);


void LT8920_read_ble_fifo(unsigned char chanel, unsigned char *RXADVDATA, unsigned char len);

#endif

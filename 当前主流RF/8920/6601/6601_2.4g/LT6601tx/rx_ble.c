#include "rx_ble.h"
#include "spi.h"

const unsigned char  WHITE_INDEX37[] = {0x8d, 0xd2,    0x57, 0xa1, 0x3d, 0xa7, 0x66, 0xb0,  0x75, 0x31, 0x11, 0x48, 0x96, 0x77, 0xf8, 0xe3, 0x46, 0xe9, 0xab, 0xd0, 0x9e, 0x53, 0x33, 0xd8, 0xba, 0x98, 0x08, 0x24,  0xcb, 0x3b, 0xfc, 0x71, 0xa3, 0xf4, 0x55, 0x68, 0xcf, 0xa9, 0x19};
const unsigned char  WHITE_INDEX38[] = {0xd6, 0xc5,    0x44, 0x20, 0x59, 0xde, 0xe1, 0x8f,  0x1b, 0xa5, 0xaf, 0x42, 0x7b, 0x4e, 0xcd, 0x60, 0xeb, 0x62, 0x22, 0x90, 0x2c, 0xef, 0xf0, 0xc7, 0x8d, 0xd2, 0x57, 0xa1,  0x3d, 0xa7, 0x66, 0xb0, 0x75, 0x31, 0x11, 0x48, 0x96, 0x77, 0xf8};
const unsigned char  WHITE_INDEX39[] = {0x1f, 0x37,    0x4a, 0x5f, 0x85, 0xf6, 0x9c, 0x9a,  0xc1, 0xd6, 0xc5, 0x44, 0x20, 0x59, 0xde, 0xe1, 0x8f, 0x1b, 0xa5, 0xaf, 0x42, 0x7b, 0x4e, 0xcd, 0x60, 0xeb, 0x62, 0x22,  0x90, 0x2c, 0xef, 0xf0, 0xc7, 0x8d, 0xd2, 0x57, 0xa1, 0x3d, 0xa7};



/********************************
*���� ���ֽڹ������
*���� �����ֽ�
*��� ������
**********************************/

unsigned char roll_data(unsigned char roll_in)
{
    unsigned char i, roll_out = 0;

    for(i = 0; i < 8; i++)
    {
        if(roll_in & (1 << i)) roll_out |= 1 << (7 - i);
    }
    return roll_out;
}

/***********************************
 *���� ��ȡcrcУ��ֵ
 *����  PDU����
 *����   ��ʼ crc 0x55 0x55 0x55
 *���  �����������ֽڻᱻ���ΪcrcУ����ֵ,��������ʱ��Ԥ�������ֽ�
 * *********************************/

void get_crc(unsigned char *user_data_buf, unsigned char lenth)
{
    unsigned char c0, c1, c2;  //������δ���������ֵ����Ӧ��ʽ crc =0x[c0][c1][c2]
    unsigned char i, e;

    // �����û����й̶������趨�˴���ֵ, NST��ʼĬ��0x55 0x55 0x55,
    c0 = 85;
    c1 = 85;
    c2 = 85;

    // crc У�����
    for(i = 0; i < lenth - 3; i++)
    {
        e = roll_data(user_data_buf[i])^c2;

        c2 = ((e >> 6)) ^ ((e >> 7))^c1;
        c1 = ((e << 1) & 255) ^ ((e << 2) & 255) ^ ((e >> 2)) ^ ((e >> 4)) ^ ((e >> 5)) ^ ((e >> 7))^c0;
        c0 = e ^ ((e << 1) & 255) ^ ((e << 3) & 255) ^ ((e << 4) & 255) ^ ((e << 6) & 255);
    }


    // ��ȡ �ṩ��NST �û�����ʼδ���� crc��ֵ
    // printf(" NST : c0 c1 c2=%x %x %x \n",c0,c1,c2);

    // ��� crc��ֵ���û�
    user_data_buf[lenth - 1] =  roll_data(c0);
    user_data_buf[lenth - 2] =  roll_data(c1);
    user_data_buf[lenth - 3] =  roll_data(c2);

}

/********************************
*���� ��PDU��ֵ���м��ܴ���
*���� BLE�ŵ� PDU�������� ���鳤��
*��� ���ܺ��PDU���� �� TX_BUF
**********************************/

void LT8920_pdudata_white(unsigned char chanel, unsigned char *PDUDATA, unsigned char len)
{
    // ��Ӧ ������Ϣ				TYPE+PDUHEAD	ADDR(MAC)						PLOYAD(AD)
    //unsigned char  WHITE_INDEX37[]={0x8d,0xd2,    0x57,0xa1,0x3d,0xa7,0x66,0xb0,  0x75,0x31,0x11,0x48,0x96,0x77,0xf8,0xe3,0x46,0xe9,0xab,0xd0,0x9e,0x53,0x33,0xd8,0xba,0x98,  0x08,0x24,0xcb,0x3b,0xfc,0x71,0xa3,0xf4,0x55,0x68,0xcf,0xa9,0x19,0x6c,0x5d,0x4c,0x04,0x92,0xe5};
    //unsigned char  WHITE_INDEX38[]={0xd6,0xc5,    0x44,0x20,0x59,0xde,0xe1,0x8f,  0x1b,0xa5,0xaf,0x42,0x7b,0x4e,0xcd,0x60,0xeb,0x62,0x22,0x90,0x2c,0xef,0xf0,0xc7,0x8d,0xd2,  0x57,0xa1,0x3d,0xa7,0x66,0xb0,0x75,0x31,0x11,0x48,0x96,0x77,0xf8,0xe3,0x46,0xe9,0xab,0xd0,0x9e};
    //unsigned char  WHITE_INDEX39[]={0x1f,0x37,    0x4a,0x5f,0x85,0xf6,0x9c,0x9a,  0xc1,0xd6,0xc5,0x44,0x20,0x59,0xde,0xe1,0x8f,0x1b,0xa5,0xaf,0x42,0x7b,0x4e,0xcd,0x60,0xeb,  0x62,0x22,0x90,0x2c,0xef,0xf0,0xc7,0x8d,0xd2,0x57,0xa1,0x3d,0xa7,0x66,0xb0,0x75,0x31,0x11,0x48};

    unsigned char i;

    if(chanel == 37)
    {
        for(i = 0; i < len; i++)
        {
            PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX37[i];
        }

    }
    else if(chanel == 38)
    {
        for(i = 0; i < len; i++)
        {
            PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX38[i];
        }

    }
    else if(chanel == 39)
    {
        for(i = 0; i < len; i++)
        {
            PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX39[i];
        }
    }

    // ��Ϣ��ӡ
    //printf("this is chanel %d \n",chanel);
    //for(i=0;i<len;i++){
    //printf("%x ",TX_BUF[i]); //��ӡ������Ϣ
    //		}
    //	printf("\n");
    //for(i=0;i<len;i++){
    //printf("%x ",PDUDATA[i]); //��ӡ������Ϣ
    //		}
    //printf("\n----------------------\n");
}


/********************************
*���� RXBUF��ֵ���н��ܴ���
*���� BLE�ŵ� RX�������� ���鳤��  ADVDATA  ����ɵ�ƫ�Ʋ���
*��� ���ܺ��RXBUF���� �� ADVDATA
**********************************/

void LT8920_ble_to_localdata(unsigned char chanel, unsigned char *ADVDATA, unsigned char len, unsigned char adv_offset)
{

    unsigned char i;

    if(chanel == 37)
    {
        for(i = 0; i < len; i++)
        {
            ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX37[i + adv_offset];

        }
        //��APP �����ĸ���  37Ƶ��ƫ��3λ
        for(i = 3; i < len; i++)
            ADVDATA[i - 3] = ADVDATA[i];


    }
    else if(chanel == 38)
    {
        for(i = 0; i < len; i++)
        {
            ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX38[i + adv_offset];
        }
        //��APP �����ĸ���ƫ��2λ
        for(i = 2; i < len; i++)
            ADVDATA[i - 2] = ADVDATA[i];

    }
    else if(chanel == 39)
    {
        for(i = 0; i < len; i++)
        {
            ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX39[i + adv_offset];
        }
        //��APP �����ĸ��� ƫ��1λ
        for(i = 1; i < len; i++)
            ADVDATA[i - 1] = ADVDATA[i];
    }

    //����APP �������趨 // �����������ֽ�����
    for(i = 10; i < len; i++)
        ADVDATA[i] = 0;


}


/************************************/


void LT8920_write_ble_fifo(unsigned char *txdata, unsigned char len) //len���Ȳ��ܴ���28
{
    unsigned char i;
    LT8920_ble_write_reg(7, 0x00, 0x00);
    LT8920_ble_write_reg(52, 0x80, 0x80);

    LT8920_ble_write_reg(50, 0xd6, 0xbe );
    LT8920_ble_write_reg(50, 0x89 , 0x8e );
    LT8920_ble_write_reg(50, txdata[0], txdata[1]);

    for(i = 2; i < len; i = i + 2)
    {
        LT8920_ble_write_reg(50, txdata[i], txdata[i + 1]);


    }

}



void LT8920_ble_tx_enable(void)
{

    //TXͬ��������
    LT8920_ble_write_reg(32, 0x48, 0x00);
    LT8920_ble_write_reg(36, 0xAA, 0xaa);
    LT8920_ble_write_reg(39, 0xAA, 0xaa);

}

void LT8920_ble_tx_start(unsigned char chanel, unsigned char *PDUDATA, unsigned char len)
{
    get_crc(PDUDATA, len); //BLE crc����  ÿ�����ݱ����������¼���crc
    LT8920_pdudata_white(chanel, PDUDATA, len); //ble���ݰ����ܴ���   bleƵ�����
    LT8920_ble_write_reg(8, 0x6c, 0x90);

    LT8920_write_ble_fifo(PDUDATA, len);
    if(chanel == 37)
    {
        LT8920_ble_write_reg(7, 0x01, 0); // tx start
    }
    else if(chanel == 38)
    {
        LT8920_ble_write_reg(7, 0x01, 24); // tx start
    }
    else if(chanel == 39)
    {
        LT8920_ble_write_reg(7, 0x01, 78); // tx start
    }
    LT8920_pdudata_white(chanel, PDUDATA, len); //ble���ݰ����ܴ���   bleƵ�����
}


/*******************************/


void LT8920_ble_rx_enable(void)
{
    // RX ͬ��������
    LT8920_ble_write_reg(32, 0x4A, 0x00); //ͬ����������
}

void LT8920_ble_rx_start(unsigned char chanel)
{

    if(chanel == 37)
    {

        //37Ƶ��ͬ�������� ���ƶ��������й�
        LT8920_ble_write_reg(36, 0x91, 0x59);
        LT8920_ble_write_reg(39, 0x24, 0x70);
        //������Ƶ
        LT8920_ble_write_reg(7, 0, 0);
        LT8920_ble_write_reg(8, 0x6c, 0x90);
        LT8920_ble_write_reg(52, 0x80, 0x80);
        LT8920_ble_write_reg(7, 0, 0 | 0X80);
    }
    else if(chanel == 38)
    {

        //38Ƶ��ͬ�������� ���ƶ��������й�
        LT8920_ble_write_reg(7, 0, 24);
        LT8920_ble_write_reg(8, 0x6c, 0x90);
        LT8920_ble_write_reg(36, 0x49, 0x7c);
        LT8920_ble_write_reg(39, 0x8e, 0x11);
        //������Ƶ

        LT8920_ble_write_reg(52, 0x80, 0x80);
        LT8920_ble_write_reg(7, 0, 24 | 0X80);

    }
    else if(chanel == 39)
    {
        //39Ƶ��ͬ�������� ���ƶ��������й�
        LT8920_ble_write_reg(7, 0, 78);
        LT8920_ble_write_reg(8, 0x6c, 0x90);
        LT8920_ble_write_reg(36, 0x02, 0x5e);
        LT8920_ble_write_reg(39, 0xc6, 0x0f);
        //������Ƶ

        LT8920_ble_write_reg(52, 0x80, 0x80);
        LT8920_ble_write_reg(7, 0, 78 | 0X80);
    }

}



void LT8920_read_ble_fifo(unsigned char chanel, unsigned char *RXADVDATA, unsigned char len)
{

    LT8920_ble_write_reg(7, 0x00, 0x00); //IDEL
    ble_read_fifo(RXADVDATA);//rx
    if(chanel == 37)
    {
        LT8920_ble_to_localdata(chanel, RXADVDATA, len, 16);

    }
    else if(chanel == 38)
    {
        LT8920_ble_to_localdata(chanel, RXADVDATA, len, 17);
    }
    else if(chanel == 39)
    {
        LT8920_ble_to_localdata(chanel, RXADVDATA, len, 18);

    }

}

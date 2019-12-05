//#include "pic.h"
//#include "pic16f685.h"
#include "syscfg.h"
#include "LT8988drv.h"


#define CLK_H           RC0=1
#define CLK_L           RC0=0

#define DAT_H           RC1=1
#define DAT_L           RC1=0

#define CLK_read        (RC0)
#define DAT_read        (RC1)
#define DAT_Input()     TRISC1=1
#define DAT_Output()	TRISC1=0


unsigned char _RegH, _RegL;

//----------LT8988- IIC----

#if 0
void __delay(void)
{
    unsigned char i = 1;
    while (i)
    {
        i--;

        NOP();
    }

}
#else
#define __delay()     NOP()//;	NOP();	NOP()
#endif

void LT8988_start(void)
{
    DAT_H;
    CLK_H;
    //__delay();

    DAT_L;
    //__delay();

    CLK_L;
    //__delay();
}

void LT8988_stop(void) // 同比 标准iic  多出一个clk
{
    CLK_L;
    //__delay();
    DAT_L;
    //__delay();
    CLK_H;
    //__delay();
    DAT_H;
    //__delay();
    CLK_L;
    //__delay();
    CLK_H;
}


void Send_Byte(unsigned char DATA)
{
#if 0
    int i = 8;
    while (i--)
    {
        CLK_L;
        __delay();
        if (DATA & 0x80)
            DAT_H;
        else
            DAT_L;
        DATA <<= 1;
        //__delay();
        CLK_H;
        //__delay();
    }
    CLK_L;
#else
    CLK_L;
    //__delay();
    if (DATA & 0x80)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x40)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x20)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x10)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();


    CLK_L;
    //__delay();
    if (DATA & 0x8)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x4)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x2)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
    //__delay();
    if (DATA & 0x1)
        DAT_H;
    else
        DAT_L;
    // DATA <<= 1;
    //__delay();
    CLK_H;
    //__delay();

    CLK_L;
#endif



}
unsigned char Read_Byte(void)
{


    unsigned char byte = 0;

    DAT_H;
    DAT_Input();

#if 0
    unsigned char i = 8;
    while (i--)
    {
        byte <<= 1;
        CLK_L;
        __delay();//__delay();
        CLK_H;
        __delay();//__delay();
        if (DAT_read)
        {
            byte |= 0x01;
        }
        //    else
        //    {
        //      byte &= ~0x01;
        //    }

    }
    CLK_L;

#else
    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x80;
    }
    //    else
    //    {
    //      byte &=(~ 0X80);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x40;
    }
    //    else
    //    {
    //      byte &=(~ 0X40);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x20;
    }
    //    else
    //    {
    //      byte &=(~ 0X20);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x10;
    }
    //    else
    //    {
    //      byte &=(~ 0X10);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x8;
    }
    //    else
    //    {
    //      byte &=(~ 0X8);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x4;
    }
    //    else
    //    {
    //      byte &=(~ 0X4);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x2;
    }
    //    else
    //    {
    //      byte &=(~ 0X2);
    //    }

    CLK_L;
    //__delay();
    CLK_H;
    //__delay();//__delay();
    if (DAT_read)
    {
        byte |= 0x1;
    }
    //    else
    //    {
    //      byte &=(~ 0X1);
    //    }
    CLK_L;
#endif
    DAT_Output();
    return byte;
}

void ack(void)
{
    DAT_L;      //mcu to chip   ACK
    //__delay();
    CLK_H;      //9th clock
    __delay();
    CLK_L;
}
void nack(void)
{
    DAT_H;      //mcu to chip   ACK
    //__delay();
    CLK_H;      //9th clock
    __delay();
    CLK_L;
}





void LT8988_WriteReg(unsigned char reg, unsigned char H, unsigned char L)
{
    LT8988_start();
    Send_Byte(0x50);
    ack();
    Send_Byte(reg);
    ack();
    Send_Byte(H);
    ack();
    Send_Byte(L);
    ack();
    LT8988_stop();
}

void LT8988_ReadReg(unsigned char reg)
{
    LT8988_start();
    Send_Byte(0x50);
    ack();
    Send_Byte(reg | 0X80);
    ack();
    LT8988_start();
    Send_Byte(0x51);
    ack();

    _RegH = Read_Byte();
    ack();
    _RegL = Read_Byte();
    nack();
    LT8988_stop();
}


////---------8988驱动部分-----

void DelayMs(unsigned char Tms)
{

    unsigned int dly;
    while(Tms)
    {
        Tms--;
        dly = 650;
        while(dly)	dly--;
    }

}


void LT8988_INIT(void)//unsigned char TypeInit)
{


reTry:


    LT8988_WriteReg(0x38, 0x00, 0x00);    //reset?
    DelayMs(5);
    LT8988_WriteReg(0x38, 0xBC, 0xDF);
    DelayMs(5);



    // LT8988_WriteReg(7, 0x00, 0x00);// use for setting 	RF frequency and to start or stop TX /RX packets

    LT8988_WriteReg(8, 0x6C, 0x90);
    LT8988_WriteReg(9, 0x78, 0x30);

    LT8988_WriteReg(35, 0x03, 0x00);
    LT8988_WriteReg(40, 0x44, 0x02);// 容错控制
    LT8988_WriteReg(41, 0xb0, 0x00);//crc on scramble off ,1st byte packet length ,auto ack  off  //TX-E800     RX-E000
    LT8988_WriteReg(42, 0xFD, 0xB0);
    // 频偏设置
    LT8988_WriteReg(28, 0x18, 0x02);

    LT8988_WriteReg(32, 0x48, 0x00);//48 06//26;set preamble_len :3 byes.  set syncword_len:32 bits ----Reg36[15:0]

    // 带宽设置
    LT8988_WriteReg(44, 0x01, 0x01);
    LT8988_WriteReg(45, 0x05, 0x52);


    LT8988_WriteReg(52, 0x80, 0x80);


    LT8988_ReadReg(0);
    if(_RegH != 0x6F || _RegL != 0XE0)

        goto reTry;

}


void LT8988_regset(unsigned char dat1)
{
    switch(dat1)
    {
    case LT8988_SLEEP:
        LT8988_WriteReg(7, 0x00, 0x00);
        LT8988_WriteReg(27, 0x13, 0x00);
        LT8988_WriteReg(35, 0x43, 0x00);
        break;
    case LT8988_WARKUP:
        LT8988_WriteReg(0x38, 0xbc, 0xde);
        DelayMs(3);
        LT8988_WriteReg(0x38, 0xbc, 0xdf);
        DelayMs(3);
        break;
    case CLEAR_FIFO:
        LT8988_WriteReg(52, 0x80, 0x80);
        break;
    case LT8988_IDLE:
        LT8988_WriteReg(7, 0x00, 0x00);
        break;
    case LT8988_SPAN_1M:
        LT8988_WriteReg(44, 0x01, 0x01);   //
        LT8988_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8988_SPAN_512K:
        LT8988_WriteReg(44, 0x02, 0x01);   //
        LT8988_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8988_SPAN_250K:
        LT8988_WriteReg(44, 0x04, 0x01);   //
        LT8988_WriteReg(45, 0x05, 0x52);	 //
        break;
    case LT8988_SPAN_125K:
        LT8988_WriteReg(44, 0x08, 0x01);     //
        LT8988_WriteReg(45, 0x05, 0x52);	   //
        break;
    case LT8988_SPAN_62K:
        LT8988_WriteReg(44, 0x10, 0x01);        //
        LT8988_WriteReg(45, 0x05, 0x52);	 //
        break;
    }
}
void write_sync(void)
{

    LT8988_WriteReg(36, 0xAA, 0x55 );
    LT8988_WriteReg(39, 0x33, 0x77 );

}


void LT8988_WriteBUF(unsigned char reg, unsigned char *pBuf, unsigned char len)
{

    unsigned char i;

    LT8988_regset(CLEAR_FIFO);

    LT8988_WriteReg(reg, len, pBuf[0]);
    for(i = 1; i < len; i = i + 2)
    {
        LT8988_WriteReg(reg, pBuf[i], pBuf[i + 1]);
    }

}



unsigned char LT8988_ReadBUF(unsigned char *pBuf)
{

    unsigned char len = 0;
    unsigned char i;



    LT8988_start();
    Send_Byte(0x50);
    ack();
    Send_Byte(50 | 0X80);
    ack();
    LT8988_start();
    Send_Byte(0x51);
    ack();

    len = Read_Byte();

    if(len > 15) { //当前ble默认有效长度为15(min)
        nack();
        LT8988_stop();
        return 0;
    }
    ack();

    pBuf[0] = len;  // 当前真实长度为13(min)
    len = 13;
    for(i = 0; i < len; i++)
    {
        pBuf[i + 1] = Read_Byte();
        if(i < len - 1)
        {
            ack();
        }
    }
    nack();
    LT8988_stop();

    return 1;

}


///--------------累加和校验-------------
// 累加和计算 存放到数组最后字节
void crc_sum(unsigned char *buf, unsigned char len)
{

    unsigned char sum, i;
    sum = 0;
    i = 0;
    for(i = 0; i < len - 1; i++)
    {

        sum = buf[i] + sum;
    }
    buf[len - 1] = sum;

}

// 校验和审查 通过返回1 失败返回0
unsigned char check_sum(unsigned char *buf, unsigned char len)
{

    unsigned char sum, i;
    sum = 0;
    i = 0;
    for(i = 0; i < len - 1; i++)
    {

        sum = buf[i] + sum;
    }
    if(buf[len - 1] == sum)
    {
        return 1;
    }
    return 0;
}




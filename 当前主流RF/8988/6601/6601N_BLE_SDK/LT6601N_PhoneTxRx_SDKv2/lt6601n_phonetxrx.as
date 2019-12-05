opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Init
	FNCALL	_main,_LT8988_INIT
	FNCALL	_main,_write_sync
	FNCALL	_main,_lt8988_ble_tx
	FNCALL	_main,_lt8988_ble_rx
	FNCALL	_lt8988_ble_rx,_LT8988_ble_rx_enable
	FNCALL	_lt8988_ble_rx,_ble_chanel_scan
	FNCALL	_lt8988_ble_tx,_LT8988_ble_tx_enable
	FNCALL	_lt8988_ble_tx,_LT8988_ble_tx_start
	FNCALL	_lt8988_ble_tx,_DelayMs
	FNCALL	_ble_chanel_scan,_LT8988_ble_rx_start
	FNCALL	_ble_chanel_scan,_LT8988_ReadReg
	FNCALL	_ble_chanel_scan,_LT8988_read_ble_fifo
	FNCALL	_ble_chanel_scan,_check_sum
	FNCALL	_ble_chanel_scan,_DelayMs
	FNCALL	_LT8988_ble_tx_start,_get_crc
	FNCALL	_LT8988_ble_tx_start,_LT8988_pdudata_white
	FNCALL	_LT8988_ble_tx_start,_LT8988_ble_write_reg
	FNCALL	_LT8988_ble_tx_start,_LT8988_write_ble_fifo
	FNCALL	_LT8988_write_ble_fifo,_LT8988_ble_write_reg
	FNCALL	_LT8988_ble_rx_enable,_LT8988_ble_write_reg
	FNCALL	_LT8988_read_ble_fifo,_LT8988_ble_write_reg
	FNCALL	_LT8988_read_ble_fifo,_ble_read_fifo
	FNCALL	_LT8988_read_ble_fifo,_LT8988_ble_to_localdata
	FNCALL	_LT8988_ble_rx_start,_LT8988_ble_write_reg
	FNCALL	_LT8988_ble_tx_enable,_LT8988_ble_write_reg
	FNCALL	_ble_read_fifo,_LT8988_ReadBUF
	FNCALL	_LT8988_ble_write_reg,_LT8988_WriteReg
	FNCALL	_write_sync,_LT8988_WriteReg
	FNCALL	_LT8988_INIT,_LT8988_WriteReg
	FNCALL	_LT8988_INIT,_DelayMs
	FNCALL	_LT8988_INIT,_LT8988_ReadReg
	FNCALL	_LT8988_ReadBUF,_LT8988_start
	FNCALL	_LT8988_ReadBUF,_Send_Byte
	FNCALL	_LT8988_ReadBUF,_ack
	FNCALL	_LT8988_ReadBUF,_Read_Byte
	FNCALL	_LT8988_ReadBUF,_nack
	FNCALL	_LT8988_ReadBUF,_LT8988_stop
	FNCALL	_LT8988_WriteReg,_LT8988_start
	FNCALL	_LT8988_WriteReg,_Send_Byte
	FNCALL	_LT8988_WriteReg,_ack
	FNCALL	_LT8988_WriteReg,_LT8988_stop
	FNCALL	_LT8988_ReadReg,_LT8988_start
	FNCALL	_LT8988_ReadReg,_Send_Byte
	FNCALL	_LT8988_ReadReg,_ack
	FNCALL	_LT8988_ReadReg,_Read_Byte
	FNCALL	_LT8988_ReadReg,_nack
	FNCALL	_LT8988_ReadReg,_LT8988_stop
	FNCALL	_get_crc,_roll_data
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_PDUDATA
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"main.c"
	line	31

;initializer for _PDUDATA
	retlw	02h
	retlw	015h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	01h
	retlw	05h
	retlw	03h
	retlw	019h
	retlw	0C1h
	retlw	03h
	retlw	07h
	retlw	016h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0B0h
	retlw	0B0h
	retlw	0B0h
	retlw	0
	retlw	0
	retlw	0
	global	_WHITE_INDEX37
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"8988_ble.c"
	line	4
_WHITE_INDEX37:
	retlw	08Dh
	retlw	0D2h
	retlw	057h
	retlw	0A1h
	retlw	03Dh
	retlw	0A7h
	retlw	066h
	retlw	0B0h
	retlw	075h
	retlw	031h
	retlw	011h
	retlw	048h
	retlw	096h
	retlw	077h
	retlw	0F8h
	retlw	0E3h
	retlw	046h
	retlw	0E9h
	retlw	0ABh
	retlw	0D0h
	retlw	09Eh
	retlw	053h
	retlw	033h
	retlw	0D8h
	retlw	0BAh
	retlw	098h
	retlw	08h
	retlw	024h
	retlw	0CBh
	retlw	03Bh
	retlw	0FCh
	retlw	071h
	retlw	0A3h
	retlw	0F4h
	retlw	055h
	retlw	068h
	retlw	0CFh
	retlw	0A9h
	retlw	019h
	global	_WHITE_INDEX38
psect	strings
	file	"8988_ble.c"
	line	5
_WHITE_INDEX38:
	retlw	0D6h
	retlw	0C5h
	retlw	044h
	retlw	020h
	retlw	059h
	retlw	0DEh
	retlw	0E1h
	retlw	08Fh
	retlw	01Bh
	retlw	0A5h
	retlw	0AFh
	retlw	042h
	retlw	07Bh
	retlw	04Eh
	retlw	0CDh
	retlw	060h
	retlw	0EBh
	retlw	062h
	retlw	022h
	retlw	090h
	retlw	02Ch
	retlw	0EFh
	retlw	0F0h
	retlw	0C7h
	retlw	08Dh
	retlw	0D2h
	retlw	057h
	retlw	0A1h
	retlw	03Dh
	retlw	0A7h
	retlw	066h
	retlw	0B0h
	retlw	075h
	retlw	031h
	retlw	011h
	retlw	048h
	retlw	096h
	retlw	077h
	retlw	0F8h
	global	_WHITE_INDEX39
psect	strings
	file	"8988_ble.c"
	line	6
_WHITE_INDEX39:
	retlw	01Fh
	retlw	037h
	retlw	04Ah
	retlw	05Fh
	retlw	085h
	retlw	0F6h
	retlw	09Ch
	retlw	09Ah
	retlw	0C1h
	retlw	0D6h
	retlw	0C5h
	retlw	044h
	retlw	020h
	retlw	059h
	retlw	0DEh
	retlw	0E1h
	retlw	08Fh
	retlw	01Bh
	retlw	0A5h
	retlw	0AFh
	retlw	042h
	retlw	07Bh
	retlw	04Eh
	retlw	0CDh
	retlw	060h
	retlw	0EBh
	retlw	062h
	retlw	022h
	retlw	090h
	retlw	02Ch
	retlw	0EFh
	retlw	0F0h
	retlw	0C7h
	retlw	08Dh
	retlw	0D2h
	retlw	057h
	retlw	0A1h
	retlw	03Dh
	retlw	0A7h
	global	_WHITE_INDEX37
	global	_WHITE_INDEX38
	global	_WHITE_INDEX39
	global	_rxtimeout
	global	__RegH
	global	_ledsta
	global	_lt8988_work_sta
	global	_rxflag
	global	__RegL
	global	_RXADVDATA
	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_ADCON0
_ADCON0	set	31
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_MSCKCON
_MSCKCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ADCON1
_ADCON1	set	159
	global	_ANSEL
_ANSEL	set	145
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISC1
_TRISC1	set	1081
	file	"lt6601n_phonetxrx.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
__RegL:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rxtimeout:
       ds      2

__RegH:
       ds      1

_ledsta:
       ds      1

_lt8988_work_sta:
       ds      1

_rxflag:
       ds      1

_RXADVDATA:
       ds      13

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"main.c"
	line	31
_PDUDATA:
       ds      26

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+013h)
	fcall	clear_ram
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+26)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_LT8988_INIT
?_LT8988_INIT:	; 0 bytes @ 0x0
	global	?_write_sync
?_write_sync:	; 0 bytes @ 0x0
	global	?_lt8988_ble_tx
?_lt8988_ble_tx:	; 0 bytes @ 0x0
	global	?_lt8988_ble_rx
?_lt8988_ble_rx:	; 0 bytes @ 0x0
	global	?_LT8988_ble_tx_enable
?_LT8988_ble_tx_enable:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	?_LT8988_ble_rx_start
?_LT8988_ble_rx_start:	; 0 bytes @ 0x0
	global	?_LT8988_ReadReg
?_LT8988_ReadReg:	; 0 bytes @ 0x0
	global	?_LT8988_ble_rx_enable
?_LT8988_ble_rx_enable:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_Init
?_Init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ble_chanel_scan
?_ble_chanel_scan:	; 0 bytes @ 0x0
	global	?_ble_read_fifo
?_ble_read_fifo:	; 0 bytes @ 0x0
	global	?_LT8988_start
?_LT8988_start:	; 0 bytes @ 0x0
	global	?_LT8988_stop
?_LT8988_stop:	; 0 bytes @ 0x0
	global	?_Send_Byte
?_Send_Byte:	; 0 bytes @ 0x0
	global	?_ack
?_ack:	; 0 bytes @ 0x0
	global	?_nack
?_nack:	; 0 bytes @ 0x0
	global	?_LT8988_ReadBUF
?_LT8988_ReadBUF:	; 1 bytes @ 0x0
	global	?_Read_Byte
?_Read_Byte:	; 1 bytes @ 0x0
	global	?_roll_data
?_roll_data:	; 1 bytes @ 0x0
	ds	2
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x2
	global	??_Init
??_Init:	; 0 bytes @ 0x2
	global	??_LT8988_start
??_LT8988_start:	; 0 bytes @ 0x2
	global	??_LT8988_stop
??_LT8988_stop:	; 0 bytes @ 0x2
	global	??_Send_Byte
??_Send_Byte:	; 0 bytes @ 0x2
	global	??_Read_Byte
??_Read_Byte:	; 0 bytes @ 0x2
	global	??_ack
??_ack:	; 0 bytes @ 0x2
	global	??_nack
??_nack:	; 0 bytes @ 0x2
	global	??_roll_data
??_roll_data:	; 0 bytes @ 0x2
	global	?_LT8988_pdudata_white
?_LT8988_pdudata_white:	; 0 bytes @ 0x2
	global	?_LT8988_ble_to_localdata
?_LT8988_ble_to_localdata:	; 0 bytes @ 0x2
	global	?_check_sum
?_check_sum:	; 1 bytes @ 0x2
	global	Send_Byte@DATA
Send_Byte@DATA:	; 1 bytes @ 0x2
	global	Read_Byte@byte
Read_Byte@byte:	; 1 bytes @ 0x2
	global	check_sum@len
check_sum@len:	; 1 bytes @ 0x2
	global	LT8988_pdudata_white@PDUDATA
LT8988_pdudata_white@PDUDATA:	; 1 bytes @ 0x2
	global	LT8988_ble_to_localdata@ADVDATA
LT8988_ble_to_localdata@ADVDATA:	; 1 bytes @ 0x2
	global	DelayMs@dly
DelayMs@dly:	; 2 bytes @ 0x2
	ds	1
	global	??_LT8988_ReadReg
??_LT8988_ReadReg:	; 0 bytes @ 0x3
	global	??_check_sum
??_check_sum:	; 0 bytes @ 0x3
	global	?_LT8988_WriteReg
?_LT8988_WriteReg:	; 0 bytes @ 0x3
	global	??_LT8988_ReadBUF
??_LT8988_ReadBUF:	; 0 bytes @ 0x3
	global	LT8988_WriteReg@H
LT8988_WriteReg@H:	; 1 bytes @ 0x3
	global	LT8988_ReadReg@reg
LT8988_ReadReg@reg:	; 1 bytes @ 0x3
	global	roll_data@roll_in
roll_data@roll_in:	; 1 bytes @ 0x3
	global	LT8988_pdudata_white@len
LT8988_pdudata_white@len:	; 1 bytes @ 0x3
	global	LT8988_ble_to_localdata@len
LT8988_ble_to_localdata@len:	; 1 bytes @ 0x3
	ds	1
	global	??_LT8988_pdudata_white
??_LT8988_pdudata_white:	; 0 bytes @ 0x4
	global	LT8988_WriteReg@L
LT8988_WriteReg@L:	; 1 bytes @ 0x4
	global	DelayMs@Tms
DelayMs@Tms:	; 1 bytes @ 0x4
	global	roll_data@roll_out
roll_data@roll_out:	; 1 bytes @ 0x4
	global	LT8988_ble_to_localdata@adv_offset
LT8988_ble_to_localdata@adv_offset:	; 1 bytes @ 0x4
	ds	1
	global	??_LT8988_WriteReg
??_LT8988_WriteReg:	; 0 bytes @ 0x5
	global	??_LT8988_ble_to_localdata
??_LT8988_ble_to_localdata:	; 0 bytes @ 0x5
	global	LT8988_WriteReg@reg
LT8988_WriteReg@reg:	; 1 bytes @ 0x5
	global	LT8988_ReadBUF@pBuf
LT8988_ReadBUF@pBuf:	; 1 bytes @ 0x5
	global	check_sum@sum
check_sum@sum:	; 1 bytes @ 0x5
	global	roll_data@i
roll_data@i:	; 1 bytes @ 0x5
	ds	1
	global	??_LT8988_INIT
??_LT8988_INIT:	; 0 bytes @ 0x6
	global	??_write_sync
??_write_sync:	; 0 bytes @ 0x6
	global	?_LT8988_ble_write_reg
?_LT8988_ble_write_reg:	; 0 bytes @ 0x6
	global	?_get_crc
?_get_crc:	; 0 bytes @ 0x6
	global	LT8988_ble_write_reg@first
LT8988_ble_write_reg@first:	; 1 bytes @ 0x6
	global	LT8988_ReadBUF@i
LT8988_ReadBUF@i:	; 1 bytes @ 0x6
	global	check_sum@buf
check_sum@buf:	; 1 bytes @ 0x6
	global	get_crc@lenth
get_crc@lenth:	; 1 bytes @ 0x6
	ds	1
	global	LT8988_ble_write_reg@second
LT8988_ble_write_reg@second:	; 1 bytes @ 0x7
	global	LT8988_ReadBUF@len
LT8988_ReadBUF@len:	; 1 bytes @ 0x7
	global	check_sum@i
check_sum@i:	; 1 bytes @ 0x7
	ds	1
	global	??_LT8988_ble_write_reg
??_LT8988_ble_write_reg:	; 0 bytes @ 0x8
	global	??_ble_read_fifo
??_ble_read_fifo:	; 0 bytes @ 0x8
	global	LT8988_ble_write_reg@reg
LT8988_ble_write_reg@reg:	; 1 bytes @ 0x8
	global	ble_read_fifo@buf
ble_read_fifo@buf:	; 1 bytes @ 0x8
	global	LT8988_pdudata_white@chanel
LT8988_pdudata_white@chanel:	; 1 bytes @ 0x8
	ds	1
	global	??_LT8988_ble_tx_enable
??_LT8988_ble_tx_enable:	; 0 bytes @ 0x9
	global	??_LT8988_ble_rx_start
??_LT8988_ble_rx_start:	; 0 bytes @ 0x9
	global	??_LT8988_ble_rx_enable
??_LT8988_ble_rx_enable:	; 0 bytes @ 0x9
	global	?_LT8988_write_ble_fifo
?_LT8988_write_ble_fifo:	; 0 bytes @ 0x9
	global	LT8988_pdudata_white@i
LT8988_pdudata_white@i:	; 1 bytes @ 0x9
	global	LT8988_write_ble_fifo@len
LT8988_write_ble_fifo@len:	; 1 bytes @ 0x9
	global	LT8988_ble_rx_start@chanel
LT8988_ble_rx_start@chanel:	; 1 bytes @ 0x9
	ds	1
	global	??_LT8988_ble_tx_start
??_LT8988_ble_tx_start:	; 0 bytes @ 0xA
	global	??_LT8988_read_ble_fifo
??_LT8988_read_ble_fifo:	; 0 bytes @ 0xA
	global	LT8988_ble_tx_start@chanel
LT8988_ble_tx_start@chanel:	; 1 bytes @ 0xA
	global	LT8988_read_ble_fifo@chanel
LT8988_read_ble_fifo@chanel:	; 1 bytes @ 0xA
	ds	1
	global	??_lt8988_ble_tx
??_lt8988_ble_tx:	; 0 bytes @ 0xB
	global	??_lt8988_ble_rx
??_lt8988_ble_rx:	; 0 bytes @ 0xB
	global	??_main
??_main:	; 0 bytes @ 0xB
	global	??_ble_chanel_scan
??_ble_chanel_scan:	; 0 bytes @ 0xB
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_get_crc
??_get_crc:	; 0 bytes @ 0x0
	global	??_LT8988_write_ble_fifo
??_LT8988_write_ble_fifo:	; 0 bytes @ 0x0
	global	LT8988_ble_to_localdata@chanel
LT8988_ble_to_localdata@chanel:	; 1 bytes @ 0x0
	ds	1
	global	LT8988_ble_to_localdata@i
LT8988_ble_to_localdata@i:	; 1 bytes @ 0x1
	ds	1
	global	?_LT8988_read_ble_fifo
?_LT8988_read_ble_fifo:	; 0 bytes @ 0x2
	global	LT8988_write_ble_fifo@i
LT8988_write_ble_fifo@i:	; 1 bytes @ 0x2
	global	LT8988_read_ble_fifo@RXADVDATA
LT8988_read_ble_fifo@RXADVDATA:	; 1 bytes @ 0x2
	ds	1
	global	LT8988_write_ble_fifo@txdata
LT8988_write_ble_fifo@txdata:	; 1 bytes @ 0x3
	global	LT8988_read_ble_fifo@len
LT8988_read_ble_fifo@len:	; 1 bytes @ 0x3
	ds	1
	global	ble_chanel_scan@chanel
ble_chanel_scan@chanel:	; 1 bytes @ 0x4
	ds	1
	global	ble_chanel_scan@i
ble_chanel_scan@i:	; 1 bytes @ 0x5
	global	get_crc@c0
get_crc@c0:	; 1 bytes @ 0x5
	ds	1
	global	lt8988_ble_rx@i
lt8988_ble_rx@i:	; 1 bytes @ 0x6
	global	get_crc@c1
get_crc@c1:	; 1 bytes @ 0x6
	ds	1
	global	get_crc@c2
get_crc@c2:	; 1 bytes @ 0x7
	ds	1
	global	get_crc@i
get_crc@i:	; 1 bytes @ 0x8
	ds	1
	global	get_crc@user_data_buf
get_crc@user_data_buf:	; 1 bytes @ 0x9
	ds	1
	global	get_crc@e
get_crc@e:	; 1 bytes @ 0xA
	ds	1
	global	?_LT8988_ble_tx_start
?_LT8988_ble_tx_start:	; 0 bytes @ 0xB
	global	LT8988_ble_tx_start@PDUDATA
LT8988_ble_tx_start@PDUDATA:	; 1 bytes @ 0xB
	ds	1
	global	LT8988_ble_tx_start@len
LT8988_ble_tx_start@len:	; 1 bytes @ 0xC
	ds	1
;;Data sizes: Strings 0, constant 117, data 26, bss 20, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      12
;; BANK0           80     13      58
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; LT8988_read_ble_fifo@RXADVDATA	PTR unsigned char  size(1) Largest target is 13
;;		 -> RXADVDATA(BANK0[13]), 
;;
;; LT8988_ble_tx_start@PDUDATA	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; LT8988_write_ble_fifo@txdata	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; LT8988_ble_to_localdata@ADVDATA	PTR unsigned char  size(1) Largest target is 13
;;		 -> RXADVDATA(BANK0[13]), 
;;
;; LT8988_pdudata_white@PDUDATA	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; get_crc@user_data_buf	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; check_sum@buf	PTR unsigned char  size(1) Largest target is 13
;;		 -> RXADVDATA(BANK0[13]), 
;;
;; LT8988_ReadBUF@pBuf	PTR unsigned char  size(1) Largest target is 13
;;		 -> RXADVDATA(BANK0[13]), 
;;
;; ble_read_fifo@buf	PTR unsigned char  size(1) Largest target is 13
;;		 -> RXADVDATA(BANK0[13]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _lt8988_ble_tx->_LT8988_ble_tx_start
;;   _ble_chanel_scan->_LT8988_read_ble_fifo
;;   _LT8988_ble_tx_start->_LT8988_pdudata_white
;;   _LT8988_ble_tx_start->_LT8988_write_ble_fifo
;;   _LT8988_write_ble_fifo->_LT8988_ble_write_reg
;;   _LT8988_ble_rx_enable->_LT8988_ble_write_reg
;;   _LT8988_read_ble_fifo->_LT8988_ble_to_localdata
;;   _LT8988_ble_rx_start->_LT8988_ble_write_reg
;;   _LT8988_ble_tx_enable->_LT8988_ble_write_reg
;;   _ble_read_fifo->_LT8988_ReadBUF
;;   _LT8988_ble_write_reg->_LT8988_WriteReg
;;   _write_sync->_LT8988_WriteReg
;;   _LT8988_INIT->_LT8988_WriteReg
;;   _LT8988_ReadBUF->_Send_Byte
;;   _LT8988_ReadBUF->_Read_Byte
;;   _LT8988_WriteReg->_Send_Byte
;;   _LT8988_ReadReg->_Send_Byte
;;   _LT8988_ReadReg->_Read_Byte
;;   _get_crc->_roll_data
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _lt8988_ble_rx->_ble_chanel_scan
;;   _lt8988_ble_tx->_LT8988_ble_tx_start
;;   _ble_chanel_scan->_LT8988_read_ble_fifo
;;   _LT8988_ble_tx_start->_get_crc
;;   _LT8988_read_ble_fifo->_LT8988_ble_to_localdata
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    9698
;;                               _Init
;;                        _LT8988_INIT
;;                         _write_sync
;;                      _lt8988_ble_tx
;;                      _lt8988_ble_rx
;; ---------------------------------------------------------------------------------
;; (1) _lt8988_ble_rx                                        1     1      0    4740
;;                                              6 BANK0      1     1      0
;;               _LT8988_ble_rx_enable
;;                    _ble_chanel_scan
;; ---------------------------------------------------------------------------------
;; (1) _lt8988_ble_tx                                        0     0      0    3892
;;               _LT8988_ble_tx_enable
;;                _LT8988_ble_tx_start
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (2) _ble_chanel_scan                                      2     2      0    4238
;;                                              4 BANK0      2     2      0
;;                _LT8988_ble_rx_start
;;                     _LT8988_ReadReg
;;               _LT8988_read_ble_fifo
;;                          _check_sum
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (2) _LT8988_ble_tx_start                                  3     1      2    3411
;;                                             10 COMMON     1     1      0
;;                                             11 BANK0      2     0      2
;;                            _get_crc
;;               _LT8988_pdudata_white
;;               _LT8988_ble_write_reg
;;              _LT8988_write_ble_fifo
;; ---------------------------------------------------------------------------------
;; (3) _LT8988_write_ble_fifo                                5     4      1     688
;;                                              9 COMMON     1     0      1
;;                                              0 BANK0      4     4      0
;;               _LT8988_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (2) _LT8988_ble_rx_enable                                 0     0      0     434
;;               _LT8988_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (3) _LT8988_read_ble_fifo                                 3     1      2    3029
;;                                             10 COMMON     1     1      0
;;                                              2 BANK0      2     0      2
;;               _LT8988_ble_write_reg
;;                      _ble_read_fifo
;;            _LT8988_ble_to_localdata
;; ---------------------------------------------------------------------------------
;; (3) _LT8988_ble_rx_start                                  1     1      0     527
;;                                              9 COMMON     1     1      0
;;               _LT8988_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (2) _LT8988_ble_tx_enable                                 0     0      0     434
;;               _LT8988_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (4) _ble_read_fifo                                        1     1      0     631
;;                                              8 COMMON     1     1      0
;;                     _LT8988_ReadBUF
;; ---------------------------------------------------------------------------------
;; (4) _LT8988_ble_write_reg                                 3     1      2     434
;;                                              6 COMMON     3     1      2
;;                    _LT8988_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _write_sync                                           0     0      0     341
;;                    _LT8988_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _LT8988_INIT                                          0     0      0     725
;;                    _LT8988_WriteReg
;;                            _DelayMs
;;                     _LT8988_ReadReg
;; ---------------------------------------------------------------------------------
;; (5) _LT8988_ReadBUF                                       5     5      0     600
;;                                              3 COMMON     5     5      0
;;                       _LT8988_start
;;                          _Send_Byte
;;                                _ack
;;                          _Read_Byte
;;                               _nack
;;                        _LT8988_stop
;; ---------------------------------------------------------------------------------
;; (5) _LT8988_WriteReg                                      3     1      2     341
;;                                              3 COMMON     3     1      2
;;                       _LT8988_start
;;                          _Send_Byte
;;                                _ack
;;                        _LT8988_stop
;; ---------------------------------------------------------------------------------
;; (3) _LT8988_ReadReg                                       1     1      0     337
;;                                              3 COMMON     1     1      0
;;                       _LT8988_start
;;                          _Send_Byte
;;                                _ack
;;                          _Read_Byte
;;                               _nack
;;                        _LT8988_stop
;; ---------------------------------------------------------------------------------
;; (3) _get_crc                                             12    11      1    1124
;;                                              6 COMMON     1     0      1
;;                                              0 BANK0     11    11      0
;;                          _roll_data
;; ---------------------------------------------------------------------------------
;; (6) _nack                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (6) _ack                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _LT8988_ble_to_localdata                             10     7      3    1561
;;                                              2 COMMON     8     5      3
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _LT8988_pdudata_white                                 8     6      2     762
;;                                              2 COMMON     8     6      2
;; ---------------------------------------------------------------------------------
;; (4) _roll_data                                            4     4      0     198
;;                                              2 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (6) _Read_Byte                                            1     1      0      58
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (6) _Send_Byte                                            1     1      0     248
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (6) _LT8988_stop                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (6) _LT8988_start                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _check_sum                                            6     5      1     165
;;                                              2 COMMON     6     5      1
;; ---------------------------------------------------------------------------------
;; (3) _DelayMs                                              3     3      0      47
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (7) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init
;;   _LT8988_INIT
;;     _LT8988_WriteReg
;;       _LT8988_start
;;       _Send_Byte
;;       _ack
;;       _LT8988_stop
;;     _DelayMs
;;     _LT8988_ReadReg
;;       _LT8988_start
;;       _Send_Byte
;;       _ack
;;       _Read_Byte
;;       _nack
;;       _LT8988_stop
;;   _write_sync
;;     _LT8988_WriteReg
;;       _LT8988_start
;;       _Send_Byte
;;       _ack
;;       _LT8988_stop
;;   _lt8988_ble_tx
;;     _LT8988_ble_tx_enable
;;       _LT8988_ble_write_reg
;;         _LT8988_WriteReg
;;           _LT8988_start
;;           _Send_Byte
;;           _ack
;;           _LT8988_stop
;;     _LT8988_ble_tx_start
;;       _get_crc
;;         _roll_data
;;       _LT8988_pdudata_white
;;       _LT8988_ble_write_reg
;;         _LT8988_WriteReg
;;           _LT8988_start
;;           _Send_Byte
;;           _ack
;;           _LT8988_stop
;;       _LT8988_write_ble_fifo
;;         _LT8988_ble_write_reg
;;           _LT8988_WriteReg
;;             _LT8988_start
;;             _Send_Byte
;;             _ack
;;             _LT8988_stop
;;     _DelayMs
;;   _lt8988_ble_rx
;;     _LT8988_ble_rx_enable
;;       _LT8988_ble_write_reg
;;         _LT8988_WriteReg
;;           _LT8988_start
;;           _Send_Byte
;;           _ack
;;           _LT8988_stop
;;     _ble_chanel_scan
;;       _LT8988_ble_rx_start
;;         _LT8988_ble_write_reg
;;           _LT8988_WriteReg
;;             _LT8988_start
;;             _Send_Byte
;;             _ack
;;             _LT8988_stop
;;       _LT8988_ReadReg
;;         _LT8988_start
;;         _Send_Byte
;;         _ack
;;         _Read_Byte
;;         _nack
;;         _LT8988_stop
;;       _LT8988_read_ble_fifo
;;         _LT8988_ble_write_reg
;;           _LT8988_WriteReg
;;             _LT8988_start
;;             _Send_Byte
;;             _ack
;;             _LT8988_stop
;;         _ble_read_fifo
;;           _LT8988_ReadBUF
;;             _LT8988_start
;;             _Send_Byte
;;             _ack
;;             _Read_Byte
;;             _nack
;;             _LT8988_stop
;;         _LT8988_ble_to_localdata
;;       _check_sum
;;       _DelayMs
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       6        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      4C       8        0.0%
;;ABS                  0      0      46       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       6       2        0.0%
;;BANK0               50      D      3A       4       72.5%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 131 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Init
;;		_LT8988_INIT
;;		_write_sync
;;		_lt8988_ble_tx
;;		_lt8988_ble_rx
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	131
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	132
	
l4895:	
;main.c: 132: Init();
	fcall	_Init
	line	134
;main.c: 134: LT8988_INIT();
	fcall	_LT8988_INIT
	line	135
;main.c: 135: write_sync();
	fcall	_write_sync
	line	157
	
l4897:	
;main.c: 157: lt8988_work_sta = SCAN;
	clrf	(_lt8988_work_sta)
	line	162
	
l4899:	
;main.c: 160: {
;main.c: 162: if(lt8988_work_sta == SCAN)
	movf	(_lt8988_work_sta),f
	skipz
	goto	u2191
	goto	u2190
u2191:
	goto	l4913
u2190:
	line	165
	
l4901:	
;main.c: 163: {
;main.c: 165: rxflag = 0;
	clrf	(_rxflag)
	line	167
	
l4903:	
;main.c: 167: lt8988_ble_tx();
	fcall	_lt8988_ble_tx
	line	168
	
l4905:	
;main.c: 168: lt8988_ble_rx();
	fcall	_lt8988_ble_rx
	line	169
	
l4907:	
;main.c: 169: if(rxflag == 1)
	decf	(_rxflag),w
	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l4899
u2200:
	line	171
	
l4909:	
;main.c: 170: {
;main.c: 171: rxflag = 0;
	clrf	(_rxflag)
	line	172
;main.c: 172: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	line	173
	
l4911:	
;main.c: 173: lt8988_work_sta = RXBLE;
	clrf	(_lt8988_work_sta)
	incf	(_lt8988_work_sta),f
	goto	l4899
	line	178
	
l4913:	
;main.c: 178: else if(lt8988_work_sta == RXBLE)
	decf	(_lt8988_work_sta),w
	skipz
	goto	u2211
	goto	u2210
u2211:
	goto	l4899
u2210:
	line	181
	
l4915:	
;main.c: 179: {
;main.c: 181: lt8988_ble_rx();
	fcall	_lt8988_ble_rx
	goto	l4899
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	190
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lt8988_ble_rx
psect	text931,local,class=CODE,delta=2
global __ptext931
__ptext931:

;; *************** function _lt8988_ble_rx *****************
;; Defined at:
;;		line 275 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_LT8988_ble_rx_enable
;;		_ble_chanel_scan
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text931
	file	"main.c"
	line	275
	global	__size_of_lt8988_ble_rx
	__size_of_lt8988_ble_rx	equ	__end_of_lt8988_ble_rx-_lt8988_ble_rx
	
_lt8988_ble_rx:	
	opt	stack 1
; Regs used in _lt8988_ble_rx: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	279
	
l4881:	
;main.c: 277: unsigned char i;
;main.c: 279: LT8988_ble_rx_enable();
	fcall	_LT8988_ble_rx_enable
	line	281
	
l4883:	
;main.c: 281: for(i = 0; i < 5; i++)
	clrf	(lt8988_ble_rx@i)
	line	283
	
l4889:	
;main.c: 282: {
;main.c: 283: ble_chanel_scan(37);
	movlw	(025h)
	fcall	_ble_chanel_scan
	line	284
;main.c: 284: ble_chanel_scan(38);
	movlw	(026h)
	fcall	_ble_chanel_scan
	line	285
;main.c: 285: ble_chanel_scan(39);
	movlw	(027h)
	fcall	_ble_chanel_scan
	line	281
	
l4891:	
	incf	(lt8988_ble_rx@i),f
	
l4893:	
	movlw	(05h)
	subwf	(lt8988_ble_rx@i),w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4889
u2180:
	line	288
	
l1140:	
	return
	opt stack 0
GLOBAL	__end_of_lt8988_ble_rx
	__end_of_lt8988_ble_rx:
;; =============== function _lt8988_ble_rx ends ============

	signat	_lt8988_ble_rx,88
	global	_lt8988_ble_tx
psect	text932,local,class=CODE,delta=2
global __ptext932
__ptext932:

;; *************** function _lt8988_ble_tx *****************
;; Defined at:
;;		line 204 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_LT8988_ble_tx_enable
;;		_LT8988_ble_tx_start
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text932
	file	"main.c"
	line	204
	global	__size_of_lt8988_ble_tx
	__size_of_lt8988_ble_tx	equ	__end_of_lt8988_ble_tx-_lt8988_ble_tx
	
_lt8988_ble_tx:	
	opt	stack 1
; Regs used in _lt8988_ble_tx: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	206
	
l4869:	
;main.c: 206: LT8988_ble_tx_enable();
	fcall	_LT8988_ble_tx_enable
	line	207
	
l4871:	
;main.c: 207: LT8988_ble_tx_start(37, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8988_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8988_ble_tx_start)+01h
	movlw	(025h)
	fcall	_LT8988_ble_tx_start
	line	208
	
l4873:	
;main.c: 208: DelayMs(3);
	movlw	(03h)
	fcall	_DelayMs
	line	209
;main.c: 209: LT8988_ble_tx_start(38, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8988_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8988_ble_tx_start)+01h
	movlw	(026h)
	fcall	_LT8988_ble_tx_start
	line	210
	
l4875:	
;main.c: 210: DelayMs(3);
	movlw	(03h)
	fcall	_DelayMs
	line	211
	
l4877:	
;main.c: 211: LT8988_ble_tx_start(39, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8988_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8988_ble_tx_start)+01h
	movlw	(027h)
	fcall	_LT8988_ble_tx_start
	line	212
;main.c: 212: DelayMs(3);
	movlw	(03h)
	fcall	_DelayMs
	line	213
	
l4879:	
;main.c: 213: RA6 = !RA6;
	movlw	1<<((46)&7)
	xorwf	((46)/8),f
	line	215
	
l1121:	
	return
	opt stack 0
GLOBAL	__end_of_lt8988_ble_tx
	__end_of_lt8988_ble_tx:
;; =============== function _lt8988_ble_tx ends ============

	signat	_lt8988_ble_tx,88
	global	_ble_chanel_scan
psect	text933,local,class=CODE,delta=2
global __ptext933
__ptext933:

;; *************** function _ble_chanel_scan *****************
;; Defined at:
;;		line 220 in file "main.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    4[BANK0 ] unsigned char 
;;  i               1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_LT8988_ble_rx_start
;;		_LT8988_ReadReg
;;		_LT8988_read_ble_fifo
;;		_check_sum
;;		_DelayMs
;; This function is called by:
;;		_lt8988_ble_rx
;; This function uses a non-reentrant model
;;
psect	text933
	file	"main.c"
	line	220
	global	__size_of_ble_chanel_scan
	__size_of_ble_chanel_scan	equ	__end_of_ble_chanel_scan-_ble_chanel_scan
	
_ble_chanel_scan:	
	opt	stack 1
; Regs used in _ble_chanel_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ble_chanel_scan@chanel stored from wreg
	line	223
	movwf	(ble_chanel_scan@chanel)
	
l4831:	
;main.c: 221: unsigned char i;
;main.c: 223: LT8988_ble_rx_start(chanel);
	movf	(ble_chanel_scan@chanel),w
	fcall	_LT8988_ble_rx_start
	line	225
	
l4833:	
;main.c: 225: for(i = 0; i < 8; i++)
	clrf	(ble_chanel_scan@i)
	line	227
	
l4839:	
;main.c: 226: {
;main.c: 227: LT8988_ReadReg(3);
	movlw	(03h)
	fcall	_LT8988_ReadReg
	line	228
	
l4841:	
;main.c: 228: if(_RegH & 0x20)
	btfss	(__RegH),(5)&7
	goto	u2111
	goto	u2110
u2111:
	goto	l4863
u2110:
	line	230
	
l4843:	
;main.c: 229: {
;main.c: 230: LT8988_read_ble_fifo(chanel, RXADVDATA, 13);
	movlw	(_RXADVDATA)&0ffh
	movwf	(?_LT8988_read_ble_fifo)
	movlw	(0Dh)
	movwf	0+(?_LT8988_read_ble_fifo)+01h
	movf	(ble_chanel_scan@chanel),w
	fcall	_LT8988_read_ble_fifo
	line	232
;main.c: 232: if(check_sum(RXADVDATA, 10) == 1)
	movlw	(0Ah)
	movwf	(?_check_sum)
	movlw	(_RXADVDATA)&0ffh
	fcall	_check_sum
	xorlw	01h
	skipz
	goto	u2121
	goto	u2120
u2121:
	goto	l1127
u2120:
	line	235
	
l4845:	
;main.c: 233: {
;main.c: 235: if(RXADVDATA[5] == 0x02)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_RXADVDATA)+05h,w
	xorlw	02h
	skipz
	goto	u2131
	goto	u2130
u2131:
	goto	l4849
u2130:
	line	237
	
l4847:	
;main.c: 236: {
;main.c: 237: RA7 = 1;
	bsf	(47/8),(47)&7
	line	239
;main.c: 239: }
	goto	l1129
	line	240
	
l4849:	
;main.c: 240: else if(RXADVDATA[5] == 0x01)
	decf	0+(_RXADVDATA)+05h,w
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l4853
u2140:
	line	242
	
l4851:	
;main.c: 241: {
;main.c: 242: RA7 = 0;
	bcf	(47/8),(47)&7
	line	244
;main.c: 244: }
	goto	l1129
	line	245
	
l4853:	
;main.c: 245: else if(RXADVDATA[5] == 0x04)
	movf	0+(_RXADVDATA)+05h,w
	xorlw	04h
	skipz
	goto	u2151
	goto	u2150
u2151:
	goto	l1129
u2150:
	line	248
	
l4855:	
;main.c: 246: {
;main.c: 248: if( ledsta != RXADVDATA[6])
	movf	0+(_RXADVDATA)+06h,w
	xorwf	(_ledsta),w
	skipnz
	goto	u2161
	goto	u2160
u2161:
	goto	l1129
u2160:
	line	250
	
l4857:	
;main.c: 249: {
;main.c: 250: RA7 = !RA7;
	movlw	1<<((47)&7)
	xorwf	((47)/8),f
	line	253
	
l1129:	
;main.c: 251: }
;main.c: 252: }
;main.c: 253: ledsta = RXADVDATA[6];
	movf	0+(_RXADVDATA)+06h,w
	movwf	(_ledsta)
	line	254
	
l1127:	
	line	256
;main.c: 254: }
;main.c: 256: i = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ble_chanel_scan@i)
	line	258
	
l4859:	
;main.c: 258: rxflag = 1;
	clrf	(_rxflag)
	incf	(_rxflag),f
	line	259
	
l4861:	
;main.c: 259: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	line	261
;main.c: 261: }
	goto	l4865
	line	264
	
l4863:	
;main.c: 262: else
;main.c: 263: {
;main.c: 264: DelayMs(2);
	movlw	(02h)
	fcall	_DelayMs
	line	225
	
l4865:	
	incf	(ble_chanel_scan@i),f
	
l4867:	
	movlw	(08h)
	subwf	(ble_chanel_scan@i),w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l4839
u2170:
	line	270
	
l1135:	
	return
	opt stack 0
GLOBAL	__end_of_ble_chanel_scan
	__end_of_ble_chanel_scan:
;; =============== function _ble_chanel_scan ends ============

	signat	_ble_chanel_scan,4216
	global	_LT8988_ble_tx_start
psect	text934,local,class=CODE,delta=2
global __ptext934
__ptext934:

;; *************** function _LT8988_ble_tx_start *****************
;; Defined at:
;;		line 206 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  PDUDATA         1   11[BANK0 ] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_get_crc
;;		_LT8988_pdudata_white
;;		_LT8988_ble_write_reg
;;		_LT8988_write_ble_fifo
;; This function is called by:
;;		_lt8988_ble_tx
;; This function uses a non-reentrant model
;;
psect	text934
	file	"8988_ble.c"
	line	206
	global	__size_of_LT8988_ble_tx_start
	__size_of_LT8988_ble_tx_start	equ	__end_of_LT8988_ble_tx_start-_LT8988_ble_tx_start
	
_LT8988_ble_tx_start:	
	opt	stack 1
; Regs used in _LT8988_ble_tx_start: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8988_ble_tx_start@chanel stored from wreg
	movwf	(LT8988_ble_tx_start@chanel)
	line	207
	
l4811:	
;8988_ble.c: 207: get_crc(PDUDATA, len);
	movf	(LT8988_ble_tx_start@len),w
	movwf	(?_get_crc)
	movf	(LT8988_ble_tx_start@PDUDATA),w
	fcall	_get_crc
	line	208
;8988_ble.c: 208: LT8988_pdudata_white(chanel, PDUDATA, len);
	movf	(LT8988_ble_tx_start@PDUDATA),w
	movwf	(?_LT8988_pdudata_white)
	movf	(LT8988_ble_tx_start@len),w
	movwf	0+(?_LT8988_pdudata_white)+01h
	movf	(LT8988_ble_tx_start@chanel),w
	fcall	_LT8988_pdudata_white
	line	209
	
l4813:	
;8988_ble.c: 209: LT8988_ble_write_reg(8, 0x6c, 0x90);
	movlw	(06Ch)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(090h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(08h)
	fcall	_LT8988_ble_write_reg
	line	211
	
l4815:	
;8988_ble.c: 211: LT8988_write_ble_fifo(PDUDATA, len);
	movf	(LT8988_ble_tx_start@len),w
	movwf	(?_LT8988_write_ble_fifo)
	movf	(LT8988_ble_tx_start@PDUDATA),w
	fcall	_LT8988_write_ble_fifo
	line	212
	
l4817:	
;8988_ble.c: 212: if(chanel == 37)
	movf	(LT8988_ble_tx_start@chanel),w
	xorlw	025h
	skipz
	goto	u2081
	goto	u2080
u2081:
	goto	l4821
u2080:
	line	214
	
l4819:	
;8988_ble.c: 213: {
;8988_ble.c: 214: LT8988_ble_write_reg(7, 0x01, 0);
	clrf	(?_LT8988_ble_write_reg)
	incf	(?_LT8988_ble_write_reg),f
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	215
;8988_ble.c: 215: }
	goto	l4829
	line	216
	
l4821:	
;8988_ble.c: 216: else if(chanel == 38)
	movf	(LT8988_ble_tx_start@chanel),w
	xorlw	026h
	skipz
	goto	u2091
	goto	u2090
u2091:
	goto	l4825
u2090:
	line	218
	
l4823:	
;8988_ble.c: 217: {
;8988_ble.c: 218: LT8988_ble_write_reg(7, 0x01, 24);
	clrf	(?_LT8988_ble_write_reg)
	incf	(?_LT8988_ble_write_reg),f
	movlw	(018h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	219
;8988_ble.c: 219: }
	goto	l4829
	line	220
	
l4825:	
;8988_ble.c: 220: else if(chanel == 39)
	movf	(LT8988_ble_tx_start@chanel),w
	xorlw	027h
	skipz
	goto	u2101
	goto	u2100
u2101:
	goto	l4829
u2100:
	line	222
	
l4827:	
;8988_ble.c: 221: {
;8988_ble.c: 222: LT8988_ble_write_reg(7, 0x01, 78);
	clrf	(?_LT8988_ble_write_reg)
	incf	(?_LT8988_ble_write_reg),f
	movlw	(04Eh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	224
	
l4829:	
;8988_ble.c: 223: }
;8988_ble.c: 224: LT8988_pdudata_white(chanel, PDUDATA, len);
	movf	(LT8988_ble_tx_start@PDUDATA),w
	movwf	(?_LT8988_pdudata_white)
	movf	(LT8988_ble_tx_start@len),w
	movwf	0+(?_LT8988_pdudata_white)+01h
	movf	(LT8988_ble_tx_start@chanel),w
	fcall	_LT8988_pdudata_white
	line	225
	
l2411:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_tx_start
	__end_of_LT8988_ble_tx_start:
;; =============== function _LT8988_ble_tx_start ends ============

	signat	_LT8988_ble_tx_start,12408
	global	_LT8988_write_ble_fifo
psect	text935,local,class=CODE,delta=2
global __ptext935
__ptext935:

;; *************** function _LT8988_write_ble_fifo *****************
;; Defined at:
;;		line 175 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  txdata          1    wreg     PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  txdata          1    3[BANK0 ] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8988_ble_write_reg
;; This function is called by:
;;		_LT8988_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text935
	file	"8988_ble.c"
	line	175
	global	__size_of_LT8988_write_ble_fifo
	__size_of_LT8988_write_ble_fifo	equ	__end_of_LT8988_write_ble_fifo-_LT8988_write_ble_fifo
	
_LT8988_write_ble_fifo:	
	opt	stack 1
; Regs used in _LT8988_write_ble_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8988_write_ble_fifo@txdata stored from wreg
	line	177
	movwf	(LT8988_write_ble_fifo@txdata)
	
l4799:	
;8988_ble.c: 176: unsigned char i;
;8988_ble.c: 177: LT8988_ble_write_reg(7, 0x00, 0x00);
	clrf	(?_LT8988_ble_write_reg)
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	178
;8988_ble.c: 178: LT8988_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8988_ble_write_reg
	line	180
;8988_ble.c: 180: LT8988_ble_write_reg(50, 0xd6, 0xbe );
	movlw	(0D6h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(0BEh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(032h)
	fcall	_LT8988_ble_write_reg
	line	181
;8988_ble.c: 181: LT8988_ble_write_reg(50, 0x89 , 0x8e );
	movlw	(089h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(08Eh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(032h)
	fcall	_LT8988_ble_write_reg
	line	182
	
l4801:	
;8988_ble.c: 182: LT8988_ble_write_reg(50, txdata[0], txdata[1]);
	movf	(LT8988_write_ble_fifo@txdata),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_LT8988_ble_write_reg)
	movf	(LT8988_write_ble_fifo@txdata),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(032h)
	fcall	_LT8988_ble_write_reg
	line	184
	
l4803:	
;8988_ble.c: 184: for(i = 2; i < len; i = i + 2)
	movlw	(02h)
	movwf	(LT8988_write_ble_fifo@i)
	goto	l4809
	line	186
	
l4805:	
;8988_ble.c: 185: {
;8988_ble.c: 186: LT8988_ble_write_reg(50, txdata[i], txdata[i + 1]);
	movf	(LT8988_write_ble_fifo@i),w
	addwf	(LT8988_write_ble_fifo@txdata),w
	movwf	(??_LT8988_write_ble_fifo+0)+0
	movf	0+(??_LT8988_write_ble_fifo+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_LT8988_ble_write_reg)
	movf	(LT8988_write_ble_fifo@i),w
	addwf	(LT8988_write_ble_fifo@txdata),w
	movwf	(??_LT8988_write_ble_fifo+1)+0
	movf	0+(??_LT8988_write_ble_fifo+1)+0,w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(032h)
	fcall	_LT8988_ble_write_reg
	line	184
	
l4807:	
	incf	(LT8988_write_ble_fifo@i),f
	incf	(LT8988_write_ble_fifo@i),f
	
l4809:	
	movf	(LT8988_write_ble_fifo@len),w
	subwf	(LT8988_write_ble_fifo@i),w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4805
u2070:
	line	191
	
l2400:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_write_ble_fifo
	__end_of_LT8988_write_ble_fifo:
;; =============== function _LT8988_write_ble_fifo ends ============

	signat	_LT8988_write_ble_fifo,8312
	global	_LT8988_ble_rx_enable
psect	text936,local,class=CODE,delta=2
global __ptext936
__ptext936:

;; *************** function _LT8988_ble_rx_enable *****************
;; Defined at:
;;		line 232 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8988_ble_write_reg
;; This function is called by:
;;		_lt8988_ble_rx
;; This function uses a non-reentrant model
;;
psect	text936
	file	"8988_ble.c"
	line	232
	global	__size_of_LT8988_ble_rx_enable
	__size_of_LT8988_ble_rx_enable	equ	__end_of_LT8988_ble_rx_enable-_LT8988_ble_rx_enable
	
_LT8988_ble_rx_enable:	
	opt	stack 2
; Regs used in _LT8988_ble_rx_enable: [wreg+status,2+status,0+pclath+cstack]
	line	234
	
l4797:	
;8988_ble.c: 234: LT8988_ble_write_reg(32, 0x4A, 0x00);
	movlw	(04Ah)
	movwf	(?_LT8988_ble_write_reg)
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(020h)
	fcall	_LT8988_ble_write_reg
	line	235
	
l2414:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_rx_enable
	__end_of_LT8988_ble_rx_enable:
;; =============== function _LT8988_ble_rx_enable ends ============

	signat	_LT8988_ble_rx_enable,88
	global	_LT8988_read_ble_fifo
psect	text937,local,class=CODE,delta=2
global __ptext937
__ptext937:

;; *************** function _LT8988_read_ble_fifo *****************
;; Defined at:
;;		line 308 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  RXADVDATA       1    2[BANK0 ] PTR unsigned char 
;;		 -> RXADVDATA(13), 
;;  len             1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8988_ble_write_reg
;;		_ble_read_fifo
;;		_LT8988_ble_to_localdata
;; This function is called by:
;;		_ble_chanel_scan
;; This function uses a non-reentrant model
;;
psect	text937
	file	"8988_ble.c"
	line	308
	global	__size_of_LT8988_read_ble_fifo
	__size_of_LT8988_read_ble_fifo	equ	__end_of_LT8988_read_ble_fifo-_LT8988_read_ble_fifo
	
_LT8988_read_ble_fifo:	
	opt	stack 1
; Regs used in _LT8988_read_ble_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8988_read_ble_fifo@chanel stored from wreg
	line	310
	movwf	(LT8988_read_ble_fifo@chanel)
	
l4781:	
;8988_ble.c: 310: LT8988_ble_write_reg(7, 0x00, 0x00);
	clrf	(?_LT8988_ble_write_reg)
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	311
	
l4783:	
;8988_ble.c: 311: ble_read_fifo(RXADVDATA);
	movf	(LT8988_read_ble_fifo@RXADVDATA),w
	fcall	_ble_read_fifo
	line	312
	
l4785:	
;8988_ble.c: 312: if(chanel == 37)
	movf	(LT8988_read_ble_fifo@chanel),w
	xorlw	025h
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l4789
u2040:
	line	314
	
l4787:	
;8988_ble.c: 313: {
;8988_ble.c: 314: LT8988_ble_to_localdata(chanel, RXADVDATA, len, 16);
	movf	(LT8988_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8988_ble_to_localdata)
	movf	(LT8988_read_ble_fifo@len),w
	movwf	0+(?_LT8988_ble_to_localdata)+01h
	movlw	(010h)
	movwf	0+(?_LT8988_ble_to_localdata)+02h
	movf	(LT8988_read_ble_fifo@chanel),w
	fcall	_LT8988_ble_to_localdata
	line	316
;8988_ble.c: 316: }
	goto	l2430
	line	317
	
l4789:	
;8988_ble.c: 317: else if(chanel == 38)
	movf	(LT8988_read_ble_fifo@chanel),w
	xorlw	026h
	skipz
	goto	u2051
	goto	u2050
u2051:
	goto	l4793
u2050:
	line	319
	
l4791:	
;8988_ble.c: 318: {
;8988_ble.c: 319: LT8988_ble_to_localdata(chanel, RXADVDATA, len, 17);
	movf	(LT8988_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8988_ble_to_localdata)
	movf	(LT8988_read_ble_fifo@len),w
	movwf	0+(?_LT8988_ble_to_localdata)+01h
	movlw	(011h)
	movwf	0+(?_LT8988_ble_to_localdata)+02h
	movf	(LT8988_read_ble_fifo@chanel),w
	fcall	_LT8988_ble_to_localdata
	line	320
;8988_ble.c: 320: }
	goto	l2430
	line	321
	
l4793:	
;8988_ble.c: 321: else if(chanel == 39)
	movf	(LT8988_read_ble_fifo@chanel),w
	xorlw	027h
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l2430
u2060:
	line	323
	
l4795:	
;8988_ble.c: 322: {
;8988_ble.c: 323: LT8988_ble_to_localdata(chanel, RXADVDATA, len, 18);
	movf	(LT8988_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8988_ble_to_localdata)
	movf	(LT8988_read_ble_fifo@len),w
	movwf	0+(?_LT8988_ble_to_localdata)+01h
	movlw	(012h)
	movwf	0+(?_LT8988_ble_to_localdata)+02h
	movf	(LT8988_read_ble_fifo@chanel),w
	fcall	_LT8988_ble_to_localdata
	line	327
	
l2430:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_read_ble_fifo
	__end_of_LT8988_read_ble_fifo:
;; =============== function _LT8988_read_ble_fifo ends ============

	signat	_LT8988_read_ble_fifo,12408
	global	_LT8988_ble_rx_start
psect	text938,local,class=CODE,delta=2
global __ptext938
__ptext938:

;; *************** function _LT8988_ble_rx_start *****************
;; Defined at:
;;		line 238 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8988_ble_write_reg
;; This function is called by:
;;		_ble_chanel_scan
;; This function uses a non-reentrant model
;;
psect	text938
	file	"8988_ble.c"
	line	238
	global	__size_of_LT8988_ble_rx_start
	__size_of_LT8988_ble_rx_start	equ	__end_of_LT8988_ble_rx_start-_LT8988_ble_rx_start
	
_LT8988_ble_rx_start:	
	opt	stack 1
; Regs used in _LT8988_ble_rx_start: [wreg+status,2+status,0+pclath+cstack]
;LT8988_ble_rx_start@chanel stored from wreg
	line	240
	movwf	(LT8988_ble_rx_start@chanel)
	
l4769:	
;8988_ble.c: 240: if(chanel == 37)
	movf	(LT8988_ble_rx_start@chanel),w
	xorlw	025h
	skipz
	goto	u2011
	goto	u2010
u2011:
	goto	l4773
u2010:
	line	244
	
l4771:	
;8988_ble.c: 241: {
;8988_ble.c: 244: LT8988_ble_write_reg(36, 0x91, 0x59);
	movlw	(091h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(059h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8988_ble_write_reg
	line	245
;8988_ble.c: 245: LT8988_ble_write_reg(39, 0x24, 0x70);
	movlw	(024h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(070h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8988_ble_write_reg
	line	247
;8988_ble.c: 247: LT8988_ble_write_reg(7, 0, 0);
	clrf	(?_LT8988_ble_write_reg)
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	248
;8988_ble.c: 248: LT8988_ble_write_reg(8, 0x6c, 0x90);
	movlw	(06Ch)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(090h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(08h)
	fcall	_LT8988_ble_write_reg
	line	249
;8988_ble.c: 249: LT8988_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8988_ble_write_reg
	line	250
;8988_ble.c: 250: LT8988_ble_write_reg(7, 0, 0 | 0X80);
	clrf	(?_LT8988_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	251
;8988_ble.c: 251: }
	goto	l2422
	line	252
	
l4773:	
;8988_ble.c: 252: else if(chanel == 38)
	movf	(LT8988_ble_rx_start@chanel),w
	xorlw	026h
	skipz
	goto	u2021
	goto	u2020
u2021:
	goto	l4777
u2020:
	line	256
	
l4775:	
;8988_ble.c: 253: {
;8988_ble.c: 256: LT8988_ble_write_reg(7, 0, 24);
	clrf	(?_LT8988_ble_write_reg)
	movlw	(018h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	257
;8988_ble.c: 257: LT8988_ble_write_reg(8, 0x6c, 0x90);
	movlw	(06Ch)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(090h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(08h)
	fcall	_LT8988_ble_write_reg
	line	258
;8988_ble.c: 258: LT8988_ble_write_reg(36, 0x49, 0x7c);
	movlw	(049h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(07Ch)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8988_ble_write_reg
	line	259
;8988_ble.c: 259: LT8988_ble_write_reg(39, 0x8e, 0x11);
	movlw	(08Eh)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(011h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8988_ble_write_reg
	line	262
;8988_ble.c: 262: LT8988_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8988_ble_write_reg
	line	263
;8988_ble.c: 263: LT8988_ble_write_reg(7, 0, 24 | 0X80);
	clrf	(?_LT8988_ble_write_reg)
	movlw	(098h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	265
;8988_ble.c: 265: }
	goto	l2422
	line	266
	
l4777:	
;8988_ble.c: 266: else if(chanel == 39)
	movf	(LT8988_ble_rx_start@chanel),w
	xorlw	027h
	skipz
	goto	u2031
	goto	u2030
u2031:
	goto	l2422
u2030:
	line	269
	
l4779:	
;8988_ble.c: 267: {
;8988_ble.c: 269: LT8988_ble_write_reg(7, 0, 78);
	clrf	(?_LT8988_ble_write_reg)
	movlw	(04Eh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	270
;8988_ble.c: 270: LT8988_ble_write_reg(8, 0x6c, 0x90);
	movlw	(06Ch)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(090h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(08h)
	fcall	_LT8988_ble_write_reg
	line	271
;8988_ble.c: 271: LT8988_ble_write_reg(36, 0x02, 0x5e);
	movlw	(02h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(05Eh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8988_ble_write_reg
	line	272
;8988_ble.c: 272: LT8988_ble_write_reg(39, 0xc6, 0x0f);
	movlw	(0C6h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(0Fh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8988_ble_write_reg
	line	275
;8988_ble.c: 275: LT8988_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8988_ble_write_reg
	line	276
;8988_ble.c: 276: LT8988_ble_write_reg(7, 0, 78 | 0X80);
	clrf	(?_LT8988_ble_write_reg)
	movlw	(0CEh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8988_ble_write_reg
	line	279
	
l2422:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_rx_start
	__end_of_LT8988_ble_rx_start:
;; =============== function _LT8988_ble_rx_start ends ============

	signat	_LT8988_ble_rx_start,4216
	global	_LT8988_ble_tx_enable
psect	text939,local,class=CODE,delta=2
global __ptext939
__ptext939:

;; *************** function _LT8988_ble_tx_enable *****************
;; Defined at:
;;		line 196 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8988_ble_write_reg
;; This function is called by:
;;		_lt8988_ble_tx
;; This function uses a non-reentrant model
;;
psect	text939
	file	"8988_ble.c"
	line	196
	global	__size_of_LT8988_ble_tx_enable
	__size_of_LT8988_ble_tx_enable	equ	__end_of_LT8988_ble_tx_enable-_LT8988_ble_tx_enable
	
_LT8988_ble_tx_enable:	
	opt	stack 2
; Regs used in _LT8988_ble_tx_enable: [wreg+status,2+status,0+pclath+cstack]
	line	199
	
l4767:	
;8988_ble.c: 199: LT8988_ble_write_reg(32, 0x48, 0x00);
	movlw	(048h)
	movwf	(?_LT8988_ble_write_reg)
	clrf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(020h)
	fcall	_LT8988_ble_write_reg
	line	200
;8988_ble.c: 200: LT8988_ble_write_reg(36, 0xAA, 0xaa);
	movlw	(0AAh)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(0AAh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8988_ble_write_reg
	line	201
;8988_ble.c: 201: LT8988_ble_write_reg(39, 0xAA, 0xaa);
	movlw	(0AAh)
	movwf	(?_LT8988_ble_write_reg)
	movlw	(0AAh)
	movwf	0+(?_LT8988_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8988_ble_write_reg
	line	203
	
l2403:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_tx_enable
	__end_of_LT8988_ble_tx_enable:
;; =============== function _LT8988_ble_tx_enable ends ============

	signat	_LT8988_ble_tx_enable,88
	global	_ble_read_fifo
psect	text940,local,class=CODE,delta=2
global __ptext940
__ptext940:

;; *************** function _ble_read_fifo *****************
;; Defined at:
;;		line 8 in file "BLE_IIC.C"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> RXADVDATA(13), 
;; Auto vars:     Size  Location     Type
;;  buf             1    8[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(13), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT8988_ReadBUF
;; This function is called by:
;;		_LT8988_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text940
	file	"BLE_IIC.C"
	line	8
	global	__size_of_ble_read_fifo
	__size_of_ble_read_fifo	equ	__end_of_ble_read_fifo-_ble_read_fifo
	
_ble_read_fifo:	
	opt	stack 1
; Regs used in _ble_read_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ble_read_fifo@buf stored from wreg
	line	10
	movwf	(ble_read_fifo@buf)
	
l4765:	
;BLE_IIC.C: 10: LT8988_ReadBUF(buf);
	movf	(ble_read_fifo@buf),w
	fcall	_LT8988_ReadBUF
	line	13
	
l1150:	
	return
	opt stack 0
GLOBAL	__end_of_ble_read_fifo
	__end_of_ble_read_fifo:
;; =============== function _ble_read_fifo ends ============

	signat	_ble_read_fifo,4216
	global	_LT8988_ble_write_reg
psect	text941,local,class=CODE,delta=2
global __ptext941
__ptext941:

;; *************** function _LT8988_ble_write_reg *****************
;; Defined at:
;;		line 2 in file "BLE_IIC.C"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  first           1    6[COMMON] unsigned char 
;;  second          1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT8988_WriteReg
;; This function is called by:
;;		_LT8988_write_ble_fifo
;;		_LT8988_ble_tx_enable
;;		_LT8988_ble_tx_start
;;		_LT8988_ble_rx_enable
;;		_LT8988_ble_rx_start
;;		_LT8988_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text941
	file	"BLE_IIC.C"
	line	2
	global	__size_of_LT8988_ble_write_reg
	__size_of_LT8988_ble_write_reg	equ	__end_of_LT8988_ble_write_reg-_LT8988_ble_write_reg
	
_LT8988_ble_write_reg:	
	opt	stack 1
; Regs used in _LT8988_ble_write_reg: [wreg+status,2+status,0+pclath+cstack]
;LT8988_ble_write_reg@reg stored from wreg
	line	4
	movwf	(LT8988_ble_write_reg@reg)
	
l4763:	
;BLE_IIC.C: 4: LT8988_WriteReg(reg, first,second);
	movf	(LT8988_ble_write_reg@first),w
	movwf	(?_LT8988_WriteReg)
	movf	(LT8988_ble_write_reg@second),w
	movwf	0+(?_LT8988_WriteReg)+01h
	movf	(LT8988_ble_write_reg@reg),w
	fcall	_LT8988_WriteReg
	line	6
	
l1147:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_write_reg
	__end_of_LT8988_ble_write_reg:
;; =============== function _LT8988_ble_write_reg ends ============

	signat	_LT8988_ble_write_reg,12408
	global	_write_sync
psect	text942,local,class=CODE,delta=2
global __ptext942
__ptext942:

;; *************** function _write_sync *****************
;; Defined at:
;;		line 480 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT8988_WriteReg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text942
	file	"LT8988DRV.C"
	line	480
	global	__size_of_write_sync
	__size_of_write_sync	equ	__end_of_write_sync-_write_sync
	
_write_sync:	
	opt	stack 4
; Regs used in _write_sync: [wreg+status,2+status,0+pclath+cstack]
	line	482
	
l4761:	
;LT8988DRV.C: 482: LT8988_WriteReg(36, 0xAA, 0x55 );
	movlw	(0AAh)
	movwf	(?_LT8988_WriteReg)
	movlw	(055h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(024h)
	fcall	_LT8988_WriteReg
	line	483
;LT8988DRV.C: 483: LT8988_WriteReg(39, 0x33, 0x77 );
	movlw	(033h)
	movwf	(?_LT8988_WriteReg)
	movlw	(077h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(027h)
	fcall	_LT8988_WriteReg
	line	485
	
l2299:	
	return
	opt stack 0
GLOBAL	__end_of_write_sync
	__end_of_write_sync:
;; =============== function _write_sync ends ============

	signat	_write_sync,88
	global	_LT8988_INIT
psect	text943,local,class=CODE,delta=2
global __ptext943
__ptext943:

;; *************** function _LT8988_INIT *****************
;; Defined at:
;;		line 393 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT8988_WriteReg
;;		_DelayMs
;;		_LT8988_ReadReg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text943
	file	"LT8988DRV.C"
	line	393
	global	__size_of_LT8988_INIT
	__size_of_LT8988_INIT	equ	__end_of_LT8988_INIT-_LT8988_INIT
	
_LT8988_INIT:	
	opt	stack 4
; Regs used in _LT8988_INIT: [wreg+status,2+status,0+pclath+cstack]
	line	396
;LT8988DRV.C: 396: reTry:
	
l2278:	
	line	399
	
l4755:	
;LT8988DRV.C: 399: LT8988_WriteReg(0x38, 0x00, 0x00);
	clrf	(?_LT8988_WriteReg)
	clrf	0+(?_LT8988_WriteReg)+01h
	movlw	(038h)
	fcall	_LT8988_WriteReg
	line	400
;LT8988DRV.C: 400: DelayMs(5);
	movlw	(05h)
	fcall	_DelayMs
	line	401
;LT8988DRV.C: 401: LT8988_WriteReg(0x38, 0xBC, 0xDF);
	movlw	(0BCh)
	movwf	(?_LT8988_WriteReg)
	movlw	(0DFh)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(038h)
	fcall	_LT8988_WriteReg
	line	402
;LT8988DRV.C: 402: DelayMs(5);
	movlw	(05h)
	fcall	_DelayMs
	line	408
;LT8988DRV.C: 408: LT8988_WriteReg(8, 0x6C, 0x90);
	movlw	(06Ch)
	movwf	(?_LT8988_WriteReg)
	movlw	(090h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(08h)
	fcall	_LT8988_WriteReg
	line	409
;LT8988DRV.C: 409: LT8988_WriteReg(9, 0x78, 0x30);
	movlw	(078h)
	movwf	(?_LT8988_WriteReg)
	movlw	(030h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(09h)
	fcall	_LT8988_WriteReg
	line	411
;LT8988DRV.C: 411: LT8988_WriteReg(35, 0x03, 0x00);
	movlw	(03h)
	movwf	(?_LT8988_WriteReg)
	clrf	0+(?_LT8988_WriteReg)+01h
	movlw	(023h)
	fcall	_LT8988_WriteReg
	line	412
;LT8988DRV.C: 412: LT8988_WriteReg(40, 0x44, 0x02);
	movlw	(044h)
	movwf	(?_LT8988_WriteReg)
	movlw	(02h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(028h)
	fcall	_LT8988_WriteReg
	line	413
;LT8988DRV.C: 413: LT8988_WriteReg(41, 0xb0, 0x00);
	movlw	(0B0h)
	movwf	(?_LT8988_WriteReg)
	clrf	0+(?_LT8988_WriteReg)+01h
	movlw	(029h)
	fcall	_LT8988_WriteReg
	line	414
;LT8988DRV.C: 414: LT8988_WriteReg(42, 0xFD, 0xB0);
	movlw	(0FDh)
	movwf	(?_LT8988_WriteReg)
	movlw	(0B0h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(02Ah)
	fcall	_LT8988_WriteReg
	line	416
;LT8988DRV.C: 416: LT8988_WriteReg(28, 0x18, 0x02);
	movlw	(018h)
	movwf	(?_LT8988_WriteReg)
	movlw	(02h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(01Ch)
	fcall	_LT8988_WriteReg
	line	418
;LT8988DRV.C: 418: LT8988_WriteReg(32, 0x48, 0x00);
	movlw	(048h)
	movwf	(?_LT8988_WriteReg)
	clrf	0+(?_LT8988_WriteReg)+01h
	movlw	(020h)
	fcall	_LT8988_WriteReg
	line	421
;LT8988DRV.C: 421: LT8988_WriteReg(44, 0x01, 0x01);
	clrf	(?_LT8988_WriteReg)
	incf	(?_LT8988_WriteReg),f
	clrf	0+(?_LT8988_WriteReg)+01h
	incf	0+(?_LT8988_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT8988_WriteReg
	line	422
;LT8988DRV.C: 422: LT8988_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT8988_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT8988_WriteReg
	line	425
;LT8988DRV.C: 425: LT8988_WriteReg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8988_WriteReg)
	movlw	(080h)
	movwf	0+(?_LT8988_WriteReg)+01h
	movlw	(034h)
	fcall	_LT8988_WriteReg
	line	428
;LT8988DRV.C: 428: LT8988_ReadReg(0);
	movlw	(0)
	fcall	_LT8988_ReadReg
	line	429
	
l4757:	
;LT8988DRV.C: 429: if(_RegH != 0x6F || _RegL != 0XE0)
	movf	(__RegH),w
	xorlw	06Fh
	skipz
	goto	u1991
	goto	u1990
u1991:
	goto	l2278
u1990:
	
l4759:	
	movf	(__RegL),w
	xorlw	0E0h
	skipnz
	goto	u2001
	goto	u2000
u2001:
	goto	l2282
u2000:
	goto	l2278
	line	433
	
l2282:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_INIT
	__end_of_LT8988_INIT:
;; =============== function _LT8988_INIT ends ============

	signat	_LT8988_INIT,88
	global	_LT8988_ReadBUF
psect	text944,local,class=CODE,delta=2
global __ptext944
__ptext944:

;; *************** function _LT8988_ReadBUF *****************
;; Defined at:
;;		line 506 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  pBuf            1    wreg     PTR unsigned char 
;;		 -> RXADVDATA(13), 
;; Auto vars:     Size  Location     Type
;;  pBuf            1    5[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(13), 
;;  len             1    7[COMMON] unsigned char 
;;  i               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          2       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LT8988_start
;;		_Send_Byte
;;		_ack
;;		_Read_Byte
;;		_nack
;;		_LT8988_stop
;; This function is called by:
;;		_ble_read_fifo
;; This function uses a non-reentrant model
;;
psect	text944
	file	"LT8988DRV.C"
	line	506
	global	__size_of_LT8988_ReadBUF
	__size_of_LT8988_ReadBUF	equ	__end_of_LT8988_ReadBUF-_LT8988_ReadBUF
	
_LT8988_ReadBUF:	
	opt	stack 1
; Regs used in _LT8988_ReadBUF: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8988_ReadBUF@pBuf stored from wreg
	movwf	(LT8988_ReadBUF@pBuf)
	line	508
	
l4707:	
	line	513
	
l4709:	
;LT8988DRV.C: 509: unsigned char i;
;LT8988DRV.C: 513: LT8988_start();
	fcall	_LT8988_start
	line	514
	
l4711:	
;LT8988DRV.C: 514: Send_Byte(0x50);
	movlw	(050h)
	fcall	_Send_Byte
	line	515
	
l4713:	
;LT8988DRV.C: 515: ack();
	fcall	_ack
	line	516
	
l4715:	
;LT8988DRV.C: 516: Send_Byte(50 | 0X80);
	movlw	(0B2h)
	fcall	_Send_Byte
	line	517
	
l4717:	
;LT8988DRV.C: 517: ack();
	fcall	_ack
	line	518
	
l4719:	
;LT8988DRV.C: 518: LT8988_start();
	fcall	_LT8988_start
	line	519
	
l4721:	
;LT8988DRV.C: 519: Send_Byte(0x51);
	movlw	(051h)
	fcall	_Send_Byte
	line	520
	
l4723:	
;LT8988DRV.C: 520: ack();
	fcall	_ack
	line	522
	
l4725:	
;LT8988DRV.C: 522: len = Read_Byte();
	fcall	_Read_Byte
	movwf	(LT8988_ReadBUF@len)
	line	524
	
l4727:	
;LT8988DRV.C: 524: if(len > 15) {
	movlw	(010h)
	subwf	(LT8988_ReadBUF@len),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l4733
u1960:
	line	525
	
l4729:	
;LT8988DRV.C: 525: nack();
	fcall	_nack
	line	526
;LT8988DRV.C: 526: LT8988_stop();
	fcall	_LT8988_stop
	goto	l2309
	line	529
	
l4733:	
;LT8988DRV.C: 528: }
;LT8988DRV.C: 529: ack();
	fcall	_ack
	line	531
	
l4735:	
;LT8988DRV.C: 531: pBuf[0] = len;
	movf	(LT8988_ReadBUF@pBuf),w
	movwf	fsr0
	movf	(LT8988_ReadBUF@len),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	532
	
l4737:	
;LT8988DRV.C: 532: len = 13;
	movlw	(0Dh)
	movwf	(LT8988_ReadBUF@len)
	line	533
	
l4739:	
;LT8988DRV.C: 533: for(i = 0; i < len; i++)
	clrf	(LT8988_ReadBUF@i)
	goto	l4749
	line	535
	
l4741:	
;LT8988DRV.C: 534: {
;LT8988DRV.C: 535: pBuf[i + 1] = Read_Byte();
	movf	(LT8988_ReadBUF@i),w
	addwf	(LT8988_ReadBUF@pBuf),w
	movwf	(??_LT8988_ReadBUF+0)+0
	movf	0+(??_LT8988_ReadBUF+0)+0,w
	addlw	01h
	movwf	fsr0
	fcall	_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	536
	
l4743:	
;LT8988DRV.C: 536: if(i < len - 1)
	movf	(LT8988_ReadBUF@len),w
	addlw	low(-1)
	movwf	(??_LT8988_ReadBUF+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_LT8988_ReadBUF+0)+0)+1
	movf	1+(??_LT8988_ReadBUF+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1975
	movf	0+(??_LT8988_ReadBUF+0)+0,w
	subwf	(LT8988_ReadBUF@i),w
u1975:

	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l4747
u1970:
	line	538
	
l4745:	
;LT8988DRV.C: 537: {
;LT8988DRV.C: 538: ack();
	fcall	_ack
	line	533
	
l4747:	
	incf	(LT8988_ReadBUF@i),f
	
l4749:	
	movf	(LT8988_ReadBUF@len),w
	subwf	(LT8988_ReadBUF@i),w
	skipc
	goto	u1981
	goto	u1980
u1981:
	goto	l4741
u1980:
	goto	l4729
	line	546
	
l2309:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ReadBUF
	__end_of_LT8988_ReadBUF:
;; =============== function _LT8988_ReadBUF ends ============

	signat	_LT8988_ReadBUF,4217
	global	_LT8988_WriteReg
psect	text945,local,class=CODE,delta=2
global __ptext945
__ptext945:

;; *************** function _LT8988_WriteReg *****************
;; Defined at:
;;		line 344 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  H               1    3[COMMON] unsigned char 
;;  L               1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LT8988_start
;;		_Send_Byte
;;		_ack
;;		_LT8988_stop
;; This function is called by:
;;		_LT8988_ble_write_reg
;;		_LT8988_INIT
;;		_write_sync
;; This function uses a non-reentrant model
;;
psect	text945
	file	"LT8988DRV.C"
	line	344
	global	__size_of_LT8988_WriteReg
	__size_of_LT8988_WriteReg	equ	__end_of_LT8988_WriteReg-_LT8988_WriteReg
	
_LT8988_WriteReg:	
	opt	stack 1
; Regs used in _LT8988_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;LT8988_WriteReg@reg stored from wreg
	movwf	(LT8988_WriteReg@reg)
	line	345
	
l4691:	
;LT8988DRV.C: 345: LT8988_start();
	fcall	_LT8988_start
	line	346
	
l4693:	
;LT8988DRV.C: 346: Send_Byte(0x50);
	movlw	(050h)
	fcall	_Send_Byte
	line	347
	
l4695:	
;LT8988DRV.C: 347: ack();
	fcall	_ack
	line	348
;LT8988DRV.C: 348: Send_Byte(reg);
	movf	(LT8988_WriteReg@reg),w
	fcall	_Send_Byte
	line	349
	
l4697:	
;LT8988DRV.C: 349: ack();
	fcall	_ack
	line	350
	
l4699:	
;LT8988DRV.C: 350: Send_Byte(H);
	movf	(LT8988_WriteReg@H),w
	fcall	_Send_Byte
	line	351
;LT8988DRV.C: 351: ack();
	fcall	_ack
	line	352
	
l4701:	
;LT8988DRV.C: 352: Send_Byte(L);
	movf	(LT8988_WriteReg@L),w
	fcall	_Send_Byte
	line	353
	
l4703:	
;LT8988DRV.C: 353: ack();
	fcall	_ack
	line	354
	
l4705:	
;LT8988DRV.C: 354: LT8988_stop();
	fcall	_LT8988_stop
	line	355
	
l2263:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_WriteReg
	__end_of_LT8988_WriteReg:
;; =============== function _LT8988_WriteReg ends ============

	signat	_LT8988_WriteReg,12408
	global	_LT8988_ReadReg
psect	text946,local,class=CODE,delta=2
global __ptext946
__ptext946:

;; *************** function _LT8988_ReadReg *****************
;; Defined at:
;;		line 358 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LT8988_start
;;		_Send_Byte
;;		_ack
;;		_Read_Byte
;;		_nack
;;		_LT8988_stop
;; This function is called by:
;;		_ble_chanel_scan
;;		_LT8988_INIT
;; This function uses a non-reentrant model
;;
psect	text946
	file	"LT8988DRV.C"
	line	358
	global	__size_of_LT8988_ReadReg
	__size_of_LT8988_ReadReg	equ	__end_of_LT8988_ReadReg-_LT8988_ReadReg
	
_LT8988_ReadReg:	
	opt	stack 3
; Regs used in _LT8988_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;LT8988_ReadReg@reg stored from wreg
	movwf	(LT8988_ReadReg@reg)
	line	359
	
l4669:	
;LT8988DRV.C: 359: LT8988_start();
	fcall	_LT8988_start
	line	360
	
l4671:	
;LT8988DRV.C: 360: Send_Byte(0x50);
	movlw	(050h)
	fcall	_Send_Byte
	line	361
	
l4673:	
;LT8988DRV.C: 361: ack();
	fcall	_ack
	line	362
;LT8988DRV.C: 362: Send_Byte(reg | 0X80);
	movf	(LT8988_ReadReg@reg),w
	iorlw	080h
	fcall	_Send_Byte
	line	363
	
l4675:	
;LT8988DRV.C: 363: ack();
	fcall	_ack
	line	364
	
l4677:	
;LT8988DRV.C: 364: LT8988_start();
	fcall	_LT8988_start
	line	365
;LT8988DRV.C: 365: Send_Byte(0x51);
	movlw	(051h)
	fcall	_Send_Byte
	line	366
	
l4679:	
;LT8988DRV.C: 366: ack();
	fcall	_ack
	line	368
	
l4681:	
;LT8988DRV.C: 368: _RegH = Read_Byte();
	fcall	_Read_Byte
	bcf	status, 5	;RP0=0, select bank0
	movwf	(__RegH)
	line	369
	
l4683:	
;LT8988DRV.C: 369: ack();
	fcall	_ack
	line	370
	
l4685:	
;LT8988DRV.C: 370: _RegL = Read_Byte();
	fcall	_Read_Byte
	movwf	(__RegL)
	line	371
	
l4687:	
;LT8988DRV.C: 371: nack();
	fcall	_nack
	line	372
	
l4689:	
;LT8988DRV.C: 372: LT8988_stop();
	fcall	_LT8988_stop
	line	373
	
l2266:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ReadReg
	__end_of_LT8988_ReadReg:
;; =============== function _LT8988_ReadReg ends ============

	signat	_LT8988_ReadReg,4216
	global	_get_crc
psect	text947,local,class=CODE,delta=2
global __ptext947
__ptext947:

;; *************** function _get_crc *****************
;; Defined at:
;;		line 35 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  user_data_bu    1    wreg     PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  lenth           1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  user_data_bu    1    9[BANK0 ] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  e               1   10[BANK0 ] unsigned char 
;;  i               1    8[BANK0 ] unsigned char 
;;  c2              1    7[BANK0 ] unsigned char 
;;  c1              1    6[BANK0 ] unsigned char 
;;  c0              1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       6       0
;;      Temps:          0       5       0
;;      Totals:         1      11       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_roll_data
;; This function is called by:
;;		_LT8988_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text947
	file	"8988_ble.c"
	line	35
	global	__size_of_get_crc
	__size_of_get_crc	equ	__end_of_get_crc-_get_crc
	
_get_crc:	
	opt	stack 3
; Regs used in _get_crc: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;get_crc@user_data_buf stored from wreg
	line	40
	movwf	(get_crc@user_data_buf)
	
l4651:	
;8988_ble.c: 36: unsigned char c0, c1, c2;
;8988_ble.c: 37: unsigned char i, e;
;8988_ble.c: 40: c0 = 85;
	movlw	(055h)
	movwf	(get_crc@c0)
	line	41
;8988_ble.c: 41: c1 = 85;
	movlw	(055h)
	movwf	(get_crc@c1)
	line	42
;8988_ble.c: 42: c2 = 85;
	movlw	(055h)
	movwf	(get_crc@c2)
	line	45
	
l4653:	
;8988_ble.c: 45: for(i = 0; i < lenth - 3; i++)
	clrf	(get_crc@i)
	goto	l4665
	line	47
	
l4655:	
;8988_ble.c: 46: {
;8988_ble.c: 47: e = roll_data(user_data_buf[i])^c2;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(get_crc@i),w
	addwf	(get_crc@user_data_buf),w
	movwf	(??_get_crc+0)+0
	movf	0+(??_get_crc+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_roll_data
	xorwf	(get_crc@c2),w
	movwf	(get_crc@e)
	line	49
	
l4657:	
;8988_ble.c: 49: c2 = ((e >> 6)) ^ ((e >> 7))^c1;
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	07h
u1895:
	clrc
	rrf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1895
	movf	(get_crc@e),w
	movwf	(??_get_crc+1)+0
	movlw	06h
u1905:
	clrc
	rrf	(??_get_crc+1)+0,f
	addlw	-1
	skipz
	goto	u1905
	movf	0+(??_get_crc+1)+0,w
	xorwf	0+(??_get_crc+0)+0,w
	xorwf	(get_crc@c1),w
	movwf	(get_crc@c2)
	line	50
	
l4659:	
;8988_ble.c: 50: c1 = ((e << 1) & 255) ^ ((e << 2) & 255) ^ ((e >> 2)) ^ ((e >> 4)) ^ ((e >> 5)) ^ ((e >> 7))^c0;
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	07h
u1915:
	clrc
	rrf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1915
	movf	(get_crc@e),w
	movwf	(??_get_crc+1)+0
	movlw	05h
u1925:
	clrc
	rrf	(??_get_crc+1)+0,f
	addlw	-1
	skipz
	goto	u1925
	movf	(get_crc@e),w
	movwf	(??_get_crc+2)+0
	movlw	04h
u1935:
	clrc
	rrf	(??_get_crc+2)+0,f
	addlw	-1
	skipz
	goto	u1935
	movf	(get_crc@e),w
	movwf	(??_get_crc+3)+0
	clrc
	rrf	(??_get_crc+3)+0,f
	clrc
	rrf	(??_get_crc+3)+0,f
	movf	(get_crc@e),w
	movwf	(??_get_crc+4)+0
	clrc
	rlf	(??_get_crc+4)+0,f
	clrc
	rlf	(??_get_crc+4)+0,f
	clrc
	rlf	(get_crc@e),w
	xorwf	0+(??_get_crc+4)+0,w
	xorwf	0+(??_get_crc+3)+0,w
	xorwf	0+(??_get_crc+2)+0,w
	xorwf	0+(??_get_crc+1)+0,w
	xorwf	0+(??_get_crc+0)+0,w
	xorwf	(get_crc@c0),w
	movwf	(get_crc@c1)
	line	51
	
l4661:	
;8988_ble.c: 51: c0 = e ^ ((e << 1) & 255) ^ ((e << 3) & 255) ^ ((e << 4) & 255) ^ ((e << 6) & 255);
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	06h
u1945:
	clrc
	rlf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1945
	movf	(get_crc@e),w
	movwf	(??_get_crc+1)+0
	swapf	(??_get_crc+1)+0,w
	andlw	0f0h
	movwf	(??_get_crc+1)+0
	movf	(get_crc@e),w
	movwf	(??_get_crc+2)+0
	clrc
	rlf	(??_get_crc+2)+0,f
	clrc
	rlf	(??_get_crc+2)+0,f
	clrc
	rlf	(??_get_crc+2)+0,f
	clrc
	rlf	(get_crc@e),w
	xorwf	0+(??_get_crc+2)+0,w
	xorwf	0+(??_get_crc+1)+0,w
	xorwf	0+(??_get_crc+0)+0,w
	xorwf	(get_crc@e),w
	movwf	(get_crc@c0)
	line	45
	
l4663:	
	incf	(get_crc@i),f
	
l4665:	
	movf	(get_crc@lenth),w
	addlw	low(-3)
	movwf	(??_get_crc+0)+0
	movlw	high(-3)
	skipnc
	movlw	(high(-3)+1)&0ffh
	movwf	((??_get_crc+0)+0)+1
	movf	1+(??_get_crc+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1955
	movf	0+(??_get_crc+0)+0,w
	subwf	(get_crc@i),w
u1955:

	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4655
u1950:
	line	59
	
l4667:	
;8988_ble.c: 52: }
;8988_ble.c: 59: user_data_buf[lenth - 1] = roll_data(c0);
	movf	(get_crc@lenth),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(get_crc@user_data_buf),w
	movwf	(??_get_crc+0)+0
	movf	0+(??_get_crc+0)+0,w
	addlw	-1
	movwf	fsr0
	movf	(get_crc@c0),w
	fcall	_roll_data
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	60
;8988_ble.c: 60: user_data_buf[lenth - 2] = roll_data(c1);
	movf	(get_crc@lenth),w
	addwf	(get_crc@user_data_buf),w
	movwf	(??_get_crc+0)+0
	movf	0+(??_get_crc+0)+0,w
	addlw	-2
	movwf	fsr0
	movf	(get_crc@c1),w
	fcall	_roll_data
	movwf	indf
	line	61
;8988_ble.c: 61: user_data_buf[lenth - 3] = roll_data(c2);
	movf	(get_crc@lenth),w
	addwf	(get_crc@user_data_buf),w
	movwf	(??_get_crc+0)+0
	movf	0+(??_get_crc+0)+0,w
	addlw	-3
	movwf	fsr0
	movf	(get_crc@c2),w
	fcall	_roll_data
	movwf	indf
	line	63
	
l2348:	
	return
	opt stack 0
GLOBAL	__end_of_get_crc
	__end_of_get_crc:
;; =============== function _get_crc ends ============

	signat	_get_crc,8312
	global	_nack
psect	text948,local,class=CODE,delta=2
global __ptext948
__ptext948:

;; *************** function _nack *****************
;; Defined at:
;;		line 331 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text948
	file	"LT8988DRV.C"
	line	331
	global	__size_of_nack
	__size_of_nack	equ	__end_of_nack-_nack
	
_nack:	
	opt	stack 1
; Regs used in _nack: []
	line	332
	
l4649:	
;LT8988DRV.C: 332: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	334
;LT8988DRV.C: 334: RC0=1;
	bsf	(56/8),(56)&7
	line	335
;LT8988DRV.C: 335: _nop();
	nop
	line	336
;LT8988DRV.C: 336: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	337
	
l2260:	
	return
	opt stack 0
GLOBAL	__end_of_nack
	__end_of_nack:
;; =============== function _nack ends ============

	signat	_nack,88
	global	_ack
psect	text949,local,class=CODE,delta=2
global __ptext949
__ptext949:

;; *************** function _ack *****************
;; Defined at:
;;		line 323 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_WriteReg
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text949
	file	"LT8988DRV.C"
	line	323
	global	__size_of_ack
	__size_of_ack	equ	__end_of_ack-_ack
	
_ack:	
	opt	stack 1
; Regs used in _ack: []
	line	324
	
l4647:	
;LT8988DRV.C: 324: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	326
;LT8988DRV.C: 326: RC0=1;
	bsf	(56/8),(56)&7
	line	327
;LT8988DRV.C: 327: _nop();
	nop
	line	328
;LT8988DRV.C: 328: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	329
	
l2257:	
	return
	opt stack 0
GLOBAL	__end_of_ack
	__end_of_ack:
;; =============== function _ack ends ============

	signat	_ack,88
	global	_LT8988_ble_to_localdata
psect	text950,local,class=CODE,delta=2
global __ptext950
__ptext950:

;; *************** function _LT8988_ble_to_localdata *****************
;; Defined at:
;;		line 124 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  ADVDATA         1    2[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(13), 
;;  len             1    3[COMMON] unsigned char 
;;  adv_offset      1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       2       0
;;      Temps:          5       0       0
;;      Totals:         8       2       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    2
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text950
	file	"8988_ble.c"
	line	124
	global	__size_of_LT8988_ble_to_localdata
	__size_of_LT8988_ble_to_localdata	equ	__end_of_LT8988_ble_to_localdata-_LT8988_ble_to_localdata
	
_LT8988_ble_to_localdata:	
	opt	stack 2
; Regs used in _LT8988_ble_to_localdata: [wreg-fsr0h+status,2+status,0+pclath]
;LT8988_ble_to_localdata@chanel stored from wreg
	line	128
	movwf	(LT8988_ble_to_localdata@chanel)
	
l4587:	
;8988_ble.c: 126: unsigned char i;
;8988_ble.c: 128: if(chanel == 37)
	movf	(LT8988_ble_to_localdata@chanel),w
	xorlw	025h
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l4605
u1790:
	line	130
	
l4589:	
;8988_ble.c: 129: {
;8988_ble.c: 130: for(i = 0; i < len; i++)
	clrf	(LT8988_ble_to_localdata@i)
	goto	l4595
	line	132
	
l4591:	
;8988_ble.c: 131: {
;8988_ble.c: 132: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX37[i + adv_offset];
	movlw	((_WHITE_INDEX37-__stringbase))&0ffh
	addwf	(LT8988_ble_to_localdata@adv_offset),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	(??_LT8988_ble_to_localdata+3)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+4)+0
	movf	0+(??_LT8988_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+3)+0,w
	movwf	indf
	line	130
	
l4593:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4595:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l4591
u1800:
	line	136
	
l4597:	
;8988_ble.c: 134: }
;8988_ble.c: 136: for(i = 3; i < len; i++)
	movlw	(03h)
	movwf	(LT8988_ble_to_localdata@i)
	goto	l4603
	line	137
	
l4599:	
;8988_ble.c: 137: ADVDATA[i - 3] = ADVDATA[i];
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	addlw	-3
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	indf
	line	136
	
l4601:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4603:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1811
	goto	u1810
u1811:
	goto	l4599
u1810:
	goto	l4639
	line	141
	
l4605:	
;8988_ble.c: 141: else if(chanel == 38)
	movf	(LT8988_ble_to_localdata@chanel),w
	xorlw	026h
	skipz
	goto	u1821
	goto	u1820
u1821:
	goto	l4623
u1820:
	line	143
	
l4607:	
;8988_ble.c: 142: {
;8988_ble.c: 143: for(i = 0; i < len; i++)
	clrf	(LT8988_ble_to_localdata@i)
	goto	l4613
	line	145
	
l4609:	
;8988_ble.c: 144: {
;8988_ble.c: 145: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX38[i + adv_offset];
	movlw	((_WHITE_INDEX38-__stringbase))&0ffh
	addwf	(LT8988_ble_to_localdata@adv_offset),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	(??_LT8988_ble_to_localdata+3)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+4)+0
	movf	0+(??_LT8988_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+3)+0,w
	movwf	indf
	line	143
	
l4611:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4613:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1831
	goto	u1830
u1831:
	goto	l4609
u1830:
	line	148
	
l4615:	
;8988_ble.c: 146: }
;8988_ble.c: 148: for(i = 2; i < len; i++)
	movlw	(02h)
	movwf	(LT8988_ble_to_localdata@i)
	goto	l4621
	line	149
	
l4617:	
;8988_ble.c: 149: ADVDATA[i - 2] = ADVDATA[i];
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	addlw	-2
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	indf
	line	148
	
l4619:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4621:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1841
	goto	u1840
u1841:
	goto	l4617
u1840:
	goto	l4639
	line	152
	
l4623:	
;8988_ble.c: 152: else if(chanel == 39)
	movf	(LT8988_ble_to_localdata@chanel),w
	xorlw	027h
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l4639
u1850:
	line	154
	
l4625:	
;8988_ble.c: 153: {
;8988_ble.c: 154: for(i = 0; i < len; i++)
	clrf	(LT8988_ble_to_localdata@i)
	goto	l4631
	line	156
	
l4627:	
;8988_ble.c: 155: {
;8988_ble.c: 156: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX39[i + adv_offset];
	movlw	((_WHITE_INDEX39-__stringbase))&0ffh
	addwf	(LT8988_ble_to_localdata@adv_offset),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	(??_LT8988_ble_to_localdata+3)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+4)+0
	movf	0+(??_LT8988_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+3)+0,w
	movwf	indf
	line	154
	
l4629:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4631:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1861
	goto	u1860
u1861:
	goto	l4627
u1860:
	
l2387:	
	line	159
;8988_ble.c: 157: }
;8988_ble.c: 159: for(i = 1; i < len; i++)
	clrf	(LT8988_ble_to_localdata@i)
	incf	(LT8988_ble_to_localdata@i),f
	goto	l4637
	line	160
	
l4633:	
;8988_ble.c: 160: ADVDATA[i - 1] = ADVDATA[i];
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_LT8988_ble_to_localdata+1)+0
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+2)+0
	movf	0+(??_LT8988_ble_to_localdata+2)+0,w
	addlw	-1
	movwf	fsr0
	movf	(??_LT8988_ble_to_localdata+1)+0,w
	movwf	indf
	line	159
	
l4635:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4637:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l4633
u1870:
	line	164
	
l4639:	
;8988_ble.c: 161: }
;8988_ble.c: 164: for(i = 10; i < len; i++)
	movlw	(0Ah)
	movwf	(LT8988_ble_to_localdata@i)
	goto	l4645
	line	165
	
l4641:	
;8988_ble.c: 165: ADVDATA[i] = 0;
	movf	(LT8988_ble_to_localdata@i),w
	addwf	(LT8988_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8988_ble_to_localdata+0)+0
	movf	0+(??_LT8988_ble_to_localdata+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	164
	
l4643:	
	incf	(LT8988_ble_to_localdata@i),f
	
l4645:	
	movf	(LT8988_ble_to_localdata@len),w
	subwf	(LT8988_ble_to_localdata@i),w
	skipc
	goto	u1881
	goto	u1880
u1881:
	goto	l4641
u1880:
	line	168
	
l2394:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_ble_to_localdata
	__end_of_LT8988_ble_to_localdata:
;; =============== function _LT8988_ble_to_localdata ends ============

	signat	_LT8988_ble_to_localdata,16504
	global	_LT8988_pdudata_white
psect	text951,local,class=CODE,delta=2
global __ptext951
__ptext951:

;; *************** function _LT8988_pdudata_white *****************
;; Defined at:
;;		line 72 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  PDUDATA         1    2[COMMON] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    8[COMMON] unsigned char 
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          4       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    2
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text951
	file	"8988_ble.c"
	line	72
	global	__size_of_LT8988_pdudata_white
	__size_of_LT8988_pdudata_white	equ	__end_of_LT8988_pdudata_white-_LT8988_pdudata_white
	
_LT8988_pdudata_white:	
	opt	stack 3
; Regs used in _LT8988_pdudata_white: [wreg-fsr0h+status,2+status,0+pclath]
;LT8988_pdudata_white@chanel stored from wreg
	line	80
	movwf	(LT8988_pdudata_white@chanel)
	
l4557:	
;8988_ble.c: 78: unsigned char i;
;8988_ble.c: 80: if(chanel == 37)
	movf	(LT8988_pdudata_white@chanel),w
	xorlw	025h
	skipz
	goto	u1731
	goto	u1730
u1731:
	goto	l4567
u1730:
	line	82
	
l4559:	
;8988_ble.c: 81: {
;8988_ble.c: 82: for(i = 0; i < len; i++)
	clrf	(LT8988_pdudata_white@i)
	goto	l4565
	line	84
	
l4561:	
;8988_ble.c: 83: {
;8988_ble.c: 84: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX37[i];
	movf	(LT8988_pdudata_white@i),w
	addlw	low((_WHITE_INDEX37-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_pdudata_white+0)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+1)+0
	movf	0+(??_LT8988_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_pdudata_white+0)+0,w
	movwf	(??_LT8988_pdudata_white+2)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+3)+0
	movf	0+(??_LT8988_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8988_pdudata_white+2)+0,w
	movwf	indf
	line	82
	
l4563:	
	incf	(LT8988_pdudata_white@i),f
	
l4565:	
	movf	(LT8988_pdudata_white@len),w
	subwf	(LT8988_pdudata_white@i),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4561
u1740:
	goto	l2365
	line	88
	
l4567:	
;8988_ble.c: 88: else if(chanel == 38)
	movf	(LT8988_pdudata_white@chanel),w
	xorlw	026h
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l4577
u1750:
	line	90
	
l4569:	
;8988_ble.c: 89: {
;8988_ble.c: 90: for(i = 0; i < len; i++)
	clrf	(LT8988_pdudata_white@i)
	goto	l4575
	line	92
	
l4571:	
;8988_ble.c: 91: {
;8988_ble.c: 92: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX38[i];
	movf	(LT8988_pdudata_white@i),w
	addlw	low((_WHITE_INDEX38-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_pdudata_white+0)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+1)+0
	movf	0+(??_LT8988_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_pdudata_white+0)+0,w
	movwf	(??_LT8988_pdudata_white+2)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+3)+0
	movf	0+(??_LT8988_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8988_pdudata_white+2)+0,w
	movwf	indf
	line	90
	
l4573:	
	incf	(LT8988_pdudata_white@i),f
	
l4575:	
	movf	(LT8988_pdudata_white@len),w
	subwf	(LT8988_pdudata_white@i),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l4571
u1760:
	goto	l2365
	line	96
	
l4577:	
;8988_ble.c: 96: else if(chanel == 39)
	movf	(LT8988_pdudata_white@chanel),w
	xorlw	027h
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l2365
u1770:
	line	98
	
l4579:	
;8988_ble.c: 97: {
;8988_ble.c: 98: for(i = 0; i < len; i++)
	clrf	(LT8988_pdudata_white@i)
	goto	l4585
	line	100
	
l4581:	
;8988_ble.c: 99: {
;8988_ble.c: 100: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX39[i];
	movf	(LT8988_pdudata_white@i),w
	addlw	low((_WHITE_INDEX39-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8988_pdudata_white+0)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+1)+0
	movf	0+(??_LT8988_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8988_pdudata_white+0)+0,w
	movwf	(??_LT8988_pdudata_white+2)+0
	movf	(LT8988_pdudata_white@i),w
	addwf	(LT8988_pdudata_white@PDUDATA),w
	movwf	(??_LT8988_pdudata_white+3)+0
	movf	0+(??_LT8988_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8988_pdudata_white+2)+0,w
	movwf	indf
	line	98
	
l4583:	
	incf	(LT8988_pdudata_white@i),f
	
l4585:	
	movf	(LT8988_pdudata_white@len),w
	subwf	(LT8988_pdudata_white@i),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l4581
u1780:
	line	114
	
l2365:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_pdudata_white
	__end_of_LT8988_pdudata_white:
;; =============== function _LT8988_pdudata_white ends ============

	signat	_LT8988_pdudata_white,12408
	global	_roll_data
psect	text952,local,class=CODE,delta=2
global __ptext952
__ptext952:

;; *************** function _roll_data *****************
;; Defined at:
;;		line 17 in file "8988_ble.c"
;; Parameters:    Size  Location     Type
;;  roll_in         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  roll_in         1    3[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
;;  roll_out        1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_crc
;; This function uses a non-reentrant model
;;
psect	text952
	file	"8988_ble.c"
	line	17
	global	__size_of_roll_data
	__size_of_roll_data	equ	__end_of_roll_data-_roll_data
	
_roll_data:	
	opt	stack 3
; Regs used in _roll_data: [wreg+status,2+status,0]
;roll_data@roll_in stored from wreg
	movwf	(roll_data@roll_in)
	line	18
	
l4541:	
;8988_ble.c: 18: unsigned char i, roll_out = 0;
	clrf	(roll_data@roll_out)
	line	20
;8988_ble.c: 20: for(i = 0; i < 8; i++)
	clrf	(roll_data@i)
	line	22
	
l4547:	
;8988_ble.c: 21: {
;8988_ble.c: 22: if(roll_in & (1 << i)) roll_out |= 1 << (7 - i);
	movlw	(01h)
	movwf	(??_roll_data+0)+0
	incf	(roll_data@i),w
	goto	u1694
u1695:
	clrc
	rlf	(??_roll_data+0)+0,f
u1694:
	addlw	-1
	skipz
	goto	u1695
	movf	0+(??_roll_data+0)+0,w
	andwf	(roll_data@roll_in),w
	btfsc	status,2
	goto	u1701
	goto	u1700
u1701:
	goto	l4551
u1700:
	
l4549:	
	movlw	(01h)
	movwf	(??_roll_data+0)+0
	movf	(roll_data@i),w
	sublw	07h
	addlw	1
	goto	u1714
u1715:
	clrc
	rlf	(??_roll_data+0)+0,f
u1714:
	addlw	-1
	skipz
	goto	u1715
	movf	0+(??_roll_data+0)+0,w
	iorwf	(roll_data@roll_out),f
	line	20
	
l4551:	
	incf	(roll_data@i),f
	movlw	(08h)
	subwf	(roll_data@i),w
	skipc
	goto	u1721
	goto	u1720
u1721:
	goto	l4547
u1720:
	line	24
	
l4553:	
;8988_ble.c: 23: }
;8988_ble.c: 24: return roll_out;
	movf	(roll_data@roll_out),w
	line	25
	
l2342:	
	return
	opt stack 0
GLOBAL	__end_of_roll_data
	__end_of_roll_data:
;; =============== function _roll_data ends ============

	signat	_roll_data,4217
	global	_Read_Byte
psect	text953,local,class=CODE,delta=2
global __ptext953
__ptext953:

;; *************** function _Read_Byte *****************
;; Defined at:
;;		line 183 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byte            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text953
	file	"LT8988DRV.C"
	line	183
	global	__size_of_Read_Byte
	__size_of_Read_Byte	equ	__end_of_Read_Byte-_Read_Byte
	
_Read_Byte:	
	opt	stack 1
; Regs used in _Read_Byte: [wreg+status,2]
	line	186
	
l4509:	
;LT8988DRV.C: 186: unsigned char byte = 0;
	clrf	(Read_Byte@byte)
	line	188
	
l4511:	
;LT8988DRV.C: 188: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	189
	
l4513:	
;LT8988DRV.C: 189: TRISC1=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	line	213
	
l4515:	
;LT8988DRV.C: 213: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	215
	
l4517:	
;LT8988DRV.C: 215: RC0=1;
	bsf	(56/8),(56)&7
	line	217
	
l4519:	
;LT8988DRV.C: 217: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1611
	goto	u1610
u1611:
	goto	l2246
u1610:
	line	219
	
l4521:	
;LT8988DRV.C: 218: {
;LT8988DRV.C: 219: byte |= 0x80;
	bsf	(Read_Byte@byte)+(7/8),(7)&7
	line	220
	
l2246:	
	line	226
;LT8988DRV.C: 220: }
;LT8988DRV.C: 226: RC0=0;
	bcf	(56/8),(56)&7
	line	228
;LT8988DRV.C: 228: RC0=1;
	bsf	(56/8),(56)&7
	line	230
;LT8988DRV.C: 230: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1621
	goto	u1620
u1621:
	goto	l2247
u1620:
	line	232
	
l4523:	
;LT8988DRV.C: 231: {
;LT8988DRV.C: 232: byte |= 0x40;
	bsf	(Read_Byte@byte)+(6/8),(6)&7
	line	233
	
l2247:	
	line	239
;LT8988DRV.C: 233: }
;LT8988DRV.C: 239: RC0=0;
	bcf	(56/8),(56)&7
	line	241
;LT8988DRV.C: 241: RC0=1;
	bsf	(56/8),(56)&7
	line	243
;LT8988DRV.C: 243: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1631
	goto	u1630
u1631:
	goto	l2248
u1630:
	line	245
	
l4525:	
;LT8988DRV.C: 244: {
;LT8988DRV.C: 245: byte |= 0x20;
	bsf	(Read_Byte@byte)+(5/8),(5)&7
	line	246
	
l2248:	
	line	252
;LT8988DRV.C: 246: }
;LT8988DRV.C: 252: RC0=0;
	bcf	(56/8),(56)&7
	line	254
;LT8988DRV.C: 254: RC0=1;
	bsf	(56/8),(56)&7
	line	256
;LT8988DRV.C: 256: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1641
	goto	u1640
u1641:
	goto	l2249
u1640:
	line	258
	
l4527:	
;LT8988DRV.C: 257: {
;LT8988DRV.C: 258: byte |= 0x10;
	bsf	(Read_Byte@byte)+(4/8),(4)&7
	line	259
	
l2249:	
	line	265
;LT8988DRV.C: 259: }
;LT8988DRV.C: 265: RC0=0;
	bcf	(56/8),(56)&7
	line	267
;LT8988DRV.C: 267: RC0=1;
	bsf	(56/8),(56)&7
	line	269
;LT8988DRV.C: 269: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1651
	goto	u1650
u1651:
	goto	l2250
u1650:
	line	271
	
l4529:	
;LT8988DRV.C: 270: {
;LT8988DRV.C: 271: byte |= 0x8;
	bsf	(Read_Byte@byte)+(3/8),(3)&7
	line	272
	
l2250:	
	line	278
;LT8988DRV.C: 272: }
;LT8988DRV.C: 278: RC0=0;
	bcf	(56/8),(56)&7
	line	280
;LT8988DRV.C: 280: RC0=1;
	bsf	(56/8),(56)&7
	line	282
;LT8988DRV.C: 282: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1661
	goto	u1660
u1661:
	goto	l2251
u1660:
	line	284
	
l4531:	
;LT8988DRV.C: 283: {
;LT8988DRV.C: 284: byte |= 0x4;
	bsf	(Read_Byte@byte)+(2/8),(2)&7
	line	285
	
l2251:	
	line	291
;LT8988DRV.C: 285: }
;LT8988DRV.C: 291: RC0=0;
	bcf	(56/8),(56)&7
	line	293
;LT8988DRV.C: 293: RC0=1;
	bsf	(56/8),(56)&7
	line	295
;LT8988DRV.C: 295: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1671
	goto	u1670
u1671:
	goto	l2252
u1670:
	line	297
	
l4533:	
;LT8988DRV.C: 296: {
;LT8988DRV.C: 297: byte |= 0x2;
	bsf	(Read_Byte@byte)+(1/8),(1)&7
	line	298
	
l2252:	
	line	304
;LT8988DRV.C: 298: }
;LT8988DRV.C: 304: RC0=0;
	bcf	(56/8),(56)&7
	line	306
;LT8988DRV.C: 306: RC0=1;
	bsf	(56/8),(56)&7
	line	308
;LT8988DRV.C: 308: if ((RC1))
	btfss	(57/8),(57)&7
	goto	u1681
	goto	u1680
u1681:
	goto	l2253
u1680:
	line	310
	
l4535:	
;LT8988DRV.C: 309: {
;LT8988DRV.C: 310: byte |= 0x1;
	bsf	(Read_Byte@byte)+(0/8),(0)&7
	line	311
	
l2253:	
	line	316
;LT8988DRV.C: 311: }
;LT8988DRV.C: 316: RC0=0;
	bcf	(56/8),(56)&7
	line	318
;LT8988DRV.C: 318: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	319
	
l4537:	
;LT8988DRV.C: 319: return byte;
	movf	(Read_Byte@byte),w
	line	320
	
l2254:	
	return
	opt stack 0
GLOBAL	__end_of_Read_Byte
	__end_of_Read_Byte:
;; =============== function _Read_Byte ends ============

	signat	_Read_Byte,89
	global	_Send_Byte
psect	text954,local,class=CODE,delta=2
global __ptext954
__ptext954:

;; *************** function _Send_Byte *****************
;; Defined at:
;;		line 69 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  DATA            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  DATA            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_WriteReg
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text954
	file	"LT8988DRV.C"
	line	69
	global	__size_of_Send_Byte
	__size_of_Send_Byte	equ	__end_of_Send_Byte-_Send_Byte
	
_Send_Byte:	
	opt	stack 1
; Regs used in _Send_Byte: [wreg]
;Send_Byte@DATA stored from wreg
	line	87
	movwf	(Send_Byte@DATA)
	
l4491:	
;LT8988DRV.C: 87: RC0=0;
	bcf	(56/8),(56)&7
	line	89
;LT8988DRV.C: 89: if (DATA & 0x80)
	btfss	(Send_Byte@DATA),(7)&7
	goto	u1531
	goto	u1530
u1531:
	goto	l2227
u1530:
	line	90
	
l4493:	
;LT8988DRV.C: 90: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2228
	line	91
	
l2227:	
	line	92
;LT8988DRV.C: 91: else
;LT8988DRV.C: 92: RC1=0;
	bcf	(57/8),(57)&7
	
l2228:	
	line	95
;LT8988DRV.C: 95: RC0=1;
	bsf	(56/8),(56)&7
	line	98
;LT8988DRV.C: 98: RC0=0;
	bcf	(56/8),(56)&7
	line	100
;LT8988DRV.C: 100: if (DATA & 0x40)
	btfss	(Send_Byte@DATA),(6)&7
	goto	u1541
	goto	u1540
u1541:
	goto	l2229
u1540:
	line	101
	
l4495:	
;LT8988DRV.C: 101: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2230
	line	102
	
l2229:	
	line	103
;LT8988DRV.C: 102: else
;LT8988DRV.C: 103: RC1=0;
	bcf	(57/8),(57)&7
	
l2230:	
	line	106
;LT8988DRV.C: 106: RC0=1;
	bsf	(56/8),(56)&7
	line	109
;LT8988DRV.C: 109: RC0=0;
	bcf	(56/8),(56)&7
	line	111
;LT8988DRV.C: 111: if (DATA & 0x20)
	btfss	(Send_Byte@DATA),(5)&7
	goto	u1551
	goto	u1550
u1551:
	goto	l2231
u1550:
	line	112
	
l4497:	
;LT8988DRV.C: 112: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2232
	line	113
	
l2231:	
	line	114
;LT8988DRV.C: 113: else
;LT8988DRV.C: 114: RC1=0;
	bcf	(57/8),(57)&7
	
l2232:	
	line	117
;LT8988DRV.C: 117: RC0=1;
	bsf	(56/8),(56)&7
	line	120
;LT8988DRV.C: 120: RC0=0;
	bcf	(56/8),(56)&7
	line	122
;LT8988DRV.C: 122: if (DATA & 0x10)
	btfss	(Send_Byte@DATA),(4)&7
	goto	u1561
	goto	u1560
u1561:
	goto	l2233
u1560:
	line	123
	
l4499:	
;LT8988DRV.C: 123: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2234
	line	124
	
l2233:	
	line	125
;LT8988DRV.C: 124: else
;LT8988DRV.C: 125: RC1=0;
	bcf	(57/8),(57)&7
	
l2234:	
	line	128
;LT8988DRV.C: 128: RC0=1;
	bsf	(56/8),(56)&7
	line	132
;LT8988DRV.C: 132: RC0=0;
	bcf	(56/8),(56)&7
	line	134
;LT8988DRV.C: 134: if (DATA & 0x8)
	btfss	(Send_Byte@DATA),(3)&7
	goto	u1571
	goto	u1570
u1571:
	goto	l2235
u1570:
	line	135
	
l4501:	
;LT8988DRV.C: 135: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2236
	line	136
	
l2235:	
	line	137
;LT8988DRV.C: 136: else
;LT8988DRV.C: 137: RC1=0;
	bcf	(57/8),(57)&7
	
l2236:	
	line	140
;LT8988DRV.C: 140: RC0=1;
	bsf	(56/8),(56)&7
	line	143
;LT8988DRV.C: 143: RC0=0;
	bcf	(56/8),(56)&7
	line	145
;LT8988DRV.C: 145: if (DATA & 0x4)
	btfss	(Send_Byte@DATA),(2)&7
	goto	u1581
	goto	u1580
u1581:
	goto	l2237
u1580:
	line	146
	
l4503:	
;LT8988DRV.C: 146: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2238
	line	147
	
l2237:	
	line	148
;LT8988DRV.C: 147: else
;LT8988DRV.C: 148: RC1=0;
	bcf	(57/8),(57)&7
	
l2238:	
	line	151
;LT8988DRV.C: 151: RC0=1;
	bsf	(56/8),(56)&7
	line	154
;LT8988DRV.C: 154: RC0=0;
	bcf	(56/8),(56)&7
	line	156
;LT8988DRV.C: 156: if (DATA & 0x2)
	btfss	(Send_Byte@DATA),(1)&7
	goto	u1591
	goto	u1590
u1591:
	goto	l2239
u1590:
	line	157
	
l4505:	
;LT8988DRV.C: 157: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2240
	line	158
	
l2239:	
	line	159
;LT8988DRV.C: 158: else
;LT8988DRV.C: 159: RC1=0;
	bcf	(57/8),(57)&7
	
l2240:	
	line	162
;LT8988DRV.C: 162: RC0=1;
	bsf	(56/8),(56)&7
	line	165
;LT8988DRV.C: 165: RC0=0;
	bcf	(56/8),(56)&7
	line	167
;LT8988DRV.C: 167: if (DATA & 0x1)
	btfss	(Send_Byte@DATA),(0)&7
	goto	u1601
	goto	u1600
u1601:
	goto	l2241
u1600:
	line	168
	
l4507:	
;LT8988DRV.C: 168: RC1=1;
	bsf	(57/8),(57)&7
	goto	l2242
	line	169
	
l2241:	
	line	170
;LT8988DRV.C: 169: else
;LT8988DRV.C: 170: RC1=0;
	bcf	(57/8),(57)&7
	
l2242:	
	line	173
;LT8988DRV.C: 173: RC0=1;
	bsf	(56/8),(56)&7
	line	176
;LT8988DRV.C: 176: RC0=0;
	bcf	(56/8),(56)&7
	line	181
	
l2243:	
	return
	opt stack 0
GLOBAL	__end_of_Send_Byte
	__end_of_Send_Byte:
;; =============== function _Send_Byte ends ============

	signat	_Send_Byte,4216
	global	_LT8988_stop
psect	text955,local,class=CODE,delta=2
global __ptext955
__ptext955:

;; *************** function _LT8988_stop *****************
;; Defined at:
;;		line 53 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_WriteReg
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text955
	file	"LT8988DRV.C"
	line	53
	global	__size_of_LT8988_stop
	__size_of_LT8988_stop	equ	__end_of_LT8988_stop-_LT8988_stop
	
_LT8988_stop:	
	opt	stack 1
; Regs used in _LT8988_stop: []
	line	54
	
l4489:	
;LT8988DRV.C: 54: RC0=0;
	bcf	(56/8),(56)&7
	line	56
;LT8988DRV.C: 56: RC1=0;
	bcf	(57/8),(57)&7
	line	58
;LT8988DRV.C: 58: RC0=1;
	bsf	(56/8),(56)&7
	line	60
;LT8988DRV.C: 60: RC1=1;
	bsf	(57/8),(57)&7
	line	62
;LT8988DRV.C: 62: RC0=0;
	bcf	(56/8),(56)&7
	line	64
;LT8988DRV.C: 64: RC0=1;
	bsf	(56/8),(56)&7
	line	65
	
l2224:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_stop
	__end_of_LT8988_stop:
;; =============== function _LT8988_stop ends ============

	signat	_LT8988_stop,88
	global	_LT8988_start
psect	text956,local,class=CODE,delta=2
global __ptext956
__ptext956:

;; *************** function _LT8988_start *****************
;; Defined at:
;;		line 40 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT8988_WriteReg
;;		_LT8988_ReadReg
;;		_LT8988_ReadBUF
;; This function uses a non-reentrant model
;;
psect	text956
	file	"LT8988DRV.C"
	line	40
	global	__size_of_LT8988_start
	__size_of_LT8988_start	equ	__end_of_LT8988_start-_LT8988_start
	
_LT8988_start:	
	opt	stack 1
; Regs used in _LT8988_start: []
	line	41
	
l4487:	
;LT8988DRV.C: 41: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	42
;LT8988DRV.C: 42: RC0=1;
	bsf	(56/8),(56)&7
	line	45
;LT8988DRV.C: 45: RC1=0;
	bcf	(57/8),(57)&7
	line	48
;LT8988DRV.C: 48: RC0=0;
	bcf	(56/8),(56)&7
	line	50
	
l2221:	
	return
	opt stack 0
GLOBAL	__end_of_LT8988_start
	__end_of_LT8988_start:
;; =============== function _LT8988_start ends ============

	signat	_LT8988_start,88
	global	_check_sum
psect	text957,local,class=CODE,delta=2
global __ptext957
__ptext957:

;; *************** function _check_sum *****************
;; Defined at:
;;		line 568 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> RXADVDATA(13), 
;;  len             1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf             1    6[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(13), 
;;  i               1    7[COMMON] unsigned char 
;;  sum             1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 100/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          2       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ble_chanel_scan
;; This function uses a non-reentrant model
;;
psect	text957
	file	"LT8988DRV.C"
	line	568
	global	__size_of_check_sum
	__size_of_check_sum	equ	__end_of_check_sum-_check_sum
	
_check_sum:	
	opt	stack 4
; Regs used in _check_sum: [wreg-fsr0h+status,2+status,0]
;check_sum@buf stored from wreg
	line	571
	movwf	(check_sum@buf)
	
l4039:	
;LT8988DRV.C: 570: unsigned char sum, i;
;LT8988DRV.C: 571: sum = 0;
	clrf	(check_sum@sum)
	line	572
;LT8988DRV.C: 572: i = 0;
	clrf	(check_sum@i)
	line	573
;LT8988DRV.C: 573: for(i = 0; i < len - 1; i++)
	clrf	(check_sum@i)
	goto	l4045
	line	576
	
l4041:	
;LT8988DRV.C: 574: {
;LT8988DRV.C: 576: sum = buf[i] + sum;
	movf	(check_sum@i),w
	addwf	(check_sum@buf),w
	movwf	(??_check_sum+0)+0
	movf	0+(??_check_sum+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addwf	(check_sum@sum),f
	line	573
	
l4043:	
	incf	(check_sum@i),f
	
l4045:	
	movf	(check_sum@len),w
	addlw	low(-1)
	movwf	(??_check_sum+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_check_sum+0)+0)+1
	movf	1+(??_check_sum+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u825
	movf	0+(??_check_sum+0)+0,w
	subwf	(check_sum@i),w
u825:

	skipc
	goto	u821
	goto	u820
u821:
	goto	l4041
u820:
	line	578
	
l4047:	
;LT8988DRV.C: 577: }
;LT8988DRV.C: 578: if(buf[len - 1] == sum)
	movf	(check_sum@len),w
	addwf	(check_sum@buf),w
	movwf	(??_check_sum+0)+0
	movf	0+(??_check_sum+0)+0,w
	addlw	-1
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(check_sum@sum),w
	skipz
	goto	u831
	goto	u830
u831:
	goto	l4053
u830:
	line	580
	
l4049:	
;LT8988DRV.C: 579: {
;LT8988DRV.C: 580: return 1;
	movlw	(01h)
	goto	l2326
	line	582
	
l4053:	
;LT8988DRV.C: 581: }
;LT8988DRV.C: 582: return 0;
	movlw	(0)
	line	583
	
l2326:	
	return
	opt stack 0
GLOBAL	__end_of_check_sum
	__end_of_check_sum:
;; =============== function _check_sum ends ============

	signat	_check_sum,8313
	global	_DelayMs
psect	text958,local,class=CODE,delta=2
global __ptext958
__ptext958:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 379 in file "LT8988DRV.C"
;; Parameters:    Size  Location     Type
;;  Tms             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Tms             1    4[COMMON] unsigned char 
;;  dly             2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lt8988_ble_tx
;;		_ble_chanel_scan
;;		_LT8988_INIT
;; This function uses a non-reentrant model
;;
psect	text958
	file	"LT8988DRV.C"
	line	379
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 4
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@Tms stored from wreg
	movwf	(DelayMs@Tms)
	line	382
	
l4029:	
;LT8988DRV.C: 381: unsigned int dly;
;LT8988DRV.C: 382: while(Tms)
	goto	l4037
	line	384
	
l4031:	
;LT8988DRV.C: 383: {
;LT8988DRV.C: 384: Tms--;
	decf	(DelayMs@Tms),f
	line	385
;LT8988DRV.C: 385: dly = 650;
	movlw	low(028Ah)
	movwf	(DelayMs@dly)
	movlw	high(028Ah)
	movwf	((DelayMs@dly))+1
	line	386
;LT8988DRV.C: 386: while(dly) dly--;
	goto	l4035
	
l4033:	
	movlw	low(01h)
	subwf	(DelayMs@dly),f
	movlw	high(01h)
	skipc
	decf	(DelayMs@dly+1),f
	subwf	(DelayMs@dly+1),f
	
l4035:	
	movf	((DelayMs@dly+1)),w
	iorwf	((DelayMs@dly)),w
	skipz
	goto	u801
	goto	u800
u801:
	goto	l4033
u800:
	line	382
	
l4037:	
	movf	(DelayMs@Tms),f
	skipz
	goto	u811
	goto	u810
u811:
	goto	l4031
u810:
	line	389
	
l2275:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_Init
psect	text959,local,class=CODE,delta=2
global __ptext959
__ptext959:

;; *************** function _Init *****************
;; Defined at:
;;		line 73 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text959
	file	"main.c"
	line	73
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 6
; Regs used in _Init: [wreg+status,2]
	line	84
	
l3991:	
;main.c: 84: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	87
	
l3993:	
;main.c: 87: INTCON = 0;
	clrf	(11)	;volatile
	line	88
	
l3995:	
;main.c: 88: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	89
	
l3997:	
;main.c: 89: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	90
	
l3999:	
;main.c: 90: PORTC = 0B00000011;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	91
;main.c: 91: TRISC = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(135)^080h	;volatile
	line	93
	
l4001:	
;main.c: 93: WPUA = 0B00000111;
	movlw	(07h)
	movwf	(149)^080h	;volatile
	line	94
	
l4003:	
;main.c: 94: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	95
;main.c: 95: OPTION = 0B10001000;
	movlw	(088h)
	movwf	(129)^080h	;volatile
	line	97
	
l4005:	
;main.c: 97: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	100
	
l4007:	
;main.c: 100: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	104
;main.c: 104: T1CON = 0B00000000;
	clrf	(16)	;volatile
	line	107
	
l4009:	
;main.c: 107: TMR1L = 0XBF;
	movlw	(0BFh)
	movwf	(14)	;volatile
	line	109
	
l4011:	
;main.c: 109: TMR1H = 0XE0;
	movlw	(0E0h)
	movwf	(15)	;volatile
	line	110
	
l4013:	
;main.c: 110: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	111
	
l4015:	
;main.c: 111: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	112
	
l4017:	
;main.c: 112: PEIE = 1;
	bsf	(94/8),(94)&7
	line	113
	
l4019:	
;main.c: 113: GIE = 1;
	bsf	(95/8),(95)&7
	line	116
	
l4021:	
;main.c: 116: ADCON1 = 0B00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	118
	
l4023:	
;main.c: 118: ADCON1 = 0B01010000;
	movlw	(050h)
	movwf	(159)^080h	;volatile
	line	120
	
l4025:	
;main.c: 120: ADCON0 = 0B10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	124
	
l4027:	
;main.c: 124: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(145)^080h	;volatile
	line	125
	
l1108:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
	global	_ISR
psect	text960,local,class=CODE,delta=2
global __ptext960
__ptext960:

;; *************** function _ISR *****************
;; Defined at:
;;		line 45 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text960
	file	"main.c"
	line	45
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 1
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text960
	line	46
	
i1l3975:	
;main.c: 46: GIE = 0;
	bcf	(95/8),(95)&7
	line	51
;main.c: 51: if(TMR1IE && TMR1IF)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u77_21
	goto	u77_20
u77_21:
	goto	i1l3989
u77_20:
	
i1l3977:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u78_21
	goto	u78_20
u78_21:
	goto	i1l3989
u78_20:
	line	53
	
i1l3979:	
;main.c: 52: {
;main.c: 53: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	54
	
i1l3981:	
;main.c: 54: TMR1L = 0X2F;
	movlw	(02Fh)
	movwf	(14)	;volatile
	line	55
;main.c: 55: TMR1H = 0XF8;
	movlw	(0F8h)
	movwf	(15)	;volatile
	line	57
	
i1l3983:	
;main.c: 57: rxtimeout++;
	incf	(_rxtimeout),f
	skipnz
	incf	(_rxtimeout+1),f
	line	59
	
i1l3985:	
;main.c: 59: if(rxtimeout > 4000)
	movlw	high(0FA1h)
	subwf	(_rxtimeout+1),w
	movlw	low(0FA1h)
	skipnz
	subwf	(_rxtimeout),w
	skipc
	goto	u79_21
	goto	u79_20
u79_21:
	goto	i1l3989
u79_20:
	line	61
	
i1l3987:	
;main.c: 60: {
;main.c: 61: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	line	62
;main.c: 62: lt8988_work_sta = SCAN;
	clrf	(_lt8988_work_sta)
	line	68
	
i1l3989:	
;main.c: 64: }
;main.c: 66: }
;main.c: 68: GIE = 1;
	bsf	(95/8),(95)&7
	line	69
	
i1l1105:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text961,local,class=CODE,delta=2
global __ptext961
__ptext961:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

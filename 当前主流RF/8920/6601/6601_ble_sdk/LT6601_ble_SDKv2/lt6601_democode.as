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
	FNCALL	_main,_LT89XX_INIT
	FNCALL	_main,_LT89xx_ModeSet
	FNCALL	_main,_LT8920_ble_tx
	FNCALL	_main,_LT8920_ble_rx
	FNCALL	_LT8920_ble_rx,_LT8920_ble_rx_enable
	FNCALL	_LT8920_ble_rx,_ble_chanel_scan
	FNCALL	_ble_chanel_scan,_LT8920_ble_rx_start
	FNCALL	_ble_chanel_scan,_LT_ReadReg
	FNCALL	_ble_chanel_scan,_LT8920_read_ble_fifo
	FNCALL	_ble_chanel_scan,_check_sum
	FNCALL	_ble_chanel_scan,_DELAY_MS
	FNCALL	_LT8920_ble_tx,_LT8920_ble_tx_enable
	FNCALL	_LT8920_ble_tx,_LT8920_ble_tx_start
	FNCALL	_LT8920_ble_tx,_DELAY_MS
	FNCALL	_LT8920_ble_rx_enable,_LT8920_ble_write_reg
	FNCALL	_LT8920_read_ble_fifo,_LT8920_ble_write_reg
	FNCALL	_LT8920_read_ble_fifo,_ble_read_fifo
	FNCALL	_LT8920_read_ble_fifo,_LT8920_ble_to_localdata
	FNCALL	_LT8920_ble_rx_start,_LT8920_ble_write_reg
	FNCALL	_LT8920_ble_tx_start,_get_crc
	FNCALL	_LT8920_ble_tx_start,_LT8920_pdudata_white
	FNCALL	_LT8920_ble_tx_start,_LT8920_ble_write_reg
	FNCALL	_LT8920_ble_tx_start,_LT8920_write_ble_fifo
	FNCALL	_LT8920_ble_tx_enable,_LT8920_ble_write_reg
	FNCALL	_ble_read_fifo,_LT_ReadBUF_ble
	FNCALL	_LT8920_write_ble_fifo,_LT_WriteBUF_ble
	FNCALL	_LT8920_ble_write_reg,_LT_WriteReg
	FNCALL	_LT89xx_ModeSet,_LT_WriteReg
	FNCALL	_LT89XX_INIT,_DELAY_MS
	FNCALL	_LT89XX_INIT,_LT_WriteReg
	FNCALL	_LT89XX_INIT,_LT_ReadReg
	FNCALL	_get_crc,_roll_data
	FNCALL	_LT_ReadBUF_ble,_SPI_SendByte
	FNCALL	_LT_ReadBUF_ble,_SPI_ReadByte
	FNCALL	_LT_WriteBUF_ble,_SPI_SendByte
	FNCALL	_LT_WriteReg,_SPI_SendByte
	FNCALL	_LT_ReadReg,_SPI_SendByte
	FNCALL	_LT_ReadReg,_SPI_ReadByte
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_PDUDATA
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"main.c"
	line	24

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
	global	_LDT8900config
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
	file	"lt89xxdrvspi.c"
	line	161
_LDT8900config:
	retlw	0
	retlw	06Fh
	retlw	0E0h
	retlw	01h
	retlw	056h
	retlw	081h
	retlw	02h
	retlw	066h
	retlw	017h
	retlw	04h
	retlw	09Ch
	retlw	0C9h
	retlw	05h
	retlw	066h
	retlw	037h
	retlw	07h
	retlw	0
	retlw	030h
	retlw	08h
	retlw	06Ch
	retlw	090h
	retlw	09h
	retlw	048h
	retlw	0
	retlw	0Ah
	retlw	07Fh
	retlw	0FDh
	retlw	0Bh
	retlw	0
	retlw	08h
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	0Dh
	retlw	048h
	retlw	0BDh
	retlw	016h
	retlw	0
	retlw	0FFh
	retlw	017h
	retlw	080h
	retlw	05h
	retlw	018h
	retlw	0
	retlw	067h
	retlw	019h
	retlw	016h
	retlw	0DBh
	retlw	01Ah
	retlw	019h
	retlw	0E0h
	retlw	01Bh
	retlw	013h
	retlw	0
	retlw	01Ch
	retlw	018h
	retlw	0
	retlw	020h
	retlw	048h
	retlw	08h
	retlw	021h
	retlw	03Fh
	retlw	0C7h
	retlw	022h
	retlw	020h
	retlw	0
	retlw	023h
	retlw	03h
	retlw	0
	retlw	024h
	retlw	0AAh
	retlw	0AAh
	retlw	025h
	retlw	0AAh
	retlw	0AAh
	retlw	026h
	retlw	0AAh
	retlw	0AAh
	retlw	027h
	retlw	0AAh
	retlw	0AAh
	retlw	028h
	retlw	044h
	retlw	02h
	retlw	029h
	retlw	0B0h
	retlw	0
	retlw	02Ah
	retlw	0FDh
	retlw	0B0h
	retlw	02Bh
	retlw	0
	retlw	0Fh
	retlw	02Ch
	retlw	01h
	retlw	01h
	retlw	02Dh
	retlw	01h
	retlw	052h
	retlw	034h
	retlw	080h
	retlw	080h
	global	_WHITE_INDEX37
psect	strings
	file	"rx_ble.c"
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
	file	"rx_ble.c"
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
	file	"rx_ble.c"
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
	global	_LDT8900config
	global	_WHITE_INDEX37
	global	_WHITE_INDEX38
	global	_WHITE_INDEX39
	global	_rxtimeout
	global	_LT8920_work_sta
	global	_RegL
	global	_ledsta
	global	_rxflag
	global	_RegH
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
	global	_RA5
_RA5	set	45
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
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
	file	"lt6601_democode.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_RegH:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rxtimeout:
       ds      2

_LT8920_work_sta:
       ds      1

_RegL:
       ds      1

_ledsta:
       ds      1

_rxflag:
       ds      1

_RXADVDATA:
       ds      29

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"main.c"
	line	24
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
	movlw	low((__pbssBANK0)+023h)
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
	global	?_LT89XX_INIT
?_LT89XX_INIT:	; 0 bytes @ 0x0
	global	?_LT89xx_ModeSet
?_LT89xx_ModeSet:	; 0 bytes @ 0x0
	global	?_LT8920_ble_tx
?_LT8920_ble_tx:	; 0 bytes @ 0x0
	global	?_LT8920_ble_rx
?_LT8920_ble_rx:	; 0 bytes @ 0x0
	global	?_LT8920_ble_tx_enable
?_LT8920_ble_tx_enable:	; 0 bytes @ 0x0
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x0
	global	?_LT8920_ble_rx_start
?_LT8920_ble_rx_start:	; 0 bytes @ 0x0
	global	?_LT_ReadReg
?_LT_ReadReg:	; 0 bytes @ 0x0
	global	?_LT8920_ble_rx_enable
?_LT8920_ble_rx_enable:	; 0 bytes @ 0x0
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
	global	?_SPI_SendByte
?_SPI_SendByte:	; 0 bytes @ 0x0
	global	?_SPI_ReadByte
?_SPI_ReadByte:	; 1 bytes @ 0x0
	global	?_roll_data
?_roll_data:	; 1 bytes @ 0x0
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x2
	global	??_Init
??_Init:	; 0 bytes @ 0x2
	global	??_SPI_SendByte
??_SPI_SendByte:	; 0 bytes @ 0x2
	global	??_SPI_ReadByte
??_SPI_ReadByte:	; 0 bytes @ 0x2
	global	??_roll_data
??_roll_data:	; 0 bytes @ 0x2
	global	?_LT8920_pdudata_white
?_LT8920_pdudata_white:	; 0 bytes @ 0x2
	global	?_LT8920_ble_to_localdata
?_LT8920_ble_to_localdata:	; 0 bytes @ 0x2
	global	?_check_sum
?_check_sum:	; 1 bytes @ 0x2
	global	check_sum@len
check_sum@len:	; 1 bytes @ 0x2
	global	SPI_SendByte@buf
SPI_SendByte@buf:	; 1 bytes @ 0x2
	global	SPI_ReadByte@retvalue
SPI_ReadByte@retvalue:	; 1 bytes @ 0x2
	global	LT8920_pdudata_white@PDUDATA
LT8920_pdudata_white@PDUDATA:	; 1 bytes @ 0x2
	global	LT8920_ble_to_localdata@ADVDATA
LT8920_ble_to_localdata@ADVDATA:	; 1 bytes @ 0x2
	global	DELAY_MS@dly
DELAY_MS@dly:	; 2 bytes @ 0x2
	ds	1
	global	??_check_sum
??_check_sum:	; 0 bytes @ 0x3
	global	SPI_SendByte@mcnt
SPI_SendByte@mcnt:	; 1 bytes @ 0x3
	global	SPI_ReadByte@mcnt
SPI_ReadByte@mcnt:	; 1 bytes @ 0x3
	global	roll_data@roll_in
roll_data@roll_in:	; 1 bytes @ 0x3
	global	LT8920_pdudata_white@len
LT8920_pdudata_white@len:	; 1 bytes @ 0x3
	global	LT8920_ble_to_localdata@len
LT8920_ble_to_localdata@len:	; 1 bytes @ 0x3
	ds	1
	global	??_LT_ReadReg
??_LT_ReadReg:	; 0 bytes @ 0x4
	global	?_LT_WriteReg
?_LT_WriteReg:	; 0 bytes @ 0x4
	global	?_LT_WriteBUF_ble
?_LT_WriteBUF_ble:	; 0 bytes @ 0x4
	global	??_LT8920_pdudata_white
??_LT8920_pdudata_white:	; 0 bytes @ 0x4
	global	?_LT_ReadBUF_ble
?_LT_ReadBUF_ble:	; 1 bytes @ 0x4
	global	DELAY_MS@Tms
DELAY_MS@Tms:	; 1 bytes @ 0x4
	global	LT_ReadReg@reg
LT_ReadReg@reg:	; 1 bytes @ 0x4
	global	LT_WriteReg@H
LT_WriteReg@H:	; 1 bytes @ 0x4
	global	LT_WriteBUF_ble@pBuf
LT_WriteBUF_ble@pBuf:	; 1 bytes @ 0x4
	global	LT_ReadBUF_ble@pBuf
LT_ReadBUF_ble@pBuf:	; 1 bytes @ 0x4
	global	roll_data@roll_out
roll_data@roll_out:	; 1 bytes @ 0x4
	global	LT8920_ble_to_localdata@adv_offset
LT8920_ble_to_localdata@adv_offset:	; 1 bytes @ 0x4
	ds	1
	global	??_LT8920_ble_to_localdata
??_LT8920_ble_to_localdata:	; 0 bytes @ 0x5
	global	check_sum@sum
check_sum@sum:	; 1 bytes @ 0x5
	global	LT_WriteReg@L
LT_WriteReg@L:	; 1 bytes @ 0x5
	global	LT_WriteBUF_ble@len
LT_WriteBUF_ble@len:	; 1 bytes @ 0x5
	global	LT_ReadBUF_ble@lenth
LT_ReadBUF_ble@lenth:	; 1 bytes @ 0x5
	global	roll_data@i
roll_data@i:	; 1 bytes @ 0x5
	ds	1
	global	??_LT_WriteReg
??_LT_WriteReg:	; 0 bytes @ 0x6
	global	??_LT_WriteBUF_ble
??_LT_WriteBUF_ble:	; 0 bytes @ 0x6
	global	??_LT_ReadBUF_ble
??_LT_ReadBUF_ble:	; 0 bytes @ 0x6
	global	?_get_crc
?_get_crc:	; 0 bytes @ 0x6
	global	check_sum@buf
check_sum@buf:	; 1 bytes @ 0x6
	global	LT_WriteReg@reg
LT_WriteReg@reg:	; 1 bytes @ 0x6
	global	get_crc@lenth
get_crc@lenth:	; 1 bytes @ 0x6
	ds	1
	global	??_LT89XX_INIT
??_LT89XX_INIT:	; 0 bytes @ 0x7
	global	??_LT89xx_ModeSet
??_LT89xx_ModeSet:	; 0 bytes @ 0x7
	global	?_LT8920_ble_write_reg
?_LT8920_ble_write_reg:	; 0 bytes @ 0x7
	global	check_sum@i
check_sum@i:	; 1 bytes @ 0x7
	global	LT_WriteBUF_ble@reg
LT_WriteBUF_ble@reg:	; 1 bytes @ 0x7
	global	LT89XX_INIT@CFG_CNT
LT89XX_INIT@CFG_CNT:	; 1 bytes @ 0x7
	global	LT89xx_ModeSet@dat1
LT89xx_ModeSet@dat1:	; 1 bytes @ 0x7
	global	LT8920_ble_write_reg@first
LT8920_ble_write_reg@first:	; 1 bytes @ 0x7
	ds	1
	global	LT_WriteBUF_ble@i
LT_WriteBUF_ble@i:	; 1 bytes @ 0x8
	global	LT_ReadBUF_ble@reg
LT_ReadBUF_ble@reg:	; 1 bytes @ 0x8
	global	LT8920_ble_write_reg@second
LT8920_ble_write_reg@second:	; 1 bytes @ 0x8
	global	LT8920_pdudata_white@chanel
LT8920_pdudata_white@chanel:	; 1 bytes @ 0x8
	ds	1
	global	??_LT8920_ble_write_reg
??_LT8920_ble_write_reg:	; 0 bytes @ 0x9
	global	?_LT8920_write_ble_fifo
?_LT8920_write_ble_fifo:	; 0 bytes @ 0x9
	global	LT_ReadBUF_ble@i
LT_ReadBUF_ble@i:	; 1 bytes @ 0x9
	global	LT8920_ble_write_reg@reg
LT8920_ble_write_reg@reg:	; 1 bytes @ 0x9
	global	LT8920_write_ble_fifo@len
LT8920_write_ble_fifo@len:	; 1 bytes @ 0x9
	global	LT8920_pdudata_white@i
LT8920_pdudata_white@i:	; 1 bytes @ 0x9
	ds	1
	global	??_LT8920_ble_tx_enable
??_LT8920_ble_tx_enable:	; 0 bytes @ 0xA
	global	??_LT8920_ble_rx_start
??_LT8920_ble_rx_start:	; 0 bytes @ 0xA
	global	??_LT8920_ble_rx_enable
??_LT8920_ble_rx_enable:	; 0 bytes @ 0xA
	global	??_LT8920_write_ble_fifo
??_LT8920_write_ble_fifo:	; 0 bytes @ 0xA
	global	?_ble_read_fifo
?_ble_read_fifo:	; 0 bytes @ 0xA
	global	LT8920_write_ble_fifo@txdata
LT8920_write_ble_fifo@txdata:	; 1 bytes @ 0xA
	global	ble_read_fifo@len
ble_read_fifo@len:	; 1 bytes @ 0xA
	global	LT8920_ble_rx_start@chanel
LT8920_ble_rx_start@chanel:	; 1 bytes @ 0xA
	ds	1
	global	??_LT8920_ble_tx
??_LT8920_ble_tx:	; 0 bytes @ 0xB
	global	??_LT8920_ble_rx
??_LT8920_ble_rx:	; 0 bytes @ 0xB
	global	??_LT8920_ble_tx_start
??_LT8920_ble_tx_start:	; 0 bytes @ 0xB
	global	??_LT8920_read_ble_fifo
??_LT8920_read_ble_fifo:	; 0 bytes @ 0xB
	global	??_main
??_main:	; 0 bytes @ 0xB
	global	??_ble_chanel_scan
??_ble_chanel_scan:	; 0 bytes @ 0xB
	global	??_ble_read_fifo
??_ble_read_fifo:	; 0 bytes @ 0xB
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_get_crc
??_get_crc:	; 0 bytes @ 0x0
	global	ble_read_fifo@buf
ble_read_fifo@buf:	; 1 bytes @ 0x0
	global	LT8920_ble_to_localdata@chanel
LT8920_ble_to_localdata@chanel:	; 1 bytes @ 0x0
	ds	1
	global	LT8920_ble_to_localdata@i
LT8920_ble_to_localdata@i:	; 1 bytes @ 0x1
	ds	1
	global	?_LT8920_read_ble_fifo
?_LT8920_read_ble_fifo:	; 0 bytes @ 0x2
	global	LT8920_read_ble_fifo@RXADVDATA
LT8920_read_ble_fifo@RXADVDATA:	; 1 bytes @ 0x2
	ds	1
	global	LT8920_read_ble_fifo@len
LT8920_read_ble_fifo@len:	; 1 bytes @ 0x3
	ds	1
	global	LT8920_read_ble_fifo@chanel
LT8920_read_ble_fifo@chanel:	; 1 bytes @ 0x4
	ds	1
	global	ble_chanel_scan@chanel
ble_chanel_scan@chanel:	; 1 bytes @ 0x5
	global	get_crc@c0
get_crc@c0:	; 1 bytes @ 0x5
	ds	1
	global	ble_chanel_scan@i
ble_chanel_scan@i:	; 1 bytes @ 0x6
	global	get_crc@c1
get_crc@c1:	; 1 bytes @ 0x6
	ds	1
	global	LT8920_ble_rx@i
LT8920_ble_rx@i:	; 1 bytes @ 0x7
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
	global	?_LT8920_ble_tx_start
?_LT8920_ble_tx_start:	; 0 bytes @ 0xB
	global	LT8920_ble_tx_start@PDUDATA
LT8920_ble_tx_start@PDUDATA:	; 1 bytes @ 0xB
	ds	1
	global	LT8920_ble_tx_start@len
LT8920_ble_tx_start@len:	; 1 bytes @ 0xC
	ds	1
	global	LT8920_ble_tx_start@chanel
LT8920_ble_tx_start@chanel:	; 1 bytes @ 0xD
	ds	1
;;Data sizes: Strings 0, constant 219, data 26, bss 36, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      12
;; BANK0           80     14      75
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; LT8920_read_ble_fifo@RXADVDATA	PTR unsigned char  size(1) Largest target is 29
;;		 -> RXADVDATA(BANK0[29]), 
;;
;; LT8920_ble_tx_start@PDUDATA	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; LT8920_ble_to_localdata@ADVDATA	PTR unsigned char  size(1) Largest target is 29
;;		 -> RXADVDATA(BANK0[29]), 
;;
;; LT8920_pdudata_white@PDUDATA	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; get_crc@user_data_buf	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; ble_read_fifo@buf	PTR unsigned char  size(1) Largest target is 29
;;		 -> RXADVDATA(BANK0[29]), 
;;
;; LT8920_write_ble_fifo@txdata	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; LT_ReadBUF_ble@pBuf	PTR unsigned char  size(1) Largest target is 29
;;		 -> RXADVDATA(BANK0[29]), 
;;
;; LT_WriteBUF_ble@pBuf	PTR unsigned char  size(1) Largest target is 26
;;		 -> PDUDATA(BANK0[26]), 
;;
;; check_sum@buf	PTR unsigned char  size(1) Largest target is 29
;;		 -> RXADVDATA(BANK0[29]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _ble_chanel_scan->_LT8920_ble_rx_start
;;   _LT8920_ble_rx_enable->_LT8920_ble_write_reg
;;   _LT8920_read_ble_fifo->_ble_read_fifo
;;   _LT8920_ble_rx_start->_LT8920_ble_write_reg
;;   _LT8920_ble_tx_start->_LT8920_write_ble_fifo
;;   _LT8920_ble_tx_enable->_LT8920_ble_write_reg
;;   _ble_read_fifo->_LT_ReadBUF_ble
;;   _LT8920_write_ble_fifo->_LT_WriteBUF_ble
;;   _LT8920_ble_write_reg->_LT_WriteReg
;;   _LT89xx_ModeSet->_LT_WriteReg
;;   _LT89XX_INIT->_LT_WriteReg
;;   _get_crc->_roll_data
;;   _LT_ReadBUF_ble->_SPI_SendByte
;;   _LT_ReadBUF_ble->_SPI_ReadByte
;;   _LT_WriteBUF_ble->_SPI_SendByte
;;   _LT_WriteReg->_SPI_SendByte
;;   _LT_ReadReg->_SPI_SendByte
;;   _LT_ReadReg->_SPI_ReadByte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _LT8920_ble_rx->_ble_chanel_scan
;;   _ble_chanel_scan->_LT8920_read_ble_fifo
;;   _LT8920_ble_tx->_LT8920_ble_tx_start
;;   _LT8920_read_ble_fifo->_LT8920_ble_to_localdata
;;   _LT8920_ble_tx_start->_get_crc
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
;; (0) _main                                                 1     1      0    7200
;;                               _Init
;;                        _LT89XX_INIT
;;                     _LT89xx_ModeSet
;;                      _LT8920_ble_tx
;;                      _LT8920_ble_rx
;; ---------------------------------------------------------------------------------
;; (1) _LT8920_ble_rx                                        1     1      0    3349
;;                                              7 BANK0      1     1      0
;;               _LT8920_ble_rx_enable
;;                    _ble_chanel_scan
;; ---------------------------------------------------------------------------------
;; (2) _ble_chanel_scan                                      2     2      0    2993
;;                                              5 BANK0      2     2      0
;;                _LT8920_ble_rx_start
;;                         _LT_ReadReg
;;               _LT8920_read_ble_fifo
;;                          _check_sum
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (1) _LT8920_ble_tx                                        0     0      0    2978
;;               _LT8920_ble_tx_enable
;;                _LT8920_ble_tx_start
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (2) _LT8920_ble_rx_enable                                 0     0      0     288
;;               _LT8920_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (3) _LT8920_read_ble_fifo                                 3     1      2    2023
;;                                              2 BANK0      3     1      2
;;               _LT8920_ble_write_reg
;;                      _ble_read_fifo
;;            _LT8920_ble_to_localdata
;; ---------------------------------------------------------------------------------
;; (3) _LT8920_ble_rx_start                                  1     1      0     381
;;                                             10 COMMON     1     1      0
;;               _LT8920_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (2) _LT8920_ble_tx_start                                  3     1      2    2643
;;                                             11 BANK0      3     1      2
;;                            _get_crc
;;               _LT8920_pdudata_white
;;               _LT8920_ble_write_reg
;;              _LT8920_write_ble_fifo
;; ---------------------------------------------------------------------------------
;; (2) _LT8920_ble_tx_enable                                 0     0      0     288
;;               _LT8920_ble_write_reg
;; ---------------------------------------------------------------------------------
;; (4) _ble_read_fifo                                        2     1      1     446
;;                                             10 COMMON     1     0      1
;;                                              0 BANK0      1     1      0
;;                     _LT_ReadBUF_ble
;; ---------------------------------------------------------------------------------
;; (3) _LT8920_write_ble_fifo                                2     1      1     356
;;                                              9 COMMON     2     1      1
;;                    _LT_WriteBUF_ble
;; ---------------------------------------------------------------------------------
;; (4) _LT8920_ble_write_reg                                 3     1      2     288
;;                                              7 COMMON     3     1      2
;;                        _LT_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _LT89xx_ModeSet                                       1     1      0     226
;;                                              7 COMMON     1     1      0
;;                        _LT_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _LT89XX_INIT                                          1     1      0     647
;;                                              7 COMMON     1     1      0
;;                           _DELAY_MS
;;                        _LT_WriteReg
;;                         _LT_ReadReg
;; ---------------------------------------------------------------------------------
;; (3) _get_crc                                             12    11      1    1062
;;                                              6 COMMON     1     0      1
;;                                              0 BANK0     11    11      0
;;                          _roll_data
;; ---------------------------------------------------------------------------------
;; (5) _LT_ReadBUF_ble                                       6     4      2     384
;;                                              4 COMMON     6     4      2
;;                       _SPI_SendByte
;;                       _SPI_ReadByte
;; ---------------------------------------------------------------------------------
;; (4) _LT_WriteBUF_ble                                      5     3      2     294
;;                                              4 COMMON     5     3      2
;;                       _SPI_SendByte
;; ---------------------------------------------------------------------------------
;; (5) _LT_WriteReg                                          3     1      2     195
;;                                              4 COMMON     3     1      2
;;                       _SPI_SendByte
;; ---------------------------------------------------------------------------------
;; (3) _LT_ReadReg                                           1     1      0     244
;;                                              4 COMMON     1     1      0
;;                       _SPI_SendByte
;;                       _SPI_ReadByte
;; ---------------------------------------------------------------------------------
;; (5) _LT8920_ble_to_localdata                             10     7      3     855
;;                                              2 COMMON     8     5      3
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _LT8920_pdudata_white                                 8     6      2     534
;;                                              2 COMMON     8     6      2
;; ---------------------------------------------------------------------------------
;; (4) _roll_data                                            4     4      0     136
;;                                              2 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (6) _SPI_ReadByte                                         2     2      0     111
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (6) _SPI_SendByte                                         2     2      0     102
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _check_sum                                            6     5      1     165
;;                                              2 COMMON     6     5      1
;; ---------------------------------------------------------------------------------
;; (3) _DELAY_MS                                             3     3      0      47
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
;;   _LT89XX_INIT
;;     _DELAY_MS
;;     _LT_WriteReg
;;       _SPI_SendByte
;;     _LT_ReadReg
;;       _SPI_SendByte
;;       _SPI_ReadByte
;;   _LT89xx_ModeSet
;;     _LT_WriteReg
;;       _SPI_SendByte
;;   _LT8920_ble_tx
;;     _LT8920_ble_tx_enable
;;       _LT8920_ble_write_reg
;;         _LT_WriteReg
;;           _SPI_SendByte
;;     _LT8920_ble_tx_start
;;       _get_crc
;;         _roll_data
;;       _LT8920_pdudata_white
;;       _LT8920_ble_write_reg
;;         _LT_WriteReg
;;           _SPI_SendByte
;;       _LT8920_write_ble_fifo
;;         _LT_WriteBUF_ble
;;           _SPI_SendByte
;;     _DELAY_MS
;;   _LT8920_ble_rx
;;     _LT8920_ble_rx_enable
;;       _LT8920_ble_write_reg
;;         _LT_WriteReg
;;           _SPI_SendByte
;;     _ble_chanel_scan
;;       _LT8920_ble_rx_start
;;         _LT8920_ble_write_reg
;;           _LT_WriteReg
;;             _SPI_SendByte
;;       _LT_ReadReg
;;         _SPI_SendByte
;;         _SPI_ReadByte
;;       _LT8920_read_ble_fifo
;;         _LT8920_ble_write_reg
;;           _LT_WriteReg
;;             _SPI_SendByte
;;         _ble_read_fifo
;;           _LT_ReadBUF_ble
;;             _SPI_SendByte
;;             _SPI_ReadByte
;;         _LT8920_ble_to_localdata
;;       _check_sum
;;       _DELAY_MS
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
;;DATA                 0      0      5D       8        0.0%
;;ABS                  0      0      57       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       6       2        0.0%
;;BANK0               50      E      4B       4       93.8%
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
;;		line 140 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  I               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Init
;;		_LT89XX_INIT
;;		_LT89xx_ModeSet
;;		_LT8920_ble_tx
;;		_LT8920_ble_rx
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	140
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	142
	
l5729:	
;main.c: 141: unsigned char I;
;main.c: 142: Init();
	fcall	_Init
	line	143
	
l5731:	
;main.c: 143: LT89XX_INIT();
	fcall	_LT89XX_INIT
	line	144
	
l5733:	
;main.c: 144: LT89xx_ModeSet(0x15);
	movlw	(015h)
	fcall	_LT89xx_ModeSet
	line	147
	
l5735:	
;main.c: 147: LT8920_work_sta = SCAN;
	clrf	(_LT8920_work_sta)
	line	153
	
l5737:	
;main.c: 150: {
;main.c: 153: if(LT8920_work_sta == SCAN)
	movf	(_LT8920_work_sta),f
	skipz
	goto	u1691
	goto	u1690
u1691:
	goto	l5751
u1690:
	line	156
	
l5739:	
;main.c: 154: {
;main.c: 156: rxflag = 0;
	clrf	(_rxflag)
	line	158
	
l5741:	
;main.c: 158: LT8920_ble_tx();
	fcall	_LT8920_ble_tx
	line	159
	
l5743:	
;main.c: 159: LT8920_ble_rx();
	fcall	_LT8920_ble_rx
	line	160
	
l5745:	
;main.c: 160: if(rxflag == 1)
	decf	(_rxflag),w
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l5737
u1700:
	line	162
	
l5747:	
;main.c: 161: {
;main.c: 162: rxflag = 0;
	clrf	(_rxflag)
	line	163
;main.c: 163: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	line	164
	
l5749:	
;main.c: 164: LT8920_work_sta = RXBLE;
	clrf	(_LT8920_work_sta)
	incf	(_LT8920_work_sta),f
	goto	l5737
	line	169
	
l5751:	
;main.c: 169: else if(LT8920_work_sta == RXBLE)
	decf	(_LT8920_work_sta),w
	skipz
	goto	u1711
	goto	u1710
u1711:
	goto	l5737
u1710:
	line	172
	
l5753:	
;main.c: 170: {
;main.c: 172: LT8920_ble_rx();
	fcall	_LT8920_ble_rx
	goto	l5737
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	181
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_LT8920_ble_rx
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:

;; *************** function _LT8920_ble_rx *****************
;; Defined at:
;;		line 272 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_LT8920_ble_rx_enable
;;		_ble_chanel_scan
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text791
	file	"main.c"
	line	272
	global	__size_of_LT8920_ble_rx
	__size_of_LT8920_ble_rx	equ	__end_of_LT8920_ble_rx-_LT8920_ble_rx
	
_LT8920_ble_rx:	
	opt	stack 1
; Regs used in _LT8920_ble_rx: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	276
	
l5715:	
;main.c: 274: unsigned char i;
;main.c: 276: LT8920_ble_rx_enable();
	fcall	_LT8920_ble_rx_enable
	line	278
	
l5717:	
;main.c: 278: for(i = 0; i < 5; i++)
	clrf	(LT8920_ble_rx@i)
	line	280
	
l5723:	
;main.c: 279: {
;main.c: 280: ble_chanel_scan(37);
	movlw	(025h)
	fcall	_ble_chanel_scan
	line	281
;main.c: 281: ble_chanel_scan(38);
	movlw	(026h)
	fcall	_ble_chanel_scan
	line	282
;main.c: 282: ble_chanel_scan(39);
	movlw	(027h)
	fcall	_ble_chanel_scan
	line	278
	
l5725:	
	incf	(LT8920_ble_rx@i),f
	
l5727:	
	movlw	(05h)
	subwf	(LT8920_ble_rx@i),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l5723
u1680:
	line	285
	
l1145:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_rx
	__end_of_LT8920_ble_rx:
;; =============== function _LT8920_ble_rx ends ============

	signat	_LT8920_ble_rx,88
	global	_ble_chanel_scan
psect	text792,local,class=CODE,delta=2
global __ptext792
__ptext792:

;; *************** function _ble_chanel_scan *****************
;; Defined at:
;;		line 206 in file "main.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    5[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_LT8920_ble_rx_start
;;		_LT_ReadReg
;;		_LT8920_read_ble_fifo
;;		_check_sum
;;		_DELAY_MS
;; This function is called by:
;;		_LT8920_ble_rx
;; This function uses a non-reentrant model
;;
psect	text792
	file	"main.c"
	line	206
	global	__size_of_ble_chanel_scan
	__size_of_ble_chanel_scan	equ	__end_of_ble_chanel_scan-_ble_chanel_scan
	
_ble_chanel_scan:	
	opt	stack 1
; Regs used in _ble_chanel_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ble_chanel_scan@chanel stored from wreg
	line	209
	movwf	(ble_chanel_scan@chanel)
	
l5669:	
;main.c: 207: unsigned char i;
;main.c: 209: LT8920_ble_rx_start(chanel);
	movf	(ble_chanel_scan@chanel),w
	fcall	_LT8920_ble_rx_start
	line	212
	
l5671:	
;main.c: 212: for(i = 0; i < 8; i++)
	clrf	(ble_chanel_scan@i)
	line	214
	
l5677:	
;main.c: 213: {
;main.c: 214: LT_ReadReg(48);
	movlw	(030h)
	fcall	_LT_ReadReg
	line	216
	
l5679:	
;main.c: 216: if(RegL&0X40){
	btfss	(_RegL),(6)&7
	goto	u1581
	goto	u1580
u1581:
	goto	l5709
u1580:
	line	218
	
l5681:	
;main.c: 218: LT8920_read_ble_fifo(chanel, RXADVDATA,29);
	movlw	(_RXADVDATA)&0ffh
	movwf	(?_LT8920_read_ble_fifo)
	movlw	(01Dh)
	movwf	0+(?_LT8920_read_ble_fifo)+01h
	movf	(ble_chanel_scan@chanel),w
	fcall	_LT8920_read_ble_fifo
	line	220
	
l5683:	
;main.c: 220: if((RXADVDATA[17]==0x11)&&(RXADVDATA[18]==0x11)&&(RXADVDATA[19]==0x11)){
	movf	0+(_RXADVDATA)+011h,w
	xorlw	011h
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l5711
u1590:
	
l5685:	
	movf	0+(_RXADVDATA)+012h,w
	xorlw	011h
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l5711
u1600:
	
l5687:	
	movf	0+(_RXADVDATA)+013h,w
	xorlw	011h
	skipz
	goto	u1611
	goto	u1610
u1611:
	goto	l5711
u1610:
	line	223
	
l5689:	
;main.c: 223: if(check_sum(RXADVDATA+17, 10) == 1)
	movlw	(0Ah)
	movwf	(?_check_sum)
	movlw	(_RXADVDATA+011h)&0ffh
	fcall	_check_sum
	xorlw	01h
	skipz
	goto	u1621
	goto	u1620
u1621:
	goto	l1132
u1620:
	line	229
	
l5691:	
;main.c: 226: {
;main.c: 229: if(RXADVDATA[5+17] == 0x02)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_RXADVDATA)+016h,w
	xorlw	02h
	skipz
	goto	u1631
	goto	u1630
u1631:
	goto	l5695
u1630:
	line	231
	
l5693:	
;main.c: 230: {
;main.c: 231: RC5 = 1;
	bsf	(61/8),(61)&7
	line	233
;main.c: 233: }
	goto	l1134
	line	234
	
l5695:	
;main.c: 234: else if(RXADVDATA[5+17] == 0x01)
	decf	0+(_RXADVDATA)+016h,w
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l5699
u1640:
	line	236
	
l5697:	
;main.c: 235: {
;main.c: 236: RC5 = 0;
	bcf	(61/8),(61)&7
	line	238
;main.c: 238: }
	goto	l1134
	line	239
	
l5699:	
;main.c: 239: else if(RXADVDATA[5+17] == 0x04)
	movf	0+(_RXADVDATA)+016h,w
	xorlw	04h
	skipz
	goto	u1651
	goto	u1650
u1651:
	goto	l1134
u1650:
	line	242
	
l5701:	
;main.c: 240: {
;main.c: 242: if( ledsta != RXADVDATA[6+17])
	movf	0+(_RXADVDATA)+017h,w
	xorwf	(_ledsta),w
	skipnz
	goto	u1661
	goto	u1660
u1661:
	goto	l1134
u1660:
	line	244
	
l5703:	
;main.c: 243: {
;main.c: 244: RC5 = !RC5;
	movlw	1<<((61)&7)
	xorwf	((61)/8),f
	line	247
	
l1134:	
;main.c: 245: }
;main.c: 246: }
;main.c: 247: ledsta = RXADVDATA[6+17];
	movf	0+(_RXADVDATA)+017h,w
	movwf	(_ledsta)
	line	251
	
l1132:	
	line	253
;main.c: 251: }
;main.c: 253: i = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ble_chanel_scan@i)
	line	255
	
l5705:	
;main.c: 255: rxflag = 1;
	clrf	(_rxflag)
	incf	(_rxflag),f
	line	256
	
l5707:	
;main.c: 256: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	goto	l5711
	line	261
	
l5709:	
;main.c: 259: else
;main.c: 260: {
;main.c: 261: DELAY_MS(1);
	movlw	(01h)
	fcall	_DELAY_MS
	line	212
	
l5711:	
	incf	(ble_chanel_scan@i),f
	
l5713:	
	movlw	(08h)
	subwf	(ble_chanel_scan@i),w
	skipc
	goto	u1671
	goto	u1670
u1671:
	goto	l5677
u1670:
	line	267
	
l1140:	
	return
	opt stack 0
GLOBAL	__end_of_ble_chanel_scan
	__end_of_ble_chanel_scan:
;; =============== function _ble_chanel_scan ends ============

	signat	_ble_chanel_scan,4216
	global	_LT8920_ble_tx
psect	text793,local,class=CODE,delta=2
global __ptext793
__ptext793:

;; *************** function _LT8920_ble_tx *****************
;; Defined at:
;;		line 191 in file "main.c"
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
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_LT8920_ble_tx_enable
;;		_LT8920_ble_tx_start
;;		_DELAY_MS
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text793
	file	"main.c"
	line	191
	global	__size_of_LT8920_ble_tx
	__size_of_LT8920_ble_tx	equ	__end_of_LT8920_ble_tx-_LT8920_ble_tx
	
_LT8920_ble_tx:	
	opt	stack 2
; Regs used in _LT8920_ble_tx: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	193
	
l5657:	
;main.c: 193: LT8920_ble_tx_enable();
	fcall	_LT8920_ble_tx_enable
	line	194
	
l5659:	
;main.c: 194: LT8920_ble_tx_start(37, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8920_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8920_ble_tx_start)+01h
	movlw	(025h)
	fcall	_LT8920_ble_tx_start
	line	195
	
l5661:	
;main.c: 195: DELAY_MS(4);
	movlw	(04h)
	fcall	_DELAY_MS
	line	196
;main.c: 196: LT8920_ble_tx_start(38, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8920_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8920_ble_tx_start)+01h
	movlw	(026h)
	fcall	_LT8920_ble_tx_start
	line	197
	
l5663:	
;main.c: 197: DELAY_MS(4);
	movlw	(04h)
	fcall	_DELAY_MS
	line	198
	
l5665:	
;main.c: 198: LT8920_ble_tx_start(39, PDUDATA, 26);
	movlw	(_PDUDATA)&0ffh
	movwf	(?_LT8920_ble_tx_start)
	movlw	(01Ah)
	movwf	0+(?_LT8920_ble_tx_start)+01h
	movlw	(027h)
	fcall	_LT8920_ble_tx_start
	line	199
;main.c: 199: DELAY_MS(4);
	movlw	(04h)
	fcall	_DELAY_MS
	line	200
	
l5667:	
;main.c: 200: RC4 = !RC4;
	movlw	1<<((60)&7)
	xorwf	((60)/8),f
	line	202
	
l1125:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_tx
	__end_of_LT8920_ble_tx:
;; =============== function _LT8920_ble_tx ends ============

	signat	_LT8920_ble_tx,88
	global	_LT8920_ble_rx_enable
psect	text794,local,class=CODE,delta=2
global __ptext794
__ptext794:

;; *************** function _LT8920_ble_rx_enable *****************
;; Defined at:
;;		line 205 in file "rx_ble.c"
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
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8920_ble_write_reg
;; This function is called by:
;;		_LT8920_ble_rx
;; This function uses a non-reentrant model
;;
psect	text794
	file	"rx_ble.c"
	line	205
	global	__size_of_LT8920_ble_rx_enable
	__size_of_LT8920_ble_rx_enable	equ	__end_of_LT8920_ble_rx_enable-_LT8920_ble_rx_enable
	
_LT8920_ble_rx_enable:	
	opt	stack 2
; Regs used in _LT8920_ble_rx_enable: [wreg+status,2+status,0+pclath+cstack]
	line	207
	
l5655:	
;rx_ble.c: 207: LT8920_ble_write_reg(32, 0x4A, 0x08);
	movlw	(04Ah)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(08h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(020h)
	fcall	_LT8920_ble_write_reg
	line	208
;rx_ble.c: 208: LT8920_ble_write_reg(36, 0xbe, 0xd6);
	movlw	(0BEh)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(0D6h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8920_ble_write_reg
	line	209
;rx_ble.c: 209: LT8920_ble_write_reg(39, 0x8e, 0x89);
	movlw	(08Eh)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(089h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8920_ble_write_reg
	line	211
	
l3448:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_rx_enable
	__end_of_LT8920_ble_rx_enable:
;; =============== function _LT8920_ble_rx_enable ends ============

	signat	_LT8920_ble_rx_enable,88
	global	_LT8920_read_ble_fifo
psect	text795,local,class=CODE,delta=2
global __ptext795
__ptext795:

;; *************** function _LT8920_read_ble_fifo *****************
;; Defined at:
;;		line 247 in file "rx_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  RXADVDATA       1    2[BANK0 ] PTR unsigned char 
;;		 -> RXADVDATA(29), 
;;  len             1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8920_ble_write_reg
;;		_ble_read_fifo
;;		_LT8920_ble_to_localdata
;; This function is called by:
;;		_ble_chanel_scan
;; This function uses a non-reentrant model
;;
psect	text795
	file	"rx_ble.c"
	line	247
	global	__size_of_LT8920_read_ble_fifo
	__size_of_LT8920_read_ble_fifo	equ	__end_of_LT8920_read_ble_fifo-_LT8920_read_ble_fifo
	
_LT8920_read_ble_fifo:	
	opt	stack 1
; Regs used in _LT8920_read_ble_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8920_read_ble_fifo@chanel stored from wreg
	line	249
	movwf	(LT8920_read_ble_fifo@chanel)
	
l5639:	
;rx_ble.c: 249: LT8920_ble_write_reg(7, 0x00, 0x00);
	clrf	(?_LT8920_ble_write_reg)
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	250
	
l5641:	
;rx_ble.c: 250: ble_read_fifo(RXADVDATA,len);
	movf	(LT8920_read_ble_fifo@len),w
	movwf	(?_ble_read_fifo)
	movf	(LT8920_read_ble_fifo@RXADVDATA),w
	fcall	_ble_read_fifo
	line	251
	
l5643:	
;rx_ble.c: 251: if(chanel == 37)
	movf	(LT8920_read_ble_fifo@chanel),w
	xorlw	025h
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l5647
u1550:
	line	253
	
l5645:	
;rx_ble.c: 252: {
;rx_ble.c: 253: LT8920_ble_to_localdata(chanel, RXADVDATA, len, 2);
	movf	(LT8920_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8920_ble_to_localdata)
	movf	(LT8920_read_ble_fifo@len),w
	movwf	0+(?_LT8920_ble_to_localdata)+01h
	movlw	(02h)
	movwf	0+(?_LT8920_ble_to_localdata)+02h
	movf	(LT8920_read_ble_fifo@chanel),w
	fcall	_LT8920_ble_to_localdata
	line	255
;rx_ble.c: 255: }
	goto	l3464
	line	256
	
l5647:	
;rx_ble.c: 256: else if(chanel == 38)
	movf	(LT8920_read_ble_fifo@chanel),w
	xorlw	026h
	skipz
	goto	u1561
	goto	u1560
u1561:
	goto	l5651
u1560:
	line	258
	
l5649:	
;rx_ble.c: 257: {
;rx_ble.c: 258: LT8920_ble_to_localdata(chanel, RXADVDATA, len, 2);
	movf	(LT8920_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8920_ble_to_localdata)
	movf	(LT8920_read_ble_fifo@len),w
	movwf	0+(?_LT8920_ble_to_localdata)+01h
	movlw	(02h)
	movwf	0+(?_LT8920_ble_to_localdata)+02h
	movf	(LT8920_read_ble_fifo@chanel),w
	fcall	_LT8920_ble_to_localdata
	line	259
;rx_ble.c: 259: }
	goto	l3464
	line	260
	
l5651:	
;rx_ble.c: 260: else if(chanel == 39)
	movf	(LT8920_read_ble_fifo@chanel),w
	xorlw	027h
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l3464
u1570:
	line	262
	
l5653:	
;rx_ble.c: 261: {
;rx_ble.c: 262: LT8920_ble_to_localdata(chanel, RXADVDATA, len, 2);
	movf	(LT8920_read_ble_fifo@RXADVDATA),w
	movwf	(?_LT8920_ble_to_localdata)
	movf	(LT8920_read_ble_fifo@len),w
	movwf	0+(?_LT8920_ble_to_localdata)+01h
	movlw	(02h)
	movwf	0+(?_LT8920_ble_to_localdata)+02h
	movf	(LT8920_read_ble_fifo@chanel),w
	fcall	_LT8920_ble_to_localdata
	line	266
	
l3464:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_read_ble_fifo
	__end_of_LT8920_read_ble_fifo:
;; =============== function _LT8920_read_ble_fifo ends ============

	signat	_LT8920_read_ble_fifo,12408
	global	_LT8920_ble_rx_start
psect	text796,local,class=CODE,delta=2
global __ptext796
__ptext796:

;; *************** function _LT8920_ble_rx_start *****************
;; Defined at:
;;		line 214 in file "rx_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8920_ble_write_reg
;; This function is called by:
;;		_ble_chanel_scan
;; This function uses a non-reentrant model
;;
psect	text796
	file	"rx_ble.c"
	line	214
	global	__size_of_LT8920_ble_rx_start
	__size_of_LT8920_ble_rx_start	equ	__end_of_LT8920_ble_rx_start-_LT8920_ble_rx_start
	
_LT8920_ble_rx_start:	
	opt	stack 1
; Regs used in _LT8920_ble_rx_start: [wreg+status,2+status,0+pclath+cstack]
;LT8920_ble_rx_start@chanel stored from wreg
	line	216
	movwf	(LT8920_ble_rx_start@chanel)
	
l5627:	
;rx_ble.c: 216: if(chanel == 37)
	movf	(LT8920_ble_rx_start@chanel),w
	xorlw	025h
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l5631
u1520:
	line	220
	
l5629:	
;rx_ble.c: 217: {
;rx_ble.c: 220: LT8920_ble_write_reg(7, 0, 0);
	clrf	(?_LT8920_ble_write_reg)
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	221
;rx_ble.c: 221: LT8920_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8920_ble_write_reg
	line	222
;rx_ble.c: 222: LT8920_ble_write_reg(7, 0, 0 | 0X80);
	clrf	(?_LT8920_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	223
;rx_ble.c: 223: }
	goto	l3456
	line	224
	
l5631:	
;rx_ble.c: 224: else if(chanel == 38)
	movf	(LT8920_ble_rx_start@chanel),w
	xorlw	026h
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l5635
u1530:
	line	228
	
l5633:	
;rx_ble.c: 225: {
;rx_ble.c: 228: LT8920_ble_write_reg(7, 0, 0);
	clrf	(?_LT8920_ble_write_reg)
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	230
;rx_ble.c: 230: LT8920_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8920_ble_write_reg
	line	231
;rx_ble.c: 231: LT8920_ble_write_reg(7, 0, 24 | 0X80);
	clrf	(?_LT8920_ble_write_reg)
	movlw	(098h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	233
;rx_ble.c: 233: }
	goto	l3456
	line	234
	
l5635:	
;rx_ble.c: 234: else if(chanel == 39)
	movf	(LT8920_ble_rx_start@chanel),w
	xorlw	027h
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l3456
u1540:
	line	237
	
l5637:	
;rx_ble.c: 235: {
;rx_ble.c: 237: LT8920_ble_write_reg(7, 0, 0);
	clrf	(?_LT8920_ble_write_reg)
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	238
;rx_ble.c: 238: LT8920_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8920_ble_write_reg
	line	239
;rx_ble.c: 239: LT8920_ble_write_reg(7, 0, 78 | 0X80);
	clrf	(?_LT8920_ble_write_reg)
	movlw	(0CEh)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	242
	
l3456:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_rx_start
	__end_of_LT8920_ble_rx_start:
;; =============== function _LT8920_ble_rx_start ends ============

	signat	_LT8920_ble_rx_start,4216
	global	_LT8920_ble_tx_start
psect	text797,local,class=CODE,delta=2
global __ptext797
__ptext797:

;; *************** function _LT8920_ble_tx_start *****************
;; Defined at:
;;		line 178 in file "rx_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  PDUDATA         1   11[BANK0 ] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  chanel          1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_get_crc
;;		_LT8920_pdudata_white
;;		_LT8920_ble_write_reg
;;		_LT8920_write_ble_fifo
;; This function is called by:
;;		_LT8920_ble_tx
;; This function uses a non-reentrant model
;;
psect	text797
	file	"rx_ble.c"
	line	178
	global	__size_of_LT8920_ble_tx_start
	__size_of_LT8920_ble_tx_start	equ	__end_of_LT8920_ble_tx_start-_LT8920_ble_tx_start
	
_LT8920_ble_tx_start:	
	opt	stack 2
; Regs used in _LT8920_ble_tx_start: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8920_ble_tx_start@chanel stored from wreg
	movwf	(LT8920_ble_tx_start@chanel)
	line	179
	
l5607:	
;rx_ble.c: 179: get_crc(PDUDATA, len);
	movf	(LT8920_ble_tx_start@len),w
	movwf	(?_get_crc)
	movf	(LT8920_ble_tx_start@PDUDATA),w
	fcall	_get_crc
	line	180
;rx_ble.c: 180: LT8920_pdudata_white(chanel, PDUDATA, len);
	movf	(LT8920_ble_tx_start@PDUDATA),w
	movwf	(?_LT8920_pdudata_white)
	movf	(LT8920_ble_tx_start@len),w
	movwf	0+(?_LT8920_pdudata_white)+01h
	movf	(LT8920_ble_tx_start@chanel),w
	fcall	_LT8920_pdudata_white
	line	182
	
l5609:	
;rx_ble.c: 182: LT8920_ble_write_reg(7, 0x00, 0x00);
	clrf	(?_LT8920_ble_write_reg)
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	183
	
l5611:	
;rx_ble.c: 183: LT8920_ble_write_reg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(080h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(034h)
	fcall	_LT8920_ble_write_reg
	line	184
;rx_ble.c: 184: LT8920_write_ble_fifo(PDUDATA, len);
	movf	(LT8920_ble_tx_start@len),w
	movwf	(?_LT8920_write_ble_fifo)
	movf	(LT8920_ble_tx_start@PDUDATA),w
	fcall	_LT8920_write_ble_fifo
	line	185
	
l5613:	
;rx_ble.c: 185: if(chanel == 37)
	movf	(LT8920_ble_tx_start@chanel),w
	xorlw	025h
	skipz
	goto	u1491
	goto	u1490
u1491:
	goto	l5617
u1490:
	line	187
	
l5615:	
;rx_ble.c: 186: {
;rx_ble.c: 187: LT8920_ble_write_reg(7, 0x01, 0);
	clrf	(?_LT8920_ble_write_reg)
	incf	(?_LT8920_ble_write_reg),f
	clrf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	188
;rx_ble.c: 188: }
	goto	l5625
	line	189
	
l5617:	
;rx_ble.c: 189: else if(chanel == 38)
	movf	(LT8920_ble_tx_start@chanel),w
	xorlw	026h
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l5621
u1500:
	line	191
	
l5619:	
;rx_ble.c: 190: {
;rx_ble.c: 191: LT8920_ble_write_reg(7, 0x01, 24);
	clrf	(?_LT8920_ble_write_reg)
	incf	(?_LT8920_ble_write_reg),f
	movlw	(018h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	192
;rx_ble.c: 192: }
	goto	l5625
	line	193
	
l5621:	
;rx_ble.c: 193: else if(chanel == 39)
	movf	(LT8920_ble_tx_start@chanel),w
	xorlw	027h
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l5625
u1510:
	line	195
	
l5623:	
;rx_ble.c: 194: {
;rx_ble.c: 195: LT8920_ble_write_reg(7, 0x01, 78);
	clrf	(?_LT8920_ble_write_reg)
	incf	(?_LT8920_ble_write_reg),f
	movlw	(04Eh)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(07h)
	fcall	_LT8920_ble_write_reg
	line	197
	
l5625:	
;rx_ble.c: 196: }
;rx_ble.c: 197: LT8920_pdudata_white(chanel, PDUDATA, len);
	movf	(LT8920_ble_tx_start@PDUDATA),w
	movwf	(?_LT8920_pdudata_white)
	movf	(LT8920_ble_tx_start@len),w
	movwf	0+(?_LT8920_pdudata_white)+01h
	movf	(LT8920_ble_tx_start@chanel),w
	fcall	_LT8920_pdudata_white
	line	198
	
l3445:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_tx_start
	__end_of_LT8920_ble_tx_start:
;; =============== function _LT8920_ble_tx_start ends ============

	signat	_LT8920_ble_tx_start,12408
	global	_LT8920_ble_tx_enable
psect	text798,local,class=CODE,delta=2
global __ptext798
__ptext798:

;; *************** function _LT8920_ble_tx_enable *****************
;; Defined at:
;;		line 168 in file "rx_ble.c"
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
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_LT8920_ble_write_reg
;; This function is called by:
;;		_LT8920_ble_tx
;; This function uses a non-reentrant model
;;
psect	text798
	file	"rx_ble.c"
	line	168
	global	__size_of_LT8920_ble_tx_enable
	__size_of_LT8920_ble_tx_enable	equ	__end_of_LT8920_ble_tx_enable-_LT8920_ble_tx_enable
	
_LT8920_ble_tx_enable:	
	opt	stack 2
; Regs used in _LT8920_ble_tx_enable: [wreg+status,2+status,0+pclath+cstack]
	line	171
	
l5605:	
;rx_ble.c: 171: LT8920_ble_write_reg(32, 0x4a, 0x08);
	movlw	(04Ah)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(08h)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(020h)
	fcall	_LT8920_ble_write_reg
	line	172
;rx_ble.c: 172: LT8920_ble_write_reg(36, 0xAA, 0xaa);
	movlw	(0AAh)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(0AAh)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(024h)
	fcall	_LT8920_ble_write_reg
	line	173
;rx_ble.c: 173: LT8920_ble_write_reg(39, 0xAA, 0xaa);
	movlw	(0AAh)
	movwf	(?_LT8920_ble_write_reg)
	movlw	(0AAh)
	movwf	0+(?_LT8920_ble_write_reg)+01h
	movlw	(027h)
	fcall	_LT8920_ble_write_reg
	line	175
	
l3437:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_tx_enable
	__end_of_LT8920_ble_tx_enable:
;; =============== function _LT8920_ble_tx_enable ends ============

	signat	_LT8920_ble_tx_enable,88
	global	_ble_read_fifo
psect	text799,local,class=CODE,delta=2
global __ptext799
__ptext799:

;; *************** function _ble_read_fifo *****************
;; Defined at:
;;		line 16 in file "spi_ble.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> RXADVDATA(29), 
;;  len             1   10[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf             1    0[BANK0 ] PTR unsigned char 
;;		 -> RXADVDATA(29), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         1       1       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT_ReadBUF_ble
;; This function is called by:
;;		_LT8920_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text799
	file	"spi_ble.c"
	line	16
	global	__size_of_ble_read_fifo
	__size_of_ble_read_fifo	equ	__end_of_ble_read_fifo-_ble_read_fifo
	
_ble_read_fifo:	
	opt	stack 1
; Regs used in _ble_read_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ble_read_fifo@buf stored from wreg
	line	18
	movwf	(ble_read_fifo@buf)
	
l5603:	
;spi_ble.c: 18: LT_ReadBUF_ble(50, buf,len);
	movf	(ble_read_fifo@buf),w
	movwf	(?_LT_ReadBUF_ble)
	movf	(ble_read_fifo@len),w
	movwf	0+(?_LT_ReadBUF_ble)+01h
	movlw	(032h)
	fcall	_LT_ReadBUF_ble
	line	22
	
l3376:	
	return
	opt stack 0
GLOBAL	__end_of_ble_read_fifo
	__end_of_ble_read_fifo:
;; =============== function _ble_read_fifo ends ============

	signat	_ble_read_fifo,8312
	global	_LT8920_write_ble_fifo
psect	text800,local,class=CODE,delta=2
global __ptext800
__ptext800:

;; *************** function _LT8920_write_ble_fifo *****************
;; Defined at:
;;		line 12 in file "spi_ble.c"
;; Parameters:    Size  Location     Type
;;  txdata          1    wreg     PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  txdata          1   10[COMMON] PTR unsigned char 
;;		 -> PDUDATA(26), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT_WriteBUF_ble
;; This function is called by:
;;		_LT8920_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text800
	file	"spi_ble.c"
	line	12
	global	__size_of_LT8920_write_ble_fifo
	__size_of_LT8920_write_ble_fifo	equ	__end_of_LT8920_write_ble_fifo-_LT8920_write_ble_fifo
	
_LT8920_write_ble_fifo:	
	opt	stack 2
; Regs used in _LT8920_write_ble_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT8920_write_ble_fifo@txdata stored from wreg
	movwf	(LT8920_write_ble_fifo@txdata)
	line	13
	
l5601:	
;spi_ble.c: 13: LT_WriteBUF_ble(50, txdata,len);
	movf	(LT8920_write_ble_fifo@txdata),w
	movwf	(?_LT_WriteBUF_ble)
	movf	(LT8920_write_ble_fifo@len),w
	movwf	0+(?_LT_WriteBUF_ble)+01h
	movlw	(032h)
	fcall	_LT_WriteBUF_ble
	line	15
	
l3373:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_write_ble_fifo
	__end_of_LT8920_write_ble_fifo:
;; =============== function _LT8920_write_ble_fifo ends ============

	signat	_LT8920_write_ble_fifo,8312
	global	_LT8920_ble_write_reg
psect	text801,local,class=CODE,delta=2
global __ptext801
__ptext801:

;; *************** function _LT8920_ble_write_reg *****************
;; Defined at:
;;		line 2 in file "spi_ble.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  first           1    7[COMMON] unsigned char 
;;  second          1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT_WriteReg
;; This function is called by:
;;		_LT8920_ble_tx_enable
;;		_LT8920_ble_tx_start
;;		_LT8920_ble_rx_enable
;;		_LT8920_ble_rx_start
;;		_LT8920_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text801
	file	"spi_ble.c"
	line	2
	global	__size_of_LT8920_ble_write_reg
	__size_of_LT8920_ble_write_reg	equ	__end_of_LT8920_ble_write_reg-_LT8920_ble_write_reg
	
_LT8920_ble_write_reg:	
	opt	stack 1
; Regs used in _LT8920_ble_write_reg: [wreg+status,2+status,0+pclath+cstack]
;LT8920_ble_write_reg@reg stored from wreg
	line	4
	movwf	(LT8920_ble_write_reg@reg)
	
l5599:	
;spi_ble.c: 4: LT_WriteReg(reg, first, second);
	movf	(LT8920_ble_write_reg@first),w
	movwf	(?_LT_WriteReg)
	movf	(LT8920_ble_write_reg@second),w
	movwf	0+(?_LT_WriteReg)+01h
	movf	(LT8920_ble_write_reg@reg),w
	fcall	_LT_WriteReg
	line	7
	
l3370:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_write_reg
	__end_of_LT8920_ble_write_reg:
;; =============== function _LT8920_ble_write_reg ends ============

	signat	_LT8920_ble_write_reg,12408
	global	_LT89xx_ModeSet
psect	text802,local,class=CODE,delta=2
global __ptext802
__ptext802:

;; *************** function _LT89xx_ModeSet *****************
;; Defined at:
;;		line 237 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  dat1            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat1            1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT_WriteReg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text802
	file	"lt89xxdrvspi.c"
	line	237
	global	__size_of_LT89xx_ModeSet
	__size_of_LT89xx_ModeSet	equ	__end_of_LT89xx_ModeSet-_LT89xx_ModeSet
	
_LT89xx_ModeSet:	
	opt	stack 4
; Regs used in _LT89xx_ModeSet: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT89xx_ModeSet@dat1 stored from wreg
	movwf	(LT89xx_ModeSet@dat1)
	line	240
	
l5575:	
;lt89xxdrvspi.c: 240: switch(dat1)
	goto	l5595
	line	243
	
l5577:	
;lt89xxdrvspi.c: 243: LT_WriteReg(7, 0x00, 0x00);
	clrf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	line	244
;lt89xxdrvspi.c: 244: LT_WriteReg(27, 0x13, 0x00);
	movlw	(013h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(01Bh)
	fcall	_LT_WriteReg
	line	245
;lt89xxdrvspi.c: 245: LT_WriteReg(35, 0x43, 0x00);
	movlw	(043h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(023h)
	fcall	_LT_WriteReg
	line	246
;lt89xxdrvspi.c: 246: break;
	goto	l2296
	line	254
	
l5579:	
;lt89xxdrvspi.c: 254: LT_WriteReg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT_WriteReg)
	movlw	(080h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(034h)
	fcall	_LT_WriteReg
	line	255
;lt89xxdrvspi.c: 255: break;
	goto	l2296
	line	257
	
l5581:	
;lt89xxdrvspi.c: 257: LT_WriteReg(7, 0x00, 0x00);
	clrf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	line	258
;lt89xxdrvspi.c: 258: break;
	goto	l2296
	line	260
	
l5583:	
;lt89xxdrvspi.c: 260: LT_WriteReg(44, 0x01, 0x01);
	clrf	(?_LT_WriteReg)
	incf	(?_LT_WriteReg),f
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	261
;lt89xxdrvspi.c: 261: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	262
;lt89xxdrvspi.c: 262: break;
	goto	l2296
	line	264
	
l5585:	
;lt89xxdrvspi.c: 264: LT_WriteReg(44, 0x02, 0x01);
	movlw	(02h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	265
;lt89xxdrvspi.c: 265: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	266
;lt89xxdrvspi.c: 266: break;
	goto	l2296
	line	268
	
l5587:	
;lt89xxdrvspi.c: 268: LT_WriteReg(44, 0x04, 0x01);
	movlw	(04h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	269
;lt89xxdrvspi.c: 269: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	270
;lt89xxdrvspi.c: 270: break;
	goto	l2296
	line	272
	
l5589:	
;lt89xxdrvspi.c: 272: LT_WriteReg(44, 0x08, 0x01);
	movlw	(08h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	273
;lt89xxdrvspi.c: 273: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	274
;lt89xxdrvspi.c: 274: break;
	goto	l2296
	line	276
	
l5591:	
;lt89xxdrvspi.c: 276: LT_WriteReg(44, 0x10, 0x01);
	movlw	(010h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	277
;lt89xxdrvspi.c: 277: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	278
;lt89xxdrvspi.c: 278: break;
	goto	l2296
	line	240
	
l5595:	
	movf	(LT89xx_ModeSet@dat1),w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 14 to 25
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           21     9 (fixed)
; simple_byte           28    15 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is direct_byte

	addlw	-14
	skipc
goto l2296
	movwf fsr
	movlw	12
	subwf	fsr,w
skipnc
goto l2296
movlw high(S5765)
movwf pclath
	movlw low(S5765)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5765:
	ljmp	l5579
	ljmp	l2296
	ljmp	l2296
	ljmp	l2296
	ljmp	l5577
	ljmp	l5581
	ljmp	l2296
	ljmp	l5583
	ljmp	l5585
	ljmp	l5587
	ljmp	l5589
	ljmp	l5591
psect	text802

	line	283
	
l2296:	
	return
	opt stack 0
GLOBAL	__end_of_LT89xx_ModeSet
	__end_of_LT89xx_ModeSet:
;; =============== function _LT89xx_ModeSet ends ============

	signat	_LT89xx_ModeSet,4216
	global	_LT89XX_INIT
psect	text803,local,class=CODE,delta=2
global __ptext803
__ptext803:

;; *************** function _LT89XX_INIT *****************
;; Defined at:
;;		line 213 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  CFG_CNT         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DELAY_MS
;;		_LT_WriteReg
;;		_LT_ReadReg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text803
	file	"lt89xxdrvspi.c"
	line	213
	global	__size_of_LT89XX_INIT
	__size_of_LT89XX_INIT	equ	__end_of_LT89XX_INIT-_LT89XX_INIT
	
_LT89XX_INIT:	
	opt	stack 4
; Regs used in _LT89XX_INIT: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	217
;lt89xxdrvspi.c: 214: unsigned char CFG_CNT;
;lt89xxdrvspi.c: 217: while(1)
	
l2276:	
	line	220
;lt89xxdrvspi.c: 218: {
;lt89xxdrvspi.c: 220: RA7 = 0; DELAY_MS(10);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	
l5551:	
	movlw	(0Ah)
	fcall	_DELAY_MS
	line	221
	
l5553:	
;lt89xxdrvspi.c: 221: RA7 = 1; DELAY_MS(100);
	bsf	(47/8),(47)&7
	movlw	(064h)
	fcall	_DELAY_MS
	line	224
	
l5555:	
;lt89xxdrvspi.c: 224: for(CFG_CNT=0;CFG_CNT<34;CFG_CNT++)
	clrf	(LT89XX_INIT@CFG_CNT)
	line	226
	
l5561:	
;lt89xxdrvspi.c: 225: {
;lt89xxdrvspi.c: 226: LT_WriteReg(LDT8900config[CFG_CNT][0],LDT8900config[CFG_CNT][1],LDT8900config[CFG_CNT][2]);
	movf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addlw	low((_LDT8900config-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(?_LT_WriteReg)
	movf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addlw	low((_LDT8900config-__stringbase)+02h)
	movwf	fsr0
	fcall	stringdir
	movwf	0+(?_LT_WriteReg)+01h
	movf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addwf	(LT89XX_INIT@CFG_CNT),w
	addlw	low((_LDT8900config-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_LT_WriteReg
	line	224
	
l5563:	
	incf	(LT89XX_INIT@CFG_CNT),f
	
l5565:	
	movlw	(022h)
	subwf	(LT89XX_INIT@CFG_CNT),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l5561
u1460:
	line	230
	
l5567:	
;lt89xxdrvspi.c: 228: }
;lt89xxdrvspi.c: 230: LT_ReadReg(0);
	movlw	(0)
	fcall	_LT_ReadReg
	line	231
	
l5569:	
;lt89xxdrvspi.c: 231: if(RegH==0x6F&&RegL==0XE0)
	movf	(_RegH),w
	xorlw	06Fh
	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l2276
u1470:
	
l5571:	
	movf	(_RegL),w
	xorlw	0E0h
	skipz
	goto	u1481
	goto	u1480
u1481:
	goto	l2276
u1480:
	line	234
	
l2282:	
	return
	opt stack 0
GLOBAL	__end_of_LT89XX_INIT
	__end_of_LT89XX_INIT:
;; =============== function _LT89XX_INIT ends ============

	signat	_LT89XX_INIT,88
	global	_get_crc
psect	text804,local,class=CODE,delta=2
global __ptext804
__ptext804:

;; *************** function _get_crc *****************
;; Defined at:
;;		line 35 in file "rx_ble.c"
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
;;		_LT8920_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text804
	file	"rx_ble.c"
	line	35
	global	__size_of_get_crc
	__size_of_get_crc	equ	__end_of_get_crc-_get_crc
	
_get_crc:	
	opt	stack 3
; Regs used in _get_crc: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;get_crc@user_data_buf stored from wreg
	line	40
	movwf	(get_crc@user_data_buf)
	
l5533:	
;rx_ble.c: 36: unsigned char c0, c1, c2;
;rx_ble.c: 37: unsigned char i, e;
;rx_ble.c: 40: c0 = 85;
	movlw	(055h)
	movwf	(get_crc@c0)
	line	41
;rx_ble.c: 41: c1 = 85;
	movlw	(055h)
	movwf	(get_crc@c1)
	line	42
;rx_ble.c: 42: c2 = 85;
	movlw	(055h)
	movwf	(get_crc@c2)
	line	45
	
l5535:	
;rx_ble.c: 45: for(i = 0; i < lenth - 3; i++)
	clrf	(get_crc@i)
	goto	l5547
	line	47
	
l5537:	
;rx_ble.c: 46: {
;rx_ble.c: 47: e = roll_data(user_data_buf[i])^c2;
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
	
l5539:	
;rx_ble.c: 49: c2 = ((e >> 6)) ^ ((e >> 7))^c1;
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	07h
u1395:
	clrc
	rrf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1395
	movf	(get_crc@e),w
	movwf	(??_get_crc+1)+0
	movlw	06h
u1405:
	clrc
	rrf	(??_get_crc+1)+0,f
	addlw	-1
	skipz
	goto	u1405
	movf	0+(??_get_crc+1)+0,w
	xorwf	0+(??_get_crc+0)+0,w
	xorwf	(get_crc@c1),w
	movwf	(get_crc@c2)
	line	50
	
l5541:	
;rx_ble.c: 50: c1 = ((e << 1) & 255) ^ ((e << 2) & 255) ^ ((e >> 2)) ^ ((e >> 4)) ^ ((e >> 5)) ^ ((e >> 7))^c0;
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	07h
u1415:
	clrc
	rrf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1415
	movf	(get_crc@e),w
	movwf	(??_get_crc+1)+0
	movlw	05h
u1425:
	clrc
	rrf	(??_get_crc+1)+0,f
	addlw	-1
	skipz
	goto	u1425
	movf	(get_crc@e),w
	movwf	(??_get_crc+2)+0
	movlw	04h
u1435:
	clrc
	rrf	(??_get_crc+2)+0,f
	addlw	-1
	skipz
	goto	u1435
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
	
l5543:	
;rx_ble.c: 51: c0 = e ^ ((e << 1) & 255) ^ ((e << 3) & 255) ^ ((e << 4) & 255) ^ ((e << 6) & 255);
	movf	(get_crc@e),w
	movwf	(??_get_crc+0)+0
	movlw	06h
u1445:
	clrc
	rlf	(??_get_crc+0)+0,f
	addlw	-1
	skipz
	goto	u1445
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
	
l5545:	
	incf	(get_crc@i),f
	
l5547:	
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
	goto	u1455
	movf	0+(??_get_crc+0)+0,w
	subwf	(get_crc@i),w
u1455:

	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l5537
u1450:
	line	59
	
l5549:	
;rx_ble.c: 52: }
;rx_ble.c: 59: user_data_buf[lenth - 1] = roll_data(c0);
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
;rx_ble.c: 60: user_data_buf[lenth - 2] = roll_data(c1);
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
;rx_ble.c: 61: user_data_buf[lenth - 3] = roll_data(c2);
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
	
l3400:	
	return
	opt stack 0
GLOBAL	__end_of_get_crc
	__end_of_get_crc:
;; =============== function _get_crc ends ============

	signat	_get_crc,8312
	global	_LT_ReadBUF_ble
psect	text805,local,class=CODE,delta=2
global __ptext805
__ptext805:

;; *************** function _LT_ReadBUF_ble *****************
;; Defined at:
;;		line 140 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  pBuf            1    4[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(29), 
;;  lenth           1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    8[COMMON] unsigned char 
;;  i               1    9[COMMON] unsigned char 
;;  len             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_SendByte
;;		_SPI_ReadByte
;; This function is called by:
;;		_ble_read_fifo
;; This function uses a non-reentrant model
;;
psect	text805
	file	"lt89xxdrvspi.c"
	line	140
	global	__size_of_LT_ReadBUF_ble
	__size_of_LT_ReadBUF_ble	equ	__end_of_LT_ReadBUF_ble-_LT_ReadBUF_ble
	
_LT_ReadBUF_ble:	
	opt	stack 1
; Regs used in _LT_ReadBUF_ble: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT_ReadBUF_ble@reg stored from wreg
	line	143
	movwf	(LT_ReadBUF_ble@reg)
	
l5521:	
;lt89xxdrvspi.c: 141: unsigned char i,len;
;lt89xxdrvspi.c: 143: RC2=0;
	bcf	(58/8),(58)&7
	line	144
	
l5523:	
;lt89xxdrvspi.c: 144: SPI_SendByte(reg|0X80);
	movf	(LT_ReadBUF_ble@reg),w
	iorlw	080h
	fcall	_SPI_SendByte
	line	145
	fcall	_SPI_ReadByte
	line	146
	
l5525:	
;lt89xxdrvspi.c: 146: for(i=0; i<lenth; i++)
	clrf	(LT_ReadBUF_ble@i)
	goto	l5531
	line	148
	
l5527:	
;lt89xxdrvspi.c: 147: {
;lt89xxdrvspi.c: 148: pBuf[i] = SPI_ReadByte();
	movf	(LT_ReadBUF_ble@i),w
	addwf	(LT_ReadBUF_ble@pBuf),w
	movwf	(??_LT_ReadBUF_ble+0)+0
	movf	0+(??_LT_ReadBUF_ble+0)+0,w
	movwf	fsr0
	fcall	_SPI_ReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	146
	
l5529:	
	incf	(LT_ReadBUF_ble@i),f
	
l5531:	
	movf	(LT_ReadBUF_ble@lenth),w
	subwf	(LT_ReadBUF_ble@i),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l5527
u1380:
	
l2272:	
	line	151
;lt89xxdrvspi.c: 149: }
;lt89xxdrvspi.c: 151: RC2=1;
	bsf	(58/8),(58)&7
	line	154
;lt89xxdrvspi.c: 153: return len;
;	Return value of _LT_ReadBUF_ble is never used
	
l2273:	
	return
	opt stack 0
GLOBAL	__end_of_LT_ReadBUF_ble
	__end_of_LT_ReadBUF_ble:
;; =============== function _LT_ReadBUF_ble ends ============

	signat	_LT_ReadBUF_ble,12409
	global	_LT_WriteBUF_ble
psect	text806,local,class=CODE,delta=2
global __ptext806
__ptext806:

;; *************** function _LT_WriteBUF_ble *****************
;; Defined at:
;;		line 121 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  pBuf            1    4[COMMON] PTR unsigned char 
;;		 -> PDUDATA(26), 
;;  len             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_SendByte
;; This function is called by:
;;		_LT8920_write_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text806
	file	"lt89xxdrvspi.c"
	line	121
	global	__size_of_LT_WriteBUF_ble
	__size_of_LT_WriteBUF_ble	equ	__end_of_LT_WriteBUF_ble-_LT_WriteBUF_ble
	
_LT_WriteBUF_ble:	
	opt	stack 2
; Regs used in _LT_WriteBUF_ble: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT_WriteBUF_ble@reg stored from wreg
	line	124
	movwf	(LT_WriteBUF_ble@reg)
	
l5509:	
;lt89xxdrvspi.c: 122: unsigned char i;
;lt89xxdrvspi.c: 124: RC2=0;
	bcf	(58/8),(58)&7
	line	125
	
l5511:	
;lt89xxdrvspi.c: 125: SPI_SendByte(reg);
	movf	(LT_WriteBUF_ble@reg),w
	fcall	_SPI_SendByte
	line	126
;lt89xxdrvspi.c: 126: SPI_SendByte(len+4);
	movf	(LT_WriteBUF_ble@len),w
	addlw	04h
	fcall	_SPI_SendByte
	line	127
;lt89xxdrvspi.c: 127: SPI_SendByte(0xd6);
	movlw	(0D6h)
	fcall	_SPI_SendByte
	line	128
;lt89xxdrvspi.c: 128: SPI_SendByte(0xbe);
	movlw	(0BEh)
	fcall	_SPI_SendByte
	line	129
;lt89xxdrvspi.c: 129: SPI_SendByte(0x89);
	movlw	(089h)
	fcall	_SPI_SendByte
	line	130
;lt89xxdrvspi.c: 130: SPI_SendByte(0x8e);
	movlw	(08Eh)
	fcall	_SPI_SendByte
	line	132
	
l5513:	
;lt89xxdrvspi.c: 132: for(i=0; i<len; i++)
	clrf	(LT_WriteBUF_ble@i)
	goto	l5519
	line	133
	
l5515:	
;lt89xxdrvspi.c: 133: SPI_SendByte(pBuf[i]);
	movf	(LT_WriteBUF_ble@i),w
	addwf	(LT_WriteBUF_ble@pBuf),w
	movwf	(??_LT_WriteBUF_ble+0)+0
	movf	0+(??_LT_WriteBUF_ble+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_SPI_SendByte
	line	132
	
l5517:	
	incf	(LT_WriteBUF_ble@i),f
	
l5519:	
	movf	(LT_WriteBUF_ble@len),w
	subwf	(LT_WriteBUF_ble@i),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l5515
u1370:
	
l2266:	
	line	136
;lt89xxdrvspi.c: 136: RC2=1;
	bsf	(58/8),(58)&7
	line	137
	
l2267:	
	return
	opt stack 0
GLOBAL	__end_of_LT_WriteBUF_ble
	__end_of_LT_WriteBUF_ble:
;; =============== function _LT_WriteBUF_ble ends ============

	signat	_LT_WriteBUF_ble,12408
	global	_LT_WriteReg
psect	text807,local,class=CODE,delta=2
global __ptext807
__ptext807:

;; *************** function _LT_WriteReg *****************
;; Defined at:
;;		line 78 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  H               1    4[COMMON] unsigned char 
;;  L               1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_SendByte
;; This function is called by:
;;		_LT89XX_INIT
;;		_LT89xx_ModeSet
;;		_LT8920_ble_write_reg
;; This function uses a non-reentrant model
;;
psect	text807
	file	"lt89xxdrvspi.c"
	line	78
	global	__size_of_LT_WriteReg
	__size_of_LT_WriteReg	equ	__end_of_LT_WriteReg-_LT_WriteReg
	
_LT_WriteReg:	
	opt	stack 1
; Regs used in _LT_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;LT_WriteReg@reg stored from wreg
	movwf	(LT_WriteReg@reg)
	line	79
	
l5503:	
;lt89xxdrvspi.c: 79: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	line	80
	
l5505:	
;lt89xxdrvspi.c: 80: SPI_SendByte(reg);
	movf	(LT_WriteReg@reg),w
	fcall	_SPI_SendByte
	line	81
;lt89xxdrvspi.c: 81: SPI_SendByte(H);
	movf	(LT_WriteReg@H),w
	fcall	_SPI_SendByte
	line	82
;lt89xxdrvspi.c: 82: SPI_SendByte(L);
	movf	(LT_WriteReg@L),w
	fcall	_SPI_SendByte
	line	83
	
l5507:	
;lt89xxdrvspi.c: 83: RC2=1;
	bsf	(58/8),(58)&7
	line	84
	
l2249:	
	return
	opt stack 0
GLOBAL	__end_of_LT_WriteReg
	__end_of_LT_WriteReg:
;; =============== function _LT_WriteReg ends ============

	signat	_LT_WriteReg,12408
	global	_LT_ReadReg
psect	text808,local,class=CODE,delta=2
global __ptext808
__ptext808:

;; *************** function _LT_ReadReg *****************
;; Defined at:
;;		line 68 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_SendByte
;;		_SPI_ReadByte
;; This function is called by:
;;		_ble_chanel_scan
;;		_LT89XX_INIT
;; This function uses a non-reentrant model
;;
psect	text808
	file	"lt89xxdrvspi.c"
	line	68
	global	__size_of_LT_ReadReg
	__size_of_LT_ReadReg	equ	__end_of_LT_ReadReg-_LT_ReadReg
	
_LT_ReadReg:	
	opt	stack 3
; Regs used in _LT_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;LT_ReadReg@reg stored from wreg
	movwf	(LT_ReadReg@reg)
	line	69
	
l5497:	
;lt89xxdrvspi.c: 69: RC2=0;
	bcf	(58/8),(58)&7
	line	70
	
l5499:	
;lt89xxdrvspi.c: 70: SPI_SendByte(reg|0x80);
	movf	(LT_ReadReg@reg),w
	iorlw	080h
	fcall	_SPI_SendByte
	line	71
;lt89xxdrvspi.c: 71: RegH=SPI_ReadByte();
	fcall	_SPI_ReadByte
	movwf	(_RegH)
	line	72
;lt89xxdrvspi.c: 72: RegL=SPI_ReadByte();
	fcall	_SPI_ReadByte
	movwf	(_RegL)
	line	73
	
l5501:	
;lt89xxdrvspi.c: 73: RC2=1;
	bsf	(58/8),(58)&7
	line	75
	
l2246:	
	return
	opt stack 0
GLOBAL	__end_of_LT_ReadReg
	__end_of_LT_ReadReg:
;; =============== function _LT_ReadReg ends ============

	signat	_LT_ReadReg,4216
	global	_LT8920_ble_to_localdata
psect	text809,local,class=CODE,delta=2
global __ptext809
__ptext809:

;; *************** function _LT8920_ble_to_localdata *****************
;; Defined at:
;;		line 124 in file "rx_ble.c"
;; Parameters:    Size  Location     Type
;;  chanel          1    wreg     unsigned char 
;;  ADVDATA         1    2[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(29), 
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
;;		_LT8920_read_ble_fifo
;; This function uses a non-reentrant model
;;
psect	text809
	file	"rx_ble.c"
	line	124
	global	__size_of_LT8920_ble_to_localdata
	__size_of_LT8920_ble_to_localdata	equ	__end_of_LT8920_ble_to_localdata-_LT8920_ble_to_localdata
	
_LT8920_ble_to_localdata:	
	opt	stack 2
; Regs used in _LT8920_ble_to_localdata: [wreg-fsr0h+status,2+status,0+pclath]
;LT8920_ble_to_localdata@chanel stored from wreg
	line	128
	movwf	(LT8920_ble_to_localdata@chanel)
	
l5467:	
;rx_ble.c: 126: unsigned char i;
;rx_ble.c: 128: if(chanel == 37)
	movf	(LT8920_ble_to_localdata@chanel),w
	xorlw	025h
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l5477
u1310:
	line	130
	
l5469:	
;rx_ble.c: 129: {
;rx_ble.c: 130: for(i = 0; i < len; i++)
	clrf	(LT8920_ble_to_localdata@i)
	goto	l5475
	line	132
	
l5471:	
;rx_ble.c: 131: {
;rx_ble.c: 132: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX37[i + adv_offset];
	movlw	((_WHITE_INDEX37-__stringbase))&0ffh
	addwf	(LT8920_ble_to_localdata@adv_offset),w
	movwf	(??_LT8920_ble_to_localdata+0)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	0+(??_LT8920_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_ble_to_localdata+1)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+2)+0
	movf	0+(??_LT8920_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_ble_to_localdata+1)+0,w
	movwf	(??_LT8920_ble_to_localdata+3)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+4)+0
	movf	0+(??_LT8920_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8920_ble_to_localdata+3)+0,w
	movwf	indf
	line	130
	
l5473:	
	incf	(LT8920_ble_to_localdata@i),f
	
l5475:	
	movf	(LT8920_ble_to_localdata@len),w
	subwf	(LT8920_ble_to_localdata@i),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l5471
u1320:
	goto	l3434
	line	138
	
l5477:	
;rx_ble.c: 138: else if(chanel == 38)
	movf	(LT8920_ble_to_localdata@chanel),w
	xorlw	026h
	skipz
	goto	u1331
	goto	u1330
u1331:
	goto	l5487
u1330:
	line	140
	
l5479:	
;rx_ble.c: 139: {
;rx_ble.c: 140: for(i = 0; i < len; i++)
	clrf	(LT8920_ble_to_localdata@i)
	goto	l5485
	line	142
	
l5481:	
;rx_ble.c: 141: {
;rx_ble.c: 142: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX38[i + adv_offset];
	movlw	((_WHITE_INDEX38-__stringbase))&0ffh
	addwf	(LT8920_ble_to_localdata@adv_offset),w
	movwf	(??_LT8920_ble_to_localdata+0)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	0+(??_LT8920_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_ble_to_localdata+1)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+2)+0
	movf	0+(??_LT8920_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_ble_to_localdata+1)+0,w
	movwf	(??_LT8920_ble_to_localdata+3)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+4)+0
	movf	0+(??_LT8920_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8920_ble_to_localdata+3)+0,w
	movwf	indf
	line	140
	
l5483:	
	incf	(LT8920_ble_to_localdata@i),f
	
l5485:	
	movf	(LT8920_ble_to_localdata@len),w
	subwf	(LT8920_ble_to_localdata@i),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l5481
u1340:
	goto	l3434
	line	147
	
l5487:	
;rx_ble.c: 147: else if(chanel == 39)
	movf	(LT8920_ble_to_localdata@chanel),w
	xorlw	027h
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l3434
u1350:
	line	149
	
l5489:	
;rx_ble.c: 148: {
;rx_ble.c: 149: for(i = 0; i < len; i++)
	clrf	(LT8920_ble_to_localdata@i)
	goto	l5495
	line	151
	
l5491:	
;rx_ble.c: 150: {
;rx_ble.c: 151: ADVDATA[i] = ADVDATA[i] ^ WHITE_INDEX39[i + adv_offset];
	movlw	((_WHITE_INDEX39-__stringbase))&0ffh
	addwf	(LT8920_ble_to_localdata@adv_offset),w
	movwf	(??_LT8920_ble_to_localdata+0)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	0+(??_LT8920_ble_to_localdata+0)+0,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_ble_to_localdata+1)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+2)+0
	movf	0+(??_LT8920_ble_to_localdata+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_ble_to_localdata+1)+0,w
	movwf	(??_LT8920_ble_to_localdata+3)+0
	movf	(LT8920_ble_to_localdata@i),w
	addwf	(LT8920_ble_to_localdata@ADVDATA),w
	movwf	(??_LT8920_ble_to_localdata+4)+0
	movf	0+(??_LT8920_ble_to_localdata+4)+0,w
	movwf	fsr0
	movf	(??_LT8920_ble_to_localdata+3)+0,w
	movwf	indf
	line	149
	
l5493:	
	incf	(LT8920_ble_to_localdata@i),f
	
l5495:	
	movf	(LT8920_ble_to_localdata@len),w
	subwf	(LT8920_ble_to_localdata@i),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l5491
u1360:
	line	157
	
l3434:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_ble_to_localdata
	__end_of_LT8920_ble_to_localdata:
;; =============== function _LT8920_ble_to_localdata ends ============

	signat	_LT8920_ble_to_localdata,16504
	global	_LT8920_pdudata_white
psect	text810,local,class=CODE,delta=2
global __ptext810
__ptext810:

;; *************** function _LT8920_pdudata_white *****************
;; Defined at:
;;		line 72 in file "rx_ble.c"
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
;;		_LT8920_ble_tx_start
;; This function uses a non-reentrant model
;;
psect	text810
	file	"rx_ble.c"
	line	72
	global	__size_of_LT8920_pdudata_white
	__size_of_LT8920_pdudata_white	equ	__end_of_LT8920_pdudata_white-_LT8920_pdudata_white
	
_LT8920_pdudata_white:	
	opt	stack 3
; Regs used in _LT8920_pdudata_white: [wreg-fsr0h+status,2+status,0+pclath]
;LT8920_pdudata_white@chanel stored from wreg
	line	80
	movwf	(LT8920_pdudata_white@chanel)
	
l5093:	
;rx_ble.c: 78: unsigned char i;
;rx_ble.c: 80: if(chanel == 37)
	movf	(LT8920_pdudata_white@chanel),w
	xorlw	025h
	skipz
	goto	u781
	goto	u780
u781:
	goto	l5103
u780:
	line	82
	
l5095:	
;rx_ble.c: 81: {
;rx_ble.c: 82: for(i = 0; i < len; i++)
	clrf	(LT8920_pdudata_white@i)
	goto	l5101
	line	84
	
l5097:	
;rx_ble.c: 83: {
;rx_ble.c: 84: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX37[i];
	movf	(LT8920_pdudata_white@i),w
	addlw	low((_WHITE_INDEX37-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_pdudata_white+0)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+1)+0
	movf	0+(??_LT8920_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_pdudata_white+0)+0,w
	movwf	(??_LT8920_pdudata_white+2)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+3)+0
	movf	0+(??_LT8920_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8920_pdudata_white+2)+0,w
	movwf	indf
	line	82
	
l5099:	
	incf	(LT8920_pdudata_white@i),f
	
l5101:	
	movf	(LT8920_pdudata_white@len),w
	subwf	(LT8920_pdudata_white@i),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l5097
u790:
	goto	l3417
	line	88
	
l5103:	
;rx_ble.c: 88: else if(chanel == 38)
	movf	(LT8920_pdudata_white@chanel),w
	xorlw	026h
	skipz
	goto	u801
	goto	u800
u801:
	goto	l5113
u800:
	line	90
	
l5105:	
;rx_ble.c: 89: {
;rx_ble.c: 90: for(i = 0; i < len; i++)
	clrf	(LT8920_pdudata_white@i)
	goto	l5111
	line	92
	
l5107:	
;rx_ble.c: 91: {
;rx_ble.c: 92: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX38[i];
	movf	(LT8920_pdudata_white@i),w
	addlw	low((_WHITE_INDEX38-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_pdudata_white+0)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+1)+0
	movf	0+(??_LT8920_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_pdudata_white+0)+0,w
	movwf	(??_LT8920_pdudata_white+2)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+3)+0
	movf	0+(??_LT8920_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8920_pdudata_white+2)+0,w
	movwf	indf
	line	90
	
l5109:	
	incf	(LT8920_pdudata_white@i),f
	
l5111:	
	movf	(LT8920_pdudata_white@len),w
	subwf	(LT8920_pdudata_white@i),w
	skipc
	goto	u811
	goto	u810
u811:
	goto	l5107
u810:
	goto	l3417
	line	96
	
l5113:	
;rx_ble.c: 96: else if(chanel == 39)
	movf	(LT8920_pdudata_white@chanel),w
	xorlw	027h
	skipz
	goto	u821
	goto	u820
u821:
	goto	l3417
u820:
	line	98
	
l5115:	
;rx_ble.c: 97: {
;rx_ble.c: 98: for(i = 0; i < len; i++)
	clrf	(LT8920_pdudata_white@i)
	goto	l5121
	line	100
	
l5117:	
;rx_ble.c: 99: {
;rx_ble.c: 100: PDUDATA[i] = PDUDATA[i] ^ WHITE_INDEX39[i];
	movf	(LT8920_pdudata_white@i),w
	addlw	low((_WHITE_INDEX39-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_LT8920_pdudata_white+0)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+1)+0
	movf	0+(??_LT8920_pdudata_white+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_LT8920_pdudata_white+0)+0,w
	movwf	(??_LT8920_pdudata_white+2)+0
	movf	(LT8920_pdudata_white@i),w
	addwf	(LT8920_pdudata_white@PDUDATA),w
	movwf	(??_LT8920_pdudata_white+3)+0
	movf	0+(??_LT8920_pdudata_white+3)+0,w
	movwf	fsr0
	movf	(??_LT8920_pdudata_white+2)+0,w
	movwf	indf
	line	98
	
l5119:	
	incf	(LT8920_pdudata_white@i),f
	
l5121:	
	movf	(LT8920_pdudata_white@len),w
	subwf	(LT8920_pdudata_white@i),w
	skipc
	goto	u831
	goto	u830
u831:
	goto	l5117
u830:
	line	114
	
l3417:	
	return
	opt stack 0
GLOBAL	__end_of_LT8920_pdudata_white
	__end_of_LT8920_pdudata_white:
;; =============== function _LT8920_pdudata_white ends ============

	signat	_LT8920_pdudata_white,12408
	global	_roll_data
psect	text811,local,class=CODE,delta=2
global __ptext811
__ptext811:

;; *************** function _roll_data *****************
;; Defined at:
;;		line 17 in file "rx_ble.c"
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
psect	text811
	file	"rx_ble.c"
	line	17
	global	__size_of_roll_data
	__size_of_roll_data	equ	__end_of_roll_data-_roll_data
	
_roll_data:	
	opt	stack 3
; Regs used in _roll_data: [wreg+status,2+status,0]
;roll_data@roll_in stored from wreg
	movwf	(roll_data@roll_in)
	line	18
	
l5077:	
;rx_ble.c: 18: unsigned char i, roll_out = 0;
	clrf	(roll_data@roll_out)
	line	20
;rx_ble.c: 20: for(i = 0; i < 8; i++)
	clrf	(roll_data@i)
	line	22
	
l5083:	
;rx_ble.c: 21: {
;rx_ble.c: 22: if(roll_in & (1 << i)) roll_out |= 1 << (7 - i);
	movlw	(01h)
	movwf	(??_roll_data+0)+0
	incf	(roll_data@i),w
	goto	u744
u745:
	clrc
	rlf	(??_roll_data+0)+0,f
u744:
	addlw	-1
	skipz
	goto	u745
	movf	0+(??_roll_data+0)+0,w
	andwf	(roll_data@roll_in),w
	btfsc	status,2
	goto	u751
	goto	u750
u751:
	goto	l5087
u750:
	
l5085:	
	movlw	(01h)
	movwf	(??_roll_data+0)+0
	movf	(roll_data@i),w
	sublw	07h
	addlw	1
	goto	u764
u765:
	clrc
	rlf	(??_roll_data+0)+0,f
u764:
	addlw	-1
	skipz
	goto	u765
	movf	0+(??_roll_data+0)+0,w
	iorwf	(roll_data@roll_out),f
	line	20
	
l5087:	
	incf	(roll_data@i),f
	movlw	(08h)
	subwf	(roll_data@i),w
	skipc
	goto	u771
	goto	u770
u771:
	goto	l5083
u770:
	line	24
	
l5089:	
;rx_ble.c: 23: }
;rx_ble.c: 24: return roll_out;
	movf	(roll_data@roll_out),w
	line	25
	
l3394:	
	return
	opt stack 0
GLOBAL	__end_of_roll_data
	__end_of_roll_data:
;; =============== function _roll_data ends ============

	signat	_roll_data,4217
	global	_SPI_ReadByte
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:

;; *************** function _SPI_ReadByte *****************
;; Defined at:
;;		line 44 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  mcnt            1    3[COMMON] unsigned char 
;;  retvalue        1    2[COMMON] unsigned char 
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
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT_ReadReg
;;		_LT_ReadBUF_ble
;; This function uses a non-reentrant model
;;
psect	text812
	file	"lt89xxdrvspi.c"
	line	44
	global	__size_of_SPI_ReadByte
	__size_of_SPI_ReadByte	equ	__end_of_SPI_ReadByte-_SPI_ReadByte
	
_SPI_ReadByte:	
	opt	stack 1
; Regs used in _SPI_ReadByte: [wreg+status,2+status,0]
	line	45
	
l5449:	
;lt89xxdrvspi.c: 45: unsigned char retvalue=0;
	clrf	(SPI_ReadByte@retvalue)
	line	47
	
l5451:	
;lt89xxdrvspi.c: 46: unsigned char mcnt;
;lt89xxdrvspi.c: 47: RC3=0;
	bcf	(59/8),(59)&7
	line	48
;lt89xxdrvspi.c: 48: for (mcnt=0;mcnt<8;mcnt++)
	clrf	(SPI_ReadByte@mcnt)
	line	49
	
l2239:	
	line	50
;lt89xxdrvspi.c: 49: {
;lt89xxdrvspi.c: 50: RC3=1;
	bsf	(59/8),(59)&7
	line	52
;lt89xxdrvspi.c: 52: retvalue<<=1;
	clrc
	rlf	(SPI_ReadByte@retvalue),f
	line	53
;lt89xxdrvspi.c: 53: RC3=0;
	bcf	(59/8),(59)&7
	line	56
;lt89xxdrvspi.c: 56: if(RA6) retvalue|=1;
	btfss	(46/8),(46)&7
	goto	u1291
	goto	u1290
u1291:
	goto	l2241
u1290:
	
l5457:	
	bsf	(SPI_ReadByte@retvalue)+(0/8),(0)&7
	goto	l5459
	line	57
	
l2241:	
;lt89xxdrvspi.c: 57: else retvalue&=0xfe;
	bcf	(SPI_ReadByte@retvalue)+(0/8),(0)&7
	line	48
	
l5459:	
	incf	(SPI_ReadByte@mcnt),f
	
l5461:	
	movlw	(08h)
	subwf	(SPI_ReadByte@mcnt),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l2239
u1300:
	
l2240:	
	line	60
;lt89xxdrvspi.c: 59: }
;lt89xxdrvspi.c: 60: RC3=0;
	bcf	(59/8),(59)&7
	line	61
	
l5463:	
;lt89xxdrvspi.c: 61: return retvalue;
	movf	(SPI_ReadByte@retvalue),w
	line	62
	
l2243:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_ReadByte
	__end_of_SPI_ReadByte:
;; =============== function _SPI_ReadByte ends ============

	signat	_SPI_ReadByte,89
	global	_SPI_SendByte
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

;; *************** function _SPI_SendByte *****************
;; Defined at:
;;		line 24 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf             1    2[COMMON] unsigned char 
;;  mcnt            1    3[COMMON] unsigned char 
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
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LT_ReadReg
;;		_LT_WriteReg
;;		_LT_WriteBUF_ble
;;		_LT_ReadBUF_ble
;; This function uses a non-reentrant model
;;
psect	text813
	file	"lt89xxdrvspi.c"
	line	24
	global	__size_of_SPI_SendByte
	__size_of_SPI_SendByte	equ	__end_of_SPI_SendByte-_SPI_SendByte
	
_SPI_SendByte:	
	opt	stack 1
; Regs used in _SPI_SendByte: [wreg+status,2+status,0]
;SPI_SendByte@buf stored from wreg
	line	26
	movwf	(SPI_SendByte@buf)
	
l5437:	
;lt89xxdrvspi.c: 25: unsigned char mcnt;
;lt89xxdrvspi.c: 26: for(mcnt=0;mcnt<8;mcnt++)
	clrf	(SPI_SendByte@mcnt)
	line	27
	
l2232:	
	line	28
;lt89xxdrvspi.c: 27: {
;lt89xxdrvspi.c: 28: RC3=0;
	bcf	(59/8),(59)&7
	line	30
;lt89xxdrvspi.c: 30: if(buf&0x80) RA5=1;
	btfss	(SPI_SendByte@buf),(7)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l2234
u1270:
	
l5443:	
	bsf	(45/8),(45)&7
	goto	l2235
	line	31
	
l2234:	
;lt89xxdrvspi.c: 31: else RA5=0;
	bcf	(45/8),(45)&7
	
l2235:	
	line	33
;lt89xxdrvspi.c: 33: RC3=1;
	bsf	(59/8),(59)&7
	line	35
;lt89xxdrvspi.c: 35: buf<<=1;
	clrc
	rlf	(SPI_SendByte@buf),f
	line	26
	
l5445:	
	incf	(SPI_SendByte@mcnt),f
	
l5447:	
	movlw	(08h)
	subwf	(SPI_SendByte@mcnt),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l2232
u1280:
	
l2233:	
	line	38
;lt89xxdrvspi.c: 37: }
;lt89xxdrvspi.c: 38: RC3=0;
	bcf	(59/8),(59)&7
	line	39
;lt89xxdrvspi.c: 39: RA5=0;
	bcf	(45/8),(45)&7
	line	40
	
l2236:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_SendByte
	__end_of_SPI_SendByte:
;; =============== function _SPI_SendByte ends ============

	signat	_SPI_SendByte,4216
	global	_check_sum
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:

;; *************** function _check_sum *****************
;; Defined at:
;;		line 290 in file "main.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> RXADVDATA(29), 
;;  len             1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf             1    6[COMMON] PTR unsigned char 
;;		 -> RXADVDATA(29), 
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
psect	text814
	file	"main.c"
	line	290
	global	__size_of_check_sum
	__size_of_check_sum	equ	__end_of_check_sum-_check_sum
	
_check_sum:	
	opt	stack 4
; Regs used in _check_sum: [wreg-fsr0h+status,2+status,0]
;check_sum@buf stored from wreg
	line	293
	movwf	(check_sum@buf)
	
l5029:	
;main.c: 292: unsigned char sum, i;
;main.c: 293: sum = 0;
	clrf	(check_sum@sum)
	line	294
;main.c: 294: i = 0;
	clrf	(check_sum@i)
	line	295
;main.c: 295: for(i = 0; i < len - 1; i++)
	clrf	(check_sum@i)
	goto	l5035
	line	298
	
l5031:	
;main.c: 296: {
;main.c: 298: sum = buf[i] + sum;
	movf	(check_sum@i),w
	addwf	(check_sum@buf),w
	movwf	(??_check_sum+0)+0
	movf	0+(??_check_sum+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addwf	(check_sum@sum),f
	line	295
	
l5033:	
	incf	(check_sum@i),f
	
l5035:	
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
	goto	u685
	movf	0+(??_check_sum+0)+0,w
	subwf	(check_sum@i),w
u685:

	skipc
	goto	u681
	goto	u680
u681:
	goto	l5031
u680:
	line	300
	
l5037:	
;main.c: 299: }
;main.c: 300: if(buf[len - 1] == sum)
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
	goto	u691
	goto	u690
u691:
	goto	l5043
u690:
	line	302
	
l5039:	
;main.c: 301: {
;main.c: 302: return 1;
	movlw	(01h)
	goto	l1152
	line	304
	
l5043:	
;main.c: 303: }
;main.c: 304: return 0;
	movlw	(0)
	line	305
	
l1152:	
	return
	opt stack 0
GLOBAL	__end_of_check_sum
	__end_of_check_sum:
;; =============== function _check_sum ends ============

	signat	_check_sum,8313
	global	_DELAY_MS
psect	text815,local,class=CODE,delta=2
global __ptext815
__ptext815:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 8 in file "lt89xxdrvspi.c"
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
;;		_LT8920_ble_tx
;;		_ble_chanel_scan
;;		_LT89XX_INIT
;; This function uses a non-reentrant model
;;
psect	text815
	file	"lt89xxdrvspi.c"
	line	8
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 4
; Regs used in _DELAY_MS: [wreg+status,2+status,0]
;DELAY_MS@Tms stored from wreg
	movwf	(DELAY_MS@Tms)
	line	11
	
l5019:	
;lt89xxdrvspi.c: 10: unsigned int dly;
;lt89xxdrvspi.c: 11: while(Tms)
	goto	l5027
	line	13
	
l5021:	
;lt89xxdrvspi.c: 12: {
;lt89xxdrvspi.c: 13: Tms--;
	decf	(DELAY_MS@Tms),f
	line	14
;lt89xxdrvspi.c: 14: dly=650;
	movlw	low(028Ah)
	movwf	(DELAY_MS@dly)
	movlw	high(028Ah)
	movwf	((DELAY_MS@dly))+1
	line	15
;lt89xxdrvspi.c: 15: while(dly) dly--;
	goto	l5025
	
l5023:	
	movlw	low(01h)
	subwf	(DELAY_MS@dly),f
	movlw	high(01h)
	skipc
	decf	(DELAY_MS@dly+1),f
	subwf	(DELAY_MS@dly+1),f
	
l5025:	
	movf	((DELAY_MS@dly+1)),w
	iorwf	((DELAY_MS@dly)),w
	skipz
	goto	u661
	goto	u660
u661:
	goto	l5023
u660:
	line	11
	
l5027:	
	movf	(DELAY_MS@Tms),f
	skipz
	goto	u671
	goto	u670
u671:
	goto	l5021
u670:
	line	18
	
l2229:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_Init
psect	text816,local,class=CODE,delta=2
global __ptext816
__ptext816:

;; *************** function _Init *****************
;; Defined at:
;;		line 79 in file "main.c"
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
psect	text816
	file	"main.c"
	line	79
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 6
; Regs used in _Init: [wreg+status,2]
	line	90
	
l4985:	
;main.c: 90: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	93
	
l4987:	
;main.c: 93: INTCON = 0;
	clrf	(11)	;volatile
	line	94
	
l4989:	
;main.c: 94: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	95
;main.c: 95: TRISA = 0B01011111;
	movlw	(05Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	96
	
l4991:	
;main.c: 96: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	97
	
l4993:	
;main.c: 97: TRISC = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	99
;main.c: 99: WPUA = 0;
	clrf	(149)^080h	;volatile
	line	100
;main.c: 100: WPUC = 0;
	clrf	(136)^080h	;volatile
	line	101
	
l4995:	
;main.c: 101: OPTION = 0B10001000;
	movlw	(088h)
	movwf	(129)^080h	;volatile
	line	103
	
l4997:	
;main.c: 103: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	106
;main.c: 106: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	110
	
l4999:	
;main.c: 110: T1CON = 0B00000000;
	clrf	(16)	;volatile
	line	113
	
l5001:	
;main.c: 113: TMR1L = 0XBF;
	movlw	(0BFh)
	movwf	(14)	;volatile
	line	115
	
l5003:	
;main.c: 115: TMR1H = 0XE0;
	movlw	(0E0h)
	movwf	(15)	;volatile
	line	116
	
l5005:	
;main.c: 116: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	117
	
l5007:	
;main.c: 117: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	118
	
l5009:	
;main.c: 118: PEIE=1;
	bsf	(94/8),(94)&7
	line	119
	
l5011:	
;main.c: 119: GIE = 1;
	bsf	(95/8),(95)&7
	line	124
	
l5013:	
;main.c: 124: ADCON1 = 0B01010000;
	movlw	(050h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	126
	
l5015:	
;main.c: 126: ADCON0 = 0B10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	130
	
l5017:	
;main.c: 130: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(145)^080h	;volatile
	line	131
	
l1112:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
	global	_ISR
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:

;; *************** function _ISR *****************
;; Defined at:
;;		line 49 in file "main.c"
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
psect	text817
	file	"main.c"
	line	49
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
psect	text817
	line	50
	
i1l4969:	
;main.c: 50: GIE=0;
	bcf	(95/8),(95)&7
	line	55
;main.c: 55: if(TMR1IE && TMR1IF)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l4983
u63_20:
	
i1l4971:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l4983
u64_20:
	line	57
	
i1l4973:	
;main.c: 56: {
;main.c: 57: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	58
	
i1l4975:	
;main.c: 58: TMR1L = 0X2F;
	movlw	(02Fh)
	movwf	(14)	;volatile
	line	59
;main.c: 60: T250uS++;
	movlw	(0F8h)
	movwf	(15)	;volatile
	line	63
	
i1l4977:	
;main.c: 63: rxtimeout++;
	incf	(_rxtimeout),f
	skipnz
	incf	(_rxtimeout+1),f
	line	65
	
i1l4979:	
;main.c: 65: if(rxtimeout > 4000)
	movlw	high(0FA1h)
	subwf	(_rxtimeout+1),w
	movlw	low(0FA1h)
	skipnz
	subwf	(_rxtimeout),w
	skipc
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l4983
u65_20:
	line	67
	
i1l4981:	
;main.c: 66: {
;main.c: 67: rxtimeout = 0;
	clrf	(_rxtimeout)
	clrf	(_rxtimeout+1)
	line	68
;main.c: 68: LT8920_work_sta = SCAN;
	clrf	(_LT8920_work_sta)
	line	75
	
i1l4983:	
;main.c: 70: }
;main.c: 74: }
;main.c: 75: GIE=1;
	bsf	(95/8),(95)&7
	line	76
	
i1l1109:	
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
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

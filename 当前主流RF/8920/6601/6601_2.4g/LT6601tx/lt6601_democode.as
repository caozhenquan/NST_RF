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
	FNCALL	_main,_write_sync
	FNCALL	_main,_LT_WriteReg
	FNCALL	_main,_LT_WriteBUF
	FNCALL	_write_sync,_LT_WriteReg
	FNCALL	_LT89xx_ModeSet,_LT_WriteReg
	FNCALL	_LT89XX_INIT,_DELAY_MS
	FNCALL	_LT89XX_INIT,_LT_WriteReg
	FNCALL	_LT89XX_INIT,_LT_ReadReg
	FNCALL	_LT_ReadReg,_SPI_SendByte
	FNCALL	_LT_ReadReg,_SPI_ReadByte
	FNCALL	_LT_WriteBUF,_SPI_SendByte
	FNCALL	_LT_WriteReg,_SPI_SendByte
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_txdata
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"main.c"
	line	16

;initializer for _txdata
	retlw	011h
	retlw	022h
	retlw	033h
	retlw	044h
	retlw	055h
	retlw	066h
	retlw	077h
	retlw	088h
	retlw	099h
	retlw	0AAh
	retlw	0BBh
	retlw	0CCh
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
	line	122
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
	global	_LDT8900config
	global	_RegH
	global	_RegL
	global	_T250uS
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

_RegL:
       ds      1

_T250uS:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"main.c"
	line	16
_txdata:
       ds      12

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
	fcall	__pidataBANK0+10		;fetch initializer
	movwf	__pdataBANK0+10&07fh		
	fcall	__pidataBANK0+11		;fetch initializer
	movwf	__pdataBANK0+11&07fh		
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
	global	?_write_sync
?_write_sync:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_Init
?_Init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x0
	global	?_SPI_SendByte
?_SPI_SendByte:	; 0 bytes @ 0x0
	global	?_LT_ReadReg
?_LT_ReadReg:	; 0 bytes @ 0x0
	global	?_SPI_ReadByte
?_SPI_ReadByte:	; 1 bytes @ 0x0
	ds	2
	global	??_Init
??_Init:	; 0 bytes @ 0x2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x2
	global	??_SPI_SendByte
??_SPI_SendByte:	; 0 bytes @ 0x2
	global	??_SPI_ReadByte
??_SPI_ReadByte:	; 0 bytes @ 0x2
	global	SPI_SendByte@buf
SPI_SendByte@buf:	; 1 bytes @ 0x2
	global	SPI_ReadByte@retvalue
SPI_ReadByte@retvalue:	; 1 bytes @ 0x2
	global	DELAY_MS@dly
DELAY_MS@dly:	; 2 bytes @ 0x2
	ds	1
	global	SPI_SendByte@mcnt
SPI_SendByte@mcnt:	; 1 bytes @ 0x3
	global	SPI_ReadByte@mcnt
SPI_ReadByte@mcnt:	; 1 bytes @ 0x3
	ds	1
	global	?_LT_WriteReg
?_LT_WriteReg:	; 0 bytes @ 0x4
	global	?_LT_WriteBUF
?_LT_WriteBUF:	; 0 bytes @ 0x4
	global	??_LT_ReadReg
??_LT_ReadReg:	; 0 bytes @ 0x4
	global	DELAY_MS@Tms
DELAY_MS@Tms:	; 1 bytes @ 0x4
	global	LT_ReadReg@reg
LT_ReadReg@reg:	; 1 bytes @ 0x4
	global	LT_WriteReg@H
LT_WriteReg@H:	; 1 bytes @ 0x4
	global	LT_WriteBUF@pBuf
LT_WriteBUF@pBuf:	; 1 bytes @ 0x4
	ds	1
	global	LT_WriteReg@L
LT_WriteReg@L:	; 1 bytes @ 0x5
	global	LT_WriteBUF@len
LT_WriteBUF@len:	; 1 bytes @ 0x5
	ds	1
	global	??_LT_WriteReg
??_LT_WriteReg:	; 0 bytes @ 0x6
	global	??_LT_WriteBUF
??_LT_WriteBUF:	; 0 bytes @ 0x6
	global	LT_WriteReg@reg
LT_WriteReg@reg:	; 1 bytes @ 0x6
	ds	1
	global	??_LT89XX_INIT
??_LT89XX_INIT:	; 0 bytes @ 0x7
	global	??_LT89xx_ModeSet
??_LT89xx_ModeSet:	; 0 bytes @ 0x7
	global	??_write_sync
??_write_sync:	; 0 bytes @ 0x7
	global	LT_WriteBUF@reg
LT_WriteBUF@reg:	; 1 bytes @ 0x7
	global	LT89XX_INIT@CFG_CNT
LT89XX_INIT@CFG_CNT:	; 1 bytes @ 0x7
	global	LT89xx_ModeSet@dat1
LT89xx_ModeSet@dat1:	; 1 bytes @ 0x7
	ds	1
	global	LT_WriteBUF@i
LT_WriteBUF@i:	; 1 bytes @ 0x8
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x9
;;Data sizes: Strings 0, constant 102, data 12, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      12
;; BANK0           80      0      12
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; LT_WriteBUF@pBuf	PTR unsigned char  size(1) Largest target is 12
;;		 -> txdata(BANK0[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_LT_WriteBUF
;;   _write_sync->_LT_WriteReg
;;   _LT89xx_ModeSet->_LT_WriteReg
;;   _LT89XX_INIT->_LT_WriteReg
;;   _LT_ReadReg->_SPI_SendByte
;;   _LT_ReadReg->_SPI_ReadByte
;;   _LT_WriteBUF->_SPI_SendByte
;;   _LT_WriteReg->_SPI_SendByte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;; (0) _main                                                 1     1      0    1087
;;                               _Init
;;                        _LT89XX_INIT
;;                     _LT89xx_ModeSet
;;                         _write_sync
;;                        _LT_WriteReg
;;                        _LT_WriteBUF
;; ---------------------------------------------------------------------------------
;; (1) _write_sync                                           0     0      0     135
;;                        _LT_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _LT89xx_ModeSet                                       1     1      0     157
;;                                              7 COMMON     1     1      0
;;                        _LT_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _LT89XX_INIT                                          1     1      0     457
;;                                              7 COMMON     1     1      0
;;                           _DELAY_MS
;;                        _LT_WriteReg
;;                         _LT_ReadReg
;; ---------------------------------------------------------------------------------
;; (2) _LT_ReadReg                                           1     1      0     163
;;                                              4 COMMON     1     1      0
;;                       _SPI_SendByte
;;                       _SPI_ReadByte
;; ---------------------------------------------------------------------------------
;; (1) _LT_WriteBUF                                          5     3      2     203
;;                                              4 COMMON     5     3      2
;;                       _SPI_SendByte
;; ---------------------------------------------------------------------------------
;; (1) _LT_WriteReg                                          3     1      2     135
;;                                              4 COMMON     3     1      2
;;                       _SPI_SendByte
;; ---------------------------------------------------------------------------------
;; (3) _SPI_ReadByte                                         2     2      0      72
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _SPI_SendByte                                         2     2      0      69
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_MS                                             3     3      0      47
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
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
;;   _write_sync
;;     _LT_WriteReg
;;       _SPI_SendByte
;;   _LT_WriteReg
;;     _SPI_SendByte
;;   _LT_WriteBUF
;;     _SPI_SendByte
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
;;DATA                 0      0      1B       8        0.0%
;;ABS                  0      0      18       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0       C       4       15.0%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 105 in file "main.c"
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
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Init
;;		_LT89XX_INIT
;;		_LT89xx_ModeSet
;;		_write_sync
;;		_LT_WriteReg
;;		_LT_WriteBUF
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	105
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	107
	
l3184:	
;main.c: 106: unsigned char I;
;main.c: 107: Init();
	fcall	_Init
	line	108
	
l3186:	
;main.c: 108: LT89XX_INIT();
	fcall	_LT89XX_INIT
	line	109
	
l3188:	
;main.c: 109: LT89xx_ModeSet(0x19);
	movlw	(019h)
	fcall	_LT89xx_ModeSet
	line	110
;main.c: 110: write_sync();
	fcall	_write_sync
	line	113
	
l3190:	
;main.c: 113: if(T250uS>40){
	movlw	(029h)
	subwf	(_T250uS),w
	skipc
	goto	u261
	goto	u260
u261:
	goto	l3190
u260:
	line	114
	
l3192:	
;main.c: 114: T250uS=0;
	clrf	(_T250uS)
	line	115
	
l3194:	
;main.c: 115: RC5=!RC5;
	movlw	1<<((61)&7)
	xorwf	((61)/8),f
	line	117
	
l3196:	
;main.c: 117: LT_WriteReg(7,0,0);
	clrf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	line	118
	
l3198:	
;main.c: 118: LT89xx_ModeSet(0x0e);
	movlw	(0Eh)
	fcall	_LT89xx_ModeSet
	line	119
	
l3200:	
;main.c: 119: LT_WriteBUF(50, txdata, 11);
	movlw	(_txdata)&0ffh
	movwf	(?_LT_WriteBUF)
	movlw	(0Bh)
	movwf	0+(?_LT_WriteBUF)+01h
	movlw	(032h)
	fcall	_LT_WriteBUF
	line	121
	
l3202:	
;main.c: 121: LT_WriteReg(7,0x01,70);
	clrf	(?_LT_WriteReg)
	incf	(?_LT_WriteReg),f
	movlw	(046h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	goto	l3190
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	133
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_write_sync
psect	text205,local,class=CODE,delta=2
global __ptext205
__ptext205:

;; *************** function _write_sync *****************
;; Defined at:
;;		line 246 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LT_WriteReg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text205
	file	"lt89xxdrvspi.c"
	line	246
	global	__size_of_write_sync
	__size_of_write_sync	equ	__end_of_write_sync-_write_sync
	
_write_sync:	
	opt	stack 4
; Regs used in _write_sync: [wreg+status,2+status,0+pclath+cstack]
	line	248
	
l3182:	
;lt89xxdrvspi.c: 248: LT_WriteReg(36, 0x33, 0x33);
	movlw	(033h)
	movwf	(?_LT_WriteReg)
	movlw	(033h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(024h)
	fcall	_LT_WriteReg
	line	249
;lt89xxdrvspi.c: 249: LT_WriteReg(37, 0xaa, 0xaa);
	movlw	(0AAh)
	movwf	(?_LT_WriteReg)
	movlw	(0AAh)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(025h)
	fcall	_LT_WriteReg
	line	250
;lt89xxdrvspi.c: 250: LT_WriteReg(38, 0x55, 0x01);
	movlw	(055h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(026h)
	fcall	_LT_WriteReg
	line	251
;lt89xxdrvspi.c: 251: LT_WriteReg(39, 0x10, 0x01);
	movlw	(010h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(027h)
	fcall	_LT_WriteReg
	line	254
	
l1777:	
	return
	opt stack 0
GLOBAL	__end_of_write_sync
	__end_of_write_sync:
;; =============== function _write_sync ends ============

	signat	_write_sync,88
	global	_LT89xx_ModeSet
psect	text206,local,class=CODE,delta=2
global __ptext206
__ptext206:

;; *************** function _LT89xx_ModeSet *****************
;; Defined at:
;;		line 198 in file "lt89xxdrvspi.c"
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
psect	text206
	file	"lt89xxdrvspi.c"
	line	198
	global	__size_of_LT89xx_ModeSet
	__size_of_LT89xx_ModeSet	equ	__end_of_LT89xx_ModeSet-_LT89xx_ModeSet
	
_LT89xx_ModeSet:	
	opt	stack 4
; Regs used in _LT89xx_ModeSet: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT89xx_ModeSet@dat1 stored from wreg
	movwf	(LT89xx_ModeSet@dat1)
	line	201
	
l3158:	
;lt89xxdrvspi.c: 201: switch(dat1)
	goto	l3178
	line	204
	
l3160:	
;lt89xxdrvspi.c: 204: LT_WriteReg(7, 0x00, 0x00);
	clrf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	line	205
;lt89xxdrvspi.c: 205: LT_WriteReg(27, 0x13, 0x00);
	movlw	(013h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(01Bh)
	fcall	_LT_WriteReg
	line	206
;lt89xxdrvspi.c: 206: LT_WriteReg(35, 0x43, 0x00);
	movlw	(043h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(023h)
	fcall	_LT_WriteReg
	line	207
;lt89xxdrvspi.c: 207: break;
	goto	l1774
	line	215
	
l3162:	
;lt89xxdrvspi.c: 215: LT_WriteReg(52, 0x80, 0x80);
	movlw	(080h)
	movwf	(?_LT_WriteReg)
	movlw	(080h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(034h)
	fcall	_LT_WriteReg
	line	216
;lt89xxdrvspi.c: 216: break;
	goto	l1774
	line	218
	
l3164:	
;lt89xxdrvspi.c: 218: LT_WriteReg(7, 0x00, 0x00);
	clrf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	movlw	(07h)
	fcall	_LT_WriteReg
	line	219
;lt89xxdrvspi.c: 219: break;
	goto	l1774
	line	221
	
l3166:	
;lt89xxdrvspi.c: 221: LT_WriteReg(44, 0x01, 0x01);
	clrf	(?_LT_WriteReg)
	incf	(?_LT_WriteReg),f
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	222
;lt89xxdrvspi.c: 222: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	223
;lt89xxdrvspi.c: 223: break;
	goto	l1774
	line	225
	
l3168:	
;lt89xxdrvspi.c: 225: LT_WriteReg(44, 0x02, 0x01);
	movlw	(02h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	226
;lt89xxdrvspi.c: 226: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	227
;lt89xxdrvspi.c: 227: break;
	goto	l1774
	line	229
	
l3170:	
;lt89xxdrvspi.c: 229: LT_WriteReg(44, 0x04, 0x01);
	movlw	(04h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	230
;lt89xxdrvspi.c: 230: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	231
;lt89xxdrvspi.c: 231: break;
	goto	l1774
	line	233
	
l3172:	
;lt89xxdrvspi.c: 233: LT_WriteReg(44, 0x08, 0x01);
	movlw	(08h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	234
;lt89xxdrvspi.c: 234: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	235
;lt89xxdrvspi.c: 235: break;
	goto	l1774
	line	237
	
l3174:	
;lt89xxdrvspi.c: 237: LT_WriteReg(44, 0x10, 0x01);
	movlw	(010h)
	movwf	(?_LT_WriteReg)
	clrf	0+(?_LT_WriteReg)+01h
	incf	0+(?_LT_WriteReg)+01h,f
	movlw	(02Ch)
	fcall	_LT_WriteReg
	line	238
;lt89xxdrvspi.c: 238: LT_WriteReg(45, 0x05, 0x52);
	movlw	(05h)
	movwf	(?_LT_WriteReg)
	movlw	(052h)
	movwf	0+(?_LT_WriteReg)+01h
	movlw	(02Dh)
	fcall	_LT_WriteReg
	line	239
;lt89xxdrvspi.c: 239: break;
	goto	l1774
	line	201
	
l3178:	
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
goto l1774
	movwf fsr
	movlw	12
	subwf	fsr,w
skipnc
goto l1774
movlw high(S3214)
movwf pclath
	movlw low(S3214)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3214:
	ljmp	l3162
	ljmp	l1774
	ljmp	l1774
	ljmp	l1774
	ljmp	l3160
	ljmp	l3164
	ljmp	l1774
	ljmp	l3166
	ljmp	l3168
	ljmp	l3170
	ljmp	l3172
	ljmp	l3174
psect	text206

	line	244
	
l1774:	
	return
	opt stack 0
GLOBAL	__end_of_LT89xx_ModeSet
	__end_of_LT89xx_ModeSet:
;; =============== function _LT89xx_ModeSet ends ============

	signat	_LT89xx_ModeSet,4216
	global	_LT89XX_INIT
psect	text207,local,class=CODE,delta=2
global __ptext207
__ptext207:

;; *************** function _LT89XX_INIT *****************
;; Defined at:
;;		line 174 in file "lt89xxdrvspi.c"
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
psect	text207
	file	"lt89xxdrvspi.c"
	line	174
	global	__size_of_LT89XX_INIT
	__size_of_LT89XX_INIT	equ	__end_of_LT89XX_INIT-_LT89XX_INIT
	
_LT89XX_INIT:	
	opt	stack 4
; Regs used in _LT89XX_INIT: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	178
;lt89xxdrvspi.c: 175: unsigned char CFG_CNT;
;lt89xxdrvspi.c: 178: while(1)
	
l1754:	
	line	181
;lt89xxdrvspi.c: 179: {
;lt89xxdrvspi.c: 181: RA7 = 0; DELAY_MS(10);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	
l3134:	
	movlw	(0Ah)
	fcall	_DELAY_MS
	line	182
	
l3136:	
;lt89xxdrvspi.c: 182: RA7 = 1; DELAY_MS(100);
	bsf	(47/8),(47)&7
	movlw	(064h)
	fcall	_DELAY_MS
	line	185
	
l3138:	
;lt89xxdrvspi.c: 185: for(CFG_CNT=0;CFG_CNT<34;CFG_CNT++)
	clrf	(LT89XX_INIT@CFG_CNT)
	line	187
	
l3144:	
;lt89xxdrvspi.c: 186: {
;lt89xxdrvspi.c: 187: LT_WriteReg(LDT8900config[CFG_CNT][0],LDT8900config[CFG_CNT][1],LDT8900config[CFG_CNT][2]);
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
	line	185
	
l3146:	
	incf	(LT89XX_INIT@CFG_CNT),f
	
l3148:	
	movlw	(022h)
	subwf	(LT89XX_INIT@CFG_CNT),w
	skipc
	goto	u231
	goto	u230
u231:
	goto	l3144
u230:
	line	191
	
l3150:	
;lt89xxdrvspi.c: 189: }
;lt89xxdrvspi.c: 191: LT_ReadReg(0);
	movlw	(0)
	fcall	_LT_ReadReg
	line	192
	
l3152:	
;lt89xxdrvspi.c: 192: if(RegH==0x6F&&RegL==0XE0)
	movf	(_RegH),w
	xorlw	06Fh
	skipz
	goto	u241
	goto	u240
u241:
	goto	l1754
u240:
	
l3154:	
	movf	(_RegL),w
	xorlw	0E0h
	skipz
	goto	u251
	goto	u250
u251:
	goto	l1754
u250:
	line	195
	
l1760:	
	return
	opt stack 0
GLOBAL	__end_of_LT89XX_INIT
	__end_of_LT89XX_INIT:
;; =============== function _LT89XX_INIT ends ============

	signat	_LT89XX_INIT,88
	global	_LT_ReadReg
psect	text208,local,class=CODE,delta=2
global __ptext208
__ptext208:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_SendByte
;;		_SPI_ReadByte
;; This function is called by:
;;		_LT89XX_INIT
;; This function uses a non-reentrant model
;;
psect	text208
	file	"lt89xxdrvspi.c"
	line	68
	global	__size_of_LT_ReadReg
	__size_of_LT_ReadReg	equ	__end_of_LT_ReadReg-_LT_ReadReg
	
_LT_ReadReg:	
	opt	stack 4
; Regs used in _LT_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;LT_ReadReg@reg stored from wreg
	movwf	(LT_ReadReg@reg)
	line	69
	
l3128:	
;lt89xxdrvspi.c: 69: RC2=0;
	bcf	(58/8),(58)&7
	line	70
	
l3130:	
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
	
l3132:	
;lt89xxdrvspi.c: 73: RC2=1;
	bsf	(58/8),(58)&7
	line	75
	
l1736:	
	return
	opt stack 0
GLOBAL	__end_of_LT_ReadReg
	__end_of_LT_ReadReg:
;; =============== function _LT_ReadReg ends ============

	signat	_LT_ReadReg,4216
	global	_LT_WriteBUF
psect	text209,local,class=CODE,delta=2
global __ptext209
__ptext209:

;; *************** function _LT_WriteBUF *****************
;; Defined at:
;;		line 89 in file "lt89xxdrvspi.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  pBuf            1    4[COMMON] PTR unsigned char 
;;		 -> txdata(12), 
;;  len             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text209
	file	"lt89xxdrvspi.c"
	line	89
	global	__size_of_LT_WriteBUF
	__size_of_LT_WriteBUF	equ	__end_of_LT_WriteBUF-_LT_WriteBUF
	
_LT_WriteBUF:	
	opt	stack 5
; Regs used in _LT_WriteBUF: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LT_WriteBUF@reg stored from wreg
	line	92
	movwf	(LT_WriteBUF@reg)
	
l3116:	
;lt89xxdrvspi.c: 90: unsigned char i;
;lt89xxdrvspi.c: 92: RC2=0;
	bcf	(58/8),(58)&7
	line	93
	
l3118:	
;lt89xxdrvspi.c: 93: SPI_SendByte(reg);
	movf	(LT_WriteBUF@reg),w
	fcall	_SPI_SendByte
	line	94
;lt89xxdrvspi.c: 94: SPI_SendByte(len);
	movf	(LT_WriteBUF@len),w
	fcall	_SPI_SendByte
	line	95
	
l3120:	
;lt89xxdrvspi.c: 95: for(i=0; i<len; i++)
	clrf	(LT_WriteBUF@i)
	goto	l3126
	line	96
	
l3122:	
;lt89xxdrvspi.c: 96: SPI_SendByte(pBuf[i]);
	movf	(LT_WriteBUF@i),w
	addwf	(LT_WriteBUF@pBuf),w
	movwf	(??_LT_WriteBUF+0)+0
	movf	0+(??_LT_WriteBUF+0)+0,w
	movwf	fsr0
	movf	indf,w
	fcall	_SPI_SendByte
	line	95
	
l3124:	
	incf	(LT_WriteBUF@i),f
	
l3126:	
	movf	(LT_WriteBUF@len),w
	subwf	(LT_WriteBUF@i),w
	skipc
	goto	u221
	goto	u220
u221:
	goto	l3122
u220:
	
l1744:	
	line	99
;lt89xxdrvspi.c: 99: RC2=1;
	bsf	(58/8),(58)&7
	line	100
	
l1745:	
	return
	opt stack 0
GLOBAL	__end_of_LT_WriteBUF
	__end_of_LT_WriteBUF:
;; =============== function _LT_WriteBUF ends ============

	signat	_LT_WriteBUF,12408
	global	_LT_WriteReg
psect	text210,local,class=CODE,delta=2
global __ptext210
__ptext210:

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
;;		On entry : 15F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;;		_main
;;		_LT89XX_INIT
;;		_LT89xx_ModeSet
;;		_write_sync
;; This function uses a non-reentrant model
;;
psect	text210
	file	"lt89xxdrvspi.c"
	line	78
	global	__size_of_LT_WriteReg
	__size_of_LT_WriteReg	equ	__end_of_LT_WriteReg-_LT_WriteReg
	
_LT_WriteReg:	
	opt	stack 5
; Regs used in _LT_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;LT_WriteReg@reg stored from wreg
	movwf	(LT_WriteReg@reg)
	line	79
	
l3110:	
;lt89xxdrvspi.c: 79: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	line	80
	
l3112:	
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
	
l3114:	
;lt89xxdrvspi.c: 83: RC2=1;
	bsf	(58/8),(58)&7
	line	84
	
l1739:	
	return
	opt stack 0
GLOBAL	__end_of_LT_WriteReg
	__end_of_LT_WriteReg:
;; =============== function _LT_WriteReg ends ============

	signat	_LT_WriteReg,12408
	global	_SPI_ReadByte
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

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
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;; This function uses a non-reentrant model
;;
psect	text211
	file	"lt89xxdrvspi.c"
	line	44
	global	__size_of_SPI_ReadByte
	__size_of_SPI_ReadByte	equ	__end_of_SPI_ReadByte-_SPI_ReadByte
	
_SPI_ReadByte:	
	opt	stack 4
; Regs used in _SPI_ReadByte: [wreg+status,2+status,0]
	line	45
	
l3076:	
;lt89xxdrvspi.c: 45: unsigned char retvalue=0;
	clrf	(SPI_ReadByte@retvalue)
	line	47
	
l3078:	
;lt89xxdrvspi.c: 46: unsigned char mcnt;
;lt89xxdrvspi.c: 47: RC3=0;
	bcf	(59/8),(59)&7
	line	48
;lt89xxdrvspi.c: 48: for (mcnt=0;mcnt<8;mcnt++)
	clrf	(SPI_ReadByte@mcnt)
	line	49
	
l1729:	
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
	goto	u181
	goto	u180
u181:
	goto	l1731
u180:
	
l3084:	
	bsf	(SPI_ReadByte@retvalue)+(0/8),(0)&7
	goto	l3086
	line	57
	
l1731:	
;lt89xxdrvspi.c: 57: else retvalue&=0xfe;
	bcf	(SPI_ReadByte@retvalue)+(0/8),(0)&7
	line	48
	
l3086:	
	incf	(SPI_ReadByte@mcnt),f
	
l3088:	
	movlw	(08h)
	subwf	(SPI_ReadByte@mcnt),w
	skipc
	goto	u191
	goto	u190
u191:
	goto	l1729
u190:
	
l1730:	
	line	60
;lt89xxdrvspi.c: 59: }
;lt89xxdrvspi.c: 60: RC3=0;
	bcf	(59/8),(59)&7
	line	61
	
l3090:	
;lt89xxdrvspi.c: 61: return retvalue;
	movf	(SPI_ReadByte@retvalue),w
	line	62
	
l1733:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_ReadByte
	__end_of_SPI_ReadByte:
;; =============== function _SPI_ReadByte ends ============

	signat	_SPI_ReadByte,89
	global	_SPI_SendByte
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

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
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;;		_LT_WriteBUF
;; This function uses a non-reentrant model
;;
psect	text212
	file	"lt89xxdrvspi.c"
	line	24
	global	__size_of_SPI_SendByte
	__size_of_SPI_SendByte	equ	__end_of_SPI_SendByte-_SPI_SendByte
	
_SPI_SendByte:	
	opt	stack 5
; Regs used in _SPI_SendByte: [wreg+status,2+status,0]
;SPI_SendByte@buf stored from wreg
	line	26
	movwf	(SPI_SendByte@buf)
	
l3064:	
;lt89xxdrvspi.c: 25: unsigned char mcnt;
;lt89xxdrvspi.c: 26: for(mcnt=0;mcnt<8;mcnt++)
	clrf	(SPI_SendByte@mcnt)
	line	27
	
l1722:	
	line	28
;lt89xxdrvspi.c: 27: {
;lt89xxdrvspi.c: 28: RC3=0;
	bcf	(59/8),(59)&7
	line	30
;lt89xxdrvspi.c: 30: if(buf&0x80) RA5=1;
	btfss	(SPI_SendByte@buf),(7)&7
	goto	u161
	goto	u160
u161:
	goto	l1724
u160:
	
l3070:	
	bsf	(45/8),(45)&7
	goto	l1725
	line	31
	
l1724:	
;lt89xxdrvspi.c: 31: else RA5=0;
	bcf	(45/8),(45)&7
	
l1725:	
	line	33
;lt89xxdrvspi.c: 33: RC3=1;
	bsf	(59/8),(59)&7
	line	35
;lt89xxdrvspi.c: 35: buf<<=1;
	clrc
	rlf	(SPI_SendByte@buf),f
	line	26
	
l3072:	
	incf	(SPI_SendByte@mcnt),f
	
l3074:	
	movlw	(08h)
	subwf	(SPI_SendByte@mcnt),w
	skipc
	goto	u171
	goto	u170
u171:
	goto	l1722
u170:
	
l1723:	
	line	38
;lt89xxdrvspi.c: 37: }
;lt89xxdrvspi.c: 38: RC3=0;
	bcf	(59/8),(59)&7
	line	39
;lt89xxdrvspi.c: 39: RA5=0;
	bcf	(45/8),(45)&7
	line	40
	
l1726:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_SendByte
	__end_of_SPI_SendByte:
;; =============== function _SPI_SendByte ends ============

	signat	_SPI_SendByte,4216
	global	_DELAY_MS
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

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
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;;		_LT89XX_INIT
;; This function uses a non-reentrant model
;;
psect	text213
	file	"lt89xxdrvspi.c"
	line	8
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 5
; Regs used in _DELAY_MS: [wreg+status,2+status,0]
;DELAY_MS@Tms stored from wreg
	movwf	(DELAY_MS@Tms)
	line	11
	
l3054:	
;lt89xxdrvspi.c: 10: unsigned int dly;
;lt89xxdrvspi.c: 11: while(Tms)
	goto	l3062
	line	13
	
l3056:	
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
	goto	l3060
	
l3058:	
	movlw	low(01h)
	subwf	(DELAY_MS@dly),f
	movlw	high(01h)
	skipc
	decf	(DELAY_MS@dly+1),f
	subwf	(DELAY_MS@dly+1),f
	
l3060:	
	movf	((DELAY_MS@dly+1)),w
	iorwf	((DELAY_MS@dly)),w
	skipz
	goto	u141
	goto	u140
u141:
	goto	l3058
u140:
	line	11
	
l3062:	
	movf	(DELAY_MS@Tms),f
	skipz
	goto	u151
	goto	u150
u151:
	goto	l3056
u150:
	line	18
	
l1719:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_Init
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _Init *****************
;; Defined at:
;;		line 44 in file "main.c"
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
psect	text214
	file	"main.c"
	line	44
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 6
; Regs used in _Init: [wreg+status,2]
	line	55
	
l3020:	
;main.c: 55: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	58
	
l3022:	
;main.c: 58: INTCON = 0;
	clrf	(11)	;volatile
	line	59
	
l3024:	
;main.c: 59: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	60
;main.c: 60: TRISA = 0B01011111;
	movlw	(05Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	61
	
l3026:	
;main.c: 61: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	62
	
l3028:	
;main.c: 62: TRISC = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	64
;main.c: 64: WPUA = 0;
	clrf	(149)^080h	;volatile
	line	65
;main.c: 65: WPUC = 0;
	clrf	(136)^080h	;volatile
	line	66
	
l3030:	
;main.c: 66: OPTION = 0B10001000;
	movlw	(088h)
	movwf	(129)^080h	;volatile
	line	68
	
l3032:	
;main.c: 68: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	71
;main.c: 71: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	75
	
l3034:	
;main.c: 75: T1CON = 0B00000000;
	clrf	(16)	;volatile
	line	78
	
l3036:	
;main.c: 78: TMR1L = 0XBF;
	movlw	(0BFh)
	movwf	(14)	;volatile
	line	80
	
l3038:	
;main.c: 80: TMR1H = 0XE0;
	movlw	(0E0h)
	movwf	(15)	;volatile
	line	81
	
l3040:	
;main.c: 81: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	82
	
l3042:	
;main.c: 82: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	83
	
l3044:	
;main.c: 83: PEIE=1;
	bsf	(94/8),(94)&7
	line	84
	
l3046:	
;main.c: 84: GIE = 1;
	bsf	(95/8),(95)&7
	line	89
	
l3048:	
;main.c: 89: ADCON1 = 0B01010000;
	movlw	(050h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	91
	
l3050:	
;main.c: 91: ADCON0 = 0B10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	95
	
l3052:	
;main.c: 95: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(145)^080h	;volatile
	line	96
	
l863:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
	global	_ISR
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:

;; *************** function _ISR *****************
;; Defined at:
;;		line 25 in file "main.c"
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
psect	text215
	file	"main.c"
	line	25
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
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
psect	text215
	line	26
	
i1l2828:	
;main.c: 26: GIE=0;
	bcf	(95/8),(95)&7
	line	31
;main.c: 31: if(TMR1IE && TMR1IF)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l2838
u1_20:
	
i1l2830:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l2838
u2_20:
	line	33
	
i1l2832:	
;main.c: 32: {
;main.c: 33: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	34
	
i1l2834:	
;main.c: 34: TMR1L = 0X2F;
	movlw	(02Fh)
	movwf	(14)	;volatile
	line	35
;main.c: 35: TMR1H = 0XF8;
	movlw	(0F8h)
	movwf	(15)	;volatile
	line	36
	
i1l2836:	
;main.c: 36: T250uS++;
	incf	(_T250uS),f
	line	40
	
i1l2838:	
;main.c: 39: }
;main.c: 40: GIE=1;
	bsf	(95/8),(95)&7
	line	41
	
i1l860:	
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
psect	text216,local,class=CODE,delta=2
global __ptext216
__ptext216:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

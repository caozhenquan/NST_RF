//Deviec:FT61F02X
//-----------------------Variable---------------------------------
		_RegL		EQU		23H
		_RegH		EQU		7BH
		_PDUDATA		EQU		43H
		_RXADVDATA		EQU		26H
		_LT8920_work_sta		EQU		22H
		_rxtimeout		EQU		20H
		_rxflag		EQU		25H
		_ledsta		EQU		24H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	3C4H 			//0009 	3BC4
		LJUMP 	4B4H 			//000A 	3CB4
		LDWI 	0H 			//000B 	2A00
		ORG		000CH
		STR 	PCLATH 			//000C 	018A
		LDR 	FSR,0 			//000D 	0804
		INCR	FSR,1 			//000E 	0984
		ADDWR 	PCL,1 			//000F 	0B82
		RETW 	0H 			//0010 	2100
		RETW 	0H 			//0011 	2100
		RETW 	6FH 			//0012 	216F
		RETW 	E0H 			//0013 	21E0
		ORG		0014H
		RETW 	1H 			//0014 	2101
		RETW 	56H 			//0015 	2156
		RETW 	81H 			//0016 	2181
		RETW 	2H 			//0017 	2102
		RETW 	66H 			//0018 	2166
		RETW 	17H 			//0019 	2117
		RETW 	4H 			//001A 	2104
		RETW 	9CH 			//001B 	219C
		ORG		001CH
		RETW 	C9H 			//001C 	21C9
		RETW 	5H 			//001D 	2105
		RETW 	66H 			//001E 	2166
		RETW 	37H 			//001F 	2137
		RETW 	7H 			//0020 	2107
		RETW 	0H 			//0021 	2100
		RETW 	30H 			//0022 	2130
		RETW 	8H 			//0023 	2108
		ORG		0024H
		RETW 	6CH 			//0024 	216C
		RETW 	90H 			//0025 	2190
		RETW 	9H 			//0026 	2109
		RETW 	48H 			//0027 	2148
		RETW 	0H 			//0028 	2100
		RETW 	AH 			//0029 	210A
		RETW 	7FH 			//002A 	217F
		RETW 	FDH 			//002B 	21FD
		ORG		002CH
		RETW 	BH 			//002C 	210B
		RETW 	0H 			//002D 	2100
		RETW 	8H 			//002E 	2108
		RETW 	CH 			//002F 	210C
		RETW 	0H 			//0030 	2100
		RETW 	0H 			//0031 	2100
		RETW 	DH 			//0032 	210D
		RETW 	48H 			//0033 	2148
		ORG		0034H
		RETW 	BDH 			//0034 	21BD
		RETW 	16H 			//0035 	2116
		RETW 	0H 			//0036 	2100
		RETW 	FFH 			//0037 	21FF
		RETW 	17H 			//0038 	2117
		RETW 	80H 			//0039 	2180
		RETW 	5H 			//003A 	2105
		RETW 	18H 			//003B 	2118
		ORG		003CH
		RETW 	0H 			//003C 	2100
		RETW 	67H 			//003D 	2167
		RETW 	19H 			//003E 	2119
		RETW 	16H 			//003F 	2116
		RETW 	DBH 			//0040 	21DB
		RETW 	1AH 			//0041 	211A
		RETW 	19H 			//0042 	2119
		RETW 	E0H 			//0043 	21E0
		ORG		0044H
		RETW 	1BH 			//0044 	211B
		RETW 	13H 			//0045 	2113
		RETW 	0H 			//0046 	2100
		RETW 	1CH 			//0047 	211C
		RETW 	18H 			//0048 	2118
		RETW 	0H 			//0049 	2100
		RETW 	20H 			//004A 	2120
		RETW 	48H 			//004B 	2148
		ORG		004CH
		RETW 	8H 			//004C 	2108
		RETW 	21H 			//004D 	2121
		RETW 	3FH 			//004E 	213F
		RETW 	C7H 			//004F 	21C7
		RETW 	22H 			//0050 	2122
		RETW 	20H 			//0051 	2120
		RETW 	0H 			//0052 	2100
		RETW 	23H 			//0053 	2123
		ORG		0054H
		RETW 	3H 			//0054 	2103
		RETW 	0H 			//0055 	2100
		RETW 	24H 			//0056 	2124
		RETW 	AAH 			//0057 	21AA
		RETW 	AAH 			//0058 	21AA
		RETW 	25H 			//0059 	2125
		RETW 	AAH 			//005A 	21AA
		RETW 	AAH 			//005B 	21AA
		ORG		005CH
		RETW 	26H 			//005C 	2126
		RETW 	AAH 			//005D 	21AA
		RETW 	AAH 			//005E 	21AA
		RETW 	27H 			//005F 	2127
		RETW 	AAH 			//0060 	21AA
		RETW 	AAH 			//0061 	21AA
		RETW 	28H 			//0062 	2128
		RETW 	44H 			//0063 	2144
		ORG		0064H
		RETW 	2H 			//0064 	2102
		RETW 	29H 			//0065 	2129
		RETW 	B0H 			//0066 	21B0
		RETW 	0H 			//0067 	2100
		RETW 	2AH 			//0068 	212A
		RETW 	FDH 			//0069 	21FD
		RETW 	B0H 			//006A 	21B0
		RETW 	2BH 			//006B 	212B
		ORG		006CH
		RETW 	0H 			//006C 	2100
		RETW 	FH 			//006D 	210F
		RETW 	2CH 			//006E 	212C
		RETW 	1H 			//006F 	2101
		RETW 	1H 			//0070 	2101
		RETW 	2DH 			//0071 	212D
		RETW 	1H 			//0072 	2101
		RETW 	52H 			//0073 	2152
		ORG		0074H
		RETW 	34H 			//0074 	2134
		RETW 	80H 			//0075 	2180
		RETW 	80H 			//0076 	2180
		RETW 	8DH 			//0077 	218D
		RETW 	D2H 			//0078 	21D2
		RETW 	57H 			//0079 	2157
		RETW 	A1H 			//007A 	21A1
		RETW 	3DH 			//007B 	213D
		ORG		007CH
		RETW 	A7H 			//007C 	21A7
		RETW 	66H 			//007D 	2166
		RETW 	B0H 			//007E 	21B0
		RETW 	75H 			//007F 	2175
		RETW 	31H 			//0080 	2131
		RETW 	11H 			//0081 	2111
		RETW 	48H 			//0082 	2148
		RETW 	96H 			//0083 	2196
		ORG		0084H
		RETW 	77H 			//0084 	2177
		RETW 	F8H 			//0085 	21F8
		RETW 	E3H 			//0086 	21E3
		RETW 	46H 			//0087 	2146
		RETW 	E9H 			//0088 	21E9
		RETW 	ABH 			//0089 	21AB
		RETW 	D0H 			//008A 	21D0
		RETW 	9EH 			//008B 	219E
		ORG		008CH
		RETW 	53H 			//008C 	2153
		RETW 	33H 			//008D 	2133
		RETW 	D8H 			//008E 	21D8
		RETW 	BAH 			//008F 	21BA
		RETW 	98H 			//0090 	2198
		RETW 	8H 			//0091 	2108
		RETW 	24H 			//0092 	2124
		RETW 	CBH 			//0093 	21CB
		ORG		0094H
		RETW 	3BH 			//0094 	213B
		RETW 	FCH 			//0095 	21FC
		RETW 	71H 			//0096 	2171
		RETW 	A3H 			//0097 	21A3
		RETW 	F4H 			//0098 	21F4
		RETW 	55H 			//0099 	2155
		RETW 	68H 			//009A 	2168
		RETW 	CFH 			//009B 	21CF
		ORG		009CH
		RETW 	A9H 			//009C 	21A9
		RETW 	19H 			//009D 	2119
		RETW 	D6H 			//009E 	21D6
		RETW 	C5H 			//009F 	21C5
		RETW 	44H 			//00A0 	2144
		RETW 	20H 			//00A1 	2120
		RETW 	59H 			//00A2 	2159
		RETW 	DEH 			//00A3 	21DE
		ORG		00A4H
		RETW 	E1H 			//00A4 	21E1
		RETW 	8FH 			//00A5 	218F
		RETW 	1BH 			//00A6 	211B
		RETW 	A5H 			//00A7 	21A5
		RETW 	AFH 			//00A8 	21AF
		RETW 	42H 			//00A9 	2142
		RETW 	7BH 			//00AA 	217B
		RETW 	4EH 			//00AB 	214E
		ORG		00ACH
		RETW 	CDH 			//00AC 	21CD
		RETW 	60H 			//00AD 	2160
		RETW 	EBH 			//00AE 	21EB
		RETW 	62H 			//00AF 	2162
		RETW 	22H 			//00B0 	2122
		RETW 	90H 			//00B1 	2190
		RETW 	2CH 			//00B2 	212C
		RETW 	EFH 			//00B3 	21EF
		ORG		00B4H
		RETW 	F0H 			//00B4 	21F0
		RETW 	C7H 			//00B5 	21C7
		RETW 	8DH 			//00B6 	218D
		RETW 	D2H 			//00B7 	21D2
		RETW 	57H 			//00B8 	2157
		RETW 	A1H 			//00B9 	21A1
		RETW 	3DH 			//00BA 	213D
		RETW 	A7H 			//00BB 	21A7
		ORG		00BCH
		RETW 	66H 			//00BC 	2166
		RETW 	B0H 			//00BD 	21B0
		RETW 	75H 			//00BE 	2175
		RETW 	31H 			//00BF 	2131
		RETW 	11H 			//00C0 	2111
		RETW 	48H 			//00C1 	2148
		RETW 	96H 			//00C2 	2196
		RETW 	77H 			//00C3 	2177
		ORG		00C4H
		RETW 	F8H 			//00C4 	21F8
		RETW 	1FH 			//00C5 	211F
		RETW 	37H 			//00C6 	2137
		RETW 	4AH 			//00C7 	214A
		RETW 	5FH 			//00C8 	215F
		RETW 	85H 			//00C9 	2185
		RETW 	F6H 			//00CA 	21F6
		RETW 	9CH 			//00CB 	219C
		ORG		00CCH
		RETW 	9AH 			//00CC 	219A
		RETW 	C1H 			//00CD 	21C1
		RETW 	D6H 			//00CE 	21D6
		RETW 	C5H 			//00CF 	21C5
		RETW 	44H 			//00D0 	2144
		RETW 	20H 			//00D1 	2120
		RETW 	59H 			//00D2 	2159
		RETW 	DEH 			//00D3 	21DE
		ORG		00D4H
		RETW 	E1H 			//00D4 	21E1
		RETW 	8FH 			//00D5 	218F
		RETW 	1BH 			//00D6 	211B
		RETW 	A5H 			//00D7 	21A5
		RETW 	AFH 			//00D8 	21AF
		RETW 	42H 			//00D9 	2142
		RETW 	7BH 			//00DA 	217B
		RETW 	4EH 			//00DB 	214E
		ORG		00DCH
		RETW 	CDH 			//00DC 	21CD
		RETW 	60H 			//00DD 	2160
		RETW 	EBH 			//00DE 	21EB
		RETW 	62H 			//00DF 	2162
		RETW 	22H 			//00E0 	2122
		RETW 	90H 			//00E1 	2190
		RETW 	2CH 			//00E2 	212C
		RETW 	EFH 			//00E3 	21EF
		ORG		00E4H
		RETW 	F0H 			//00E4 	21F0
		RETW 	C7H 			//00E5 	21C7
		RETW 	8DH 			//00E6 	218D
		RETW 	D2H 			//00E7 	21D2
		RETW 	57H 			//00E8 	2157
		RETW 	A1H 			//00E9 	21A1
		RETW 	3DH 			//00EA 	213D
		RETW 	A7H 			//00EB 	21A7
		ORG		00ECH
		STR 	66H 			//00EC 	01E6
		LDWI 	55H 			//00ED 	2A55
		STR 	62H 			//00EE 	01E2
		STR 	63H 			//00EF 	01E3
		STR 	64H 			//00F0 	01E4
		CLRR 	65H 			//00F1 	0165
		LDR 	76H,0 			//00F2 	0876
		ADDWI 	FDH 			//00F3 	27FD
		ORG		00F4H
		STR 	5DH 			//00F4 	01DD
		LDWI 	FFH 			//00F5 	2AFF
		BTSC 	STATUS,0 		//00F6 	1403
		LDWI 	0H 			//00F7 	2A00
		STR 	5EH 			//00F8 	01DE
		XORWI 	80H 			//00F9 	2680
		SUBWI 	80H 			//00FA 	2880
		BTSS 	STATUS,2 		//00FB 	1D03
		ORG		00FCH
		LJUMP 	FFH 			//00FC 	38FF
		LDR 	5DH,0 			//00FD 	085D
		SUBWR 	65H,0 			//00FE 	0C65
		BTSC 	STATUS,0 		//00FF 	1403
		LJUMP 	16AH 			//0100 	396A
		BCR 	STATUS,5 		//0101 	1283
		BCR 	STATUS,6 		//0102 	1303
		LDR 	65H,0 			//0103 	0865
		ORG		0104H
		ADDWR 	66H,0 			//0104 	0B66
		STR 	5DH 			//0105 	01DD
		STR 	FSR 			//0106 	0184
		BCR 	STATUS,7 		//0107 	1383
		LDR 	INDF,0 			//0108 	0800
		LCALL 	3A0H 			//0109 	33A0
		XORWR 	64H,0 			//010A 	0464
		STR 	67H 			//010B 	01E7
		ORG		010CH
		STR 	5DH 			//010C 	01DD
		LDWI 	7H 			//010D 	2A07
		BCR 	STATUS,0 		//010E 	1003
		RRR	5DH,1 			//010F 	06DD
		ADDWI 	FFH 			//0110 	27FF
		BTSS 	STATUS,2 		//0111 	1D03
		LJUMP 	10EH 			//0112 	390E
		LDR 	67H,0 			//0113 	0867
		ORG		0114H
		STR 	5EH 			//0114 	01DE
		LDWI 	6H 			//0115 	2A06
		BCR 	STATUS,0 		//0116 	1003
		RRR	5EH,1 			//0117 	06DE
		ADDWI 	FFH 			//0118 	27FF
		BTSS 	STATUS,2 		//0119 	1D03
		LJUMP 	116H 			//011A 	3916
		LDR 	5EH,0 			//011B 	085E
		ORG		011CH
		XORWR 	5DH,0 			//011C 	045D
		XORWR 	63H,0 			//011D 	0463
		STR 	64H 			//011E 	01E4
		LDR 	67H,0 			//011F 	0867
		STR 	5DH 			//0120 	01DD
		LDWI 	7H 			//0121 	2A07
		BCR 	STATUS,0 		//0122 	1003
		RRR	5DH,1 			//0123 	06DD
		ORG		0124H
		ADDWI 	FFH 			//0124 	27FF
		BTSS 	STATUS,2 		//0125 	1D03
		LJUMP 	122H 			//0126 	3922
		LDR 	67H,0 			//0127 	0867
		STR 	5EH 			//0128 	01DE
		LDWI 	5H 			//0129 	2A05
		BCR 	STATUS,0 		//012A 	1003
		RRR	5EH,1 			//012B 	06DE
		ORG		012CH
		ADDWI 	FFH 			//012C 	27FF
		BTSS 	STATUS,2 		//012D 	1D03
		LJUMP 	12AH 			//012E 	392A
		LDR 	67H,0 			//012F 	0867
		STR 	5FH 			//0130 	01DF
		LDWI 	4H 			//0131 	2A04
		BCR 	STATUS,0 		//0132 	1003
		RRR	5FH,1 			//0133 	06DF
		ORG		0134H
		ADDWI 	FFH 			//0134 	27FF
		BTSS 	STATUS,2 		//0135 	1D03
		LJUMP 	132H 			//0136 	3932
		LDR 	67H,0 			//0137 	0867
		STR 	60H 			//0138 	01E0
		BCR 	STATUS,0 		//0139 	1003
		RRR	60H,1 			//013A 	06E0
		BCR 	STATUS,0 		//013B 	1003
		ORG		013CH
		RRR	60H,1 			//013C 	06E0
		LDR 	67H,0 			//013D 	0867
		STR 	61H 			//013E 	01E1
		BCR 	STATUS,0 		//013F 	1003
		RLR 	61H,1 			//0140 	05E1
		BCR 	STATUS,0 		//0141 	1003
		RLR 	61H,1 			//0142 	05E1
		BCR 	STATUS,0 		//0143 	1003
		ORG		0144H
		RLR 	67H,0 			//0144 	0567
		XORWR 	61H,0 			//0145 	0461
		XORWR 	60H,0 			//0146 	0460
		XORWR 	5FH,0 			//0147 	045F
		XORWR 	5EH,0 			//0148 	045E
		XORWR 	5DH,0 			//0149 	045D
		XORWR 	62H,0 			//014A 	0462
		STR 	63H 			//014B 	01E3
		ORG		014CH
		LDR 	67H,0 			//014C 	0867
		STR 	5DH 			//014D 	01DD
		LDWI 	6H 			//014E 	2A06
		BCR 	STATUS,0 		//014F 	1003
		RLR 	5DH,1 			//0150 	05DD
		ADDWI 	FFH 			//0151 	27FF
		BTSS 	STATUS,2 		//0152 	1D03
		LJUMP 	14FH 			//0153 	394F
		ORG		0154H
		LDR 	67H,0 			//0154 	0867
		STR 	5EH 			//0155 	01DE
		SWAPR 	5EH,0 			//0156 	075E
		ANDWI 	F0H 			//0157 	24F0
		STR 	5EH 			//0158 	01DE
		LDR 	67H,0 			//0159 	0867
		STR 	5FH 			//015A 	01DF
		BCR 	STATUS,0 		//015B 	1003
		ORG		015CH
		RLR 	5FH,1 			//015C 	05DF
		BCR 	STATUS,0 		//015D 	1003
		RLR 	5FH,1 			//015E 	05DF
		BCR 	STATUS,0 		//015F 	1003
		RLR 	5FH,1 			//0160 	05DF
		BCR 	STATUS,0 		//0161 	1003
		RLR 	67H,0 			//0162 	0567
		XORWR 	5FH,0 			//0163 	045F
		ORG		0164H
		XORWR 	5EH,0 			//0164 	045E
		XORWR 	5DH,0 			//0165 	045D
		XORWR 	67H,0 			//0166 	0467
		STR 	62H 			//0167 	01E2
		INCR	65H,1 			//0168 	09E5
		LJUMP 	F2H 			//0169 	38F2
		LDR 	76H,0 			//016A 	0876
		BCR 	STATUS,5 		//016B 	1283
		ORG		016CH
		BCR 	STATUS,6 		//016C 	1303
		ADDWR 	66H,0 			//016D 	0B66
		STR 	5DH 			//016E 	01DD
		ADDWI 	FFH 			//016F 	27FF
		STR 	FSR 			//0170 	0184
		LDR 	62H,0 			//0171 	0862
		LCALL 	3A0H 			//0172 	33A0
		BCR 	STATUS,7 		//0173 	1383
		ORG		0174H
		STR 	INDF 			//0174 	0180
		LDR 	76H,0 			//0175 	0876
		ADDWR 	66H,0 			//0176 	0B66
		STR 	5DH 			//0177 	01DD
		ADDWI 	FEH 			//0178 	27FE
		STR 	FSR 			//0179 	0184
		LDR 	63H,0 			//017A 	0863
		LCALL 	3A0H 			//017B 	33A0
		ORG		017CH
		STR 	INDF 			//017C 	0180
		LDR 	76H,0 			//017D 	0876
		ADDWR 	66H,0 			//017E 	0B66
		STR 	5DH 			//017F 	01DD
		ADDWI 	FDH 			//0180 	27FD
		STR 	FSR 			//0181 	0184
		LDR 	64H,0 			//0182 	0864
		LCALL 	3A0H 			//0183 	33A0
		ORG		0184H
		STR 	INDF 			//0184 	0180
		RET		 					//0185 	0004
		STR 	77H 			//0186 	01F7

		//;lt89xxdrvspi.c: 278: break;
		//;lt89xxdrvspi.c: 240: switch(dat1)
		ADDWI 	F2H 			//0187 	27F2
		BTSS 	STATUS,0 		//0188 	1C03
		RET		 					//0189 	0004
		STR 	FSR 			//018A 	0184
		LDWI 	CH 			//018B 	2A0C
		ORG		018CH
		SUBWR 	FSR,0 			//018C 	0C04
		BTSC 	STATUS,0 		//018D 	1403
		RET		 					//018E 	0004
		LDWI 	4H 			//018F 	2A04
		STR 	PCLATH 			//0190 	018A
		LDWI 	F2H 			//0191 	2AF2
		ADDWR 	FSR,0 			//0192 	0B04
		STR 	PCL 			//0193 	0182
		ORG		0194H
		RET		 					//0194 	0004
		LDWI 	7H 			//0195 	2A07

		//;lt89xxdrvspi.c: 243: LT_WriteReg(7, 0x00, 0x00);
		CLRR 	74H 			//0196 	0174
		CLRR 	75H 			//0197 	0175
		LCALL 	4FEH 			//0198 	34FE

		//;lt89xxdrvspi.c: 244: LT_WriteReg(27, 0x13, 0x00);
		LDWI 	13H 			//0199 	2A13
		STR 	74H 			//019A 	01F4
		LDWI 	1BH 			//019B 	2A1B
		ORG		019CH
		CLRR 	75H 			//019C 	0175
		LCALL 	4FEH 			//019D 	34FE

		//;lt89xxdrvspi.c: 245: LT_WriteReg(35, 0x43, 0x00);
		LDWI 	43H 			//019E 	2A43
		STR 	74H 			//019F 	01F4
		LDWI 	23H 			//01A0 	2A23
		CLRR 	75H 			//01A1 	0175
		LJUMP 	4FEH 			//01A2 	3CFE

		//;lt89xxdrvspi.c: 246: break;
		//;lt89xxdrvspi.c: 254: LT_WriteReg(52, 0x80, 0x80);
		LDWI 	80H 			//01A3 	2A80
		ORG		01A4H
		STR 	74H 			//01A4 	01F4
		STR 	75H 			//01A5 	01F5
		LDWI 	34H 			//01A6 	2A34
		LJUMP 	4FEH 			//01A7 	3CFE

		//;lt89xxdrvspi.c: 255: break;
		LDWI 	7H 			//01A8 	2A07

		//;lt89xxdrvspi.c: 257: LT_WriteReg(7, 0x00, 0x00);
		CLRR 	74H 			//01A9 	0174
		CLRR 	75H 			//01AA 	0175
		LJUMP 	4FEH 			//01AB 	3CFE
		ORG		01ACH

		//;lt89xxdrvspi.c: 258: break;
		LDWI 	2CH 			//01AC 	2A2C

		//;lt89xxdrvspi.c: 260: LT_WriteReg(44, 0x01, 0x01);
		CLRR 	74H 			//01AD 	0174
		INCR	74H,1 			//01AE 	09F4
		CLRR 	75H 			//01AF 	0175
		INCR	75H,1 			//01B0 	09F5
		LCALL 	4FEH 			//01B1 	34FE

		//;lt89xxdrvspi.c: 261: LT_WriteReg(45, 0x05, 0x52);
		LCALL 	1C8H 			//01B2 	31C8
		LJUMP 	4FEH 			//01B3 	3CFE
		ORG		01B4H

		//;lt89xxdrvspi.c: 262: break;
		//;lt89xxdrvspi.c: 264: LT_WriteReg(44, 0x02, 0x01);
		LDWI 	2H 			//01B4 	2A02
		LCALL 	1CDH 			//01B5 	31CD
		LCALL 	4FEH 			//01B6 	34FE

		//;lt89xxdrvspi.c: 265: LT_WriteReg(45, 0x05, 0x52);
		LCALL 	1C8H 			//01B7 	31C8
		LJUMP 	4FEH 			//01B8 	3CFE

		//;lt89xxdrvspi.c: 266: break;
		//;lt89xxdrvspi.c: 268: LT_WriteReg(44, 0x04, 0x01);
		LDWI 	4H 			//01B9 	2A04
		LCALL 	1CDH 			//01BA 	31CD
		LCALL 	4FEH 			//01BB 	34FE
		ORG		01BCH

		//;lt89xxdrvspi.c: 269: LT_WriteReg(45, 0x05, 0x52);
		LCALL 	1C8H 			//01BC 	31C8
		LJUMP 	4FEH 			//01BD 	3CFE

		//;lt89xxdrvspi.c: 270: break;
		//;lt89xxdrvspi.c: 272: LT_WriteReg(44, 0x08, 0x01);
		LDWI 	8H 			//01BE 	2A08
		LCALL 	1CDH 			//01BF 	31CD
		LCALL 	4FEH 			//01C0 	34FE

		//;lt89xxdrvspi.c: 273: LT_WriteReg(45, 0x05, 0x52);
		LCALL 	1C8H 			//01C1 	31C8
		LJUMP 	4FEH 			//01C2 	3CFE

		//;lt89xxdrvspi.c: 274: break;
		//;lt89xxdrvspi.c: 276: LT_WriteReg(44, 0x10, 0x01);
		LDWI 	10H 			//01C3 	2A10
		ORG		01C4H
		LCALL 	1CDH 			//01C4 	31CD
		LCALL 	4FEH 			//01C5 	34FE

		//;lt89xxdrvspi.c: 277: LT_WriteReg(45, 0x05, 0x52);
		LCALL 	1C8H 			//01C6 	31C8
		LJUMP 	4FEH 			//01C7 	3CFE
		LDWI 	5H 			//01C8 	2A05
		STR 	74H 			//01C9 	01F4
		LDWI 	52H 			//01CA 	2A52
		STR 	75H 			//01CB 	01F5
		ORG		01CCH
		RETW 	2DH 			//01CC 	212D
		STR 	74H 			//01CD 	01F4
		LDWI 	2CH 			//01CE 	2A2C
		CLRR 	75H 			//01CF 	0175
		INCR	75H,1 			//01D0 	09F5
		RET		 					//01D1 	0004
		STR 	62H 			//01D2 	01E2

		//;main.c: 207: unsigned char i;
		//;main.c: 209: LT8920_ble_rx_start(chanel);
		LCALL 	2CCH 			//01D3 	32CC
		ORG		01D4H

		//;main.c: 212: for(i = 0; i < 8; i++)
		CLRR 	63H 			//01D4 	0163

		//;main.c: 213: {
		//;main.c: 214: LT_ReadReg(48);
		LDWI 	30H 			//01D5 	2A30
		LCALL 	509H 			//01D6 	3509

		//;main.c: 216: if(RegL&0X40){
		BTSS 	23H,6 			//01D7 	1F23
		LJUMP 	213H 			//01D8 	3A13

		//;main.c: 218: LT8920_read_ble_fifo(chanel, RXADVDATA,29);
		LDWI 	26H 			//01D9 	2A26
		STR 	5FH 			//01DA 	01DF
		LDWI 	1DH 			//01DB 	2A1D
		ORG		01DCH
		STR 	60H 			//01DC 	01E0
		LDR 	62H,0 			//01DD 	0862
		LCALL 	37BH 			//01DE 	337B

		//;main.c: 220: if((RXADVDATA[17]==0x11)&&(RXADVDATA[18]==0x11)&&(RXADVDATA[19]==0x11)){
		LDR 	37H,0 			//01DF 	0837
		XORWI 	11H 			//01E0 	2611
		BTSS 	STATUS,2 		//01E1 	1D03
		LJUMP 	215H 			//01E2 	3A15
		LDR 	38H,0 			//01E3 	0838
		ORG		01E4H
		XORWI 	11H 			//01E4 	2611
		BTSS 	STATUS,2 		//01E5 	1D03
		LJUMP 	215H 			//01E6 	3A15
		LDR 	39H,0 			//01E7 	0839
		XORWI 	11H 			//01E8 	2611
		BTSS 	STATUS,2 		//01E9 	1D03
		LJUMP 	215H 			//01EA 	3A15

		//;main.c: 223: if(check_sum(RXADVDATA+17, 10) == 1)
		LDWI 	AH 			//01EB 	2A0A
		ORG		01ECH
		STR 	72H 			//01EC 	01F2
		LDWI 	37H 			//01ED 	2A37
		LCALL 	354H 			//01EE 	3354
		XORWI 	1H 			//01EF 	2601
		BTSS 	STATUS,2 		//01F0 	1D03
		LJUMP 	20AH 			//01F1 	3A0A

		//;main.c: 226: {
		//;main.c: 229: if(RXADVDATA[5+17] == 0x02)
		BCR 	STATUS,5 		//01F2 	1283
		BCR 	STATUS,6 		//01F3 	1303
		ORG		01F4H
		LDR 	3CH,0 			//01F4 	083C
		XORWI 	2H 			//01F5 	2602
		BTSS 	STATUS,2 		//01F6 	1D03
		LJUMP 	1FAH 			//01F7 	39FA

		//;main.c: 230: {
		//;main.c: 231: RC5 = 1;
		BSR 	7H,5 			//01F8 	1A87

		//;main.c: 233: }
		LJUMP 	208H 			//01F9 	3A08

		//;main.c: 234: else if(RXADVDATA[5+17] == 0x01)
		DECRSZ 	3CH,0 		//01FA 	0E3C
		LJUMP 	1FEH 			//01FB 	39FE
		ORG		01FCH

		//;main.c: 235: {
		//;main.c: 236: RC5 = 0;
		BCR 	7H,5 			//01FC 	1287

		//;main.c: 238: }
		LJUMP 	208H 			//01FD 	3A08

		//;main.c: 239: else if(RXADVDATA[5+17] == 0x04)
		LDR 	3CH,0 			//01FE 	083C
		XORWI 	4H 			//01FF 	2604
		BTSS 	STATUS,2 		//0200 	1D03
		LJUMP 	208H 			//0201 	3A08

		//;main.c: 240: {
		//;main.c: 242: if( ledsta != RXADVDATA[6+17])
		LDR 	3DH,0 			//0202 	083D
		XORWR 	24H,0 			//0203 	0424
		ORG		0204H
		BTSC 	STATUS,2 		//0204 	1503
		LJUMP 	208H 			//0205 	3A08

		//;main.c: 243: {
		//;main.c: 244: RC5 = !RC5;
		LDWI 	20H 			//0206 	2A20
		XORWR 	7H,1 			//0207 	0487

		//;main.c: 245: }
		//;main.c: 246: }
		//;main.c: 247: ledsta = RXADVDATA[6+17];
		LDR 	3DH,0 			//0208 	083D
		STR 	24H 			//0209 	01A4

		//;main.c: 251: }
		//;main.c: 253: i = 9;
		LDWI 	9H 			//020A 	2A09
		BCR 	STATUS,5 		//020B 	1283
		ORG		020CH
		BCR 	STATUS,6 		//020C 	1303
		STR 	63H 			//020D 	01E3

		//;main.c: 255: rxflag = 1;
		CLRR 	25H 			//020E 	0125
		INCR	25H,1 			//020F 	09A5

		//;main.c: 256: rxtimeout = 0;
		CLRR 	20H 			//0210 	0120
		CLRR 	21H 			//0211 	0121
		LJUMP 	215H 			//0212 	3A15

		//;main.c: 259: else
		//;main.c: 260: {
		//;main.c: 261: DELAY_MS(1);
		LDWI 	1H 			//0213 	2A01
		ORG		0214H
		LCALL 	47BH 			//0214 	347B
		LDWI 	8H 			//0215 	2A08
		INCR	63H,1 			//0216 	09E3
		SUBWR 	63H,0 			//0217 	0C63
		BTSC 	STATUS,0 		//0218 	1403
		RET		 					//0219 	0004
		LJUMP 	1D5H 			//021A 	39D5
		STR 	5DH 			//021B 	01DD
		ORG		021CH
		XORWI 	25H 			//021C 	2625
		BTSS 	STATUS,2 		//021D 	1D03
		LJUMP 	229H 			//021E 	3A29
		CLRR 	5EH 			//021F 	015E
		LDR 	73H,0 			//0220 	0873
		SUBWR 	5EH,0 			//0221 	0C5E
		BTSC 	STATUS,0 		//0222 	1403
		RET		 					//0223 	0004
		ORG		0224H
		LDWI 	67H 			//0224 	2A67
		LCALL 	256H 			//0225 	3256
		LCALL 	BH 			//0226 	300B
		LCALL 	245H 			//0227 	3245
		LJUMP 	220H 			//0228 	3A20
		LDR 	5DH,0 			//0229 	085D
		XORWI 	26H 			//022A 	2626
		BTSS 	STATUS,2 		//022B 	1D03
		ORG		022CH
		LJUMP 	237H 			//022C 	3A37
		CLRR 	5EH 			//022D 	015E
		LDR 	73H,0 			//022E 	0873
		SUBWR 	5EH,0 			//022F 	0C5E
		BTSC 	STATUS,0 		//0230 	1403
		RET		 					//0231 	0004
		LDWI 	8EH 			//0232 	2A8E
		LCALL 	256H 			//0233 	3256
		ORG		0234H
		LCALL 	BH 			//0234 	300B
		LCALL 	245H 			//0235 	3245
		LJUMP 	22EH 			//0236 	3A2E
		LDR 	5DH,0 			//0237 	085D
		XORWI 	27H 			//0238 	2627
		BTSS 	STATUS,2 		//0239 	1D03
		RET		 					//023A 	0004
		CLRR 	5EH 			//023B 	015E
		ORG		023CH
		LDR 	73H,0 			//023C 	0873
		SUBWR 	5EH,0 			//023D 	0C5E
		BTSC 	STATUS,0 		//023E 	1403
		RET		 					//023F 	0004
		LDWI 	B5H 			//0240 	2AB5
		LCALL 	256H 			//0241 	3256
		LCALL 	BH 			//0242 	300B
		LCALL 	245H 			//0243 	3245
		ORG		0244H
		LJUMP 	23CH 			//0244 	3A3C
		STR 	76H 			//0245 	01F6
		LDR 	5EH,0 			//0246 	085E
		ADDWR 	72H,0 			//0247 	0B72
		STR 	77H 			//0248 	01F7
		STR 	FSR 			//0249 	0184
		BCR 	STATUS,7 		//024A 	1383
		LDR 	INDF,0 			//024B 	0800
		ORG		024CH
		XORWR 	76H,0 			//024C 	0476
		STR 	78H 			//024D 	01F8
		LDR 	5EH,0 			//024E 	085E
		ADDWR 	72H,0 			//024F 	0B72
		STR 	79H 			//0250 	01F9
		STR 	FSR 			//0251 	0184
		LDR 	78H,0 			//0252 	0878
		STR 	INDF 			//0253 	0180
		ORG		0254H
		INCR	5EH,1 			//0254 	09DE
		RET		 					//0255 	0004
		ADDWR 	74H,0 			//0256 	0B74
		STR 	75H 			//0257 	01F5
		LDR 	5EH,0 			//0258 	085E
		ADDWR 	75H,0 			//0259 	0B75
		STR 	FSR 			//025A 	0184
		RET		 					//025B 	0004
		ORG		025CH
		STR 	78H 			//025C 	01F8
		XORWI 	25H 			//025D 	2625
		BTSS 	STATUS,2 		//025E 	1D03
		LJUMP 	26BH 			//025F 	3A6B
		CLRR 	79H 			//0260 	0179
		LDR 	73H,0 			//0261 	0873
		SUBWR 	79H,0 			//0262 	0C79
		BTSC 	STATUS,0 		//0263 	1403
		ORG		0264H
		RET		 					//0264 	0004
		LDR 	79H,0 			//0265 	0879
		ADDWI 	67H 			//0266 	2767
		STR 	FSR 			//0267 	0184
		LCALL 	BH 			//0268 	300B
		LCALL 	289H 			//0269 	3289
		LJUMP 	261H 			//026A 	3A61
		LDR 	78H,0 			//026B 	0878
		ORG		026CH
		XORWI 	26H 			//026C 	2626
		BTSS 	STATUS,2 		//026D 	1D03
		LJUMP 	27AH 			//026E 	3A7A
		CLRR 	79H 			//026F 	0179
		LDR 	73H,0 			//0270 	0873
		SUBWR 	79H,0 			//0271 	0C79
		BTSC 	STATUS,0 		//0272 	1403
		RET		 					//0273 	0004
		ORG		0274H
		LDR 	79H,0 			//0274 	0879
		ADDWI 	8EH 			//0275 	278E
		STR 	FSR 			//0276 	0184
		LCALL 	BH 			//0277 	300B
		LCALL 	289H 			//0278 	3289
		LJUMP 	270H 			//0279 	3A70
		LDR 	78H,0 			//027A 	0878
		XORWI 	27H 			//027B 	2627
		ORG		027CH
		BTSS 	STATUS,2 		//027C 	1D03
		RET		 					//027D 	0004
		CLRR 	79H 			//027E 	0179
		LDR 	73H,0 			//027F 	0873
		SUBWR 	79H,0 			//0280 	0C79
		BTSC 	STATUS,0 		//0281 	1403
		RET		 					//0282 	0004
		LDR 	79H,0 			//0283 	0879
		ORG		0284H
		ADDWI 	B5H 			//0284 	27B5
		STR 	FSR 			//0285 	0184
		LCALL 	BH 			//0286 	300B
		LCALL 	289H 			//0287 	3289
		LJUMP 	27FH 			//0288 	3A7F
		STR 	74H 			//0289 	01F4
		LDR 	79H,0 			//028A 	0879
		ADDWR 	72H,0 			//028B 	0B72
		ORG		028CH
		STR 	75H 			//028C 	01F5
		STR 	FSR 			//028D 	0184
		BCR 	STATUS,7 		//028E 	1383
		LDR 	INDF,0 			//028F 	0800
		XORWR 	74H,0 			//0290 	0474
		STR 	76H 			//0291 	01F6
		LDR 	79H,0 			//0292 	0879
		ADDWR 	72H,0 			//0293 	0B72
		ORG		0294H
		STR 	77H 			//0294 	01F7
		STR 	FSR 			//0295 	0184
		LDR 	76H,0 			//0296 	0876
		STR 	INDF 			//0297 	0180
		INCR	79H,1 			//0298 	09F9
		RET		 					//0299 	0004
		STR 	6AH 			//029A 	01EA
		LDR 	69H,0 			//029B 	0869
		ORG		029CH
		STR 	76H 			//029C 	01F6
		LDR 	68H,0 			//029D 	0868
		LCALL 	ECH 			//029E 	30EC
		LCALL 	2C6H 			//029F 	32C6
		LCALL 	25CH 			//02A0 	325C
		LDWI 	7H 			//02A1 	2A07
		CLRR 	77H 			//02A2 	0177
		CLRR 	78H 			//02A3 	0178
		ORG		02A4H
		LCALL 	51BH 			//02A4 	351B
		LCALL 	2F9H 			//02A5 	32F9
		LCALL 	51BH 			//02A6 	351B
		LDR 	69H,0 			//02A7 	0869
		STR 	79H 			//02A8 	01F9
		LDR 	68H,0 			//02A9 	0868
		LCALL 	528H 			//02AA 	3528
		LDR 	6AH,0 			//02AB 	086A
		ORG		02ACH
		XORWI 	25H 			//02AC 	2625
		BTSS 	STATUS,2 		//02AD 	1D03
		LJUMP 	2B4H 			//02AE 	3AB4
		LDWI 	7H 			//02AF 	2A07
		CLRR 	77H 			//02B0 	0177
		INCR	77H,1 			//02B1 	09F7
		CLRR 	78H 			//02B2 	0178
		LJUMP 	2C3H 			//02B3 	3AC3
		ORG		02B4H
		LDR 	6AH,0 			//02B4 	086A
		XORWI 	26H 			//02B5 	2626
		BTSS 	STATUS,2 		//02B6 	1D03
		LJUMP 	2BAH 			//02B7 	3ABA
		LDWI 	18H 			//02B8 	2A18
		LJUMP 	2BFH 			//02B9 	3ABF
		LDR 	6AH,0 			//02BA 	086A
		XORWI 	27H 			//02BB 	2627
		ORG		02BCH
		BTSS 	STATUS,2 		//02BC 	1D03
		LJUMP 	2C4H 			//02BD 	3AC4
		LDWI 	4EH 			//02BE 	2A4E
		CLRR 	77H 			//02BF 	0177
		INCR	77H,1 			//02C0 	09F7
		STR 	78H 			//02C1 	01F8
		LDWI 	7H 			//02C2 	2A07
		LCALL 	51BH 			//02C3 	351B
		ORG		02C4H
		LCALL 	2C6H 			//02C4 	32C6
		LJUMP 	25CH 			//02C5 	3A5C
		LDR 	68H,0 			//02C6 	0868
		STR 	72H 			//02C7 	01F2
		LDR 	69H,0 			//02C8 	0869
		STR 	73H 			//02C9 	01F3
		LDR 	6AH,0 			//02CA 	086A
		RET		 					//02CB 	0004
		ORG		02CCH
		STR 	7AH 			//02CC 	01FA
		XORWI 	25H 			//02CD 	2625
		BTSS 	STATUS,2 		//02CE 	1D03
		LJUMP 	2DBH 			//02CF 	3ADB
		LDWI 	7H 			//02D0 	2A07
		CLRR 	77H 			//02D1 	0177
		CLRR 	78H 			//02D2 	0178
		LCALL 	51BH 			//02D3 	351B
		ORG		02D4H
		LCALL 	2F9H 			//02D4 	32F9
		LCALL 	51BH 			//02D5 	351B
		LDWI 	80H 			//02D6 	2A80
		CLRR 	77H 			//02D7 	0177
		STR 	78H 			//02D8 	01F8
		LDWI 	7H 			//02D9 	2A07
		LJUMP 	51BH 			//02DA 	3D1B
		LDR 	7AH,0 			//02DB 	087A
		ORG		02DCH
		XORWI 	26H 			//02DC 	2626
		BTSS 	STATUS,2 		//02DD 	1D03
		LJUMP 	2EAH 			//02DE 	3AEA
		LDWI 	7H 			//02DF 	2A07
		CLRR 	77H 			//02E0 	0177
		CLRR 	78H 			//02E1 	0178
		LCALL 	51BH 			//02E2 	351B
		LCALL 	2F9H 			//02E3 	32F9
		ORG		02E4H
		LCALL 	51BH 			//02E4 	351B
		LDWI 	98H 			//02E5 	2A98
		CLRR 	77H 			//02E6 	0177
		STR 	78H 			//02E7 	01F8
		LDWI 	7H 			//02E8 	2A07
		LJUMP 	51BH 			//02E9 	3D1B
		LDR 	7AH,0 			//02EA 	087A
		XORWI 	27H 			//02EB 	2627
		ORG		02ECH
		BTSS 	STATUS,2 		//02EC 	1D03
		RET		 					//02ED 	0004
		LDWI 	7H 			//02EE 	2A07
		CLRR 	77H 			//02EF 	0177
		CLRR 	78H 			//02F0 	0178
		LCALL 	51BH 			//02F1 	351B
		LCALL 	2F9H 			//02F2 	32F9
		LCALL 	51BH 			//02F3 	351B
		ORG		02F4H
		LDWI 	CEH 			//02F4 	2ACE
		CLRR 	77H 			//02F5 	0177
		STR 	78H 			//02F6 	01F8
		LDWI 	7H 			//02F7 	2A07
		LJUMP 	51BH 			//02F8 	3D1B
		LDWI 	80H 			//02F9 	2A80
		STR 	77H 			//02FA 	01F7
		STR 	78H 			//02FB 	01F8
		ORG		02FCH
		RETW 	34H 			//02FC 	2134

		//;lt89xxdrvspi.c: 214: unsigned char CFG_CNT;
		//;lt89xxdrvspi.c: 217: while(1)
		LDWI 	AH 			//02FD 	2A0A

		//;lt89xxdrvspi.c: 218: {
		//;lt89xxdrvspi.c: 220: RA7 = 0; DELAY_MS(10);
		BCR 	STATUS,5 		//02FE 	1283
		BCR 	5H,7 			//02FF 	1385
		LCALL 	47BH 			//0300 	347B
		LDWI 	64H 			//0301 	2A64

		//;lt89xxdrvspi.c: 221: RA7 = 1; DELAY_MS(100);
		BSR 	5H,7 			//0302 	1B85
		LCALL 	47BH 			//0303 	347B
		ORG		0304H

		//;lt89xxdrvspi.c: 224: for(CFG_CNT=0;CFG_CNT<34;CFG_CNT++)
		CLRR 	77H 			//0304 	0177

		//;lt89xxdrvspi.c: 225: {
		//;lt89xxdrvspi.c: 226: LT_WriteReg(LDT8900config[CFG_CNT][0],LDT8900config[CFG_CNT][1],LD
		//+                          T8900config[CFG_CNT][2]);
		LDR 	77H,0 			//0305 	0877
		ADDWR 	77H,0 			//0306 	0B77
		ADDWR 	77H,0 			//0307 	0B77
		ADDWI 	2H 			//0308 	2702
		STR 	FSR 			//0309 	0184
		LCALL 	BH 			//030A 	300B
		STR 	74H 			//030B 	01F4
		ORG		030CH
		LDR 	77H,0 			//030C 	0877
		ADDWR 	77H,0 			//030D 	0B77
		ADDWR 	77H,0 			//030E 	0B77
		ADDWI 	3H 			//030F 	2703
		STR 	FSR 			//0310 	0184
		LCALL 	BH 			//0311 	300B
		STR 	75H 			//0312 	01F5
		LDR 	77H,0 			//0313 	0877
		ORG		0314H
		ADDWR 	77H,0 			//0314 	0B77
		ADDWR 	77H,0 			//0315 	0B77
		ADDWI 	1H 			//0316 	2701
		STR 	FSR 			//0317 	0184
		LCALL 	BH 			//0318 	300B
		LCALL 	4FEH 			//0319 	34FE
		LDWI 	22H 			//031A 	2A22
		INCR	77H,1 			//031B 	09F7
		ORG		031CH
		SUBWR 	77H,0 			//031C 	0C77
		BTSS 	STATUS,0 		//031D 	1C03
		LJUMP 	305H 			//031E 	3B05

		//;lt89xxdrvspi.c: 228: }
		//;lt89xxdrvspi.c: 230: LT_ReadReg(0);
		LDWI 	0H 			//031F 	2A00
		LCALL 	509H 			//0320 	3509

		//;lt89xxdrvspi.c: 231: if(RegH==0x6F&&RegL==0XE0)
		LDR 	7BH,0 			//0321 	087B
		XORWI 	6FH 			//0322 	266F
		BTSS 	STATUS,2 		//0323 	1D03
		ORG		0324H
		LJUMP 	2FDH 			//0324 	3AFD
		LDR 	23H,0 			//0325 	0823
		XORWI 	E0H 			//0326 	26E0
		BTSC 	STATUS,2 		//0327 	1503
		RET		 					//0328 	0004
		LJUMP 	2FDH 			//0329 	3AFD

		//;main.c: 90: OSCCON = 0B01110001;
		LDWI 	71H 			//032A 	2A71
		BSR 	STATUS,5 		//032B 	1A83
		ORG		032CH
		STR 	FH 			//032C 	018F

		//;main.c: 93: INTCON = 0;
		CLRR 	INTCON 			//032D 	010B

		//;main.c: 94: PORTA = 0B00000000;
		BCR 	STATUS,5 		//032E 	1283
		CLRR 	5H 			//032F 	0105

		//;main.c: 95: TRISA = 0B01011111;
		LDWI 	5FH 			//0330 	2A5F
		BSR 	STATUS,5 		//0331 	1A83
		STR 	5H 			//0332 	0185

		//;main.c: 96: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0333 	1283
		ORG		0334H
		CLRR 	7H 			//0334 	0107

		//;main.c: 97: TRISC = 0B00000011;
		LDWI 	3H 			//0335 	2A03
		BSR 	STATUS,5 		//0336 	1A83
		STR 	7H 			//0337 	0187

		//;main.c: 99: WPUA = 0;
		CLRR 	15H 			//0338 	0115

		//;main.c: 100: WPUC = 0;
		CLRR 	8H 			//0339 	0108

		//;main.c: 101: OPTION = 0B10001000;
		LDWI 	88H 			//033A 	2A88
		STR 	1H 			//033B 	0181
		ORG		033CH

		//;main.c: 103: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//033C 	1283
		CLRR 	1BH 			//033D 	011B

		//;main.c: 106: CMCON0 = 0B00000111;
		LDWI 	7H 			//033E 	2A07
		STR 	19H 			//033F 	0199

		//;main.c: 110: T1CON = 0B00000000;
		CLRR 	10H 			//0340 	0110

		//;main.c: 113: TMR1L = 0XBF;
		LDWI 	BFH 			//0341 	2ABF
		STR 	EH 			//0342 	018E

		//;main.c: 115: TMR1H = 0XE0;
		LDWI 	E0H 			//0343 	2AE0
		ORG		0344H
		STR 	FH 			//0344 	018F
		LDWI 	50H 			//0345 	2A50

		//;main.c: 116: TMR1IE = 1;
		BSR 	STATUS,5 		//0346 	1A83
		BSR 	CH,0 			//0347 	180C

		//;main.c: 117: TMR1ON = 1;
		BCR 	STATUS,5 		//0348 	1283
		BSR 	10H,0 			//0349 	1810

		//;main.c: 118: PEIE=1;
		BSR 	INTCON,6 		//034A 	1B0B

		//;main.c: 119: GIE = 1;
		BSR 	INTCON,7 		//034B 	1B8B
		ORG		034CH

		//;main.c: 124: ADCON1 = 0B01010000;
		BSR 	STATUS,5 		//034C 	1A83
		STR 	1FH 			//034D 	019F

		//;main.c: 126: ADCON0 = 0B10001001;
		LDWI 	89H 			//034E 	2A89
		BCR 	STATUS,5 		//034F 	1283
		STR 	1FH 			//0350 	019F

		//;main.c: 130: ANSEL = 0;
		BSR 	STATUS,5 		//0351 	1A83
		CLRR 	11H 			//0352 	0111
		RET		 					//0353 	0004
		ORG		0354H
		STR 	76H 			//0354 	01F6

		//;main.c: 292: unsigned char sum, i;
		//;main.c: 293: sum = 0;
		CLRR 	75H 			//0355 	0175

		//;main.c: 294: i = 0;
		CLRR 	77H 			//0356 	0177

		//;main.c: 295: for(i = 0; i < len - 1; i++)
		CLRR 	77H 			//0357 	0177
		LDR 	72H,0 			//0358 	0872
		ADDWI 	FFH 			//0359 	27FF
		STR 	73H 			//035A 	01F3
		LDWI 	FFH 			//035B 	2AFF
		ORG		035CH
		BTSC 	STATUS,0 		//035C 	1403
		LDWI 	0H 			//035D 	2A00
		STR 	74H 			//035E 	01F4
		XORWI 	80H 			//035F 	2680
		SUBWI 	80H 			//0360 	2880
		BTSS 	STATUS,2 		//0361 	1D03
		LJUMP 	365H 			//0362 	3B65
		LDR 	73H,0 			//0363 	0873
		ORG		0364H
		SUBWR 	77H,0 			//0364 	0C77
		BTSC 	STATUS,0 		//0365 	1403
		LJUMP 	370H 			//0366 	3B70

		//;main.c: 296: {
		//;main.c: 298: sum = buf[i] + sum;
		LDR 	77H,0 			//0367 	0877
		ADDWR 	76H,0 			//0368 	0B76
		STR 	73H 			//0369 	01F3
		STR 	FSR 			//036A 	0184
		BCR 	STATUS,7 		//036B 	1383
		ORG		036CH
		LDR 	INDF,0 			//036C 	0800
		ADDWR 	75H,1 			//036D 	0BF5
		INCR	77H,1 			//036E 	09F7
		LJUMP 	358H 			//036F 	3B58

		//;main.c: 299: }
		//;main.c: 300: if(buf[len - 1] == sum)
		LDR 	72H,0 			//0370 	0872
		ADDWR 	76H,0 			//0371 	0B76
		STR 	73H 			//0372 	01F3
		ADDWI 	FFH 			//0373 	27FF
		ORG		0374H
		STR 	FSR 			//0374 	0184
		BCR 	STATUS,7 		//0375 	1383
		LDR 	INDF,0 			//0376 	0800
		XORWR 	75H,0 			//0377 	0475
		BTSC 	STATUS,2 		//0378 	1503

		//;main.c: 301: {
		//;main.c: 302: return 1;
		RETW 	1H 			//0379 	2101

		//;main.c: 303: }
		//;main.c: 304: return 0;
		RETW 	0H 			//037A 	2100
		STR 	61H 			//037B 	01E1
		ORG		037CH
		LDWI 	7H 			//037C 	2A07
		CLRR 	77H 			//037D 	0177
		CLRR 	78H 			//037E 	0178
		LCALL 	51BH 			//037F 	351B
		LDR 	60H,0 			//0380 	0860
		STR 	7AH 			//0381 	01FA
		LDR 	5FH,0 			//0382 	085F
		LCALL 	522H 			//0383 	3522
		ORG		0384H
		LDR 	61H,0 			//0384 	0861
		XORWI 	25H 			//0385 	2625
		BTSS 	STATUS,2 		//0386 	1D03
		LJUMP 	38BH 			//0387 	3B8B
		LDR 	5FH,0 			//0388 	085F
		LCALL 	399H 			//0389 	3399
		LJUMP 	21BH 			//038A 	3A1B
		LDR 	61H,0 			//038B 	0861
		ORG		038CH
		XORWI 	26H 			//038C 	2626
		BTSS 	STATUS,2 		//038D 	1D03
		LJUMP 	392H 			//038E 	3B92
		LDR 	5FH,0 			//038F 	085F
		LCALL 	399H 			//0390 	3399
		LJUMP 	21BH 			//0391 	3A1B
		LDR 	61H,0 			//0392 	0861
		XORWI 	27H 			//0393 	2627
		ORG		0394H
		BTSS 	STATUS,2 		//0394 	1D03
		RET		 					//0395 	0004
		LDR 	5FH,0 			//0396 	085F
		LCALL 	399H 			//0397 	3399
		LJUMP 	21BH 			//0398 	3A1B
		STR 	72H 			//0399 	01F2
		LDR 	60H,0 			//039A 	0860
		STR 	73H 			//039B 	01F3
		ORG		039CH
		LDWI 	2H 			//039C 	2A02
		STR 	74H 			//039D 	01F4
		LDR 	61H,0 			//039E 	0861
		RET		 					//039F 	0004
		STR 	73H 			//03A0 	01F3
		CLRR 	74H 			//03A1 	0174
		CLRR 	75H 			//03A2 	0175
		LDWI 	1H 			//03A3 	2A01
		ORG		03A4H
		STR 	72H 			//03A4 	01F2
		INCR	75H,0 			//03A5 	0975
		LJUMP 	3A9H 			//03A6 	3BA9
		BCR 	STATUS,0 		//03A7 	1003
		RLR 	72H,1 			//03A8 	05F2
		ADDWI 	FFH 			//03A9 	27FF
		BTSS 	STATUS,2 		//03AA 	1D03
		LJUMP 	3A7H 			//03AB 	3BA7
		ORG		03ACH
		LDR 	72H,0 			//03AC 	0872
		ANDWR 	73H,0 			//03AD 	0273
		BTSC 	STATUS,2 		//03AE 	1503
		LJUMP 	3BDH 			//03AF 	3BBD
		LDWI 	1H 			//03B0 	2A01
		STR 	72H 			//03B1 	01F2
		LDR 	75H,0 			//03B2 	0875
		SUBWI 	7H 			//03B3 	2807
		ORG		03B4H
		ADDWI 	1H 			//03B4 	2701
		LJUMP 	3B8H 			//03B5 	3BB8
		BCR 	STATUS,0 		//03B6 	1003
		RLR 	72H,1 			//03B7 	05F2
		ADDWI 	FFH 			//03B8 	27FF
		BTSS 	STATUS,2 		//03B9 	1D03
		LJUMP 	3B6H 			//03BA 	3BB6
		LDR 	72H,0 			//03BB 	0872
		ORG		03BCH
		IORWR 	74H,1 			//03BC 	03F4
		LDWI 	8H 			//03BD 	2A08
		INCR	75H,1 			//03BE 	09F5
		SUBWR 	75H,0 			//03BF 	0C75
		BTSS 	STATUS,0 		//03C0 	1C03
		LJUMP 	3A3H 			//03C1 	3BA3
		LDR 	74H,0 			//03C2 	0874
		RET		 					//03C3 	0004
		ORG		03C4H

		//;main.c: 50: GIE=0;
		BCR 	INTCON,7 		//03C4 	138B

		//;main.c: 55: if(TMR1IE && TMR1IF)
		BSR 	STATUS,5 		//03C5 	1A83
		BCR 	STATUS,6 		//03C6 	1303
		BTSS 	CH,0 			//03C7 	1C0C
		LJUMP 	3DEH 			//03C8 	3BDE
		BCR 	STATUS,5 		//03C9 	1283
		BTSS 	CH,0 			//03CA 	1C0C
		LJUMP 	3DEH 			//03CB 	3BDE
		ORG		03CCH
		LDWI 	2FH 			//03CC 	2A2F

		//;main.c: 56: {
		//;main.c: 57: TMR1IF = 0;
		BCR 	CH,0 			//03CD 	100C

		//;main.c: 58: TMR1L = 0X2F;
		STR 	EH 			//03CE 	018E

		//;main.c: 60: T250uS++;
		LDWI 	F8H 			//03CF 	2AF8
		STR 	FH 			//03D0 	018F

		//;main.c: 63: rxtimeout++;
		INCR	20H,1 			//03D1 	09A0
		BTSC 	STATUS,2 		//03D2 	1503
		INCR	21H,1 			//03D3 	09A1
		ORG		03D4H

		//;main.c: 65: if(rxtimeout > 4000)
		LDWI 	FH 			//03D4 	2A0F
		SUBWR 	21H,0 			//03D5 	0C21
		LDWI 	A1H 			//03D6 	2AA1
		BTSC 	STATUS,2 		//03D7 	1503
		SUBWR 	20H,0 			//03D8 	0C20
		BTSS 	STATUS,0 		//03D9 	1C03
		LJUMP 	3DEH 			//03DA 	3BDE

		//;main.c: 66: {
		//;main.c: 67: rxtimeout = 0;
		CLRR 	20H 			//03DB 	0120
		ORG		03DCH
		CLRR 	21H 			//03DC 	0121

		//;main.c: 68: LT8920_work_sta = SCAN;
		CLRR 	22H 			//03DD 	0122

		//;main.c: 70: }
		//;main.c: 74: }
		//;main.c: 75: GIE=1;
		BSR 	INTCON,7 		//03DE 	1B8B
		LDR 	71H,0 			//03DF 	0871
		STR 	PCLATH 			//03E0 	018A
		SWAPR 	70H,0 			//03E1 	0770
		STR 	STATUS 			//03E2 	0183
		SWAPR 	7EH,1 			//03E3 	07FE
		ORG		03E4H
		SWAPR 	7EH,0 			//03E4 	077E
		RETI		 			//03E5 	0009
		STR 	77H 			//03E6 	01F7

		//;lt89xxdrvspi.c: 122: unsigned char i;
		//;lt89xxdrvspi.c: 124: RC2=0;
		BCR 	7H,2 			//03E7 	1107

		//;lt89xxdrvspi.c: 125: SPI_SendByte(reg);
		LCALL 	48FH 			//03E8 	348F

		//;lt89xxdrvspi.c: 126: SPI_SendByte(len+4);
		LDR 	75H,0 			//03E9 	0875
		ADDWI 	4H 			//03EA 	2704
		LCALL 	48FH 			//03EB 	348F
		ORG		03ECH

		//;lt89xxdrvspi.c: 127: SPI_SendByte(0xd6);
		LDWI 	D6H 			//03EC 	2AD6
		LCALL 	48FH 			//03ED 	348F

		//;lt89xxdrvspi.c: 128: SPI_SendByte(0xbe);
		LDWI 	BEH 			//03EE 	2ABE
		LCALL 	48FH 			//03EF 	348F

		//;lt89xxdrvspi.c: 129: SPI_SendByte(0x89);
		LDWI 	89H 			//03F0 	2A89
		LCALL 	48FH 			//03F1 	348F

		//;lt89xxdrvspi.c: 130: SPI_SendByte(0x8e);
		LDWI 	8EH 			//03F2 	2A8E
		LCALL 	48FH 			//03F3 	348F
		ORG		03F4H

		//;lt89xxdrvspi.c: 132: for(i=0; i<len; i++)
		CLRR 	78H 			//03F4 	0178
		LDR 	75H,0 			//03F5 	0875
		SUBWR 	78H,0 			//03F6 	0C78
		BTSC 	STATUS,0 		//03F7 	1403
		LJUMP 	402H 			//03F8 	3C02

		//;lt89xxdrvspi.c: 133: SPI_SendByte(pBuf[i]);
		LDR 	78H,0 			//03F9 	0878
		ADDWR 	74H,0 			//03FA 	0B74
		STR 	76H 			//03FB 	01F6
		ORG		03FCH
		STR 	FSR 			//03FC 	0184
		BCR 	STATUS,7 		//03FD 	1383
		LDR 	INDF,0 			//03FE 	0800
		LCALL 	48FH 			//03FF 	348F
		INCR	78H,1 			//0400 	09F8
		LJUMP 	3F5H 			//0401 	3BF5

		//;lt89xxdrvspi.c: 136: RC2=1;
		BSR 	7H,2 			//0402 	1907
		RET		 					//0403 	0004
		ORG		0404H

		//;main.c: 193: LT8920_ble_tx_enable();
		LCALL 	4C5H 			//0404 	34C5

		//;main.c: 194: LT8920_ble_tx_start(37, PDUDATA, 26);
		LDWI 	43H 			//0405 	2A43
		STR 	68H 			//0406 	01E8
		LDWI 	1AH 			//0407 	2A1A
		STR 	69H 			//0408 	01E9
		LDWI 	25H 			//0409 	2A25
		LCALL 	29AH 			//040A 	329A

		//;main.c: 195: DELAY_MS(4);
		LDWI 	4H 			//040B 	2A04
		ORG		040CH
		LCALL 	47BH 			//040C 	347B

		//;main.c: 196: LT8920_ble_tx_start(38, PDUDATA, 26);
		LDWI 	43H 			//040D 	2A43
		STR 	68H 			//040E 	01E8
		LDWI 	1AH 			//040F 	2A1A
		STR 	69H 			//0410 	01E9
		LDWI 	26H 			//0411 	2A26
		LCALL 	29AH 			//0412 	329A

		//;main.c: 197: DELAY_MS(4);
		LDWI 	4H 			//0413 	2A04
		ORG		0414H
		LCALL 	47BH 			//0414 	347B

		//;main.c: 198: LT8920_ble_tx_start(39, PDUDATA, 26);
		LDWI 	43H 			//0415 	2A43
		STR 	68H 			//0416 	01E8
		LDWI 	1AH 			//0417 	2A1A
		STR 	69H 			//0418 	01E9
		LDWI 	27H 			//0419 	2A27
		LCALL 	29AH 			//041A 	329A

		//;main.c: 199: DELAY_MS(4);
		LDWI 	4H 			//041B 	2A04
		ORG		041CH
		LCALL 	47BH 			//041C 	347B

		//;main.c: 200: RC4 = !RC4;
		LDWI 	10H 			//041D 	2A10
		XORWR 	7H,1 			//041E 	0487
		RET		 					//041F 	0004
		RETW 	2H 			//0420 	2102
		RETW 	15H 			//0421 	2115
		RETW 	0H 			//0422 	2100
		RETW 	0H 			//0423 	2100
		ORG		0424H
		RETW 	0H 			//0424 	2100
		RETW 	0H 			//0425 	2100
		RETW 	0H 			//0426 	2100
		RETW 	0H 			//0427 	2100
		RETW 	2H 			//0428 	2102
		RETW 	1H 			//0429 	2101
		RETW 	5H 			//042A 	2105
		RETW 	3H 			//042B 	2103
		ORG		042CH
		RETW 	19H 			//042C 	2119
		RETW 	C1H 			//042D 	21C1
		RETW 	3H 			//042E 	2103
		RETW 	7H 			//042F 	2107
		RETW 	16H 			//0430 	2116
		RETW 	11H 			//0431 	2111
		RETW 	11H 			//0432 	2111
		RETW 	11H 			//0433 	2111
		ORG		0434H
		RETW 	B0H 			//0434 	21B0
		RETW 	B0H 			//0435 	21B0
		RETW 	B0H 			//0436 	21B0
		RETW 	0H 			//0437 	2100
		RETW 	0H 			//0438 	2100
		RETW 	0H 			//0439 	2100

		//;main.c: 141: unsigned char I;
		//;main.c: 142: Init();
		LCALL 	32AH 			//043A 	332A

		//;main.c: 143: LT89XX_INIT();
		LCALL 	2FDH 			//043B 	32FD
		ORG		043CH

		//;main.c: 144: LT89xx_ModeSet(0x15);
		LDWI 	15H 			//043C 	2A15
		LCALL 	186H 			//043D 	3186

		//;main.c: 147: LT8920_work_sta = SCAN;
		CLRR 	22H 			//043E 	0122
		LJUMP 	44AH 			//043F 	3C4A

		//;main.c: 154: {
		//;main.c: 156: rxflag = 0;
		CLRR 	25H 			//0440 	0125

		//;main.c: 158: LT8920_ble_tx();
		LCALL 	404H 			//0441 	3404

		//;main.c: 159: LT8920_ble_rx();
		LCALL 	4E4H 			//0442 	34E4

		//;main.c: 160: if(rxflag == 1)
		DECRSZ 	25H,0 		//0443 	0E25
		ORG		0444H
		LJUMP 	44AH 			//0444 	3C4A

		//;main.c: 161: {
		//;main.c: 162: rxflag = 0;
		CLRR 	25H 			//0445 	0125

		//;main.c: 163: rxtimeout = 0;
		CLRR 	20H 			//0446 	0120
		CLRR 	21H 			//0447 	0121

		//;main.c: 164: LT8920_work_sta = RXBLE;
		CLRR 	22H 			//0448 	0122
		INCR	22H,1 			//0449 	09A2

		//;main.c: 150: {
		//;main.c: 153: if(LT8920_work_sta == SCAN)
		LDR 	22H,1 			//044A 	08A2
		BTSC 	STATUS,2 		//044B 	1503
		ORG		044CH
		LJUMP 	440H 			//044C 	3C40

		//;main.c: 169: else if(LT8920_work_sta == RXBLE)
		DECR 	22H,0 			//044D 	0D22
		BTSS 	STATUS,2 		//044E 	1D03
		LJUMP 	44AH 			//044F 	3C4A

		//;main.c: 170: {
		//;main.c: 172: LT8920_ble_rx();
		LCALL 	4E4H 			//0450 	34E4
		LJUMP 	44AH 			//0451 	3C4A
		STR 	78H 			//0452 	01F8

		//;lt89xxdrvspi.c: 141: unsigned char i,len;
		//;lt89xxdrvspi.c: 143: RC2=0;
		BCR 	7H,2 			//0453 	1107
		ORG		0454H

		//;lt89xxdrvspi.c: 144: SPI_SendByte(reg|0X80);
		IORWI 	80H 			//0454 	2580
		LCALL 	48FH 			//0455 	348F
		LCALL 	467H 			//0456 	3467

		//;lt89xxdrvspi.c: 146: for(i=0; i<lenth; i++)
		CLRR 	79H 			//0457 	0179
		LDR 	75H,0 			//0458 	0875
		SUBWR 	79H,0 			//0459 	0C79
		BTSC 	STATUS,0 		//045A 	1403
		LJUMP 	465H 			//045B 	3C65
		ORG		045CH

		//;lt89xxdrvspi.c: 147: {
		//;lt89xxdrvspi.c: 148: pBuf[i] = SPI_ReadByte();
		LDR 	79H,0 			//045C 	0879
		ADDWR 	74H,0 			//045D 	0B74
		STR 	76H 			//045E 	01F6
		STR 	FSR 			//045F 	0184
		LCALL 	467H 			//0460 	3467
		BCR 	STATUS,7 		//0461 	1383
		STR 	INDF 			//0462 	0180
		INCR	79H,1 			//0463 	09F9
		ORG		0464H
		LJUMP 	458H 			//0464 	3C58

		//;lt89xxdrvspi.c: 149: }
		//;lt89xxdrvspi.c: 151: RC2=1;
		BSR 	7H,2 			//0465 	1907

		//;lt89xxdrvspi.c: 153: return len;
		RET		 					//0466 	0004

		//;lt89xxdrvspi.c: 45: unsigned char retvalue=0;
		CLRR 	72H 			//0467 	0172

		//;lt89xxdrvspi.c: 46: unsigned char mcnt;
		//;lt89xxdrvspi.c: 47: RC3=0;
		BCR 	7H,3 			//0468 	1187

		//;lt89xxdrvspi.c: 48: for (mcnt=0;mcnt<8;mcnt++)
		CLRR 	73H 			//0469 	0173

		//;lt89xxdrvspi.c: 49: {
		//;lt89xxdrvspi.c: 50: RC3=1;
		BSR 	7H,3 			//046A 	1987

		//;lt89xxdrvspi.c: 52: retvalue<<=1;
		BCR 	STATUS,0 		//046B 	1003
		ORG		046CH
		RLR 	72H,1 			//046C 	05F2

		//;lt89xxdrvspi.c: 53: RC3=0;
		BCR 	7H,3 			//046D 	1187

		//;lt89xxdrvspi.c: 56: if(RA6) retvalue|=1;
		BTSS 	5H,6 			//046E 	1F05
		LJUMP 	472H 			//046F 	3C72
		BSR 	72H,0 			//0470 	1872
		LJUMP 	473H 			//0471 	3C73

		//;lt89xxdrvspi.c: 57: else retvalue&=0xfe;
		BCR 	72H,0 			//0472 	1072
		LDWI 	8H 			//0473 	2A08
		ORG		0474H
		INCR	73H,1 			//0474 	09F3
		SUBWR 	73H,0 			//0475 	0C73
		BTSS 	STATUS,0 		//0476 	1C03
		LJUMP 	46AH 			//0477 	3C6A

		//;lt89xxdrvspi.c: 59: }
		//;lt89xxdrvspi.c: 60: RC3=0;
		BCR 	7H,3 			//0478 	1187

		//;lt89xxdrvspi.c: 61: return retvalue;
		LDR 	72H,0 			//0479 	0872
		RET		 					//047A 	0004
		STR 	74H 			//047B 	01F4
		ORG		047CH

		//;lt89xxdrvspi.c: 10: unsigned int dly;
		//;lt89xxdrvspi.c: 11: while(Tms)
		LDR 	74H,1 			//047C 	08F4
		BTSC 	STATUS,2 		//047D 	1503
		RET		 					//047E 	0004
		LDWI 	8AH 			//047F 	2A8A

		//;lt89xxdrvspi.c: 12: {
		//;lt89xxdrvspi.c: 13: Tms--;
		DECR 	74H,1 			//0480 	0DF4

		//;lt89xxdrvspi.c: 14: dly=650;
		STR 	72H 			//0481 	01F2
		LDWI 	2H 			//0482 	2A02
		STR 	73H 			//0483 	01F3
		ORG		0484H

		//;lt89xxdrvspi.c: 15: while(dly) dly--;
		LDR 	73H,0 			//0484 	0873
		IORWR 	72H,0 			//0485 	0372
		BTSC 	STATUS,2 		//0486 	1503
		LJUMP 	47CH 			//0487 	3C7C
		LDWI 	1H 			//0488 	2A01
		SUBWR 	72H,1 			//0489 	0CF2
		LDWI 	0H 			//048A 	2A00
		BTSS 	STATUS,0 		//048B 	1C03
		ORG		048CH
		DECR 	73H,1 			//048C 	0DF3
		SUBWR 	73H,1 			//048D 	0CF3
		LJUMP 	484H 			//048E 	3C84
		STR 	72H 			//048F 	01F2

		//;lt89xxdrvspi.c: 25: unsigned char mcnt;
		//;lt89xxdrvspi.c: 26: for(mcnt=0;mcnt<8;mcnt++)
		CLRR 	73H 			//0490 	0173

		//;lt89xxdrvspi.c: 27: {
		//;lt89xxdrvspi.c: 28: RC3=0;
		BCR 	7H,3 			//0491 	1187

		//;lt89xxdrvspi.c: 30: if(buf&0x80) RA5=1;
		BTSS 	72H,7 			//0492 	1FF2
		LJUMP 	496H 			//0493 	3C96
		ORG		0494H
		BSR 	5H,5 			//0494 	1A85
		LJUMP 	497H 			//0495 	3C97

		//;lt89xxdrvspi.c: 31: else RA5=0;
		BCR 	5H,5 			//0496 	1285
		LDWI 	8H 			//0497 	2A08

		//;lt89xxdrvspi.c: 33: RC3=1;
		BSR 	7H,3 			//0498 	1987

		//;lt89xxdrvspi.c: 35: buf<<=1;
		BCR 	STATUS,0 		//0499 	1003
		RLR 	72H,1 			//049A 	05F2
		INCR	73H,1 			//049B 	09F3
		ORG		049CH
		SUBWR 	73H,0 			//049C 	0C73

		//;lt89xxdrvspi.c: 37: }
		//;lt89xxdrvspi.c: 38: RC3=0;
		BCR 	7H,3 			//049D 	1187
		BTSS 	STATUS,0 		//049E 	1C03
		LJUMP 	492H 			//049F 	3C92

		//;lt89xxdrvspi.c: 39: RA5=0;
		BCR 	5H,5 			//04A0 	1285
		RET		 					//04A1 	0004
		LDWI 	4AH 			//04A2 	2A4A
		STR 	77H 			//04A3 	01F7
		ORG		04A4H
		LDWI 	8H 			//04A4 	2A08
		STR 	78H 			//04A5 	01F8
		LDWI 	20H 			//04A6 	2A20
		LCALL 	51BH 			//04A7 	351B
		LDWI 	BEH 			//04A8 	2ABE
		STR 	77H 			//04A9 	01F7
		LDWI 	D6H 			//04AA 	2AD6
		STR 	78H 			//04AB 	01F8
		ORG		04ACH
		LDWI 	24H 			//04AC 	2A24
		LCALL 	51BH 			//04AD 	351B
		LDWI 	8EH 			//04AE 	2A8E
		STR 	77H 			//04AF 	01F7
		LDWI 	89H 			//04B0 	2A89
		STR 	78H 			//04B1 	01F8
		LDWI 	27H 			//04B2 	2A27
		LJUMP 	51BH 			//04B3 	3D1B
		ORG		04B4H
		LDWI 	20H 			//04B4 	2A20
		CLRR 	7BH 			//04B5 	017B
		BCR 	STATUS,7 		//04B6 	1383
		STR 	FSR 			//04B7 	0184
		LDWI 	43H 			//04B8 	2A43
		LCALL 	513H 			//04B9 	3513
		LDWI 	5DH 			//04BA 	2A5D
		STR 	7DH 			//04BB 	01FD
		ORG		04BCH
		LDWI 	4H 			//04BC 	2A04
		STR 	7EH 			//04BD 	01FE
		LDWI 	20H 			//04BE 	2A20
		STR 	7FH 			//04BF 	01FF
		LDWI 	43H 			//04C0 	2A43
		STR 	FSR 			//04C1 	0184
		LCALL 	4D9H 			//04C2 	34D9
		CLRR 	STATUS 			//04C3 	0103
		ORG		04C4H
		LJUMP 	43AH 			//04C4 	3C3A
		LDWI 	4AH 			//04C5 	2A4A
		STR 	77H 			//04C6 	01F7
		LDWI 	8H 			//04C7 	2A08
		STR 	78H 			//04C8 	01F8
		LDWI 	20H 			//04C9 	2A20
		LCALL 	51BH 			//04CA 	351B
		LDWI 	AAH 			//04CB 	2AAA
		ORG		04CCH
		STR 	77H 			//04CC 	01F7
		STR 	78H 			//04CD 	01F8
		LDWI 	24H 			//04CE 	2A24
		LCALL 	51BH 			//04CF 	351B
		LDWI 	AAH 			//04D0 	2AAA
		STR 	77H 			//04D1 	01F7
		STR 	78H 			//04D2 	01F8
		LDWI 	27H 			//04D3 	2A27
		ORG		04D4H
		LJUMP 	51BH 			//04D4 	3D1B
		LDR 	7EH,0 			//04D5 	087E
		STR 	PCLATH 			//04D6 	018A
		LDR 	7FH,0 			//04D7 	087F
		STR 	PCL 			//04D8 	0182
		LCALL 	4D5H 			//04D9 	34D5
		STR 	INDF 			//04DA 	0180
		INCR	FSR,1 			//04DB 	0984
		ORG		04DCH
		LDR 	FSR,0 			//04DC 	0804
		XORWR 	7DH,0 			//04DD 	047D
		BTSC 	STATUS,2 		//04DE 	1503
		RETW 	0H 			//04DF 	2100
		INCR	7FH,1 			//04E0 	09FF
		BTSC 	STATUS,2 		//04E1 	1503
		INCR	7EH,1 			//04E2 	09FE
		LJUMP 	4D9H 			//04E3 	3CD9
		ORG		04E4H

		//;main.c: 274: unsigned char i;
		//;main.c: 276: LT8920_ble_rx_enable();
		LCALL 	4A2H 			//04E4 	34A2

		//;main.c: 278: for(i = 0; i < 5; i++)
		CLRR 	64H 			//04E5 	0164

		//;main.c: 279: {
		//;main.c: 280: ble_chanel_scan(37);
		LDWI 	25H 			//04E6 	2A25
		LCALL 	1D2H 			//04E7 	31D2

		//;main.c: 281: ble_chanel_scan(38);
		LDWI 	26H 			//04E8 	2A26
		LCALL 	1D2H 			//04E9 	31D2

		//;main.c: 282: ble_chanel_scan(39);
		LDWI 	27H 			//04EA 	2A27
		LCALL 	1D2H 			//04EB 	31D2
		ORG		04ECH
		LDWI 	5H 			//04EC 	2A05
		INCR	64H,1 			//04ED 	09E4
		SUBWR 	64H,0 			//04EE 	0C64
		BTSC 	STATUS,0 		//04EF 	1403
		RET		 					//04F0 	0004
		LJUMP 	4E6H 			//04F1 	3CE6
		LJUMP 	1A3H 			//04F2 	39A3
		LJUMP 	194H 			//04F3 	3994
		ORG		04F4H
		LJUMP 	194H 			//04F4 	3994
		LJUMP 	194H 			//04F5 	3994
		LJUMP 	195H 			//04F6 	3995
		LJUMP 	1A8H 			//04F7 	39A8
		LJUMP 	194H 			//04F8 	3994
		LJUMP 	1ACH 			//04F9 	39AC
		LJUMP 	1B4H 			//04FA 	39B4
		LJUMP 	1B9H 			//04FB 	39B9
		ORG		04FCH
		LJUMP 	1BEH 			//04FC 	39BE
		LJUMP 	1C3H 			//04FD 	39C3
		STR 	76H 			//04FE 	01F6

		//;lt89xxdrvspi.c: 79: RC2=0;
		BCR 	STATUS,5 		//04FF 	1283
		BCR 	7H,2 			//0500 	1107

		//;lt89xxdrvspi.c: 80: SPI_SendByte(reg);
		LDR 	76H,0 			//0501 	0876
		LCALL 	48FH 			//0502 	348F

		//;lt89xxdrvspi.c: 81: SPI_SendByte(H);
		LDR 	74H,0 			//0503 	0874
		ORG		0504H
		LCALL 	48FH 			//0504 	348F

		//;lt89xxdrvspi.c: 82: SPI_SendByte(L);
		LDR 	75H,0 			//0505 	0875
		LCALL 	48FH 			//0506 	348F

		//;lt89xxdrvspi.c: 83: RC2=1;
		BSR 	7H,2 			//0507 	1907
		RET		 					//0508 	0004
		STR 	74H 			//0509 	01F4

		//;lt89xxdrvspi.c: 69: RC2=0;
		BCR 	7H,2 			//050A 	1107

		//;lt89xxdrvspi.c: 70: SPI_SendByte(reg|0x80);
		IORWI 	80H 			//050B 	2580
		ORG		050CH
		LCALL 	48FH 			//050C 	348F

		//;lt89xxdrvspi.c: 71: RegH=SPI_ReadByte();
		LCALL 	467H 			//050D 	3467
		STR 	7BH 			//050E 	01FB

		//;lt89xxdrvspi.c: 72: RegL=SPI_ReadByte();
		LCALL 	467H 			//050F 	3467
		STR 	23H 			//0510 	01A3

		//;lt89xxdrvspi.c: 73: RC2=1;
		BSR 	7H,2 			//0511 	1907
		RET		 					//0512 	0004
		CLRWDT	 			//0513 	0001
		ORG		0514H
		CLRR 	INDF 			//0514 	0100
		INCR	FSR,1 			//0515 	0984
		XORWR 	FSR,0 			//0516 	0404
		BTSC 	STATUS,2 		//0517 	1503
		RETW 	0H 			//0518 	2100
		XORWR 	FSR,0 			//0519 	0404
		LJUMP 	514H 			//051A 	3D14
		STR 	79H 			//051B 	01F9
		ORG		051CH

		//;spi_ble.c: 4: LT_WriteReg(reg, first, second);
		LDR 	77H,0 			//051C 	0877
		STR 	74H 			//051D 	01F4
		LDR 	78H,0 			//051E 	0878
		STR 	75H 			//051F 	01F5
		LDR 	79H,0 			//0520 	0879
		LJUMP 	4FEH 			//0521 	3CFE
		STR 	5DH 			//0522 	01DD

		//;spi_ble.c: 18: LT_ReadBUF_ble(50, buf,len);
		STR 	74H 			//0523 	01F4
		ORG		0524H
		LDR 	7AH,0 			//0524 	087A
		STR 	75H 			//0525 	01F5
		LDWI 	32H 			//0526 	2A32
		LJUMP 	452H 			//0527 	3C52
		STR 	7AH 			//0528 	01FA

		//;spi_ble.c: 13: LT_WriteBUF_ble(50, txdata,len);
		STR 	74H 			//0529 	01F4
		LDR 	79H,0 			//052A 	0879
		STR 	75H 			//052B 	01F5
		ORG		052CH
		LDWI 	32H 			//052C 	2A32
		LJUMP 	3E6H 			//052D 	3BE6
			END

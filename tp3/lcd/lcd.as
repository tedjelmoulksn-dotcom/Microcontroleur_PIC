opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 5239"

opt pagewidth 120

	opt lm

	processor	16F877A
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
# 14 "G:\MICROCONTREU\tp3\lcd\lcd.c"
	psect config,class=CONFIG,delta=2 ;#
# 14 "G:\MICROCONTREU\tp3\lcd\lcd.c"
	dw 0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F ;#
;COMMON:	_main->_print_char
;COMMON:	_print_char->_delay_ms
	FNCALL	_main,_init_LCD
	FNCALL	_main,_print_char
	FNCALL	_print_char,_delay_ms
	FNCALL	_init_LCD,_delay_ms
	FNCALL	_init_LCD,_ecriture_commande
	FNCALL	_ecriture_commande,_delay_ms
	FNROOT	_main
	global	_N
	global	_i
	global	_j
	global	_ADCON0
psect	text11,local,class=CODE,delta=2
global __ptext11
__ptext11:
_ADCON0  equ     31
	global	_ADRESH
_ADRESH  equ     30
	global	_CCP1CON
_CCP1CON  equ     23
	global	_CCP2CON
_CCP2CON  equ     29
	global	_CCPR1H
_CCPR1H  equ     22
	global	_CCPR1L
_CCPR1L  equ     21
	global	_CCPR2H
_CCPR2H  equ     28
	global	_CCPR2L
_CCPR2L  equ     27
	global	_FSR
_FSR  equ     4
	global	_INDF
_INDF  equ     0
	global	_INTCON
_INTCON  equ     11
	global	_PCL
_PCL  equ     2
	global	_PCLATH
_PCLATH  equ     10
	global	_PIR1
_PIR1  equ     12
	global	_PIR2
_PIR2  equ     13
	global	_PORTA
_PORTA  equ     5
	global	_PORTB
_PORTB  equ     6
	global	_PORTC
_PORTC  equ     7
	global	_PORTD
_PORTD  equ     8
	global	_PORTE
_PORTE  equ     9
	global	_RCREG
_RCREG  equ     26
	global	_RCSTA
_RCSTA  equ     24
	global	_SSPBUF
_SSPBUF  equ     19
	global	_SSPCON
_SSPCON  equ     20
	global	_STATUS
_STATUS  equ     3
	global	_T1CON
_T1CON  equ     16
	global	_T2CON
_T2CON  equ     18
	global	_TMR0
_TMR0  equ     1
	global	_TMR1H
_TMR1H  equ     15
	global	_TMR1L
_TMR1L  equ     14
	global	_TMR2
_TMR2  equ     17
	global	_TXREG
_TXREG  equ     25
	global	_ADCS0
_ADCS0  equ     254
	global	_ADCS1
_ADCS1  equ     255
	global	_ADDEN
_ADDEN  equ     195
	global	_ADGO
_ADGO  equ     250
	global	_ADIF
_ADIF  equ     102
	global	_ADON
_ADON  equ     248
	global	_BCLIF
_BCLIF  equ     107
	global	_CARRY
_CARRY  equ     24
	global	_CCP1IF
_CCP1IF  equ     98
	global	_CCP1M0
_CCP1M0  equ     184
	global	_CCP1M1
_CCP1M1  equ     185
	global	_CCP1M2
_CCP1M2  equ     186
	global	_CCP1M3
_CCP1M3  equ     187
	global	_CCP1X
_CCP1X  equ     189
	global	_CCP1Y
_CCP1Y  equ     188
	global	_CCP2IF
_CCP2IF  equ     104
	global	_CCP2M0
_CCP2M0  equ     232
	global	_CCP2M1
_CCP2M1  equ     233
	global	_CCP2M2
_CCP2M2  equ     234
	global	_CCP2M3
_CCP2M3  equ     235
	global	_CCP2X
_CCP2X  equ     237
	global	_CCP2Y
_CCP2Y  equ     236
	global	_CHS0
_CHS0  equ     251
	global	_CHS1
_CHS1  equ     252
	global	_CHS2
_CHS2  equ     253
	global	_CKP
_CKP  equ     164
	global	_CMIF
_CMIF  equ     110
	global	_CREN
_CREN  equ     196
	global	_DC
_DC  equ     25
	global	_EEIF
_EEIF  equ     108
	global	_FERR
_FERR  equ     194
	global	_GIE
_GIE  equ     95
	global	_GODONE
_GODONE  equ     250
	global	_INTE
_INTE  equ     92
	global	_INTF
_INTF  equ     89
	global	_IRP
_IRP  equ     31
	global	_OERR
_OERR  equ     193
	global	_PD
_PD  equ     27
	global	_PEIE
_PEIE  equ     94
	global	_PSPIF
_PSPIF  equ     103
	global	_RA0
_RA0  equ     40
	global	_RA1
_RA1  equ     41
	global	_RA2
_RA2  equ     42
	global	_RA3
_RA3  equ     43
	global	_RA4
_RA4  equ     44
	global	_RA5
_RA5  equ     45
	global	_RB0
_RB0  equ     48
	global	_RB1
_RB1  equ     49
	global	_RB2
_RB2  equ     50
	global	_RB3
_RB3  equ     51
	global	_RB4
_RB4  equ     52
	global	_RB5
_RB5  equ     53
	global	_RB6
_RB6  equ     54
	global	_RB7
_RB7  equ     55
	global	_RBIE
_RBIE  equ     91
	global	_RBIF
_RBIF  equ     88
	global	_RC0
_RC0  equ     56
	global	_RC1
_RC1  equ     57
	global	_RC2
_RC2  equ     58
	global	_RC3
_RC3  equ     59
	global	_RC4
_RC4  equ     60
	global	_RC5
_RC5  equ     61
	global	_RC6
_RC6  equ     62
	global	_RC7
_RC7  equ     63
	global	_RCIF
_RCIF  equ     101
	global	_RD0
_RD0  equ     64
	global	_RD1
_RD1  equ     65
	global	_RD2
_RD2  equ     66
	global	_RD3
_RD3  equ     67
	global	_RD4
_RD4  equ     68
	global	_RD5
_RD5  equ     69
	global	_RD6
_RD6  equ     70
	global	_RD7
_RD7  equ     71
	global	_RE0
_RE0  equ     72
	global	_RE1
_RE1  equ     73
	global	_RE2
_RE2  equ     74
	global	_RP0
_RP0  equ     29
	global	_RP1
_RP1  equ     30
	global	_RX9
_RX9  equ     198
	global	_RX9D
_RX9D  equ     192
	global	_SPEN
_SPEN  equ     199
	global	_SREN
_SREN  equ     197
	global	_SSPEN
_SSPEN  equ     165
	global	_SSPIF
_SSPIF  equ     99
	global	_SSPM0
_SSPM0  equ     160
	global	_SSPM1
_SSPM1  equ     161
	global	_SSPM2
_SSPM2  equ     162
	global	_SSPM3
_SSPM3  equ     163
	global	_SSPOV
_SSPOV  equ     166
	global	_T0IE
_T0IE  equ     93
	global	_T0IF
_T0IF  equ     90
	global	_T1CKPS0
_T1CKPS0  equ     132
	global	_T1CKPS1
_T1CKPS1  equ     133
	global	_T1OSCEN
_T1OSCEN  equ     131
	global	_T1SYNC
_T1SYNC  equ     130
	global	_T2CKPS0
_T2CKPS0  equ     144
	global	_T2CKPS1
_T2CKPS1  equ     145
	global	_TMR0IE
_TMR0IE  equ     93
	global	_TMR0IF
_TMR0IF  equ     90
	global	_TMR1CS
_TMR1CS  equ     129
	global	_TMR1IF
_TMR1IF  equ     96
	global	_TMR1ON
_TMR1ON  equ     128
	global	_TMR2IF
_TMR2IF  equ     97
	global	_TMR2ON
_TMR2ON  equ     146
	global	_TO
_TO  equ     28
	global	_TOUTPS0
_TOUTPS0  equ     147
	global	_TOUTPS1
_TOUTPS1  equ     148
	global	_TOUTPS2
_TOUTPS2  equ     149
	global	_TOUTPS3
_TOUTPS3  equ     150
	global	_TXIF
_TXIF  equ     100
	global	_WCOL
_WCOL  equ     167
	global	_ZERO
_ZERO  equ     26
	global	_ADCON1
_ADCON1  equ     159
	global	_ADRESL
_ADRESL  equ     158
	global	_CMCON
_CMCON  equ     156
	global	_CVRCON
_CVRCON  equ     157
	global	_OPTION
_OPTION  equ     129
	global	_PCON
_PCON  equ     142
	global	_PIE1
_PIE1  equ     140
	global	_PIE2
_PIE2  equ     141
	global	_PR2
_PR2  equ     146
	global	_SPBRG
_SPBRG  equ     153
	global	_SSPADD
_SSPADD  equ     147
	global	_SSPCON2
_SSPCON2  equ     145
	global	_SSPSTAT
_SSPSTAT  equ     148
	global	_TRISA
_TRISA  equ     133
	global	_TRISB
_TRISB  equ     134
	global	_TRISC
_TRISC  equ     135
	global	_TRISD
_TRISD  equ     136
	global	_TRISE
_TRISE  equ     137
	global	_TXSTA
_TXSTA  equ     152
	global	_ACKDT
_ACKDT  equ     1165
	global	_ACKEN
_ACKEN  equ     1164
	global	_ACKSTAT
_ACKSTAT  equ     1166
	global	_ADCS2
_ADCS2  equ     1278
	global	_ADFM
_ADFM  equ     1279
	global	_ADIE
_ADIE  equ     1126
	global	_BCLIE
_BCLIE  equ     1131
	global	_BF
_BF  equ     1184
	global	_BOR
_BOR  equ     1136
	global	_BRGH
_BRGH  equ     1218
	global	_C1INV
_C1INV  equ     1252
	global	_C1OUT
_C1OUT  equ     1254
	global	_C2INV
_C2INV  equ     1253
	global	_C2OUT
_C2OUT  equ     1255
	global	_CCP1IE
_CCP1IE  equ     1122
	global	_CCP2IE
_CCP2IE  equ     1128
	global	_CIS
_CIS  equ     1251
	global	_CKE
_CKE  equ     1190
	global	_CM0
_CM0  equ     1248
	global	_CM1
_CM1  equ     1249
	global	_CM2
_CM2  equ     1250
	global	_CMIE
_CMIE  equ     1134
	global	_CSRC
_CSRC  equ     1223
	global	_CVR0
_CVR0  equ     1256
	global	_CVR1
_CVR1  equ     1257
	global	_CVR2
_CVR2  equ     1258
	global	_CVR3
_CVR3  equ     1259
	global	_CVREN
_CVREN  equ     1263
	global	_CVROE
_CVROE  equ     1262
	global	_CVRR
_CVRR  equ     1261
	global	_DA
_DA  equ     1189
	global	_EEIE
_EEIE  equ     1132
	global	_GCEN
_GCEN  equ     1167
	global	_IBF
_IBF  equ     1103
	global	_IBOV
_IBOV  equ     1101
	global	_INTEDG
_INTEDG  equ     1038
	global	_OBF
_OBF  equ     1102
	global	_PCFG0
_PCFG0  equ     1272
	global	_PCFG1
_PCFG1  equ     1273
	global	_PCFG2
_PCFG2  equ     1274
	global	_PCFG3
_PCFG3  equ     1275
	global	_PEN
_PEN  equ     1162
	global	_POR
_POR  equ     1137
	global	_PS0
_PS0  equ     1032
	global	_PS1
_PS1  equ     1033
	global	_PS2
_PS2  equ     1034
	global	_PSA
_PSA  equ     1035
	global	_PSPIE
_PSPIE  equ     1127
	global	_PSPMODE
_PSPMODE  equ     1100
	global	_RBPU
_RBPU  equ     1039
	global	_RCEN
_RCEN  equ     1163
	global	_RCIE
_RCIE  equ     1125
	global	_RSEN
_RSEN  equ     1161
	global	_RW
_RW  equ     1186
	global	_SEN
_SEN  equ     1160
	global	_SMP
_SMP  equ     1191
	global	_SSPIE
_SSPIE  equ     1123
	global	_START
_START  equ     1187
	global	_STOP
_STOP  equ     1188
	global	_SYNC
_SYNC  equ     1220
	global	_T0CS
_T0CS  equ     1037
	global	_T0SE
_T0SE  equ     1036
	global	_TMR1IE
_TMR1IE  equ     1120
	global	_TMR2IE
_TMR2IE  equ     1121
	global	_TRISA0
_TRISA0  equ     1064
	global	_TRISA1
_TRISA1  equ     1065
	global	_TRISA2
_TRISA2  equ     1066
	global	_TRISA3
_TRISA3  equ     1067
	global	_TRISA4
_TRISA4  equ     1068
	global	_TRISA5
_TRISA5  equ     1069
	global	_TRISB0
_TRISB0  equ     1072
	global	_TRISB1
_TRISB1  equ     1073
	global	_TRISB2
_TRISB2  equ     1074
	global	_TRISB3
_TRISB3  equ     1075
	global	_TRISB4
_TRISB4  equ     1076
	global	_TRISB5
_TRISB5  equ     1077
	global	_TRISB6
_TRISB6  equ     1078
	global	_TRISB7
_TRISB7  equ     1079
	global	_TRISC0
_TRISC0  equ     1080
	global	_TRISC1
_TRISC1  equ     1081
	global	_TRISC2
_TRISC2  equ     1082
	global	_TRISC3
_TRISC3  equ     1083
	global	_TRISC4
_TRISC4  equ     1084
	global	_TRISC5
_TRISC5  equ     1085
	global	_TRISC6
_TRISC6  equ     1086
	global	_TRISC7
_TRISC7  equ     1087
	global	_TRISD0
_TRISD0  equ     1088
	global	_TRISD1
_TRISD1  equ     1089
	global	_TRISD2
_TRISD2  equ     1090
	global	_TRISD3
_TRISD3  equ     1091
	global	_TRISD4
_TRISD4  equ     1092
	global	_TRISD5
_TRISD5  equ     1093
	global	_TRISD6
_TRISD6  equ     1094
	global	_TRISD7
_TRISD7  equ     1095
	global	_TRISE0
_TRISE0  equ     1096
	global	_TRISE1
_TRISE1  equ     1097
	global	_TRISE2
_TRISE2  equ     1098
	global	_TRMT
_TRMT  equ     1217
	global	_TX9
_TX9  equ     1222
	global	_TX9D
_TX9D  equ     1216
	global	_TXEN
_TXEN  equ     1221
	global	_TXIE
_TXIE  equ     1124
	global	_UA
_UA  equ     1185
	global	_EEADR
_EEADR  equ     269
	global	_EEADRH
_EEADRH  equ     271
	global	_EEADRL
_EEADRL  equ     269
	global	_EEDATA
_EEDATA  equ     268
	global	_EEDATH
_EEDATH  equ     270
	global	_EECON1
_EECON1  equ     396
	global	_EECON2
_EECON2  equ     397
	global	_EEPGD
_EEPGD  equ     3175
	global	_RD
_RD  equ     3168
	global	_WR
_WR  equ     3169
	global	_WREN
_WREN  equ     3170
	global	_WRERR
_WRERR  equ     3171
	file	"lcd.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      2

_j:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_N:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_delay_ms
??_delay_ms: ;@ 0x0
	ds	1
	global	delay_ms@j
delay_ms@j:	; 2 bytes @ 0x1
	ds	2
	global	??_init_LCD
??_init_LCD: ;@ 0x3
	global	??_main
??_main: ;@ 0x3
	global	delay_ms@i
delay_ms@i:	; 2 bytes @ 0x3
	ds	2
	global	?_delay_ms
?_delay_ms: ;@ 0x5
	global	delay_ms@N
delay_ms@N:	; 2 bytes @ 0x5
	ds	2
	global	??_ecriture_commande
??_ecriture_commande: ;@ 0x7
	global	??_print_char
??_print_char: ;@ 0x7
	ds	2
	global	print_char@character
print_char@character:	; 1 bytes @ 0x9
	global	ecriture_commande@instruction
ecriture_commande@instruction:	; 1 bytes @ 0x9
	ds	1
	global	?_main
?_main: ;@ 0xA
	global	?_print_char
?_print_char: ;@ 0xA
	global	?_ecriture_commande
?_ecriture_commande: ;@ 0xA
	global	?_init_LCD
?_init_LCD: ;@ 0xA
;Data sizes: Strings 0, constant 0, data 0, bss 6, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON          14     10      14
; BANK0           80      0       2
; BANK1           80      0       0
; BANK3           96      0       0
; BANK2           96      0       0


;Pointer list with targets:



;Main: autosize = 0, tempsize = 0, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                                0    0  240   0.00
;           _init_LCD
;         _print_char
;  _print_char                                        3    0   60   0.00
;                                    7 COMMO    3
;           _delay_ms
;  _init_LCD                                          0    0  180   0.00
;           _delay_ms
;  _ecriture_commande
;    _ecriture_commande                               3    0  140   0.00
;                                    7 COMMO    3
;           _delay_ms
;      _delay_ms                                      5    2   40   0.00
;                                    0 COMMO    7
; Estimated maximum call depth 3
; Address spaces:

;Name               Size   Autos  Total    Cost      Usage
;BITCOMMON            E      0       0       0        0.0%
;CODE                 0      0       0       0        0.0%
;NULL                 0      0       0       0        0.0%
;COMMON               E      A       E       1      100.0%
;SFR0                 0      0       0       1        0.0%
;BITSFR0              0      0       0       1        0.0%
;BITSFR1              0      0       0       2        0.0%
;SFR1                 0      0       0       2        0.0%
;ABS                  0      0      10       2        0.0%
;STACK                0      0       0       3        0.0%
;BITBANK0            50      0       0       4        0.0%
;SFR3                 0      0       0       4        0.0%
;BITSFR3              0      0       0       4        0.0%
;BANK0               50      0       2       5        2.5%
;BITSFR2              0      0       0       5        0.0%
;SFR2                 0      0       0       5        0.0%
;BITBANK1            50      0       0       6        0.0%
;BANK1               50      0       0       7        0.0%
;BITBANK3            60      0       0       8        0.0%
;BANK3               60      0       0       9        0.0%
;BITBANK2            60      0       0      10        0.0%
;BANK2               60      0       0      11        0.0%
;DATA                 0      0      10      12        0.0%
;EEDATA             100      0       0    1000        0.0%

	global	_main
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:

; *************** function _main *****************
; Defined at:
;		line 149 in file "G:\MICROCONTREU\tp3\lcd\lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+0, btemp+1, btemp+2, btemp+3, pclath, cstack
; Tracked objects:
;		On entry : 17F/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_init_LCD
;		_print_char
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"G:\MICROCONTREU\tp3\lcd\lcd.c"
	line	149
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;lcd.c: 148: void main(void)
;lcd.c: 149: {
	
_main:	
	opt stack 8
; Regs used in _main: [allreg]
	line	152
	
l30000427:	
;lcd.c: 152: init_LCD();
	fcall	_init_LCD
	
l30000428:	
	line	154
;lcd.c: 154: print_char('A');
	movlw	(041h)
	fcall	_print_char
	
l20:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	171
	signat	_main,88
	global	_print_char
psect	text12,local,class=CODE,delta=2
global __ptext12
__ptext12:

; *************** function _print_char *****************
; Defined at:
;		line 125 in file "G:\MICROCONTREU\tp3\lcd\lcd.c"
; Parameters:    Size  Location     Type
;  character       1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  character       1    9[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       0       0       0       0
;      Temp:     2
;      Total:    3
; This function calls:
;		_delay_ms
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text12
	file	"G:\MICROCONTREU\tp3\lcd\lcd.c"
	line	125
	global	__size_of_print_char
	__size_of_print_char	equ	__end_of_print_char-_print_char
;lcd.c: 125: void print_char(char character) {
	
_print_char:	
	opt stack 7
; Regs used in _print_char: [wreg+status,2+status,0+pclath+cstack]
;print_char@character stored from wreg
	movwf	(print_char@character)
	
l30000419:	
	line	126
;lcd.c: 126: RD4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(68/8),(68)&7
	line	127
;lcd.c: 127: RD5 = 0;
	bcf	(69/8),(69)&7
	line	128
;lcd.c: 128: RD6 = 0;
	bcf	(70/8),(70)&7
	
l30000420:	
	line	131
;lcd.c: 131: PORTD = (PORTD & 0x0F) | (character & 0xF0);
	movf	(print_char@character),w
	andlw	0F0h
	movwf	(??_print_char+0+0)
	movf	(8),w	;volatile
	andlw	0Fh
	iorwf	(??_print_char+0+0),w
	movwf	(8)	;volatile
	
l30000421:	
	line	132
;lcd.c: 132: RD6 = 1;
	bsf	(70/8),(70)&7
	
l30000422:	
	line	133
;lcd.c: 133: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000423:	
	line	134
;lcd.c: 134: RD6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
	
l30000424:	
	line	137
;lcd.c: 137: PORTD = (PORTD & 0x0F) | ((character << 4) & 0xF0);
	movf	(print_char@character),w
	movwf	(??_print_char+0+0)
	movlw	(04h)-1
u135:
	clrc
	rlf	(??_print_char+0+0),f
	addlw	-1
	skipz
	goto	u135
	clrc
	rlf	(??_print_char+0+0),w
	andlw	0F0h
	movwf	(??_print_char+1+0)
	movf	(8),w	;volatile
	andlw	0Fh
	iorwf	(??_print_char+1+0),w
	movwf	(8)	;volatile
	
l30000425:	
	line	138
;lcd.c: 138: RD6 = 1;
	bsf	(70/8),(70)&7
	line	139
;lcd.c: 139: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000426:	
	line	140
;lcd.c: 140: RD6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
	line	143
;lcd.c: 143: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l19:	
	return
	opt stack 0
GLOBAL	__end_of_print_char
	__end_of_print_char:
; =============== function _print_char ends ============

psect	text13,local,class=CODE,delta=2
global __ptext13
__ptext13:
	line	144
	signat	_print_char,4216
	global	_init_LCD

; *************** function _init_LCD *****************
; Defined at:
;		line 71 in file "G:\MICROCONTREU\tp3\lcd\lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+0, btemp+1, btemp+2, btemp+3, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_delay_ms
;		_ecriture_commande
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text13
	file	"G:\MICROCONTREU\tp3\lcd\lcd.c"
	line	71
	global	__size_of_init_LCD
	__size_of_init_LCD	equ	__end_of_init_LCD-_init_LCD
;lcd.c: 70: void init_LCD(void)
;lcd.c: 71: {
	
_init_LCD:	
	opt stack 7
; Regs used in _init_LCD: [allreg]
	line	72
	
l30000389:	
;lcd.c: 72: delay_ms(15);
	movlw	low(0Fh)
	movwf	(?_delay_ms)
	movlw	high(0Fh)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000390:	
	line	73
;lcd.c: 73: ecriture_commande(0x03);
	movlw	(03h)
	fcall	_ecriture_commande
	
l30000391:	
	line	74
;lcd.c: 74: delay_ms(5);
	movlw	low(05h)
	movwf	(?_delay_ms)
	movlw	high(05h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	76
;lcd.c: 76: ecriture_commande(0x03);
	movlw	(03h)
	fcall	_ecriture_commande
	
l30000392:	
	line	77
;lcd.c: 77: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000393:	
	line	79
;lcd.c: 79: ecriture_commande(0x03);
	movlw	(03h)
	fcall	_ecriture_commande
	line	80
;lcd.c: 80: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000394:	
	line	82
;lcd.c: 82: ecriture_commande(0x02);
	movlw	(02h)
	fcall	_ecriture_commande
	
l30000395:	
	line	83
;lcd.c: 83: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	86
;lcd.c: 86: ecriture_commande(0x28);
	movlw	(028h)
	fcall	_ecriture_commande
	
l30000396:	
	line	87
;lcd.c: 87: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000397:	
	line	89
;lcd.c: 89: ecriture_commande(0x0C);
	movlw	(0Ch)
	fcall	_ecriture_commande
	line	90
;lcd.c: 90: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000398:	
	line	92
;lcd.c: 92: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	
l30000399:	
	line	93
;lcd.c: 93: delay_ms(2);
	movlw	low(02h)
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	95
;lcd.c: 95: ecriture_commande(0x06);
	movlw	(06h)
	fcall	_ecriture_commande
	
l30000400:	
	line	96
;lcd.c: 96: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l15:	
	return
	opt stack 0
GLOBAL	__end_of_init_LCD
	__end_of_init_LCD:
; =============== function _init_LCD ends ============

psect	text14,local,class=CODE,delta=2
global __ptext14
__ptext14:
	line	97
	signat	_init_LCD,88
	global	_ecriture_commande

; *************** function _ecriture_commande *****************
; Defined at:
;		line 101 in file "G:\MICROCONTREU\tp3\lcd\lcd.c"
; Parameters:    Size  Location     Type
;  instruction     1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  instruction     1    9[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       0       0       0       0
;      Temp:     2
;      Total:    3
; This function calls:
;		_delay_ms
; This function is called by:
;		_init_LCD
; This function uses a non-reentrant model
; 
psect	text14
	file	"G:\MICROCONTREU\tp3\lcd\lcd.c"
	line	101
	global	__size_of_ecriture_commande
	__size_of_ecriture_commande	equ	__end_of_ecriture_commande-_ecriture_commande
;lcd.c: 101: void ecriture_commande(char instruction) {
	
_ecriture_commande:	
	opt stack 6
; Regs used in _ecriture_commande: [wreg+status,2+status,0+pclath+cstack]
;ecriture_commande@instruction stored from wreg
	movwf	(ecriture_commande@instruction)
	
l30000401:	
	line	102
;lcd.c: 102: RD4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(68/8),(68)&7
	line	103
;lcd.c: 103: RD5 = 0;
	bcf	(69/8),(69)&7
	line	104
;lcd.c: 104: RD6 = 0;
	bcf	(70/8),(70)&7
	
l30000402:	
	line	107
;lcd.c: 107: PORTD = (PORTD & 0x0F) | (instruction & 0xF0);
	movf	(ecriture_commande@instruction),w
	andlw	0F0h
	movwf	(??_ecriture_commande+0+0)
	movf	(8),w	;volatile
	andlw	0Fh
	iorwf	(??_ecriture_commande+0+0),w
	movwf	(8)	;volatile
	
l30000403:	
	line	108
;lcd.c: 108: RD6 = 1;
	bsf	(70/8),(70)&7
	
l30000404:	
	line	109
;lcd.c: 109: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000405:	
	line	110
;lcd.c: 110: RD6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
	
l30000406:	
	line	113
;lcd.c: 113: PORTD = (PORTD & 0x0F) | ((instruction << 4) & 0xF0);
	movf	(ecriture_commande@instruction),w
	movwf	(??_ecriture_commande+0+0)
	movlw	(04h)-1
u45:
	clrc
	rlf	(??_ecriture_commande+0+0),f
	addlw	-1
	skipz
	goto	u45
	clrc
	rlf	(??_ecriture_commande+0+0),w
	andlw	0F0h
	movwf	(??_ecriture_commande+1+0)
	movf	(8),w	;volatile
	andlw	0Fh
	iorwf	(??_ecriture_commande+1+0),w
	movwf	(8)	;volatile
	
l30000407:	
	line	114
;lcd.c: 114: RD6 = 1;
	bsf	(70/8),(70)&7
	line	115
;lcd.c: 115: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l30000408:	
	line	116
;lcd.c: 116: RD6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
	
l30000409:	
	line	119
;lcd.c: 119: if ((instruction == 0x01) || (instruction == 0x02) || (instruction == 0x03) || (instruction == 0x04) || (instruction == 0x10) || (instruction == 0x11) || (instruction == 0x12) || (instruction == 0x13))
	movf	(ecriture_commande@instruction),w
	xorlw	01h
	skipnz
	goto	u51
	goto	u50
u51:
	goto	l30000417
u50:
	
l30000410:	
	movf	(ecriture_commande@instruction),w
	xorlw	02h
	skipnz
	goto	u61
	goto	u60
u61:
	goto	l30000417
u60:
	
l30000411:	
	movf	(ecriture_commande@instruction),w
	xorlw	03h
	skipnz
	goto	u71
	goto	u70
u71:
	goto	l30000417
u70:
	
l30000412:	
	movf	(ecriture_commande@instruction),w
	xorlw	04h
	skipnz
	goto	u81
	goto	u80
u81:
	goto	l30000417
u80:
	
l30000413:	
	movf	(ecriture_commande@instruction),w
	xorlw	010h
	skipnz
	goto	u91
	goto	u90
u91:
	goto	l30000417
u90:
	
l30000414:	
	movf	(ecriture_commande@instruction),w
	xorlw	011h
	skipnz
	goto	u101
	goto	u100
u101:
	goto	l30000417
u100:
	
l30000415:	
	movf	(ecriture_commande@instruction),w
	xorlw	012h
	skipnz
	goto	u111
	goto	u110
u111:
	goto	l30000417
u110:
	
l30000416:	
	movf	(ecriture_commande@instruction),w
	xorlw	013h
	skipz
	goto	u121
	goto	u120
u121:
	goto	l30000418
u120:
	
l30000417:	
	line	120
;lcd.c: 120: delay_ms(2);
	movlw	low(02h)
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l16
	
l30000418:	
	line	122
;lcd.c: 121: else
;lcd.c: 122: delay_ms(40);
	movlw	low(028h)
	movwf	(?_delay_ms)
	movlw	high(028h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	
l16:	
	return
	opt stack 0
GLOBAL	__end_of_ecriture_commande
	__end_of_ecriture_commande:
; =============== function _ecriture_commande ends ============

psect	text15,local,class=CODE,delta=2
global __ptext15
__ptext15:
	line	123
	signat	_ecriture_commande,4216
	global	_delay_ms

; *************** function _delay_ms *****************
; Defined at:
;		line 46 in file "G:\MICROCONTREU\tp3\lcd\lcd.c"
; Parameters:    Size  Location     Type
;  N               2    5[COMMON] int 
; Auto vars:     Size  Location     Type
;  i               2    3[COMMON] int 
;  j               2    1[COMMON] int 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         7       0       0       0       0
;      Temp:     1
;      Total:    7
; This function calls:
;		Nothing
; This function is called by:
;		_init_LCD
;		_ecriture_commande
;		_print_char
; This function uses a non-reentrant model
; 
psect	text15
	file	"G:\MICROCONTREU\tp3\lcd\lcd.c"
	line	46
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
;lcd.c: 45: void delay_ms(int N)
;lcd.c: 46: {
	
_delay_ms:	
	opt stack 5
; Regs used in _delay_ms: [wreg]
	
l30000378:	
	
l30000379:	
	line	48
;lcd.c: 48: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	
l30000380:	
	line	49
;lcd.c: 49: PSA = 0;
	bcf	(1035/8)^080h,(1035)&7
	
l30000381:	
	line	50
;lcd.c: 50: PS2 = 0;
	bcf	(1034/8)^080h,(1034)&7
	
l30000382:	
	line	51
;lcd.c: 51: PS1 = 1;
	bsf	(1033/8)^080h,(1033)&7
	
l30000383:	
	line	52
;lcd.c: 52: PS0 = 1;
	bsf	(1032/8)^080h,(1032)&7
	line	54
;lcd.c: 54: TMR0 = 0x06;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	
l30000384:	
	line	55
;lcd.c: 55: T0IF = 0;
	bcf	(90/8),(90)&7
	line	56
;lcd.c: 56: int j=0;
	movlw	low(0)
	movwf	(delay_ms@j)
	movlw	high(0)
	movwf	((delay_ms@j))+1
	line	57
;lcd.c: 57: for(j=0;j<=N;j++)
	movlw	low(0)
	movwf	(delay_ms@j)
	movlw	high(0)
	movwf	((delay_ms@j))+1
	goto	l8
	
l30000385:	
	line	61
;lcd.c: 58: {
;lcd.c: 61: for (i=0; i<40; i++)
	movlw	low(0)
	movwf	(delay_ms@i)
	movlw	high(0)
	movwf	((delay_ms@i))+1
	
l12:	
	line	63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(90/8),(90)&7
	goto	u11
	goto	u10
u11:
	goto	l12
u10:
	
l14:	
	line	64
;lcd.c: 64: T0IF = 0;
	bcf	(90/8),(90)&7
	
l30000387:	
	line	65
;lcd.c: 65: TMR0 = 0X06;
	movlw	(06h)
	movwf	(1)	;volatile
	line	61
	movlw	low(01h)
	addwf	(delay_ms@i),f
	skipnc
	incf	(delay_ms@i+1),f
	movlw	high(01h)
	addwf	(delay_ms@i+1),f
	movf	(delay_ms@i+1),w
	xorlw	80h
	movwf	(??_delay_ms+0+0)
	movlw	(high(028h))^80h
	subwf	(??_delay_ms+0+0),w
	skipz
	goto	u25
	movlw	low(028h)
	subwf	(delay_ms@i),w
u25:

	skipc
	goto	u21
	goto	u20
u21:
	goto	l12
u20:
	
l30000388:	
	line	57
	movlw	low(01h)
	addwf	(delay_ms@j),f
	skipnc
	incf	(delay_ms@j+1),f
	movlw	high(01h)
	addwf	(delay_ms@j+1),f
	
l8:	
	movf	(delay_ms@N+1),w
	xorlw	80h
	movwf	(??_delay_ms+0+0)
	movf	(delay_ms@j+1),w
	xorlw	80h
	subwf	(??_delay_ms+0+0),w
	skipz
	goto	u35
	movf	(delay_ms@j),w
	subwf	(delay_ms@N),w
u35:

	skipnc
	goto	u31
	goto	u30
u31:
	goto	l30000385
u30:
	
l4:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
; =============== function _delay_ms ends ============

psect	text16,local,class=CODE,delta=2
global __ptext16
__ptext16:
	line	69
	signat	_delay_ms,4216
	end

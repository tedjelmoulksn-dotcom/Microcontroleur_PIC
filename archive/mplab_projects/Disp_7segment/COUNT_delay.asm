; bibliothèque de temporisations en assembleur
;*********************************************************************************************************
; directive list pour le type de PIC et le "radix"
; cf. cours complet page 152                
		list		p=16f877a, r=dec	; type de PIC et radix décimal

;*********************************************************************************************************
; directive #include pour les fichiers d'inclusion
; cf. cours complet page 152 	
		#include	<p16f877a.inc>		; fichier d'inclusion mapping et noms registres SFR et bits SFR

;*********************************************************************************************************
; directive _CONFIG pour la configuration au téléchargement 
 ; cf. cours complet page 153	
		__CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON &_HS_OSC & _WRT_OFF & _LVP_ON & _CPD_OFF

;*********************************************************************************************************
; directive EQU pour la définition des constantes hardware
; cf. cours complet page 153 et 154
; exemple: définition des broches du PORTB
;		RB0			EQU		0			; broche RB0
;		RB1			EQU		1			; broche RB1
;*********************************************************************************************************
; directive EQU pour la définition des constantes software : mettre ici vos constantes
; exemple :
;		NOTE_MAX	EQU		20

; variables non initialisées en GPR zone commune
; exemple du cours page 156
			CBLOCK				0x20	; début zone données
tampon			:	1

			ENDC
								; fin zone de données
			n 	EQU		0x30
			ms	EQU 	0x31
		
			p	EQU		0x32
			
			count	EQU		0x33
			
			status	EQU		0x03

			PORTC	EQU	0x07
			TRISC	EQU	0x87
			
			pcl		EQU 0x02
;*********************************************************************************************************
; début de la zone de code implantée en EEPROM de programme
;*********************************************************************************************************
; directive ORG pour fixer une adresse d'implantation du code en mémoire
; cf. cours complet page 156

					ORG			0x0000		; vecteur de reset
					goto		main		; vers le début du programme

					ORG			0x0005		; pour un éventuel vecteur d'interruption en 0x0004
main	
				;	call		tempo_test
				;	nop		
				;	call 		delay_200ms
				;	nop	
				;	call		delay_1s
				;	nop
					
					movlw		0x00
					tris		PORTC
					clrf		PORTC	


			
					
loop				clrf		count				

		again		movf 		count,w
					call		get_7seg
					movwf		PORTC
					incf		count,f
					movlw		0xFF
					call		delay_ms
					movf		count,w
					sublw		0x10
					btfss		status,Z
					goto		again
					goto		loop
				
				;	movlw		0x01
				;	call		delay_ms
				;	nop
					
				;	movlw		0xC8
				;	call		delay_ms
				;	nop
					 
				;	movlw		0x3E8
				;	call		delay_ms
				;	nop
					 
				

				
;*********************************************************************************** 
; module tempo_test fixe : void rempo_test(void) par une seule boucle
;*********************************************************************************** 
tempo_test	movlw 0xF8 ; W=248;
			movwf n ; load counter n=W
repeat		nop
			decfsz n,f ; n=n-1, n=0?
			goto repeat ; not 0, jump to repeat
			nop
			nop
			nop
			return ; end delay

;delay_200ms	movlw 0xC8 ; W=200;
			;movwf m ; load counter n=W
;loop 		call tempo_test
			;decfsz m,f ; m=m-1, n=0?
			;goto loop ; not 0, jump to repeat
			;return

;delay_1s	movlw 0x05 ; W=5;
		;	movwf p ; load counter n=W
;loop_delay_1s		
				;call delay_200ms
				;decfsz p,f ; m=m-1, n=0?
				;goto loop_delay_1s ; not 0, jump to repeat
				;return


delay_ms		
				movwf	ms       ; Charge le compteur m avec la valeur de ms 

loop_delay_ms
				call	tempo_test 		; Appel de la fonction tempo_test
    			decfsz	ms, f  		 	; Décrémenter m, saute à loop_delay_ms si m != 0
   			 	goto	loop_delay_ms

				return         


get_7seg	addwf pcl,f ; pcl=pcl+W
			retlw b'01111110' ; code 0
			retlw b'00001100' ; code 1
			retlw b'10111100' ;	code 2
			retlw b'10011110' ; code 3
			retlw b'11001100' ; code 4
			retlw b'11011010' ; code 5
			retlw b'11111010' ; code 6
			retlw b'00001110' ; code 7
			retlw b'11111110' ; 8
			retlw b'11011110' ; 9
			retlw b'11101110' ; A
    		retlw b'11111000' ;  B
   			retlw b'01110010' ;  C
    		retlw b'10101100' ; D
   			retlw b'11110010' ;  E
    		retlw b'11100010' ;  F	 
;*********************************************************************************** 			

		    END               	   		; fin de l'assemblage ici






					
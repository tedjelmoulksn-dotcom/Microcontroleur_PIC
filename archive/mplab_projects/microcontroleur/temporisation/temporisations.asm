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
tampon				:	1

			ENDC						; fin zone de données
			n 	EQU		0x30

;*********************************************************************************************************
; début de la zone de code implantée en EEPROM de programme
;*********************************************************************************************************
; directive ORG pour fixer une adresse d'implantation du code en mémoire
; cf. cours complet page 156

					ORG			0x0000		; vecteur de reset
					goto		main		; vers le début du programme

					ORG			0x0005		; pour un éventuel vecteur d'interruption en 0x0004
main	
					call		tempo_test
					nop			

				
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
;*********************************************************************************** 			

		    END               	   ; fin de l'assemblage ici






					
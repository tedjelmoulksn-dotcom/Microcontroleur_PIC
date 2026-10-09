; canevas pour les projets en assembleur
; à utiliser comme base de départ pour les nouveaux projets en assembleur
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
		__CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON &_HS_OSC & _WRT_OFF & _LVP_OFF & _CPD_OFF

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

;*********************************************************************************************************
; zone de déclaration des variables :
; directives CBLOCK... ENDC pour les variables non initialisées en GPR : mettre ici vos variables
; cf. cours complet page 158
			CBLOCK				0x71	; début zone données
			AA		:	1
			BB		:	1
			CC		:	1

; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :

 
									; fin zone de données

;*********************************************************************************************************
; déclaration variables initialisées nécessitant la fonction copy_init_data pour les initialiser
; de l'EEPROM vers la RAM
; pour cela, faire les 5 modifications suivantes:
; 1. décommenter la ligne suivante
; extern copy_init_data 
; + 2. rattacher le fichier init_data_bt.asm avec les sources de votre projet
; + 3. rajouter call copy_init_data au début du main
; + 4. rajouter le script 16f877a.lkr avec les linker script de votre projet
; + 5. décommenter la ligne suivante
; I_DATA		IDATA	;compatibilié fichier script
; tempo			DB		5
; voir exemple dans le tutorial 2

;*********************************************************************************************************
; directive DE pour les variables (semi permanentes) en EEPROM de données
; cf. cours complet page 160
; exemple :
;					ORG			0x2100
;					DE			"telecom"
;annee				DE			'1'
;code_pin			DE			0x01,0x05,0x07,0x09

;*********************************************************************************************************
; zone de code implantée en EEPROM de programme
;*********************************************************************************************************
					ORG			0x0000		; vecteur de reset
					goto		main		; vers le début du programme
											; pour un éventuel vecteur d'interruption en 0x0004

					ORG			0x0005	
main	
			
; mettre ici les instructions de votre programme

				movlw      	0x00
				tris 		PORTB

				movlw		0x07
				movwf		AA
				movlw		0x03
				movwf		BB
				movlw		0x06
				movwf		CC

				movf		AA,W
				addwf		BB,f
				movf		CC,W				
				subwf		BB,W

				movwf		PORTB

				
 				

			



			




					END               	   ; fin de l'assemblage ici






					
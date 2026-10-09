; tutorial 1 en assembleur
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

;*********************************************************************************************************
; zone de déclaration des variables :
; directives CBLOCK... ENDC pour les variables non initialisées en GPR : mettre ici vos variables
; cf. cours complet page 158
			CBLOCK				0x20	; début zone données
; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :
tampon 			:	1
			ENDC						; fin zone de données

;*********************************************************************************************************
; directive DE pour les variables (semi permanentes) en EEPROM de données
; cf. cours complet page 160
; exemple :
;					ORG			0x2100
;					DE			"telecom"
;annee				DE			'1'
;code_pin			DE			0x01,0x05,0x07,0x09

;*********************************************************************************************************
; début de la zone de code implantée en EEPROM de programme
;*********************************************************************************************************
; directive ORG pour fixer une adresse d'implantation du code en mémoire
; cf. cours complet page 156

					ORG			0x0000		; vecteur de reset
					goto		main		; vers le début du programme

					ORG			0x0005		; pour un éventuel vecteur d'interruption en 0x0004

main
					movlw		0x08		; passage du paramètre de test
					call		abs			; appel du module abs pour le tester
					nop						; retour au main

;*********************************************************************************************************
; valeur absolue unsigned char abs(signed char)
; entrée : W contient le signed char
; sortie : W renvoie la valeur absolue
;*********************************************************************************************************
abs
					movwf		tampon

                                       btfss tampon, 7				;	andlw		0x80
				                                          	;btfsc		STATUS,Z

					goto		positif		

negatif				comf		tampon
					incf		tampon
																			
positif				movf		tampon,w
					
					return

					END						; fin de l'assemblage





				
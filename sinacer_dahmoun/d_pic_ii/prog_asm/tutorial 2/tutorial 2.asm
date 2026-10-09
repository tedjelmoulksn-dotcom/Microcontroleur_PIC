; tutorial 2 en assembleur
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
			CBLOCK				0x70	; début zone données
; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :
			ENDC						; fin zone de données

;*********************************************************************************************************
; déclaration variables initialisées nécessitant la fonction copy_init_data pour les initialiser
; de l'EEPROM vers la RAM
;*********************************************************************************************************

extern copy_init_data					; module copy_init_data situé dans le fichier int_data_bt.asm

I_DATA				IDATA				; pour la compatibilité avec le fichier script

compteur			DB		    0x00 ;0x00
chaine				DB		"j'aime la vie",00

;*********************************************************************************************************
; début de la zone de code implantée en EEPROM de programme
;*********************************************************************************************************
; directive ORG pour fixer une adresse d'implantation du code en mémoire
; cf. cours complet page 156

					ORG			0x0000			; vecteur de reset
					goto		main			; vers le début du programme

					ORG			0x0005			; pour un éventuel vecteur d'interruption en 0x0004

main
					call 		copy_init_data	; pour initialiser la chaîne de caractères
	
					
					movlw		chaine					
					movwf		FSR				
					bcf			STATUS,IRP

					call		string_length	
					nop							

;*********************************************************************************************************
; module string_length pour calculer la longueur d'une chaîne de caractères
; unsigned char string_length(* char)
; entrée : FSR contient l'adresse de la chaîne de caractères
; sortie : W contient la longueur de la chaîne
;*********************************************************************************************************
string_length
					clrf		compteur	
string_scan				
					movf		INDF,W		;ici W=INDF ici  on a acces au accumulateur adresse de l'accumulateur si w=0 then z=1
					btfsc		STATUS,Z	;on verifie la valeur de Z et  quil est pas nul on continue , sinon onsute d'instruction
					goto		string_end	;si Z=1 on saute pas et donc  a stringend donc on arrte d'ecrire sinon z=0et donc on contiue a ecrire 
					
					incf		compteur	;si on est dans cette ligne, ca veut dire que z nest pas nul, et la on incrimznte la  aleur de compteur 
					incf		FSR			

					goto		string_scan	; ici on continue jusqua avoir un Z nul

string_end				
					movf		compteur, w ;je chcerche ke nombre de cracatere et compteur comporte le nombre de caractere et donc W doit avoir le nombre de caracytere 				; ici le z est nulle et donc on a plus rien a ecrire on dans W egale =0
					return

					END						; fin de l'assemblage





				
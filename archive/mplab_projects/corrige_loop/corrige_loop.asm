; canevas pour les projets en assembleur
; à utiliser comme base de départ pour les nouveaux projets en assembleur
;*********************************************************************************************************
; directive list pour le type de PIC et le "radix"
; cf. cours complet page 152                
		list		p=16f877a, r=hex	; type de PIC et radix décimal

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
        STATUS      EQU     0x003
        portb       EQU     0x06

;*********************************************************************************************************
; zone de déclaration des variables :
; directives CBLOCK... ENDC pour les variables non initialisées en GPR : mettre ici vos variables
; cf. cours complet page 158
			CBLOCK				0x71	; début zone données
; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :
COUNT			:	1
tampon          :   1

			ENDC						; fin zone de données

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
main                clrf        COUNT
                    call        compteur
                    nop				
                                ; mettre ici les instructions de votre programme
;********************************************************************************************************************************************
compteur
				   
                    movf        COUNT,w  ;on copie le contenu de count dans w
                    movwf       portb    ;on copie de contenu de w dans port b
                    incf        COUNT   ;on increment count et on garde le resultat dans count
                    movlw       0x10     ; on mets l dans w
                    subwf       COUNT,w   ; on sustrait 0x10 de count et on garde la valeur dans w si la valeur c'est zero alors on aura compteur de 0 a 16
                 
					btfss       STATUS,Z   ; on verifie la valeur du flag Z  si Z=1 alors COUNT=w=16 et donc on sort de la boucle
                    goto        compteur   ; z=0 on compte a nouveau
                    
                        ;z=1 on arrete
					return	
;*********************************************************************************************************************************************				



					END               	   ; fin de l'assemblage ici
					
					
					
;PROBLEME
;pour qu'il recommence a zero en permanence il faut que le second goto   compteur
;a la ligne 83 je n'arrive pas a mettre le resultat de l'operation dans w puisque ca refuse la virgule
;confere page 162 du cours complet!!!!!
















;compteur
				   
                   ; movf        COUNT,w  ;on copie le contenu de count dans w
                    ;movwf       portb    ;on copie de contenu de w dans port b
                   ; incf        COUNT   ;on increment count et on garde le resultat dans count
                   ; movf        COUNT,w
                   ; movf        tampon,w
                   ; movlw       0x0F     ; on mets l dans w
                    
                   ; subwf       COUNT,w ; on sustrait 0x10 de count et on garde la valeur dans w si la valeur c'est zero alors on aura compteur de 0 a 16
                   ; movf        tampon,w
				;	btfss       STATUS,Z   ; on verifie la valeur du flag Z  si Z=1 alors COUNT=w=16 et donc on sort de la boucle
                    ;goto        compteur   ; z=0 on compte a nouveau
                    
                        ;z=1 on arrete
				;	return	


					;end
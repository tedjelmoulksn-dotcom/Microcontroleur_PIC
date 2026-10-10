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
; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :
tampon			:	1
tampon_2        :   1
tampon_1ms      :   1
tampon_200ms    :   1
tampon_1s       :   1
tampon_p_s      :   1
tampon_ms_s     :   1

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
					;pour parametrer en seconde alors on appelle tempo_p_s   | pour parametrer en ms
main		
                   ; movwf       3;ici on mets la valeur fixe voulue          | idem
         	        call	   delay_1ms  ;1003 cycles
         	                                                                 ;| call tempo_ms_s
					nop			                                             ;| nop

          
;**********************************************************************************************************************************
;debbut des differents modules utilisés      TEMPORISATION PARAMETRABLE et  FIXE         

;********************************************************************************************************************************************************
;pour avoir une seconde,il suffit de compter 4ms 250fois ou bien 1000 fois tempo_1ms
;delay_1s          
 ;                  movlw        5  ;pour pouvoir appeler tempo_200ms 5fois  200ms*5=1s
  ;                 movwf        tampon_1s
;delay_1s_encore    call         delay_200ms 
 ;                  decfsz       tampon_1s,f ; on decremente la variable de 250 a zero
  ;                 goto         delay_1s_encore ;tant qu'il n'est pas egale a zero on continue a appeler tempo_4ms
   ;                return                                        
                   
;*********************************************************************************************************************************************************                   
                   
 ;ici,on appelle tempo_1ms 4 fois pour cela on initialise une variable a 4 et on decremente de 4 a zero et puis on sort de la boucle                  
;delay_200ms    
;                    movlw       200  ;pour pouvoir appeler temp_1ms 4 fois
;                    movlw       tampon_200ms
;delay_200ms_encore    call      delay_1ms
 ;                   decfsz      tampon_200ms,f
 ;                   goto        delay_200ms_encore
 ;                   return
                
;*********************************************************************************************************************************************************

                   
delay_1ms
                    movlw       4     ; 4*250us=1ms
                    movwf       tampon_1ms
delay_1ms_encore    call        delay_250
                    decfsz      tampon_1ms,f
                    goto  		delay_1ms_encore 
					return
;**********************************************************************************************************************************************************					
					                   
                   
delay_250				
					movlw		79
					movwf		tampon
				;	movlw       2
				;	movwf       tampon_2					
encore				decfsz		tampon,f
					goto		encore					
;encore_2            decfsz		tampon_2,f
;					goto		encore_2
					nop
					nop
					nop
					nop
					nop

					return					

;************************************************************************************************************************************************************ 
;Debut des modules de TEMPORISATION PARAMETRABLE
;si on veut que la temporisation varie alors on initialise la valeur voulue dans la fonction main et dans les differents modules on appelle les fonctions
;concerné ici tempo_1s et tempo_1ms ce nombre de fois
;lappel est implementer en decrementant la variable jusqu'a la valeur zero

;********************************************************************************************************************************************************
;TEMPORISATION PARAMETRABLE EN MILISCONDES
;delat_ms_s	
;		            movwf      tampon_ms_s    ;si w=4, alors on appelle tempo_1ms 4 fois et mettant ca dans la variable et en le decrementant
;delay_ms_s_encore   call       delay_1ms
;                    decfsz     tampon_ms_s,f
;                    goto       delay_ms_s_encore
;                    
;                    return
                    
;*********************************************************************************************************************************************************
;TEMPORISATION PARAMETRABLE EN SECONDES
;delay_p_s
	               
		           ; movf      tampon_p_s,w  ;si w=4, alors on appelle tempo_1ms 4 fois et mettant ca dans la variable et en le decrementant
;delay_p_s_encore    ;call       tempo_1s
                    ;decfsz     tampon_p_s,f
                    ;goto       tempo_p_s_encore
                    
                    ;return
;********************************************************************************************************************************************************

					END                            

             	   ; fin de l'assemblage ici






					
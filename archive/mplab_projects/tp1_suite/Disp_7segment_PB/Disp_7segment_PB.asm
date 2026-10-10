; canevas pour les projets en assembleur
; à utiliser comme base de départ pour les nouveaux projets en assembleur
;*********************************************************************************************************
; directive list pour le type de PIC et le "radix"
; cf. cours complet page 152                
		list		p=16f877a, r=dec	; type de PIC et radix décimal
0
;*********************************************************************************************************
; directive #include pour les fichiers d'inclusion
; cf. cours complet page 152 	
		#include	<p16f877a.inc>		; fichier d'inclusion mapping et noms registres SFR et bits SFR
		extern		tempo_test,delay_200ms,delay_ms
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
			PORTB		EQU		0X06
			TRISB		EQU		0x86 ;trisb register 
		
		
			LED_D2_BIT	EQU		0x20	
				n	EQU		0x21  ; avec les 20000 et les 40000 les nombre de cycluye
				ms	EQU		0x23
			LATB		EQU		0x24 ;
			count		EQU		0x25
			status		EQU		0x26
;*********************************************************************************************************
; zone de déclaration des variables :
; directives CBLOCK... ENDC pour les variables non initialisées en GPR : mettre ici vos variables
; cf. cours complet page 158
			CBLOCK				0x71	; début zone donnée
;latb register 
; syntaxe :
; nom_variable 	:	taille_variable (en nombre d'octets). Et donc ici :
;compteur			:	1
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
; voir exemple dans le tutorial 2
; tempo			DB		5

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
					goto			main		; vers le début du programme
											; pour un éventuel vecteur d'interruption en 0x0004

					ORG			0x0005	





main				;en permnence
		
 			call		init_port			;pour initialiser la portbb on appel la fonction init
		  ;on allume la led

			movlw		0x90
			movwf		count
			call		led_D2_on
			movlw		0xFF
			call		delay
			



			call		led_D2_off
			movlw		0x95
			movwf		count
			call		led_D2_off
			movlw		0xC8
			call		delay
		
				
		
			
			
			goto		main








init_port  ; on veut configuerer ble portb et donc on nutilise le trisb b 			
			

				movlw	0x00
				tris	PORTB
				clrf	PORTB	
				return



led_D2_on		 ;module pour led on 
			;banksel	LATB_ADDRESS  ;pour acceder au regsiter de latb	
			bsf		PORTB,0   ; pour allumer la led 
			return

led_D2_off
		;	bansel	LATB_ADDRESS
			bcf		PORTB,0  
			return
;temporisation


									








	
; mettre ici les instructions de votre programme
tempo	movlw 0xF8 ; W=248;
			movwf n ; load counter n=W
repeat		nop
			decfsz n,f ; n=n-1, n=0?
			goto repeat ; not 0, jump to repeat
			nop
			nop
			nop
			return ; end delay

delay		
				movwf	ms       ; Charge le compteur m avec la valeur de ms 

loop_delay
				call	tempo 		; Appel de la fonction tempo_test
    				decfsz	ms, f  		 	; Décrémenter m, saute à loop_delay_ms si m != 0
   			 	goto	loop_delay

				return  





END
					
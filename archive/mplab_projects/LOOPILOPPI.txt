tempo_test	movlw 0xF8 ; W=248;
			movwf n ; load counter n=W
repeat		nop
			decfsz n,f ; n=n-1, n=0?
			goto repeat ; not 0, jump to repeat
			nop
			nop
			nop
			return ; end delay

delay_ms		
				movwf	ms       ; Charge le compteur m avec la valeur de ms 

loop_delay_ms
				call	tempo_test 		; Appel de la fonction tempo_test
    			decfsz	ms, f  		 	; Décrémenter m, saute à loop_delay_ms si m != 0
   			 	goto	loop_delay_ms

				return     
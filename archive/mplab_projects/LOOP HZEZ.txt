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
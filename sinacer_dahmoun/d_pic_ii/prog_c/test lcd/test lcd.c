 
// Programme canevas de base pour démarrer une application en C
// avec l'outil HI-TECH Software PICC 
// sur la carte PICDEM 2 PLUS DEMO BOARD 

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets
#include "lcdbt.h"

//#include <stdio.h> 

#define bit(x) (1<<(x))

 __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
int i;
void main(void)
{
	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();					// initialise le LCD

//	print_char('A');				// fonction à écrire

	print_string("Le PIC 16F877");			// fonction à écrire
	goto_ligne_2();					// fonction à écrire			
	print_string("c'est fastoche");			// fonction à écrire
	tempo_N_ms(3000);
	efface();					// fonction à écrire
for(i=1;i<17;i++)
	{
	go_to(i);					// fonction à écrire
	print_char(0xFF);
	tempo_N_ms(100);
	}
	go_to(17);
	print_string("   READY !!!"); 			// fonction à écrire
	
	while(1);	
}	

	

 
/*Tutorial en C avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS */

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))		// Décalage du 1 de x bits sur la gauche car opérateur <<
							// Plus besoin de calculer soit-meme les masques en hexa

// __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );

char	debug	@0x70;		// éviter conflits avec ICD3

// Initialisation à 0 de la sortie de la porteB
void init_port(void)
{
	TRISB=TRISB & (~bit(0));		// Mise à 0 de TRISB
}

// Permet d'allumer la led D2
void allume_led_D2(void)
{
	RB0 = 1;				// Mettre l'entrée 0 de PORTB à 1 
}

// Permet d'éteindrela led D2
void eteint_led_D2(void)
{
	RB0 = 0;				// Mettre l'entrée 0 de PORTB à 0	
}

// temporsiation fixe de 1 s
void tempo1s(void)
{
	// à compléter par vos soins
}

void main(void)

{
	init_port();
	while(1)
	{
	allume_led_D2();
	tempo1s();
	eteint_led_D2();
	tempo1s();
	}
}	

	

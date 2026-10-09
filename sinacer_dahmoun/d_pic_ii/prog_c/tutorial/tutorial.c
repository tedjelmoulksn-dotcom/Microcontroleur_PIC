 
/*Tutorial en C avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS */

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))		// à commenter

// __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );

char	debug	@0x70;		// éviter conflits avec ICD3

// commenter cette fonction
void init_port(void)
{
	TRISB=TRISB|bit(0);		// commenter cette ligne et corriger la
}

// commenter cette fonction
void allume_led_D2(void)
{
	RB0 = 1;				// commenter cette ligne
}

// commenter cette fonction
void eteint_led_D2(void)
{
	RB0 = 0;				// commenter cette ligne	
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

	

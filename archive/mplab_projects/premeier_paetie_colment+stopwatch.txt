 
/*Tutorial en C avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS */

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets

#include <stdio.h> 

#define bit(x) (1<<(x))		// Décalage du 1 de x bits sur la gauche car opérateur <<
							// Plus besoin de calculer soit-meme les masques en hexa

// __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );

char	debug	@0x70;		// éviter conflits avec ICD3
int		count=0 ;
int		i=0 ;
int 	j=0;

// Initialisation à 0 de l'entree de la porteB
void init_port(void)
{
	TRISB=TRISB & (~bit(0));		// Mise à 0 de TRISB
}

// Permet d'allumer la led D2
void allume_led_D2(void)
{
	RB0 = 1;				// Mettre l'sortie 0 de PORTB à 1 
}

// Permet d'éteindrela led D2
void eteint_led_D2(void)
{
	RB0 = 0;				// Mettre l'sortie 0 de PORTB à 0	
}

// temporsiation fixe de 1 s

void tempo1ms (void)
{ 
	 for(count=0 ; count < 0x34 ; count ++ );

}
void delay_1s(void)
{
	for(j=0 ; j < 935 ;j ++ )
	{
		tempo1ms();

	}
}

void main(void)

{
	init_port();
	while(1)
	{
	allume_led_D2();
	delay_1s();
	eteint_led_D2();
	delay_1s();
	}
}	

	
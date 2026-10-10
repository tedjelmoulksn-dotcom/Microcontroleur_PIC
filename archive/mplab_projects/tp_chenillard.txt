 
/*Tutorial en C avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS */

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets

#include <stdio.h> 

#define bit(x) (1<<(x))		// Décalage du 1 de x bits sur la gauche car opérateur <<
							// Plus besoin de calculer soit-meme les masques en hexa
 __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
#define		D2		0
#define		D3		1
#define		D4		2
#define		D5		3
#define		on		1
#define		off		0

char	debug	@0x70;		// éviter conflits avec ICD3
int		count=0 ;
int		i=0 ;
int 	j=0;












void led(unsigned int led,unsigned int action)
{ 
	if (action==off)

		{ 
			if(	led==D2)
			RB0=0;


			if (led==D3)
			RB1=0;

			if	(led==D4)
			RB2=0;

			if	(led==D5)
			RB3=0;

		}

	else
			{ 
			if(	led==D2)
				RB0=1;

			if (led==D3)
				RB1=1;

			if (led==D4)
				RB2=1;

			if (led=D5)
				RB3=1;
			}
}

void delay_ms(unsigned int ms)

{
			int j=0;

			for(j=0 ; j < ms ;j ++ )
			{
				 for(count=0 ; count < 0x34 ; count ++ );

			}		
}







/*void tempo1ms (void)
{ 
	

}*/



// Initialisation à 0 de l'entree de la porteB
void init_port(void)
{
	TRISB2=0;		// Mise à 0 des TRISB
	TRISB3=0;
	TRISB4=0;
	TRISB5=0;
}

// Permet d'allumer la led D2


/*void allume_led_D2(void)
{
	RB0 = 1;				// Mettre l'sortie 0 de PORTB à 1 
}

// Permet d'éteindrela led D2
void eteint_led_D2(void)
{
	RB0 = 0;				// Mettre l'sortie 0 de PORTB à 0	
}
*/
// temporsiation fixe de 1 s



/*void delay_1ms(void)
{
	for(j=0 ; j <935 ;j ++ )
	{
		tempo1ms();

	}
}*/

	
void main(void)

{
	init_port();  //pour initilaiser les sorties a zero 
	led(D2,off);
	led(D3,off);
	led(D4,off);
	led(D5,off);


	while(1)
	{

	led(D2,on);
	delay_ms(187);
	led(D2,off);

	led(D3,on);
	delay_ms(187);
	led(D3,off);

	led(D4,on);
	delay_ms(187);
	led(D4,off);

	led(D5,on);
	delay_ms(187);
	led(D5,off);
	}
}


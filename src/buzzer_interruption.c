 
/*Tutorial en C avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS */

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))		// Décalage du 1 de x bits sur la gauche car opérateur <<
int count; 							// Plus besoin de calculer soit-meme les masques en hexa

__CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );

char	debug	@0x70;	
int	i=0;
int	j=0;
int k=0;
	// éviter conflits avec ICD3

// Initialisation à 0 de la sortie de la porteB

void init_port(void)
{
	TRISB = TRISB & (bit(0));		// Mise à 0 de TRISB
	TRISC = TRISC & (~bit(2);
}
/*Permet d'allumer la LED*/


/*Permet d'eteindre la LED*/ 



/*temporisation de 1ms*/
void tempo1ms (void)
{ 
	 for(i=0 ; i < 0x34 ; i ++ );
		
}


/*temporisation de 1s*/
void delay_1s(void)
{
	for(j=0 ; j <935 ;j ++ )
	{
		tempo1ms();

	}
}

/*Temporisation parametrable*/
void delay_ms(unsigned int ms)

{

			for(j=0 ; j < ms ;j ++ )
			{
				 for(i=0 ; i < 0x34 ; i ++ ); /*fonction delay_1ms*/

			}		
}
/*Cette fonction allume le buzzer pendant un moment donc doit l'eteindre ensuite */
void BUZER_on (void)
{
	for( k=0 ; k<200 ; k++)
	{
		delay_ms(1);
		RC2 = 1;
		delay_ms(1);
		RC2 = 0;
	}
}

/*Permet d'eteindre le buzzer */
void BUZER_off(void)
{
	RC2=0;
}


/*C'est une routine appelé en réponse a une interruption, elle 
compte le nombre de fois ou le buzzer a été activé et emet un signal
sonor ou pas selon les conditions dans le main  */

void interrupt_traitement_it(void)
{
	INTF = 0;
	count ++;
}


void main(void)

{
	init_port();
	INTEDG = 0;    /*On souhaite detecter le front descendant */
	INTE = 1;
	GIE = 1; 
	INTF = 0;
	count = 0;
	while(1)
	{
		if (count == 8)
		{ 
			count = 0;
		}
		if (count<5)
		{
			BUZER_off();
		}
		else if (count>=5)	
		{
			BUZER_on();
		}
	}
}	

	

 
/*Programme canevas de base pour démarrer une application en C
avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS DEMO BOARD */

#include "pic.h"		// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))

 __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );


char	debug	@0x70;		// éviter conflits avec ICD3
int		count;
int		i;
int		j;


// mettre ici votre programme en C


void	init_port (void)
{
		TRISA4=1;
		TRISB0=0;
}	

void	led_D2_on(void)
{
	RB0=1;
}

void	led_D2_off(void) 
{
	RB0=0;
}

void tempo1ms (void)
{ 
	 for(i=0 ; i < 0x34 ; i ++ );
		
}
void delay_1s(void)
{
	for(j=0 ; j <935 ;j ++ )
	{
		tempo1ms();

	}
}


void	main(void)

{
				delay_1s();

	init_port();
	RB0=0;
	
	while(1)
	{
		count=0;
		
		
		while(RA4==0)
		{
			led_D2_on();
			delay_1s();
			
			while (RA4==1 && count<5)
			{
				count++;
				delay_1s();
			
			}
			led_D2_off();
			delay_1s();
		}
	
	
	
	}
}









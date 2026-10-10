 
/*Programme canevas de base pour démarrer une application en C
avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS DEMO BOARD */

#include "pic.h"		// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))
#define	T0max	0xFF		//la valeur maximale de t0max car on est en hexa (255)	

__CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );


char	debug	@0x70;		// éviter conflits avec ICD3
											
unsigned	int	k;

											//	unsigned	char	TIMER_IF=0;
int	i;											
int	N;
int	j;
unsigned	char	TOIF=0;



void delay_1s(void)
{
	int i=0;
	T0CS = 0;
    PSA = 0;
    PS2 = 0;
    PS1 = 1;
    PS0 = 1;

    TMR0 = 0x06;
    T0IF = 0;
    for (i=0; i<250; i++)
    {
        while(!T0IF);
        T0IF = 0;
        TMR0 = 0X06;
    }
}
void delay_s(int	N)
{
int j=0;
for(j=0;j<=N;j++)
{
delay_1s();
}
}

// Initialisation à 0 de la sortie de la porteB
void init_port(void)
{
	TRISB0=0;		// Mise à 0 de TRISB
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


void main(void)

{

init_port();

while(1)
{
allume_led_D2();
delay_s(4);
eteint_led_D2();
delay_s(2);
}
}


	
     
// Programme canevas de base pour d marrer une application en C
// avec l'outil HI-TECH Software PICC 
// sur la carte PICDEM 2 PLUS DEMO BOARD 

#include "pic.h"			// vos headers associ s
#include "pic168xa.h"		//   vos projets
#include "lcdbt.h"

//#include <stdio.h> 

#define bit(x) (1<<(x))

 __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
int i;
int	N;
int	j;


void	init_PORTD (void)
{
	TRISD0=0;
	TRISD1=0;
	TRISD2=0;
	TRISD3=0;
	TRISD4=0;
	TRISD5=0;
	TRISD6=0;
	TRISD7=0;
}
void LCD_ON (void)
{
	init_PORTD();
	VCC=1;			//selon le shema , c'est pour avoir une ddp; jai le 5 volt mais pas le 0 mais greg ma dit de mettre a 1
}


void allume_LCD(void)
{ 

LCD_ON();

	
}
void delay_ms(int N)
{
	int i=0;
	T0CS = 0;
    PSA = 0;
    PS2 = 0;
    PS1 = 1;
    PS0 = 1;

    TMR0 = 0x06;
    T0IF = 0;
	int j=0;
	for(j=0;j<=N;j++)	//a verifier ca aussi 
		{


    			for (i=0; i<40; i++)	// ici la valeur de ui permet de fiare une ms 
    			{
					while(!T0IF);
					T0IF = 0;
        			TMR0 = 0X06;
    			}
		}

}
void init_LCD(void)
{
    delay_ms(15); // Stabilisation du LCD
    ecriture_commande(0x03); // Function set: 8-bit mode
    delay_ms(5);

    ecriture_commande(0x03); // Function set: 8-bit mode
    delay_ms(1);

    ecriture_commande(0x03); // Function set: 8-bit mode
    delay_ms(1);

    ecriture_commande(0x02); // Function set: Switch to 4-bit mode
    delay_ms(1);

    // Initialization sequence continues in 4-bit mode
    ecriture_commande(0x28); // Function set: 4-bit mode, 2 lines, 5x8 font
    delay_ms(1);

    ecriture_commande(0x0C); // Display control: Display ON, Cursor OFF, Blink OFF
    delay_ms(1);

    ecriture_commande(0x01); // Clear display
    delay_ms(2);

    ecriture_commande(0x06); // Entry mode set: Increment cursor, No display shift
    delay_ms(1);
}



void ecriture_commande(char commande)
{
	attente_bf(); 				//attente que le busy flag oasse à 0
	RW=0;					// écriture
	RS=0;					// dans IR
	LCD_PORT=((commande>>4)&0x0F)|0x80;	// poids fort commande
										// avec maintien de VCC						
	EN=1;					// valide le LCD
	EN=0;					// fin de l'écriture

	LCD_PORT=(commande&0x0F)|0x80; 		// poids faible commande
									// avec maintien de VCC
	EN=1;					// valide le LCD
	EN=0;					// fin de l'écriture
}


void print_char(char character) {
    RS = 1;  // Set RS to 1 for data mode
    RW = 0;  // Set RW to 0 for write mode
    EN = 0;  // Set EN to 0 initially

    // Send high nibble (4 most significant bits) of the character
    LCD_PORT = (LCD_PORT & 0x0F) | (character & 0xF0);  // Mask and set high nibble
    EN = 1;   // Enable LCD
    delay_ms(1);   // Short delay
    EN = 0;   // Disable LCD

    // Send low nibble (4 least significant bits) of the character
    LCD_PORT = (LCD_PORT & 0x0F) | ((character << 4) & 0xF0);  // Shift and set low nibble
    EN = 1;   // Enable LCD
  	delay_ms(1);   // Short delay
    EN = 0;   // Disable LCD

    // Wait for the character execution time
    delay_ms(1);  // Short delay
}



void main(void)
{
	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();					// initialise le LCD

	print_char('A');				// fonction    crire

	/*print_string("Le PIC 16F877");			// fonction    crire
	goto_ligne_2();					// fonction    crire
	print_string("c'est fastoche");			// fonction    crire
	tempo_N_ms(3000);
	efface();					// fonction    crire
	for(i=1;i<17;i++)
	{
	go_to(i);					// fonction    crire
	print_char(0xFF);
	tempo_N_ms(100);
	}
	go_to(17);
	print_string("   READY !!!"); 			// fonction    crire

	while(1);*/
}



    

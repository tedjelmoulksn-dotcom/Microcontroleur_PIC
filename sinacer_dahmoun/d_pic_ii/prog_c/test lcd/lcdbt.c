// fonctions de pilotage du LCD en 4 bits mode

#include 	"pic.h"			// vos headers associés
#include 	"pic168xa.h"		// à vos projets
#include	"lcdbt.h"

//*************************************************************
// fonctions de temporisation utilisant le TIMER0
// voir dans le polycopié de cours figure VIII.74
//*************************************************************
void tempo_1_ms(void)
{

		while(!T0IF);				// on attend que T0IF passe à 1
		T0IF=0;
}
//*************************************************************
void tempo_N_ms(int N)
{
		// initialisation de OPTION 
		OPTION=OPTION & 0b11000001;
		TMR0=6;					// pour avoir 1ms pour tempo_1_ms
		T0IF=0;					// efface le flag T0IF
	
		while(N--)	tempo_1_ms();		// appelle N fois tempo_1_ms
}
//*************************************************************
//*************************************************************
// fonctions de pilotage du LCD
//*************************************************************

//*************************************************************
// direction des lignes du PORTD
//*************************************************************
void init_PORTD(void)
{

// fonction à écrire
	
}

//*************************************************************
// pour allumer le LCD
//*************************************************************
void allume_LCD(void)
{ 

// fonction à écrire
	
}


//*************************************************************
// pour lire le registre IR
// renvoie le contenu de IR
//*************************************************************
unsigned char lecture_commande (void)
{
	unsigned char commande, quartet_commande;
	LCD_PORT_TRIS=0x0F;				// ici RD3 à RD0 en entrée
	RW=1;						// lecture
	RS=0;						// de IR
	tempo_N_ms(2);					// stabilisation de RS (1ms avec TIMER2)
	EN=1;						// front montant valide le LCD
	quartet_commande=LCD_PORT;			// lecture qaurtet fort
	commande=((quartet_commande<<4)& 0xF0); 	// mis en place
	EN=0;						// front descendant fin lecture
	EN=1;						// front montant valide le LCD
	quartet_commande=LCD_PORT;			// lecture qaurtet faible
	commande=commande|(quartet_commande & 0x0F); 	// mise en place
	EN=0;						// front descendant	fin lecture
	RW=0;						// retour écriture
	LCD_PORT_TRIS=0x00;				// tout le PORT LCD en sortie
	return(commande);
}

//*************************************************************	
// fonction "bloquante" de test du BUSY FLAG
// attend que le BUSY FLAG passe à 0
//*************************************************************
void attente_bf(void) 
{
	while (lecture_commande( ) & BUSY_FLAG); //attend que BF passe à 0
}
		
//*************************************************************
// fonction d'envoi d'une commande dans IR
// avec test du busy flag
//*************************************************************
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

//*************************************************************
// fonction pour initialiser le LCD 
// conforme à l'organigramme constructeur
//*************************************************************
void init_LCD(void)
{
	tempo_N_ms(30);			// 30 ms
	LCD_PORT_TRIS=0x00;		// PORT_LCD entier en sortie
	VCC=1;				// maintien VCC
	RS=0;
	EN=0;
	RW=0;
// fonction set DB7=0=RD3 DB6=0=RD2 DB5=1=RD1 DB4=1=RD0	
	LCD_PORT=LCD_PORT|0x03;
	EN=1;				// valide le LCD
	EN=0;				// fin de l'écriture
	tempo_N_ms(30);			// 30 ms				

// fonction set DB7=0=RD3 DB6=0=RD2 DB5=1=RD1 DB4=1=RD0	
	LCD_PORT=LCD_PORT|0x03;
	EN=1;				// valide le LCD
	EN=0;				// fin de l'écriture
	tempo_N_ms(30);			// 30 ms				

// fonction set DB7=0=RD3 DB6=0=RD2 DB5=1=RD1 DB4=1=RD0	
	LCD_PORT=LCD_PORT|0x03;
	EN=1;				// valide le LCD
	EN=0;				// fin de l'écriture
	tempo_N_ms(30);			// 30 ms	

// DL = 0 4 bits interface
// N=1 afficheur 2 lignes
// F=0 5*7 pixels/char
	ecriture_commande(0x28);
	
// Display on, curseur on et clignotant
	ecriture_commande(0x0F);	

// commande d'effacement du LCD
	ecriture_commande(0x01);
	
// Mode de fonctionnement en entrée (entry mode set)
// incrémenation automatique 
// pas de décalage	
	ecriture_commande(0x06);
}

//*************************************************************
// fonction d'envoi un caractère dans DR
// on envoie le code ASCII du caractère
//*************************************************************
void print_char(char car)
{

// fonction à écrire

}

//*************************************************************
// fonction d'envoi d'une chaîne de caratères vers le LCD 
// l'argument est un pointeur sur la chaîne
//*************************************************************
void print_string(char * s)
{

// fonction à écrire

}

//*************************************************************
// fonctions de gestions du curseur du LCD
//*************************************************************
// curseur en début de la ligne 1
//*************************************************************
void goto_ligne_1(void)	
{

// fonction à écrire

}

//*************************************************************		
// curseur en début de la ligne 2
//*************************************************************
void goto_ligne_2(void)	
{

// fonction à écrire

}	
//*************************************************************
// décalage à droite du curseur
//*************************************************************
void curseur_droite(void)
{

// fonction à écrire

}
	
//*************************************************************
// décalage à gauche du curseur
//*************************************************************
void curseur_gauche(void)
{

// fonction à écrire

}
	
//*************************************************************
// décalage à droite de l'écran
//*************************************************************
void ecran_droite(void)
{

// fonction à écrire

}
	
//*************************************************************
// décalage à gauche du curseur
//*************************************************************
void ecran_gauche(void)
{

// fonction à écrire

}	

//*************************************************************
// place le curseur sur la position x
// x = 1 à 16 	:ligne 1
// x = 17 à 32 	:ligne 2
//*************************************************************
void go_to (int x)
{

// fonction à écrire

}
	
//*************************************************************
// efface le LCD
//*************************************************************
void efface(void)
{

// fonction à écrire

}
		
//*************************************************************
//*************************************************************
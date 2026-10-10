    // header pour l'interface LCD
// c?bl?e en mode 4 bits 


// affectation du LCD sur le PORTD
#define 	LCD_PORT		PORTD
#define 	LCD_PORT_TRIS	TRISD

// c?blage hardware du LCD sur la carte PICDEM 2 PLUS
// quartet fort du PORTD
#define 	RS				RD4 
#define 	RW				RD5	// ? compl?ter
#define 	EN				RD6	// ? compl?ter	
#define 	VCC				RD7	// ? compl?te
// le quartet faible du PORTD RD3 ? RD0 est reli? 
// respectivement sur DB7 ? DB4 du LCD
// pas de define ? faire car lecture ou ecriture
// sur les 4 bits ? la fois

// pour la configuration du PORTD 0 = Output et 1 = Input
#define 	RS_TRIS			TRISD4 
#define 	RW_TRIS			TRISD5	// ? compl?ter
#define 	EN_TRIS			TRISD6	// ? compl?ter
#define 	VCC_TRIS		TRISD7	// ? compl?ter

// rep?rage du Busy_flag
#define 	BUSY_FLAG		0x80


// les prototypes de fonctions
void tempo_1_ms(void);
void tempo_N_ms(int);
void init_PORTD(void);
void allume_LCD(void);
unsigned char lecture_commande (void);
void attente_bf(void);
void ecriture_commande(char);
void init_LCD(void);
void print_char(char);					// fonction ? ?crire		
void print_string(char *);				// fonction ? ?crire
void goto_ligne_1(void);				// fonction ? ?crire				
void goto_ligne_2(void);				// fonction ? ?crire
void curseur_droite(void);				// fonction ? ?crire
void curseur_gauche(void);				// fonction ? ?crire
void ecran_droite(void);				// fonction ? ?crire
void ecran_gauche(void);				// fonction ? ?crire
void go_to (int);					// fonction ? ?crire
void efface(void);					// fonction ? ?crire




    

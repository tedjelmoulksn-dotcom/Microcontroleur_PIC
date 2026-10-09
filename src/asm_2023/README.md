# Assembleur PIC16F877A — exercices de 2023

Premiers exercices en assembleur MPASM (janvier–février 2023), écrits à partir du canevas de projet fourni en TP (en-tête, directives `list`, `__CONFIG`, zone `CBLOCK`).

| Fichier | Contenu |
|---|---|
| `appuie_bouton.asm` | Attente active d'un appui sur le bouton relié à RA4 (`btfss PORTA,4` puis `goto`) |
| `corrige_loop.asm` | Compteur de 0 à 15 affiché sur le PORTB : incrément de `COUNT`, soustraction de `0x10`, test du drapeau Z de `STATUS` pour sortir de la boucle |
| `Disp_7seg_PB.asm` | Clignotement de la LED RB2 avec temporisations externes (`delay_100ms`, `delay_200ms`) et table de codes 7 segments par saut calculé (`addwf pcl,f` + `retlw`) |
| `Disp_7segment.asm`, `tempo.asm`, `corrige_operation.asm` | Même série : affichage 7 segments, routines de temporisation, opérations arithmétiques — **à documenter** |

Remarques :

- Les fichiers fournis par l'enseignant (`init_data_bt.asm`, `P16F877A.INC`, script d'édition de liens `16f877a.lkr`) ne sont pas copiés ici ; ils sont nécessaires pour assembler.
- Dans `Disp_7seg_PB.asm`, les `movwf PORTC` placés après chaque `retlw` ne sont jamais exécutés ; le code est conservé tel quel.
- Les fichiers générés par MPLAB (`.hex`, `.lst`, `.o`, `.cof`, `.map`, `.mcw`) sont volontairement exclus.

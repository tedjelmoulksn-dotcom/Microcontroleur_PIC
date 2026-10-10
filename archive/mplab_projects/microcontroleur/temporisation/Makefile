# MPLAB IDE generated this makefile for use with GNU make.
# Project: temporisation.mcp
# Date: Fri Feb 23 11:57:57 2024

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

temporisation.cof : init_data_bt.o temporisations.o
	$(CC) "16f877a.lkr" "init_data_bt.o" "temporisations.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"temporisation.cof" /M"temporisation.map" /W

init_data_bt.o : init_data_bt.asm
	$(AS) /q /p16F877A "init_data_bt.asm" /l"init_data_bt.lst" /e"init_data_bt.err" /o"init_data_bt.o" /d__DEBUG=1

temporisations.o : temporisations.asm p16f877a.inc
	$(AS) /q /p16F877A "temporisations.asm" /l"temporisations.lst" /e"temporisations.err" /o"temporisations.o" /d__DEBUG=1

clean : 
	$(CC) "init_data_bt.o" "init_data_bt.err" "init_data_bt.lst" "temporisations.o" "temporisations.err" "temporisations.lst" "temporisation.cof" "temporisation.hex"


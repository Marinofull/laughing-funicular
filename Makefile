#MIT License
#
#Copyright (c) 2017 Marino Hohenheim
#Copyright (c) 2017 Jefferson Renè


CC = gcc
LEX = flex
CFLAGS =
LFLAGS =
BIN = lexico

all: dep
	$(CC) $(LFLAGS) lex.yy.c -o $(BIN)

dep: $(BIN).l
	flex $<

clean:
	rm -f *.yy.c

cleanAll:
	rm -f *.yy.c $(BIN)

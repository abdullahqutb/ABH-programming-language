all: lex lex.yy.c
	gcc -o program lex.yy.c
lex: lexFile.l
	lex lexFile.l
clean:
	rm -rf lex.yy.c program

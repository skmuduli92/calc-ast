fb1 : calc.l calc.y
	bison -d calc.y
	flex calc.l
	gcc -o $@ calc.tab.c lex.yy.c ast.c -lfl

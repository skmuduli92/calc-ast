
/* recoginising tokens for a calculator and print them out */
%{
#include "calc.tab.h"
%}

%%
"("       {return LPAREN;}
")"       {return RPAREN;}
"+"	      {return ADD;}
"-"	      {return SUB;}
"*"	      {return MUL;}
"/"	      {return DIV;}
"|"       {return ABS;}
[0-9]+    {yylval.d=atof(yytext); return NUMBER;}
[ \t]	    {}
\n	      {return EOL;}
.	        {printf("UNKNOWN CHARACTER: %c\n", *yytext);}

%%

/*int main() {

  int tok;

  while(tok = yylex()) {

    printf("%d", tok);
    if(tok == NUMBER)
      printf(" =  %d\n", yylval);
    else
      printf("\n");
  }

  return 0;
}*/

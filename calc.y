%{
#include "ast.h"
#include <stdio.h>
struct AstNode *calcTree = NULL;
%}

%union{
  /* put all types of expression */
  struct AstNode *a;
  double d;
}

/* declare tokens */
%token <d> NUMBER
%token ADD SUB MUL DIV ABS
%token EOL LPAREN RPAREN
%type <a> exp factor term

%%
calclist:
  | calclist exp EOL {calcTree = $2;}
  ;

exp: factor
  | exp ADD factor {$$ = create_node(EXP_ADD, $1, $3); }
  | exp SUB factor {$$ = create_node(EXP_SUB, $1, $3); }
  ;

factor: term
  | LPAREN exp RPAREN { $$ = $2; }
  | factor MUL term {$$ = create_node(EXP_MUL, $1, $3);}
  | factor DIV term {$$ = create_node(EXP_DIV, $1, $3);}
  ;

term: NUMBER  { $$ = create_term(EXP_VAL, yylval); }
  ;
%%

main(int argc, char **argv)
{
  yyparse();
  evaluate(calcTree);
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}

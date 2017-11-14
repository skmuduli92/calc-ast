#ifndef _AST
#define _AST
#define NULL 0

struct AstNode{
  int value;
  int type;

  struct AstNode *left, *right;
};



typedef enum {
  EXP_ADD,
  EXP_SUB,
  EXP_MUL,
  EXP_DIV,
  EXP_VAL
}expr_t;


struct AstNode *create_node(int type, struct AstNode *left, struct AstNode *right);
struct AstNode *create_term(int type, double value);
double evaluate(struct AstNode *root);


#endif

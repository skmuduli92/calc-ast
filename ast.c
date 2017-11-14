#include "ast.h"
#include <stdlib.h>
#include <stdio.h>

struct AstNode *create_node(int type, struct AstNode *left, struct AstNode *right) {
  struct AstNode *tempNode = (struct AstNode *) malloc(sizeof(struct AstNode));

  tempNode->left = left;
  tempNode->right = right;
  tempNode->type = type;
  tempNode->value = 0;
}

struct AstNode *create_term(int type, double value) {
  struct AstNode *tempNode = (struct AstNode *) malloc(sizeof(struct AstNode));

  tempNode->left = NULL;
  tempNode->right = NULL;
  tempNode->type = type;
  tempNode->value = value;
}

double evaluate(struct AstNode *root) {
  switch(root->type) {

      case EXP_ADD:
          return evaluate(root->left) + evaluate(root->right);
          break;
      case EXP_SUB:
          return evaluate(root->left) - evaluate(root->right);
          break;
      case EXP_MUL:
          return evaluate(root->left) * evaluate(root->right);
          break;
      case EXP_DIV:
          return evaluate(root->left) / evaluate(root->right);
          break;
      case EXP_VAL:
          return root->value;
          break;
      default:
          break;

  }
}

void freeTree(struct AstNode *root) {

  /* tree traversal and free all memory allocated */
  if(!root)
    return;

  free(root->left);
  free(root->right);

  free(root);

}

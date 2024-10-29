%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define YYSTYPE YYSTYPE // Define YYSTYPE for lex
#include "lexer.h" // The header file containing lexer token definitions and YYSTYPE

// Function prototypes
int yylex();
void yyerror(const char* s);

%}

// Token definitions from lexer.h
%token ID
%token INT_LITERAL
%token PLUS
%token MULTIPLY
%token LPAREN
%token RPAREN

// Define the precedence and associativity of operators
%left PLUS
%left MULTIPLY

%start E

%%
E   : T Q
    ;

Q  : PLUS T Q
    | /* epsilon */
    ;

T   : F W
    ;

W  : MULTIPLY F W
    | /* epsilon */
    ;

F   : LPAREN E RPAREN
    | ID
    | INT_LITERAL
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}

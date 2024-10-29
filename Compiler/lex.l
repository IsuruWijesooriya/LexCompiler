%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h" // The file containing yacc (parser) token definitions.
int global_variable;
%}

%%

[ \t\n]        ; // Ignore whitespaces and newlines.

"+"            { return PLUS; }
"*"            { return MULTIPLY; }
"("            { return LPAREN; }
")"            { return RPAREN; }

[a-zA-Z][a-zA-Z0-9]*  {
                      // In this case, we consider any sequence of letters and digits as an identifier (id).
                      // You may need to adjust this definition based on your specific requirements.
                      //yylval.str_val = strdup(yytext);
                      return ID;
                      }

[0-9]+         {
                      // For simplicity, we consider any sequence of digits as an integer literal.
                      // You may need to handle different types of literals in your assignment.
                      //yylval.int_val = atoi(yytext);
                      return INT_LITERAL;
                      }

.              { /* Ignore any other characters or symbols */ }

%%

int yywrap() {
    return 1; // Indicate that the input has been fully processed.
}
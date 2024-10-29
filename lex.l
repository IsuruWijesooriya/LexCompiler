%option noyywrap
%{
#include <stdio.h>
int global_variable;
%}

op [-|+|*|/|^|=]
number [0-9]+
letter [a-z|A-Z]
id {letter}({letter}|{number})*

%%
{op} {
    printf("operator found");
}
{number} {
    printf("number found: %d length: %d", atoi(yytext),yyleng);
}
{letter} {
    printf("letter found");
}
{id} {
    printf("Identifier: %s\n", yytext);
}

%%

int main()
{
    //file1 = "inputfile.txt";
    //yyin = fopen(file1, "r");
    yylex();
    return 1;
}

/*int yywrap()
{
    file1 = "inputfile2.txt";
    yyin = fopen(file1, "r");
    return 0;
}*/
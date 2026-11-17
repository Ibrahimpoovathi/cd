%{
#include <stdio.h>
int yylex();
int yyparse();
void yyerror(const char *s) { printf("Invalid Identifier\n"); }
%}

%token LETTER DIGIT

%%
stmt: id '\n' { printf("Valid Identifier\n"); return 0; }
    ;

id  : LETTER rest
    ;

rest: LETTER rest
    | DIGIT rest
    | /* empty */
    ;
%%

int main()
{
    printf("Enter identifier: ");
    yyparse();
    return 0;
}
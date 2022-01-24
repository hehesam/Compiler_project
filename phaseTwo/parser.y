%{
#include <stdio.h>
#define YYSTYPE double
int yyerror (char const *s);
extern int yylex (void);
%}
%token  PLS MNS
%token  MUL DIV
%token  NWL
%token  NUM
%token  LFT RIT
%left   PLS MNS
%left   MUL DIV
%%
Exp:    NUM             { $$ = $1; };
Exp:    Exp PLS Exp     { $$ = $1 + $3; };
Exp:    Exp MNS Exp     { $$ = $1 - $3; };
Exp:    Exp MUL Exp     { $$ = $1 * $3; };
Exp:    Exp DIV Exp     { $$ = $1 / $3; };
Exp:    LFT Exp RIT     { $$ = $2; };
Line:   NWL;
Line:   Exp NWL         { printf("%f\n", $1); };
;
%%
int yyerror(char const *s) {
  printf("%s\n", s);
}
int main(){
    int ret = yyparse();
    if (ret){
    fprintf(stderr, "%d error found.\n",ret);
    }
    return 0;
}
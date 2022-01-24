%{
    #include <stdio.h>
%}


%start input
%token Plus Minus Number Equal Mult Div Power

%left Plus Minus
%left Mult Div
%right Power



%%

start : 

%%

void yyerror(car *s){
    printf("Error happend %s", s);
}

int yywarp(){
    return 1;
}

int main(void){
    yyparse();
}
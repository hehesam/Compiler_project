%{
    #include <stdio.h>
%}

%token TOKEN_VOID TOKEN_INT TOKEN_CHAR TOKEN_LEFTPAREN TOKEN_RIGHTPAREN TOKEN_INDENTIFIER

%start input

%right TOKEN_ASSIGN 

%left TOKEN_LEFTBRACE TOKEN_LEFTBRACKET TOKEN_LEFTPAREN  TOKEN_RIGHTBRACE TOKEN_RIGHTBRACKET TOKEN_RIGHTPAREN

%%
input : 
            type main body
    ;

type : TOKEN_VOID 
        |   TOKEN_INT 
        |   TOKEN_CHAR 
    ;

main :  
            TOKEN_LEFTPAREN type TOKEN_INDENTIFIER TOKEN_RIGHTPAREN
    ;
full_body : 
            TOKEN_LEFTBRACE body_part TOKEN_RIGHTBRACE
    ;

body_part : 
            body_part 
        |   body_part Assign_value

;

value :
            TOKEN_CHAR_CONST 
        |   TOKEN_INT_CONST

;
Assign_value : 
            type TOKEN_INDENTIFIER TOKEN_ASSIGN value TOKEN_DOT
;
%%



void yyerror(char *s){
    printf("Error happend %s", s);
}
int yywarp(){
    return 1;
}


int main(void){
    yyparse();
}


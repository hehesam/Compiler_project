%{
    #include <stdio.h>
%}

%union {
    char name[20];
    int  number;  
}


%token TOKEN_MINUS TOKEN_INT_CONST TOKEN_CHAR_CONST TOKEN_ONELINE_COMMENT TOKEN_SEVERAL_LINE_COMMENT
%token TOKEN_LEFTBRACKET TOKEN_RIGHTBRACKET TOKEN_LEFTBRACE TOKEN_RIGHTBRACE TOKEN_LEFTPAREN
%token TOKEN_RIGHTPAREN TOKEN_COMMA TOKEN_DOT TOKEN_PLUS TOKEN_MULTI TOKEN_SLASH TOKEN_CARET
%token TOKEN_EXCLAMATION TOKEN_ASSIGN TOKEN_GREATER TOKEN_LESS TOKEN_LESSANDEQUAL
%token TOKEN_GREATERANDEQUAL TOKEN_EQUAL TOKEN_NOTEQUAL TOKEN_PIPE TOKEN_OR TOKEN_AMPERSAND TOKEN_AND
%token TOKEN_INT TOKEN_CHAR TOKEN_IF TOKEN_ELSE TOKEN_ELSEIF TOKEN_WHILE TOKEN_FOR TOKEN_RETURN
%token TOKEN_VOID TOKEN_MAIN TOKEN_CONTINUE TOKEN_BREAK TOKEN_INDENTIFIER
%token TOKEN_MINUS_MINUS TOKEN_PLUS_PLUS

%start start

%right TOKEN_ASSIGN 

%left TOKEN_LEFTBRACE TOKEN_LEFTBRACKET TOKEN_LEFTPAREN  TOKEN_RIGHTBRACE TOKEN_RIGHTBRACKET TOKEN_RIGHTPAREN


%type<val> TOKEN_INT_CONST
%type<name> TOKEN_CHAR_CONST

%%
start   : 
                grammer
        ;


grammer     :
                type main full_body
        ;



type : TOKEN_VOID 
        |   TOKEN_INT 
        |   TOKEN_CHAR 
    ;

main :  
            TOKEN_MAIN TOKEN_LEFTPAREN  TOKEN_RIGHTPAREN
    ;

full_body : 
            TOKEN_LEFTBRACE body_part TOKEN_RIGHTBRACE
    ;

body_part : 

        |   body_part Assign_value
        |   body_part conditional
        |   body_part for_loop

    ;

for_loop :
        TOKEN_LEFTPAREN variable_definition TOKEN_COMMA for_conditon TOKEN_COMMA step TOKEN_RIGHTPAREN body_part
        ;


for_conditon : 
        logical_actions logical_gate logical_actions
        ;

step 

conditional :
            TOKEN_IF condition full_body
        |   TOKEN_WHILE condition full_body
    ;

condition :
            TOKEN_LEFTPAREN TOKEN_INDENTIFIER logical_actions logical_gate logical_actions TOKEN_RIGHTPAREN 

        ;

logical_actions :
             TOKEN_INDENTIFIER
            |  TOKEN_CHAR_CONST
            |  TOKEN_INT_CONST

        ;

logical_gate  :
            TOKEN_LESSANDEQUAL
            |TOKEN_GREATERANDEQUAL
            |TOKEN_EQUAL
            |TOKEN_NOTEQUAL
            |TOKEN_AND
            |TOKEN_OR
        
        ;



Assign_value : 
            type TOKEN_INDENTIFIER TOKEN_ASSIGN value TOKEN_DOT
          
;


value :
            TOKEN_CHAR_CONST{printf("the string of constant_str is : %s", $1);} 
        |   TOKEN_INT_CONST {printf("the number of constant_int is : %d", $1);}
        |   TOKEN_INDENTIFIER

;
%%





int yywarp(){
}







int main(){
    FILE *inputFile = fopen("test_case.txt","r");
    yyin = inputFile;

    FILE *outputFile = fopen("Phase1_Tokens.txt", "w");
    yyout = outputFile;

    yyparse();

    return 0;
 }

void yyerror(char *s){
    printf("Error happend %s", s);
}
%{
    #include <stdio.h>
    
    extern  FILE* yyin;
    extern FILE* yyout;

    extern int yylineno;
    extern char* yytext;


%}


%union {
    char name[20];
    int  number;  
}


%token TOKEN_MINUS TOKEN_INT_CONST TOKEN_CHAR_CONST TOKEN_ONELINE_COMMENT TOKEN_SEVERAL_LINE_COMMENT
%token TOKEN_LEFTBRACKET TOKEN_RIGHTBRACKET TOKEN_LEFTBRACE TOKEN_RIGHTBRACE TOKEN_LEFTPAREN
%token TOKEN_DIVIDE TOKEN_CARET TOKEN_MOD
%token TOKEN_RIGHTPAREN TOKEN_COMMA TOKEN_DOT TOKEN_PLUS TOKEN_MULTI TOKEN_SLASH
%token TOKEN_EXCLAMATION TOKEN_ASSIGN TOKEN_GREATER TOKEN_LESS TOKEN_LESSANDEQUAL
%token TOKEN_GREATERANDEQUAL TOKEN_EQUAL TOKEN_NOTEQUAL TOKEN_PIPE TOKEN_OR TOKEN_AMPERSAND TOKEN_AND
%token TOKEN_INT TOKEN_CHAR TOKEN_IF TOKEN_ELSE TOKEN_ELSEIF TOKEN_WHILE TOKEN_FOR TOKEN_RETURN
%token TOKEN_VOID TOKEN_MAIN TOKEN_CONTINUE TOKEN_BREAK TOKEN_IDENTIFIER
%token TOKEN_MINUS_MINUS TOKEN_PLUS_PLUS TOKEN_ENTER TOKEN_PLUSEQUAL TOKEN_MINUSEQUAL TOKEN_MULTIEQUAL TOKEN_DIVIDEEQUAL TOKEN_MODEQUAL


%start start

%right TOKEN_ASSIGN 

%left TOKEN_LEFTBRACE TOKEN_LEFTBRACKET TOKEN_LEFTPAREN  TOKEN_RIGHTBRACE TOKEN_RIGHTBRACKET TOKEN_RIGHTPAREN


%type<val> TOKEN_INT_CONST
%type<name> TOKEN_CHAR_CONST

%%
start       : 
                |start grammer 
        ;

grammer     :   
            TOKEN_ENTER{yylineno++;}
        |   type TOKEN_MAIN TOKEN_LEFTPAREN TOKEN_RIGHTPAREN full_body
        |   type TOKEN_IDENTIFIER TOKEN_LEFTPAREN function_parameters  TOKEN_RIGHTPAREN full_body
                
        ;


full_body : 
            TOKEN_LEFTBRACE body_part TOKEN_RIGHTBRACE
    ;



body_part : 
            {yylineno++;}
        |   body_part TOKEN_ENTER{yylineno++;}
        |   body_part befor_Assign_value 
        |   body_part conditional
        |   body_part for_loop
        |   body_part comment
        |   body_part function_call
        |   body_part break_and_continue



    ;

break_and_continue :
                TOKEN_BREAK TOKEN_DOT
            |   TOKEN_RETURN TOKEN_IDENTIFIER TOKEN_DOT


function_call :
           TOKEN_IDENTIFIER TOKEN_LEFTPAREN parameters TOKEN_RIGHTPAREN TOKEN_DOT

    ;
        
parameters :

        |   TOKEN_IDENTIFIER
        |   TOKEN_IDENTIFIER TOKEN_COMMA TOKEN_IDENTIFIER
        |   TOKEN_IDENTIFIER TOKEN_COMMA TOKEN_IDENTIFIER TOKEN_COMMA TOKEN_IDENTIFIER

    ;
///////////////////////////////////////////////////
comment :
            TOKEN_SEVERAL_LINE_COMMENT 
        |   TOKEN_ONELINE_COMMENT
    ;
///////////////////////////////////////////////////////////////////////////

befor_Assign_value :
            type TOKEN_IDENTIFIER after_Assign_value
            | TOKEN_IDENTIFIER after_Assign_value

    ;

after_Assign_value :
            TOKEN_ASSIGN value TOKEN_DOT
            |TOKEN_ASSIGN TOKEN_IDENTIFIER TOKEN_DOT
            |TOKEN_DOT
    ;


type        :
                |TOKEN_INT
                |TOKEN_CHAR

    ;


value :
            TOKEN_CHAR_CONST
        |   TOKEN_INT_CONST 
        |   TOKEN_IDENTIFIER

    ;
//////////////////////////////////////////////////////////////////////////////
conditional :
            TOKEN_IF condition full_body
        |   TOKEN_WHILE condition full_body
    ;


condition :
            TOKEN_LEFTPAREN logical_actions logical_gates logical_actions TOKEN_RIGHTPAREN 

        ;

logical_actions :
             TOKEN_IDENTIFIER
            |  TOKEN_CHAR_CONST
            |  TOKEN_INT_CONST

        ;


logical_gates  :
            TOKEN_LESSANDEQUAL
            |TOKEN_LESS
            |TOKEN_GREATER
            |TOKEN_GREATERANDEQUAL
            |TOKEN_EQUAL
            |TOKEN_NOTEQUAL
            |TOKEN_AND
            |TOKEN_OR
        
        ;
//////////////////////////////////////////////////////////////////////////////

for_loop   :
        TOKEN_FOR TOKEN_LEFTPAREN variable_definition TOKEN_COMMA for_conditon TOKEN_COMMA step TOKEN_RIGHTPAREN full_body

        ;

variable_definition :
            type TOKEN_IDENTIFIER TOKEN_ASSIGN value 
            | TOKEN_IDENTIFIER TOKEN_ASSIGN value
            | TOKEN_IDENTIFIER

for_conditon : 
        logical_actions logical_gates logical_actions
        ;

step :
        
        | TOKEN_IDENTIFIER 
        | step TOKEN_PLUS_PLUS 
        | step TOKEN_MINUS_MINUS
        | step TOKEN_PLUSEQUAL TOKEN_INT_CONST
        | step TOKEN_MINUSEQUAL TOKEN_INT_CONST
        | step TOKEN_MULTIEQUAL TOKEN_INT_CONST
        | step TOKEN_DIVIDEEQUAL TOKEN_INT_CONST
        | step TOKEN_MODEQUAL TOKEN_INT_CONST
        | step TOKEN_EQUAL TOKEN_IDENTIFIER arithmetic_oparator TOKEN_INT_CONST
    ;

step_condition :
        TOKEN_PLUS_PLUS 
        | TOKEN_MINUS_MINUS
        | TOKEN_PLUSEQUAL TOKEN_INT_CONST
        | TOKEN_MINUSEQUAL TOKEN_INT_CONST
        | TOKEN_MULTIEQUAL TOKEN_INT_CONST
        | TOKEN_DIVIDEEQUAL TOKEN_INT_CONST
        | TOKEN_MODEQUAL TOKEN_INT_CONST
        | TOKEN_EQUAL TOKEN_IDENTIFIER arithmetic_oparator TOKEN_INT_CONST
    ;


arithmetic_oparator :
            TOKEN_PLUS
            |TOKEN_MINUS
            |TOKEN_MULTI
            |TOKEN_DIVIDE
            |TOKEN_CARET
            |TOKEN_MOD
        ;    



%%


void yyerror(char *s){
    fprintf(stderr, "⛔️ Syntax error at line:%d  before \"%s\"\n", yylineno, yytext);
    fprintf(yyout, "⛔️ Syntax error at line:%d  before \"%s\"\n", yylineno, yytext);
}

int yywrap(){
    return 1;
}





int main(int argc, char * argv[]){

    
    yyin = fopen("test_case.txt","r");

    FILE *outputFile = fopen("Phase1_Tokens.txt", "w");
    yyout = outputFile;

    yyparse();

    return 0;
 }

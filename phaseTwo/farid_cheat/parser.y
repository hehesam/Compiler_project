%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern char* yytext;
extern FILE* yyin;
extern FILE* yyout;
void yyerror(char *s);
%}

%union {int INTGR; char * STRNG; float FLT; char CHR;}
%start program
%token token_int token_char token_if token_else token_elseif token_while token_for token_return token_void token_main token_continue token_break
%token token_identifier token_int_const token_char_const token_less token_greater token_equal token_less_than_and_equal token_greater_than_and_equal
%token token_not_equal token_bitwise_or token_bitwise_and token_logical_and token_logical_or token_bitwise_xor token_not token_assign token_plus
%token token_minus token_multiply token_divide token_dot token_comma token_left_parenthesis token_right_parenthesis token_left_brace token_right_brace
%token token_left_curly_brace token_right_curly_brace token_comment token_mistery

%left token_comma
%right token_assign
%left token_logical_or token_logical_and token_bitwise_or token_bitwise_and
%left token_equal token_not_equal token_greater token_less token_greater_than_and_equal token_less_than_and_equal
%left token_multiply token_divide 
%right token_plus
%left token_minus token_not
%left token_left_parenthesis token_right_parenthesis token_left_curly_brace token_right_curly_brace


%%

program         : %empty
                | functions main
                ;

functions       : %empty
                | functions function
                | function
                ;

function        : token_void token_identifier arguments
                | token_int token_identifier arguments
                | token_char token_identifier arguments
                ;

main            : token_int token_main arguments
                ;

arguments       : %empty
                | token_left_parenthesis type token_identifier token_right_parenthesis
                | token_left_parenthesis type token_identifier token_comma type token_identifier token_right_parenthesis
                | token_left_parenthesis type token_identifier token_comma type token_identifier token_comma type token_identifier token_right_parenthesis
                ;

block           : token_left_curly_brace block_cnt token_right_curly_brace
                | token_left_curly_brace token_right_curly_brace
                ;

block_cnt       : block_cnt declaration
                | block_cnt statement
                | block_cnt token_comment
                | declaration 
                | statement
                | token_comment
                ;

declaration     : type token_identifier token_dot
                | type token_identifier token_assign expression token_dot
                ;

statement       : assignment token_dot
                | func_call token_dot
                | cond_stmt
                | loop_stmt
                | expression token_dot
                | token_return token_dot
                | token_break token_dot
                | token_continue token_dot
                ;

assignment	    : token_identifier token_assign expression
                ;

expression      : expression binary_op expression
                | func_call
                | token_identifier
                | token_int_const
                | token_char_const
                ;

func_call	    : token_identifier token_left_parenthesis token_right_parenthesis token_dot
                | token_identifier token_left_parenthesis parameters token_right_parenthesis token_dot
                ;

parameters	    : %empty
                | token_identifier
                | token_identifier token_comma parameters
                ;

type            : token_int
                | token_char
                ;

cond_stmt	    : token_if token_left_parenthesis conditional token_right_parenthesis block                                        
                | token_if token_left_parenthesis conditional token_right_parenthesis block token_else block
                | token_if token_left_parenthesis conditional token_right_parenthesis block token_elseif token_left_parenthesis conditional token_right_parenthesis block
                | token_if token_left_parenthesis conditional token_right_parenthesis block token_elseif token_left_parenthesis conditional token_right_parenthesis block token_else block
                ;

loop_stmt	    : token_for token_left_parenthesis loop_stmt_dclr token_comma conditional token_comma assignment token_right_parenthesis block
                | token_while token_left_parenthesis conditional token_right_parenthesis block
                ;

loop_stmt_dclr  : type token_identifier token_assign expression
                ;

loop_stmt_step  : token_identifier token_assign expression binary_op expression
                ;

binary_op	    : token_plus
		        | token_minus
                | token_multiply
                | token_divide
                | token_bitwise_and
                | token_bitwise_or
                ;

conditional	    : expression token_equal expression
		        | expression token_not_equal expression
                | expression token_greater_than_and_equal expression
                | expression token_less_than_and_equal expression
                | expression token_less expression
                | expression token_greater expression
                | expression token_logical_or expression
                | expression token_logical_and expression
                | token_not expression
                | token_not token_left_parenthesis conditional token_right_parenthesis
                ;

mistery         : token_mistery {yyerror("mistery");}

%%

int yywrap() {}

int main(){
    FILE *inputFile = fopen("input.txt","r");
    yyin = inputFile;

    FILE *outputFile = fopen("Phase1_Tokens.txt", "w");
    yyout = outputFile;
    
    yyparse();
    return 0;
}

void yyerror(char* s) {
    fprintf(stderr, "⛔️ Syntax error at line:%d  before \"%s\"\n", yylineno, yytext);
    fprintf(yyout, "⛔️ Syntax error at line:%d  before \"%s\"\n", yylineno, yytext);
}


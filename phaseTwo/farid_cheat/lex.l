%{
    #include "parser.tab.h"
    #include <stdio.h>
%}

SYMBOLS     "int"|"char"|"if"|"else"|"elseif"|"while"|"for"|"return"|"void"|"main"|"continue"|"break"
ID          [_a-zA-Z][_a-zA-Z0-9]*
INT_CONST   ((-)?[1-9][0-9]*)|0
CHAR_CONST  "\""(.|" ")"\""


%%
"int" {
    return(token_int);
}
"char" {
    return(token_char);
}
"if" {
    return(token_if);
}
"else" {
    return(token_else);
}
"elseif" {
    return(token_elseif);
}
"while" {
    return(token_while);
}
"for" {
    return(token_for);
}
"return" {
    return(token_return);
}
"void" {
    return(token_void);
}
"main" {
    return(token_main);
}
"continue" {
    return(token_continue);
}
"break" {
    return(token_break);
}
{ID} {
    return(token_identifier);
}
{INT_CONST} {
    if (atoi(yytext) <= 32767 && atoi(yytext) >= -32768) {
        return(token_int_const);
    } else {
        return(token_mistery);
    }
}
{CHAR_CONST} {
    return(token_char_const);
}
"<" {
    return(token_less);
}
">" {
    return(token_greater);
}
"==" {
    return(token_equal);
}
"<=" {
    return(token_less_than_and_equal);
}
">=" {
    return(token_greater_than_and_equal);
}
"!=" {
	return(token_not_equal);
}
"|" {
	return(token_bitwise_or);
}
"&" {
	return(token_bitwise_and);
}
"&&" {
	return(token_logical_and);
}
"||" {
	return(token_logical_or);
}
"^" {
	return(token_bitwise_xor);
}
"!" {
    return(token_not);
}
"=" {
    return(token_assign);
}
"+" {
	return(token_plus);
}
"-" {
	return(token_minus);
}
"*" {
	return(token_multiply);
}
"/" {
	return(token_divide);
}
"." {
    return(token_dot);
}
"," {
    return(token_comma);
}
"(" {
    return(token_left_parenthesis);
}
")" {
    return(token_right_parenthesis);
}
"[" {
    return(token_left_brace);
}
"]" {
    return(token_right_brace);
}
"{" {
    return(token_left_curly_brace);
}
"}" {
    return(token_right_curly_brace);
}
"#"(.|" "|\t)* {
    return(token_comment);
}
"!#"(.|" "|\n|\t)*"#!" {
    return(token_comment);
}
[ ] ;
\n ;
. {
    return(token_mistery);
}
%%
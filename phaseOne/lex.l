%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    char line[100];
   
%}

DIGIT  [0-9]
ID     [a-z][a-z0-9]*
OTHER  "["|"]"|"{"|"}"|"("|")"

/* Rule Section */

%%

"-" {
    printf("TOKEN_MINUS\n");
    fprintf(yyout,"TOKEN_MINUS\n");
}

[0-9]+|[-0-9]+ {
printf("TOKEN_INT_CONST\n");
fprintf(yyout, "TOKEN_INT_CONST\n");

}

["][a-z|A-Z| ]+["] {
    printf("TOKEN_CHAR_CONST\n");
    fprintf(yyout,"TOKEN_CHAR_CONST\n");

}


[#][a-z|A-Z|0-9| ]+ {
    printf("TOKEN_ONELINE_COMMENT\n");
    fprintf(yyout,"TOKEN_ONELINE_COMMENT\n");

}

[#!][a-z|A-Z|0-9|\t|\n| ]+[!#] {
    printf("TOKEN_SEVERAL_LINE_COMMENT\n");
    fprintf(yyout,"TOKEN_SEVERAL_LINE_COMMENT\n");
}



"[" {
    printf("TOKEN_LEFTBRACKET\n");
    fprintf(yyout,"TOKEN_LEFTBRACKET\n");
}
"]" {
    printf("TOKEN_RIGHTBRACKET\n");
    fprintf(yyout,"TOKEN_RIGHTBRACKET\n");
}
"{" {
    printf("TOKEN_LEFTBRACE\n");
    fprintf(yyout,"TOKEN_LEFTBRACE\n");
}
"}" {
    printf("TOKEN_RIGHTBRACE\n");
    fprintf(yyout,"TOKEN_RIGHTBRACE\n");
}
"(" {
    printf("TOKEN_LEFTPAREN\n");
    fprintf(yyout,"TOKEN_LEFTPAREN\n");
}
")" {
    printf("TOKEN_RIGHTPAREN\n");
    fprintf(yyout,"TOKEN_RIGHTPAREN\n");
}
"," {
    printf("TOKEN_COMMA\n");
    fprintf(yyout,"TOKEN_COMMA\n");
}
"." {
    printf("TOKEN_DOT\n");
    fprintf(yyout,"TOKEN_DOT\n");
}



"+" {
    printf("TOKEN_PLUS\n");
    fprintf(yyout,"TOKEN_PLUS\n");
}

"*" {
    printf("TOKEN_MULTI\n");
    fprintf(yyout,"TOKEN_MULTI\n");
}
"/" {
    printf("TOKEN_SLASH\n");
    fprintf(yyout,"TOKEN_SLASH\n");
}
"^" {
    printf("TOKEN_CARET\n");
    fprintf(yyout,"TOKEN_CARET\n");
}
"!" {
    printf("TOKEN_EXCLAMATION\n");
    fprintf(yyout,"TOKEN_EXCLAMATION\n");
}



"=" {
    printf("TOKEN_ASSIGN\n");
    fprintf(yyout,"TOKEN_ASSIGN\n");
}
">" {
    printf("TOKEN_GREATER\n");
    fprintf(yyout,"TOKEN_GREATER\n");
}
"<" {
    printf("TOKEN_LESS\n");
    fprintf(yyout,"TOKEN_LESS\n");
}
"<=" {
    printf("TOKEN_LESSANDEQUAL\n");
    fprintf(yyout,"TOKEN_LESSANDEQUAL\n");
}
">=" {
    printf("TOKEN_GREATERANDEQUAL\n");
    fprintf(yyout,"TOKEN_GREATERANDEQUAL\n");
}



"==" {
    printf("TOKEN_EQUAL\n");
    fprintf(yyout,"TOKEN_EQUAL\n");
}
"!=" {
    printf("TOKEN_NOTEQUAL\n");
    fprintf(yyout,"TOKEN_NOTEQUAL\n");
}
"|" {
    printf("TOKEN_PIPE\n");
    fprintf(yyout,"TOKEN_PIPE\n");
}
"||" {
    printf("TOKEN_OR\n");
    fprintf(yyout,"TOKEN_OR\n");
}
"&" {
    printf("TOKEN_AMPERSAND\n");
    fprintf(yyout,"TOKEN_AMPERSAND\n");
}
"&&" {
    printf("TOKEN_AND\n");
    fprintf(yyout,"TOKEN_AND\n");
}




"int" {
    printf("TOKEN_INT\n");
    fprintf(yyout,"TOKEN_INT\n");
}

"char" {
    printf("TOKEN_CHAR\n");
    fprintf(yyout,"TOKEN_CHAR\n");
}

"if" {
    printf("TOKEN_IF\n");
    fprintf(yyout,"TOKEN_IF\n");
}

"else" {
    printf("TOKEN_ELSE\n");
    fprintf(yyout,"TOKEN_ELSE\n");

}

"elseif" {
    printf("TOKEN_ELSEIF\n");
    fprintf(yyout,"TOKEN_ELSEIF\n");
}

"while" {
    printf("TOKEN_WHILE\n");
    fprintf(yyout,"TOKEN_WHILE\n");
    
}

"for" {
    printf("TOKEN_FOR\n");
    fprintf(yyout,"TOKEN_FOR\n");
}

"return" {
    printf("TOKEN_RETURN\n");
    fprintf(yyout,"TOKEN_RETURN\n");
    
}

"void" {
    printf("TOKEN_VOID\n");
    fprintf(yyout,"TOKEN_VOID\n");
}

"main" {
    printf("TOKEN_MAIN\n");
    fprintf(yyout,"TOKEN_MAIN\n");
}

"continue" {
    printf("TOKEN_CONTINUE\n");
    fprintf(yyout,"TOKEN_CONTINUE\n");
}

"break" {
    printf("TOKEN_BREAK\n");
    fprintf(yyout,"TOKEN_BREAK\n");
    

}




[a-z|A-Z|_][a-z|A-Z|0-9|_]+ {
    printf("TOKEN_INDENTIFIER\n");
    fprintf(yyout,"TOKEN_INDENTIFIER\n");

}

[\n| ]+ {
    
}



%%
 /* Code Section */

 int main(){
     FILE* f = fopen("text_case.txt", "r");
     yyin = f;
     FILE* w = fopen("phase_tokens.txt", "w");
     yyout = w;
     yylex();
     return 0;
 }

%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    int lines = 1;
   
%}

DIGIT  [0-9]
ID     [a-z][a-z0-9]*
OTHER  "["|"]"|"{"|"}"|"("|")"

/* Rule Section */

%%


{DIGIT}+ {
printf("TOKEN_INT_CONST\n");

}

["][a-z|A-Z]+["] {
    printf("TOKEN_CHAR_CONST\n");
}

[#][a-z|A-Z|0-9| ]+ {
    printf("TOKEN_ONELINE_COMMENT\n");
}

[#!][a-z|A-Z|0-9|\t|\n| ]+[!#] {
    printf("TOKEN_SEVERAL_LINE_COMMENT\n");
}

"[" {
    printf("TOKEN_");
}
"]" {
    printf("TOKEN_");
}
"{" {
    printf("TOKEN_");
}
"}" {
    printf("TOKEN_");
}
"(" {
    printf("TOKEN_");
}
")" {
    printf("TOKEN_");
}
"," {
    printf("TOKEN_");
}
"." {
    printf("TOKEN_");
}




"+" {
    printf("TOKEN_\n");
}
"-" {
    printf("TOKEN_\n");
}
"*" {
    printf("TOKEN_\n");
}
"/" {
    printf("TOKEN_\n");
}
"^" {
    printf("TOKEN_\n");
}
"!" {
    printf("TOKEN_\n");
}



"=" {
    printf("TOKEN_\n");
}
">" {
    printf("TOKEN_\n");
}
"<" {
    printf("TOKEN_\n");
}
"<=" {
    printf("TOKEN_\n");
}
">=" {
    printf("TOKEN_\n");
}



"==" {
    printf("TOKEN_\n");
}
"!=" {
    printf("TOKEN_\n");
}
"|" {
    printf("TOKEN_\n");
}
"||" {
    printf("TOKEN_\n");
}
"&" {
    printf("TOKEN_\n");
}
"&&" {
    printf("TOKEN_\n");
}



"hello" { 
        printf("hello scanned.\n");
    }

"goodby" {
    return 1;
}

"int" {
    printf("TOKEN_INT\n");
}

"char" {
    printf("TOKEN_CHAR\n");
}

"if" {
    printf("TOKEN_IF\n");
}

"else" {
    printf("TOKEN_ELSE\n");

}

"elseif" {
    printf("TOKEN_ELSEIF\n");
    
}

"while" {
    printf("TOKEN_WHILE\n");
    
}

"for" {
    printf("TOKEN_FOR\n");
    
}

"return" {
    printf("TOKEN_RETURN\n");
    
}

"void" {
    printf("TOKEN_VOID\n");
    
}

"main" {
    printf("TOKEN_MAIN\n");
    
}

"continue" {
    printf("TOKEN_CONTINUE\n");
    
}

"break" {
    printf("TOKEN_BREAK\n");
    

}



w(x|y)z  {
    printf("found %s", yytext);
}



[a-z|A-Z|_][a-z|A-Z|0-9|_]+ {
    printf("TOKEN_UNDENTIFIER\n");

}

. {
    
}



%%
 /* Code Section */

 int main(){
    //  FILE* f = fopen("text_case.txt", "r");
    //  yyin = f;
     yylex();
     printf("number of lines : %d\n", lines);
     return 0;
 }

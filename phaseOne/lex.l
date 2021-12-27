%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    int lines = 1;
   
%}

DIGIT  [0-9]
ID     [a-z][a-z0-9]*

/* Rule Section */

%%


{DIGIT}+ {
printf( "An integer: %s (%d)\n", yytext , atoi( yytext ) );

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

[a-z]+  {
    printf("I found a %s. \n", yytext);
}



[a-z|A-Z|_][a-z|A-Z|0-9|_]+ {
    printf("variable maker :  %s. \n", yytext);

}

. {
    printf(" space ");
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

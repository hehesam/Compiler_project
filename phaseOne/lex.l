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
 
}

"char" {

}

"if" {

}

"else" {

}

"elseif" {
    
}

"while" {
    
}

"for" {
    
}

"return" {
    
}

"void" {
    
}

"main" {
    
}

"continue" {
    
}

"break" {
    

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



%%
 /* Code Section */

 int main(){
    //  FILE* f = fopen("text_case.txt", "r");
    //  yyin = f;
     yylex();
     printf("number of lines : %d\n", lines);
     return 0;
 }

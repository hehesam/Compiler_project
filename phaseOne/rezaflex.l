%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    int lines = 1;
%}



/* Rule Section*/

%%

"HELLO" { 
        printf("hello scanned.\n");
    }

"goodby" {
    return 1;
}

w(x|y)z  {
    printf("found %s", yytext);
}


[a-z]+  {
    printf("I found a %s. \n", yytext);
}



[0-9]+  {
    printf("I found %s. \n", yytext);
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

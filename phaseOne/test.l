%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    int lines = 1;
%}



/* Rule Section */

%%






"goodby" {
    return 1;
}

w(x|y)z {
    printf("found %s", yytext);
}


a{2,4}  {
    printf("found %s scanned", yytext);
}

[a-z]+  {
    printf("I found a %s. \n", yytext);
}

"hello" { 
        printf("hello scanned.\n");
    }

[0-9]+  {
    printf("I found %s. \n", yytext);
}



a{2,4}  {
    printf("found %s scanned", yytext);
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

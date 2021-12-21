%option noyywrap

/* Definition Section*/

%{
    #include <stdio.h>
    int lines = 1;
%}



/* Rule Section */

%%


[a-z]+  {
    printf("I found a %s. \n", yytext);
}

"hello" { 
        printf("hello scanned.\n");
    }
"goodby" {
    return 1;
}



[0-9]+ {
    printf("I found %s. \n", yytext);
}

w(x|y)z {
    printf("found %s", yytext);
}

a{2,4} {
    printf("found %s scanned", yytext);
}

  /*
// . {
//     printf("not rec!\n");
// }
// */

\n {
    lines ++;
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

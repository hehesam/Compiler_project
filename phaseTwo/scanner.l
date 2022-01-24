%{
    #include "parser.tab.h"
    #include <stdlib.h>
%}

Num [0-9]

%% 
{Num}+ {yylval = atoi(yytyext); return (Number);}
"+"    {return(Plus);}
"-"     {return(Minus);}
"="      {return(Equal);}
"*"      {return(Mult);}
"/"      {return(Div);}
"^"      {return(Power);}
[\t]+      {;}
.           {printf("Unexpected input \n");}
%%
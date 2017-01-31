/*MIT License

Copyright (c) 2017 Marino Hohenheim
Copyright (c) 2017 Jefferson Renè
*/

%{
%}

DIGIT       [0-9]
ID          [a-zA-Z][a-zA-Z0-9_]*
COMMENT     [//].*\n
CHAR        [a-zA-Z]
WHITESPACE  [ \t\n]

%%

def         {fprintf(yyout, "KEY \"%s\"\n",yytext);}
if          {fprintf(yyout, "KEY \"%s\"\n",yytext);}
else        {fprintf(yyout, "KEY \"%s\"\n",yytext);}
while       {fprintf(yyout, "KEY \"%s\"\n",yytext);}
return      {fprintf(yyout, "KEY \"%s\"\n",yytext);}
break       {fprintf(yyout, "KEY \"%s\"\n",yytext);}
continue    {fprintf(yyout, "KEY \"%s\"\n",yytext);}
int         {fprintf(yyout, "KEY \"%s\"\n",yytext);}
void        {fprintf(yyout, "KEY \"%s\"\n",yytext);}

"("         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"{"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"["         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"]"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"}"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
")"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
","         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
";"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"="         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"+"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"-"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"*"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"/"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"<"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
">"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"<="        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
">="        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"=="        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"!="        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"&&"        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"||"        {fprintf(yyout, "SYM \"%s\"\n",yytext);}
"!"         {fprintf(yyout, "SYM \"%s\"\n",yytext);}

{DIGIT}+    {fprintf(yyout, "DEC \"%s\"\n",yytext);}
{ID}+       {fprintf(yyout, "ID \"%s\"\n",yytext);}

{WHITESPACE}+ /*Terminate it*/
{COMMENT}+ /*Terminate it*/

<<EOF>>     {return -1;}
.           {fprintf(yyout, "\n Símbolo não reconhecido: '%s'\n",yytext);}

%%

int yywrap();

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
}

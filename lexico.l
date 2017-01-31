/*MIT License

Copyright (c) 2017 Marino Hohenheim
Copyright (c) 2017 Jefferson Renè
*/

%{
%}

DIGIT       [0-9]
ID          [a-zA-Z][a-zA-Z0-9]*
COMMENT     [//].*\n
CHAR        [a-zA-Z]
WHITESPACE  [ \t\n]

%%

def         {printf("KEY \"%s\"\n",yytext);}
if          {printf("KEY \"%s\"\n",yytext);}
else        {printf("KEY \"%s\"\n",yytext);}
while       {printf("KEY \"%s\"\n",yytext);}
return      {printf("KEY \"%s\"\n",yytext);}
break       {printf("KEY \"%s\"\n",yytext);}
continue    {printf("KEY \"%s\"\n",yytext);}
int         {printf("KEY \"%s\"\n",yytext);}
void        {printf("KEY \"%s\"\n",yytext);}

"("         {printf("SYM \"%s\"\n",yytext);}
"{"         {printf("SYM \"%s\"\n",yytext);}
"["         {printf("SYM \"%s\"\n",yytext);}
"]"         {printf("SYM \"%s\"\n",yytext);}
"}"         {printf("SYM \"%s\"\n",yytext);}
")"         {printf("SYM \"%s\"\n",yytext);}
","         {printf("SYM \"%s\"\n",yytext);}
";"         {printf("SYM \"%s\"\n",yytext);}
"="         {printf("SYM \"%s\"\n",yytext);}
"+"         {printf("SYM \"%s\"\n",yytext);}
"-"         {printf("SYM \"%s\"\n",yytext);}
"*"         {printf("SYM \"%s\"\n",yytext);}
"/"         {printf("SYM \"%s\"\n",yytext);}
"<"         {printf("SYM \"%s\"\n",yytext);}
">"         {printf("SYM \"%s\"\n",yytext);}
"<="        {printf("SYM \"%s\"\n",yytext);}
">="        {printf("SYM \"%s\"\n",yytext);}
"=="        {printf("SYM \"%s\"\n",yytext);}
"!="        {printf("SYM \"%s\"\n",yytext);}
"&&"        {printf("SYM \"%s\"\n",yytext);}
"||"        {printf("SYM \"%s\"\n",yytext);}
"!"         {printf("SYM \"%s\"\n",yytext);}

{DIGIT}+    {printf("DEC \"%s\"\n",yytext);}
{ID}+       {printf("ID \"%s\"\n",yytext);}

{WHITESPACE}+ /*Terminate it*/
{COMMENT}+ /*Terminate it*/

.           {printf("\n Símbolo não reconhecido: '%s'\n",yytext);}

%%

int yywrap();

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

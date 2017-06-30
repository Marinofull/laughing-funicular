/*MIT License

Copyright (c) 2017 Marino Hohenheim
Copyright (c) 2017 Jefferson Renè
*/

DIGIT       [0-9]
ID          [a-zA-Z][a-zA-Z0-9_]*
DOIDO       [0-9]+[a-zA-Z0-9_]*
COMMENT     [//].*
WHITESPACE  [ \t]

%%

let         {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
def         {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
if          {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
else        {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
while       {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
return      {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
break       {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}
continue    {fprintf(yyout, "KEY \"%s\" %d\n",yytext, yylineno);}

"("         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"{"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"}"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
")"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
","         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
";"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"="         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"+"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"-"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"*"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"/"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"<"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
">"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"<="        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
">="        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"=="        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"!="        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"&&"        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"||"        {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}
"!"         {fprintf(yyout, "SYM \"%s\" %d\n",yytext, yylineno);}

{DIGIT}+    {fprintf(yyout, "DEC \"%s\" %d\n",yytext, yylineno);}
{ID}       {fprintf(yyout, "ID \"%s\" %d\n",yytext, yylineno);}

{WHITESPACE}+ /*Terminate it*/
{COMMENT}+ /*Terminate it*/

"\n"    yylineno++;

{DOIDO}     {fprintf(yyout, "ERROR \"%s\" %d\n",yytext, yylineno);}
.           {fprintf(yyout, "ERROR \"%s\" %d\n",yytext, yylineno);}

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

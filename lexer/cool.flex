/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%option noyywrap 
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>
#include <string.h>
#include <stdlib.h>
/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

// Pomoćna varijabla za brojanje otvorenih (* komentara. Služi za prolaženje testova gdje ima ugnježđenih komentara.

int number_of_starting_comments=0;

%}

/*
 * Define names for regular expressions here.
 */


DARROW          =>
ELSE (e|E)(l|L)(s|S)(e|E)
TRUE (t)(r|R)(u|U)(e|E)
FALSE (f)(a|A)(l|L)(s|S)(e|E)
TYPEID [A-Z][a-zA-Z0-9_]*
OBJECTID [a-z][a-zA-Z0-9_]*
CLASS	(c|C)(l|L)(a|A)(s|S)(s|S)
FI	(f|F)(i|I)
IF	(i|I)(f|F)
IN	(i|I)(n|N)
INHERITS	(i|I)(n|N)(h|H)(e|E)(r|R)(i|I)(t|T)(s|S)
LET	(l|L)(e|E)(t|T)
LOOP	(l|L)(o|O)(o|O)(p|P)
POOL	(p|P)(o|O)(o|O)(l|L)
THEN	(t|T)(h|H)(e|E)(n|N)
WHILE	(w|W)(h|H)(i|I)(l|L)(e|E)
CASE	(c|C)(a|A)(s|S)(e|E)
ESAC	(e|E)(s|S)(a|A)(c|C)
OF	(o|O)(f|F)
NEW	(n|N)(e|E)(w|W)
ISVOID	(i|I)(s|S)(v|V)(o|O)(i|I)(d|D)
NOT	(n|N)(o|O)(t|T)
LE	"<"|"<="
SPACE (\t|" ")
STARTCOMMENT1 "(*"
ENDCOMMENT1 "*)"
STARTCOMMENT2 "--"
ENDCOMMENT2 \n
INT_CONST [0-9]+
INVALIDCHARS  "!"|"#"|"$"|"%"|"^"|"&"|"_"|">"|"?"|"`"|"["|"]"|"\\"|"\|"

/*
* COMMENT1 - ovaj tip komentara (**)
* COMMENT2 - ovaj tip komentara -- 
*/
%x COMMENT1 COMMENT2 STRING_MODE

%%


 /*
  *  Nested comments
  */


 /*
  *  The multiple-character operators.
  */
<INITIAL>{
{CLASS}       {return (CLASS);}
{IF}          {return (IF);}
{FI}          {return (FI);}
{IN}          {return (IN);}
"(*" {number_of_starting_comments=1;BEGIN COMMENT1;}
{STARTCOMMENT2} {BEGIN COMMENT2;}
{INHERITS}    {return (INHERITS);}
{LET}         {return (LET);}
{POOL}        {return (POOL);}
{LOOP}        {return (LOOP);}
{THEN}        {return (THEN);}
{WHILE}       {return (WHILE);}
{CASE}        {return (CASE);}
{ESAC}        {return (ESAC);}
{OF}          {return (OF);}
{NEW}         {return (NEW);}
{ISVOID}      {return (ISVOID);}
{NOT}         {return (NOT);}
"<"           {return '<';}
{LE}          {return (LE);}
"*)"          {cool_yylval.error_msg="Unmatched *)";return (ERROR);}
"{"           {return '{';}
"}"           {return '}';}
"+"           {return '+';}
"/"           {return '/';}
"-"           {return '-';}
"*"           {return '*';}
"="           {return '=';}
"."           {return '.';}
","           {return ',';}
";"           {return ';';}
":"           {return ':';}
"("           {return '(';}
")"           {return ')';}
"@"           {return '@';}
"~"           {return '~';}
"<-"          {return (ASSIGN);}
{INVALIDCHARS}  {cool_yylval.error_msg=yytext; return (ERROR);}
\n            {curr_lineno++;}
{SPACE}       {}     
{DARROW}		  {return (DARROW);}
{ELSE}        {return (ELSE);}
{TRUE}        {cool_yylval.boolean=1; return (BOOL_CONST);}
{FALSE}       {cool_yylval.boolean=0; return (BOOL_CONST);}
{INT_CONST}   {cool_yylval.symbol=inttable.add_string(yytext); return (INT_CONST);}
\"            {string_buf_ptr = string_buf;BEGIN STRING_MODE;}
{TYPEID}      {cool_yylval.symbol=stringtable.add_string(yytext); return (TYPEID);}
{OBJECTID}    {cool_yylval.symbol=stringtable.add_string(yytext); return (OBJECTID);}
. {
    if(yytext[0]<5){
    cool_yylval.error_msg=yytext;
    return (ERROR);
    }
  }
}


<COMMENT1>{
 "*)" {number_of_starting_comments--;if(number_of_starting_comments==0){BEGIN INITIAL;}}
"(*" {number_of_starting_comments++;}
\n {curr_lineno++;}
. {}
<<EOF>> {yylval.error_msg="EOF in comment";BEGIN INITIAL;return(ERROR);}

}

<COMMENT2>{
{ENDCOMMENT2} {curr_lineno++;BEGIN INITIAL;}
. {}

}
<STRING_MODE>{
  \" {
        
          if(strlen(string_buf_ptr)>=MAX_STR_CONST){
            yylval.error_msg="String constant too long";
            *string_buf_ptr='\0';
            BEGIN INITIAL;
            return (ERROR);
          }
          else{
            cool_yylval.symbol=stringtable.add_string(string_buf_ptr);
            *string_buf_ptr='\0';
            BEGIN INITIAL;
            return (STR_CONST);
          }
        }

  \n {curr_lineno++;*string_buf='\0';yylval.error_msg="Unterminated string constant";BEGIN INITIAL;return(ERROR);}
  \\n {strcat(string_buf, "\n");}
  \\t {strcat(string_buf, "\t");}
  \\b {strcat(string_buf, "\b");}
  \\f {strcat(string_buf, "\f");}
  \\(.|\n) {strcat(string_buf, &yytext[1]);}
  \\r {strcat(string_buf, "\r");}
  [^"\n\\]+  {strcat(string_buf, yytext);}
  <<EOF>> {yylval.error_msg="EOF in string constant";BEGIN INITIAL;return(ERROR);} 
}

 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */


 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */


%%

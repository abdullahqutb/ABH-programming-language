/* float2.l just in case
{identifier}(\ )?{equals}(\ )?({identifier}|{digit}+)({op}({identifier}|{digit}+))?
{digit}+        printf("NUMBER");
 */
%option main
builtin_func     (TEMPERATURE|HUMIDITY|AIR_PRESSURE|AIR_QUALITY|LIGHT|SOUND_LEVEL|TIMESTAMP)
switch		(sw1|sw2|sw3|sw4|sw5|sw6|sw7|sw8|sw9|sw10)
digit         [0-9]
letter        [a-zA-Z]
op        [+|\-|*|/|%]
equals        [=]
rel_op        (>=|>|<=|<|==|!=)
float 		([+-]?[0-9]*(\.)[0-9]+)
identifier     ([A-Za-z][A-Za-z0-9]*)
alphanumeric   ([A-Za-z0-9]+)
type		(int|float|bool|string)
%%
    float val;
[+-]?{digit}+ {sscanf(yytext, "%f", &val);printf("NUMBER");}
{float}		printf(" FLOAT");
for             printf(" FOR");
if              printf(" IF");
while           printf(" WHILE");
else            printf(" ELSE");
when            printf(" WHEN");
connect         printf(" CONNECT");
send            printf(" SEND");
int		printf(" INT_TYPE");
bool		printf(" BOOL_TYPE");
true		printf(" TRUE");
false		printf(" FALSE");
string		printf(" STR_TYPE");
CONST		printf(" CONST");
print		printf(" PRINT");
return		printf(" RETURN");
float		printf(" FLT_TYPE");
"&&"		printf(" AND");
"||"		printf(" OR");
receive         printf(" RECEIVE");
\"[ ]*.*[ ]*\"	printf(" STRING");
(\/\/)[ ]*.*[ ]*(\/\/) printf(" COMMENT");
{identifier}[(][ ]*{identifier}?[ ]*(,[ ]*{identifier}[ ]*)*[)] printf(" FUNC_CALL");
{type}[ ]{identifier}[(][ ]*({type}[ ]*{identifier})?[ ]*(,[ ]*{type}[ ]{identifier}[ ]*)*[)] printf(" FUNC_DECL");
{switch}	printf(" SWITCH");
{builtin_func}  printf(" BUILTIN_FUNC");
{op}            printf(" OP");
{equals}        printf(" EQUALS");
{identifier}    printf(" IDENTIFIER");
[{]             printf(" LB");
[}]             printf(" RB");
[(]             printf(" LP");
[)]             printf(" RP");
"=="             printf(" EQ_CMP");
">="             printf(" GTEQ_CMP");
"!="             printf(" NEQ_CMP");
"<="             printf(" LTEQ_CMP");
[<]             printf(" LT_CMP");
[>]             printf(" GT_CMP");
www.{alphanumeric}.com printf(" URL");

%lex
id                          [a-zA-Z]([a-zA-Z0-9]|\_)*
%%

\s+                   { /* skip whitespace */ }
"//".*                { /* ignore comments */ }
"💭".*                { /* ignore comments */ }
\uFE0F                { /* ignore unicode stuff */}

"presenta il futuro a" { return 'PROGRAM'; }
"⏩"                   { return 'PROGRAM'; }

"startuppa"           { return 'CREATE'; }
"innova"              { return 'ASSIGN'; }

"stampa"              { return 'PRINT'; }
"💬"                   { return 'PRINT'; }

"urla"                { return 'SHOUT'; }
"🗯"                   { return 'SHOUT'; }

"se"                  { return 'IF'; }
"❓"                   { return 'IF'; }
"altrimenti"          { return 'ELSE'; }
"⁉"                   { return 'ELSE'; }

"finché"              { return 'WHILE'; }
"🔄"                   { return 'WHILE'; }

"restituisci"         { return 'RETURN'; }
"✅"                   { return 'RETURN'; }

"◀"                   { return '<'; }
"▶"                   { return '>'; }
"⬅"                   { return '<='; }
"➡"                   { return '=>'; }
"<"                   { return '<'; }
">"                   { return '>'; }
"<="                  { return '<='; }
"=>"                  { return '=>'; }
"=="                  { return '=='; }
"🔛"                   { return '=='; }
"!="                  { return '!='; }

"="                   { return '='; }
"con"                 { return '='; }
"🔜"                   { return '='; }

";"                   { return ';'; }
"🌚"                   { return ';'; }

"🔝"                   { return 'GLOBAL'; }
"globale"             { return 'GLOBAL'; }

"fn"                  { return 'FN'; }
"⚙"                   { return 'FN'; }

"chiama"              { return 'CALL'; }
"⚡"                   { return 'CALL'; }

"("                   { return '('; }
")"                   { return ')'; }
"↪"                   { return '('; }
"↩"                   { return ')'; }

"{"                   { return '{'; }
"}"                   { return '}'; }
"⤵"                   { return '{'; }
"⤴"                   { return '}'; }

"/"                   { return '/'; }
"➗"                   { return '/'; }
"-"                   { return '-'; }
"➖"                   { return '-'; }
"+"                   { return '+'; }
"➕"                   { return '+'; }
"*"                   { return '*'; }
"✖"                   { return '*'; }

"!"                   { return '!'; }
"❗️"                    { return '!'; }

"vero"                { return 'BOOLEAN'; }
"falso"               { return 'BOOLEAN'; }
"☝️"                   { yytext = 'vero'; return 'BOOLEAN'; }
"👌"                   { yytext = 'falso'; return 'BOOLEAN'; }

[0-9]+("."[0-9]+)?\b  { return 'NUMBER'; }
\"[^"]*\"             { yytext = yytext.substr(1,yyleng-2); return 'STRING'; }
\'[^']*\'             { yytext = yytext.substr(1,yyleng-2); return 'STRING'; }
{id}                  { return 'IDENTIFIER'; }
<<EOF>>               { return 'EOF'; }

/lex

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'
%left '^'
%left UMINUS
%right '!'

%nonassoc '==' '!=' '<' '>' '=>' '<='

%start program

%% /* language grammar */

program
    : PROGRAM identifier block EOF { $$ = {type: 'program', name: $2, statements: $3}; return $$ };

block
    : '{' statement '}' { $$ = $2 };

statement
    : statement create ';' {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement assign ';' {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement print ';' {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement shout ';' {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement function_call {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement return ';' {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement if {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement while {$$ = $$ ? $$.concat([$2]) : [$2]}
    | statement function {$$ = $$ ? $$.concat([$2]) : [$2]}
    | ;

create: CREATE identifier '=' e {$$ = {type: 'create', identifier: $2, value: $4}};
assign: ASSIGN identifier '=' e {$$ = {type: 'assign', identifier: $2, value: $4}};
print: PRINT e {$$ = {type: 'print', value: $2}};
shout: SHOUT e {$$ = {type: 'shout', value: $2}};
function: FN identifier block {$$ = {type: 'declare_function', identifier: $2, statements: $3}};
function_call: CALL identifier {$$ = {type: 'call_function', identifier: $2}};

if
    : IF '(' e ')' block {$$ = {type: 'if', condition: $3, statements: $5}}
    | IF '(' e ')' block ELSE block {$$ = {type: 'if', condition: $3, statements: $5, else: $7}};

while: WHILE '(' e ')' block {$$ = {type: 'while', condition: $3, statements: $5}};

return: RETURN e {$$ = {type: 'return', value: $2}};

identifier
    : IDENTIFIER { $$ = {type: 'identifier', value: $1} }
    | GLOBAL identifier { $$ = {type: 'global', value: $2} };

e
    : e '+' e { $$ = { type: 'addition', left: $1, right: $3 } }
    | e '-' e { $$ = { type: 'subtraction', left: $1, right: $3 } }
    | e '*' e { $$ = { type: 'multiplication', left: $1, right: $3 } }
    | e '/' e { $$ = { type: 'division', left: $1, right: $3 } }
    | '!' e { $$ = {type: 'negation', value: $2 } }
    | e '==' e { $$ = { type: 'compare', left: $1, right: $3 } }
    | e '!=' e { $$ = { type: 'not_compare', left: $1, right: $3 } }
    | e '>' e { $$ = { type: 'greater', left: $1, right: $3 } }
    | e '<' e { $$ = { type: 'lower', left: $1, right: $3 } }
    | e '<=' e { $$ = { type: 'lower_equal', left: $1, right: $3 } }
    | e '=>' e { $$ = { type: 'greater_equal', left: $1, right: $3 } }
    | primary;

primary
    : '(' e ')' { $$ = $2; }
    | '-' NUMBER %prec UMINUS { $$ = {type: 'number', value: -$2 } }
    | NUMBER { $$ = {type: 'number', value: +$1} }
    | STRING { $$ = {type: 'string', value: $1} }
    | identifier
    | function_call
    | BOOLEAN { $$ = {type: 'boolean', value: ($1 == "vero")} };
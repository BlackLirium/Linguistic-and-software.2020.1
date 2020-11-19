%{
#include <stdio.h>
#include <string.h>
extern FILE* yyin;
void yyerror(const char *str);
int yylex(void);
%}

%token KEY_BEGIN KEY_END CONSTANT IDENTIFIER MULTIPLY DIVIDE MINUS PLUS SEMICOLON COMMA ASSIGN OPEN_BRACKET CLOSE_BRACKET DELIMITER

%%

PROGRAM:
	VARIABLE_DECLARATION DESCRIPTION_OF_CALCULATION
;

DESCRIPTION_OF_CALCULATION:
        KEY_BEGIN ASSIGNMENT_LIST KEY_END 
;

VARIABLE_DECLARATION:
       KEY_VAR VARIABLE_LIST 
;

VARIABLE_LIST:
	IDENTIFIER	
	| IDENTIFIER COMMA VARIABLE_LIST
;

ASSIGNMENT_LIST:
	ASSIGNMENT
	| ASSIGNMENT ASSIGNMENT_LIST
;

ASSIGNMENT:
	IDENTIFIER ASSIGN EQUATION DELIMITER
;

EQUATION:
	UNARY_OPERATION SUB_EQUATION
	| SUB_EQUATION
;

SUB_EQUATION:
	OPEN_BRACKET EQUATION CLOSE_BRACKET	
	| OPERAND	
	| SUB_EQUATION BINARY_OPERATION SUB_EQUATION
;

UNARY_OPERATION:
	MINUS
;

BINARY_OPERATION:
	MULTIPLY
	| DIVIDE
	| PLUS
	| MINUS
;

OPERAND:
	CONSTANT	
	| IDENTIFIER
;

%%

void yyerror (const char *str)

{

fprintf(stderr,"Error: %s\n",str);

}

int main()

{

yyin = fopen("code.txt","r");

yyparse();

fclose(yyin);

return 0;

}

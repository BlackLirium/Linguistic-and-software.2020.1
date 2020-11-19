%{
#include <stdio.h>
#include "y.tab.h"
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#define INTEGER 288
%}

%%
("Var") 			return KEY_VAR;
("[")               return KEY_BEGIN;
("]")                 return KEY_END;
[0-9]+ 		        return CONSTANT;
([a-zA-Z])+ 	        return IDENTIFIER;
(\*){1} 		return MULTIPLY;
(\/){1} 		return DIVIDE;
(\,){1} 		return COMMA;
(\=){1} 		return ASSIGN;
(\-){1} 		return MINUS;
(\+){1} 		return PLUS;
(\(){1} 		return OPEN_BRACKET;
(\)){1} 		return CLOSE_BRACKET;
(\;){1} 		return DELIMITER;
\n
[ \t]+
%%

int yywrap()
{
return 1;
} 

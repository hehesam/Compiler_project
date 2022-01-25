/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER2_TAB_H_INCLUDED
# define YY_YY_PARSER2_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOKEN_MINUS = 258,
    TOKEN_INT_CONST = 259,
    TOKEN_CHAR_CONST = 260,
    TOKEN_ONELINE_COMMENT = 261,
    TOKEN_SEVERAL_LINE_COMMENT = 262,
    TOKEN_LEFTBRACKET = 263,
    TOKEN_RIGHTBRACKET = 264,
    TOKEN_LEFTBRACE = 265,
    TOKEN_RIGHTBRACE = 266,
    TOKEN_LEFTPAREN = 267,
    TOKEN_RIGHTPAREN = 268,
    TOKEN_COMMA = 269,
    TOKEN_DOT = 270,
    TOKEN_PLUS = 271,
    TOKEN_MULTI = 272,
    TOKEN_SLASH = 273,
    TOKEN_CARET = 274,
    TOKEN_EXCLAMATION = 275,
    TOKEN_ASSIGN = 276,
    TOKEN_GREATER = 277,
    TOKEN_LESS = 278,
    TOKEN_LESSANDEQUAL = 279,
    TOKEN_GREATERANDEQUAL = 280,
    TOKEN_EQUAL = 281,
    TOKEN_NOTEQUAL = 282,
    TOKEN_PIPE = 283,
    TOKEN_OR = 284,
    TOKEN_AMPERSAND = 285,
    TOKEN_AND = 286,
    TOKEN_INT = 287,
    TOKEN_CHAR = 288,
    TOKEN_IF = 289,
    TOKEN_ELSE = 290,
    TOKEN_ELSEIF = 291,
    TOKEN_WHILE = 292,
    TOKEN_FOR = 293,
    TOKEN_RETURN = 294,
    TOKEN_VOID = 295,
    TOKEN_MAIN = 296,
    TOKEN_CONTINUE = 297,
    TOKEN_BREAK = 298,
    TOKEN_INDENTIFIER = 299,
    TOKEN_MINUS_MINUS = 300,
    TOKEN_PLUS_PLUS = 301
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "parser2.y"

    char name[20];
    int  number;  

#line 109 "parser2.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER2_TAB_H_INCLUDED  */

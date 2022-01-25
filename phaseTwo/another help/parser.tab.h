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

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
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
    token_int = 258,
    token_char = 259,
    token_if = 260,
    token_else = 261,
    token_elseif = 262,
    token_while = 263,
    token_for = 264,
    token_return = 265,
    token_void = 266,
    token_main = 267,
    token_continue = 268,
    token_break = 269,
    token_identifier = 270,
    token_int_const = 271,
    token_char_const = 272,
    token_less = 273,
    token_greater = 274,
    token_equal = 275,
    token_less_than_and_equal = 276,
    token_greater_than_and_equal = 277,
    token_not_equal = 278,
    token_bitwise_or = 279,
    token_bitwise_and = 280,
    token_logical_and = 281,
    token_logical_or = 282,
    token_bitwise_xor = 283,
    token_not = 284,
    token_assign = 285,
    token_plus = 286,
    token_minus = 287,
    token_multiply = 288,
    token_divide = 289,
    token_dot = 290,
    token_comma = 291,
    token_left_parenthesis = 292,
    token_right_parenthesis = 293,
    token_left_brace = 294,
    token_right_brace = 295,
    token_left_curly_brace = 296,
    token_right_curly_brace = 297,
    token_comment = 298,
    token_mistery = 299
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 13 "parser.y"
int INTGR; char * STRNG; float FLT; char CHR;

#line 105 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */

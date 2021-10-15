/* return new Symbol(sym.error); System.out.println("LEX: Encontré una clase"); */
/* Seccion 1 */
package com.mycompany.jflex.test;
/* import java_cup.runtime.Symbol; */

%%
%class LexicoSolo
%standalone
%line
%column
/* %cup
%cupsym Simbolo */

Numeros = [0-9]+
FinLinea = \r|\n|\r\n
EspaciosBlancos = {FinLinea} | [ \t ]

CLASE = "clase"
PROPIEDADES = "propiedades"
PUBLICAS = "publicas"

%%

/* Seccion 3 */
{Numeros} {
            System.out.println("LEX: Encontré un número");
            // return new Symbol(sym.NUM, Integer.parseInt(yytext()));
        }
","     {
            System.out.println("LEX: Encontré una coma");
            // return new Symbol(sym.COMA);
        }
{CLASE} {
            System.out.println("LEX: Encontré una clase");
            // return new Symbol(sym.CLASE);
        }
{PROPIEDADES} {
            System.out.println("LEX: Encontré una propiedades");
            // return new Symbol(sym.PROPIEDADES);
        }
{PUBLICAS} {
            System.out.println("LEX: Encontré un publicas");
            // return new Symbol(sym.PUBLICAS);
        }
":"     {
            System.out.println("LEX: Encontré dos puntos");
            // return new Symbol(sym.DOS_PUNTOS);
        }
.        { }

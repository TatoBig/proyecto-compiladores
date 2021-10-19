/* Seccion 1 */
package com.mycompany.jflex.test;
/* import java_cup.runtime.Symbol; */
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.File;

%%
%class LexicoSolo
%standalone
%line
%column
%{
    private void writeLex(String lex) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("salida.txt", true));
        writer.append(lex + "\n");
        writer.close();
    }
%}
%init{
    File file = new File("salida.txt");
    if (file.createNewFile()) {
        System.out.println("File created: " + file.getName());
    } else {
        file.delete();
        file.createNewFile();
    }
%init}
%initthrow IOException

/* %cup
%cupsym Simbolo */

/* Palabras reservadas Tato */
CLASE = "clase"
EXTIENDE = "extiende"
PROPIEDADES = "propiedades"
METODOS = "metodos"
PUBLICAS = "publicas"
PUBLICOS = "publicos"
PROTEGIDOS = "protegidos"
PROTEGIDAS = "protegidas"
PRIVADAS = "privadas"
PRIVADOS = "privados"
SI = "si"
DEVOLVER = "devolver"
CONSTRUCTOR = "constructor"
DESTRUCTOR = "destructor"
HACER = "hacer"
MIENTRAS = "mientras"
INCREMENTAR = "incrementar"
DESDE = "desde"
DECREMENTAR = "decrementar"
INSTANCIAR = "instanciar"
INCLUIR = "incluir"
SINO = "sino"
ENTONCES = "entonces"
PRINCIPAL = "Principal"
ESTATICO = "estatico"

/* Tipos de datos Jeffrey */
CADENA = "cadena"
BOLEANO = "boleano"
REAL = "real"
ENTERO = "entero"
NULO = "nulo"

/* Funciones Jeffrey */
CONSTRUCTOR = "constructor"
LEER = "leer"
ESCRIBIR = "escribir"
ELIMINAR = "eliminar"
CADENA_ENTERO = "cadenaAEntero"
CADENA_REAL = "cadenaAReal"
CADENA_BOLEANO = "cadenaABoleano"
SENO = "seno"
COSENO = "coseno"
TANGENTE = "tangente"
LOGARITMO = "logaritmo"
RAIZ = "raiz"

/* Operadores Alison */
AND = "AND"
OR = "OR"
MAYOR = ">"
MENOR = "<"
MENOROIGUAL = ">="
MAYOROIGUAL = "<="
DISTINTO = "!="
VERDADERO = "verdadero"
FALSO = "falso"
IGUALQUE = "=="


/* Simbolos Paolo*/
DOSPUNTOS = ":"
PUNTO = "."
PUNTOYCOMA = ";"
COMA = ","
IGUAL = "="
INICIOCORCHETE = "["
FINALCORCHETE = "]"
INICIOLLAVE = "{"
FINALLLAVE = "}"
INICIOPARENTESIS = "("
FINALPARENTESIS = ")"
GUION_BAJO = "_"

/* Operadores basicos Paolo */
SUMA = "+"
RESTA = "-"
DIVISION = "/"
MULTIPLICACION = "*"
MODULO = "%"
INCREMENTO = "++"
DECREMENTO = "--"

Simbolos = ({DOSPUNTOS}|
            {PUNTO}|
            {PUNTOYCOMA}|
            {COMA}|
            {IGUAL}|
            {INICIOCORCHETE}|
            {FINALCORCHETE}|
            {INICIOLLAVE}|
            {FINALLLAVE}|
            {INICIOPARENTESIS}|
            {FINALPARENTESIS}|
            {GUION_BAJO}
            {SUMA}|
            {RESTA}|
            {DIVISION}|
            {MULTIPLICACION}|
            {MODULO}|
            {MAYOR}|
            {MENOR})

/* Expresiones regulares */

FINLINEA = \r|\n|\r\n
EspaciosBlancos = {FINLINEA} | [ \t ]

NUMEROS = [0-9][0-9]*

LetrasMayus = [A-Z] | "Á" | "É" | "Í" | "Ó" | "Ú" | "Ñ"
LetrasMinus = [a-z] | "ñ" | "á" | "é" | "í" | "ó" | "ú"
Letras = {LetrasMinus} | {LetrasMayus}

VARIABLE = {LetrasMinus}({Letras}|{NUMEROS}|{GUION_BAJO})*
VARIABLECLASE = {LetrasMayus}({Letras}|{NUMEROS}|{GUION_BAJO})*

Texto = [^\r\n]
CadenaString = "\"" {Texto}* "\""

Comentario = "//" {Texto}* {FINLINEA}?
ComentarioLargo = "/*" [^*] ~"*/" | "/*" "*"+ "/"

/* Errores */

ERVARIABLE = {NUMEROS}({Letras}|{NUMEROS}|{GUION_BAJO})+

%%

/* Seccion 3 */
/* Palabras reservadas */
{Comentario} {
            String lex = "Comentario - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
        }
{ComentarioLargo} {
            String lex = "Comentario de varias lineas - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
        }
{CadenaString} {
            String lex = "Cadena de texto (string) " + yytext() + " - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
        }
{CLASE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CLASE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CLASE);
        }
{EXTIENDE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: EXTIENDE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.EXTIENDE);
        }
{PROPIEDADES} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PROPIEDADES - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PROPIEDADES);
        }
{METODOS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: METODOS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.METODOS);
        }
{PUBLICAS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PUBLICAS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PUBLICAS);
        }
{PUBLICOS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PUBLICOS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PUBLICOS);
        }
{PROTEGIDOS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PROTEGIDOS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PROTEGIDOS);
        }
{PROTEGIDAS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PROTEGIDAS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PROTEGIDAS);
        }
{PRIVADAS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PRIVADAS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PRIVADAS);
        }
{PRIVADOS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PRIVADOS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PRIVADOS);
        }
{SI} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: SI - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.SI);
        }
{DEVOLVER} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DEVOLVER - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DEVOLVER);
        }
{CONSTRUCTOR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CONSTRUCTOR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CONSTRUCTOR);
        }
{DESTRUCTOR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DESTRUCTOR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DESTRUCTOR);
        }
{HACER} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: HACER - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.HACER);
        }
{MIENTRAS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MIENTRAS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MIENTRAS);
        }
{INCREMENTAR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INCREMENTAR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INCREMENTAR);
        }
{DECREMENTAR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DECREMENTAR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DECREMENTAR);
        }
{DESDE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DESDE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DESDE);
        }
{INSTANCIAR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INSTANCIAR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INSTANCIAR);
        }
{INCLUIR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INCLUIR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INCLUIR);
        }
{SINO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: SINO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.SINO);
        }
{ENTONCES} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: ENTONCES - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.ENTONCES);
        }
{PRINCIPAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PRINCIPAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PRINCIPAL);
        }
{ESTATICO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: ESTATICO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.ESTATICO);
        }
///////////////////////////////////////////////////////////////////////////
//++++++++++++++++++++++++++++++++++++++++   SIMBOLOS   ++++++++++++++++++++++++++++++++++++++++
{DOSPUNTOS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DOSPUNTOS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DOSPUNTOS);
        }
{PUNTO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PUNTO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PUNTO);
        }
{PUNTOYCOMA} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: PUNTOYCOMA - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.PUNTOYCOMA);
        }
{COMA} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: COMA - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.COMA);
        }
{IGUAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: IGUAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.IGUAL);
        }
{INICIOCORCHETE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INICIOCORCHETE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INICIOCORCHETE);
        }
{FINALCORCHETE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: FINALCORCHETE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.FINALCORCHETE);
        }
{INICIOLLAVE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INICIOLLAVE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INICIOLLAVE);
        }
{FINALLLAVE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: FINALLLAVE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.FINALLLAVE);
        }
{INICIOPARENTESIS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INICIOPARENTESIS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INICIOPARENTESIS);
        }
{FINALPARENTESIS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: FINALPARENTESIS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.FINALPARENTESIS);
        }
///////////////////////////////////////////////////////////
{AND} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: AND - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.AND);
        }
{OR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: OR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.OR);
        }
{MAYOR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: Mayor - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MAYOR);
        }
{MENOR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MENOR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MENOR);
        }
{MENOROIGUAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MENOROIGUAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MENOROIGUAL);
        }
{MAYOROIGUAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MAYOROIGUAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MAYOROIGUAL);
        }
{DISTINTO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DISTINTO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DISTINTO);
        }
{VERDADERO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: VERDADERO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.VERDADERO);
        }
{FALSO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: FALSO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.FALSO);
        }
{IGUALQUE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: IGUALQUE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.IGUALQUE);
        }
//Tipos de datos y funciones

{CADENA} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CADENA - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CADENA);
}
{BOLEANO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: BOLEANO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.BOLEANO);
}
{REAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: REAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.REAL);
}
{ENTERO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: ENTERO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.ENTERO);
}
{NULO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: NULO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.NULO);
}
{CONSTRUCTOR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CONSTRUCTOR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CONSTRUCTOR);
}
{LEER} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: LEER - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.LEER);
}
{ESCRIBIR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: ESCRIBIR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.ESCRIBIR);
}
{ELIMINAR} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: ELIMINAR - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.ELIMINAR);
}
{CADENA_ENTERO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CADENA_ENTERO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CADENA_ENTERO);
}
{CADENA_REAL} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CADENA_REAL - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CADENA_REAL);
}
{CADENA_BOLEANO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: CADENA_BOLEANO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.CADENA_BOLEANO);
}
{SENO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: SENO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.SENO);
}
{COSENO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: COSENO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.COSENO);
}
{TANGENTE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: TANGENTE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.TANGENTE);
}
{LOGARITMO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: LOGARITMO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.LOGARITMO);
}
{RAIZ} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: RAIZ - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.RAIZ);
}

// OPERADORES BASICOS
{SUMA} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: SUMA - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.SUMA);
        }
{RESTA} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: RESTA - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.RESTA);
        }
{DIVISION} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DIVISION - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DIVISION);
        }
{MULTIPLICACION} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MULTIPLICACION - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MULTIPLICACION);
        }
{MODULO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: MODULO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.MODULO);
        }
{INCREMENTO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: INCREMENTO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.INCREMENTO);
        }
{DECREMENTO} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: DECREMENTO - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.DECREMENTO);
        }
{VARIABLE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: VARIABLE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.VARIABLE);
        }
{VARIABLECLASE} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: VARIABLECLASE - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.VARIABLECLASE);
        }
{NUMEROS} {
            String lex = "Palabra encontrada: '" + yytext() + "' coincide con lexema: NUMEROS - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.NUMEROS);
        }
{ERVARIABLE} {
            String lex = "ERROR: Variable mal escrita: '" + yytext() + "' - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1)
            System.out.println(lex);
            writeLex(lex);
        }
{FINLINEA} {
            String lex = "Fin de linea encontrado - Linea " + (yyline+1) + " | Columna: " + (yycolumn+1)
            System.out.println(lex);
            writeLex(lex);
            // return new Symbol(sym.FINLINEA);
        }
{EspaciosBlancos} {

        }
.        {
            String lex = "ERROR: Palabra o simbolo no reconocido: '" + yytext() + "' en linea " + (yyline+1) + " | Columna: " + (yycolumn+1);
            System.out.println(lex);
            writeLex(lex);
}



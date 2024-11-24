package analizadorsintactcarrito;

import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

L = [a-zA-Z_]+
D = [0-9]+
espacio = [ \t\r\n]+

%{
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{espacio}            { /* Ignore whitespace */ }
"//"(.)*             { /* Ignore single-line comments */ }
"\""                       { return new Symbol(sym.COMILLA, yychar, yyline, yytext()); }

"Toyota"|"Honda"|"Hyundai"|"Chevrolet"|"Ford"|"Nissan"|"BMW"|"Mercedes"|"Kia"|"Mazda"|"Volkswagen"|"Audi"|"Tesla"|"Jeep"|"Subaru"|"Volvo"|"Porsche"|"Lexus"|"Ferrari"|"Lamborghini"
                           { return new Symbol(sym.MARCA, yychar, yyline, yytext()); }
"<"                        { return new Symbol(sym.MAYOR, yychar, yyline, yytext()); }
"carrito"                  { return new Symbol(sym.CARRO, yychar, yyline, yytext()); }
"def"                      { return new Symbol(sym.DEF, yychar, yyline, yytext()); }
"main"                     { return new Symbol(sym.MAIN, yychar, yyline, yytext()); }
"espacio"                  { return new Symbol(sym.ESPACIO, yychar, yyline, yytext()); }
"setEspacio"               { return new Symbol(sym.SET_ESPACIO, yychar, yyline, yytext()); }
"posicionInicial"          { return new Symbol(sym.POSICION_INICIAL, yychar, yyline, yytext()); }
"avanzar"                  { return new Symbol(sym.AVANZAR, yychar, yyline, yytext()); }
"girar"                    { return new Symbol(sym.GIRAR, yychar, yyline, yytext()); }
"detener"                  { return new Symbol(sym.DETENER, yychar, yyline, yytext()); }
"retroceder"               { return new Symbol(sym.RETROCEDER, yychar, yyline, yytext()); }
"encenderLuces"            { return new Symbol(sym.ENCENDER_LUCES, yychar, yyline, yytext()); }
"activarBocina"            { return new Symbol(sym.ACTIVAR_BOCINA, yychar, yyline, yytext()); }
"usarSensorProximidad"     { return new Symbol(sym.USAR_SENSOR_PROXIMIDAD, yychar, yyline, yytext()); }
"cambiarColor"             { return new Symbol(sym.CAMBIAR_COLOR, yychar, yyline, yytext()); }
"encenderMotor"            { return new Symbol(sym.ENCENDER_MOTOR, yychar, yyline, yytext()); }
"apagarMotor"              { return new Symbol(sym.APAGAR_MOTOR, yychar, yyline, yytext()); }
"ajustarVelocidad"         { return new Symbol(sym.AJUSTAR_VELOCIDAD, yychar, yyline, yytext()); }
"finRecorrido"             { return new Symbol(sym.FIN_RECORRIDO, yychar, yyline, yytext()); }
"orientacion"              { return new Symbol(sym.ORIENTACION, yychar, yyline, yytext()); }
"ajustarOrientacion"       { return new Symbol(sym.AJUSTAR_ORIENTACION, yychar, yyline, yytext()); }
"usarSensorDistancia"      { return new Symbol(sym.USAR_SENSOR_DISTANCIA, yychar, yyline, yytext()); }
"diagnosticar"             { return new Symbol(sym.DIAGNOSTICAR, yychar, yyline, yytext()); }
"nivelBateria"             { return new Symbol(sym.NIVEL_BATERIA, yychar, yyline, yytext()); }
"cargarBateria"            { return new Symbol(sym.CARGAR_BATERIA, yychar, yyline, yytext()); }
"cambiarNombre"            { return new Symbol(sym.CAMBIAR_NOMBRE, yychar, yyline, yytext()); }
"ajustarSonido"            { return new Symbol(sym.AJUSTAR_SONIDO, yychar, yyline, yytext()); }
"trazarRuta"               { return new Symbol(sym.TRAZAR_RUTA, yychar, yyline, yytext()); }
"patronMovimiento"         { return new Symbol(sym.PATRON_MOVIMIENTO, yychar, yyline, yytext()); }
"esperar"                  { return new Symbol(sym.ESPERAR, yychar, yyline, yytext()); }
"siProximidad"             { return new Symbol(sym.SI_PROXIMIDAD, yychar, yyline, yytext()); }

"rojo"|"azul"|"amarillo"|"verde"|"negro"|"plateado"
                     { return new Symbol(sym.COLOR, yychar, yyline, yytext()); }
{L}({L}|{D})*"-"{L}({L}|{D})* { return new Symbol(sym.PLACA, yychar, yyline, yytext()); }
"-"{D}+|{D}+         { return new Symbol(sym.NUMERO, yychar, yyline, yytext()); }
"\""{L}({L}|{D})*"\""   { return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext()); }
{D}("."|{D})*        { return new Symbol(sym.N_DECIMAL, yychar, yyline, yytext()); }
{D}"°"               { return new Symbol(sym.NUMERO_G, yychar, yyline, yytext()); }
{L}({L}|{D})*       { return new Symbol(sym.NAME, yychar, yyline, yytext()); }


":-"                 { return new Symbol(sym.D_PG1, yychar, yyline, yytext()); }
"-:"                 { return new Symbol(sym.D_PG2, yychar, yyline, yytext()); }
"("                  { return new Symbol(sym.PARENTESIS_ABIERTO, yychar, yyline, yytext()); }
")"                  { return new Symbol(sym.PARENTESIS_CERRADO, yychar, yyline, yytext()); }
";"                  { return new Symbol(sym.P_COMA, yychar, yyline, yytext()); }
"-"                  { return new Symbol(sym.GUION, yychar, yyline, yytext()); }
","                  { return new Symbol(sym.COMA, yychar, yyline, yytext()); }
":"                  { return new Symbol(sym.D_PUNTOS, yychar, yyline, yytext()); }

.                    { return new Symbol(sym.ERROR, yychar, yyline, yytext()); }


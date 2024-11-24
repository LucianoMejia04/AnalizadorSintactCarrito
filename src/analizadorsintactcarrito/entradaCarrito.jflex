package analizadorsintactcarrito;
import static analizadorsintactcarrito.TokensCarrito.*;

%%
%class LexerCarrito
%type TokensCarrito

L=[a-zA-Z_]+
DIGITO=[0-9]+

COLOR= "rojo" |"azul"|"verde"|"amarillo"|"negro"|"plateado"
TAMAÑO="pequeño"|"mediano"|"grande"
MARCA="Toyota"|"Honda"|"Hyundai"|"Chevrolet"|"Ford"|"Nissan"|"BMW"|"Mercedes"|"Kia"|"Mazda"|"Volkswagen"|"Audi"|"Tesla"|"Jeep"|"Subaru"|"Volvo"|"Porsche"|"Lexus"|"Ferrari"|"Lamborghini"
ESPACIO=[ \t\r\n]+

%{
    public String lexeme;
%}
%%

{ESPACIO}            { /* Ignorar espacios y saltos de línea */ }
"//".*               { /* Ignorar comentarios de una línea */ }

"<"                        { lexeme = yytext(); return MAYOR; }
"carrito"                  { lexeme = yytext(); return CARRO; }
"espacio"                  { lexeme = yytext(); return ESPACIO; }
"setEspacio"               { lexeme = yytext(); return SET_ESPACIO; }
"posicionInicial"          { lexeme = yytext(); return POSICION_INICIAL; }
"avanzar"                  { lexeme = yytext(); return AVANZAR; }
"girar"                    { lexeme = yytext(); return GIRAR; }
"detener"                  { lexeme = yytext(); return DETENER; }
"retroceder"               { lexeme = yytext(); return RETROCEDER; }
"encenderLuces"            { lexeme = yytext(); return ENCENDER_LUCES; }
"activarBocina"            { lexeme = yytext(); return ACTIVAR_BOCINA; }
"usarSensorProximidad"     { lexeme = yytext(); return USAR_SENSOR_PROXIMIDAD; }
"cambiarColor"             { lexeme = yytext(); return CAMBIAR_COLOR; }
"encenderMotor"            { lexeme = yytext(); return ENCENDER_MOTOR; }
"apagarMotor"              { lexeme = yytext(); return APAGAR_MOTOR; }
"ajustarVelocidad"         { lexeme = yytext(); return AJUSTAR_VELOCIDAD; }
"finRecorrido"             { lexeme = yytext(); return FIN_RECORRIDO; }
"def"                      { lexeme = yytext(); return DEF; }
"main"                     { lexeme = yytext(); return MAIN; }
"orientacion"              { lexeme = yytext(); return ORIENTACION; }
"ajustarOrientacion"       { lexeme = yytext(); return AJUSTAR_ORIENTACION; }
"usarSensorDistancia"      { lexeme = yytext(); return USAR_SENSOR_DISTANCIA; }
"diagnosticar"             { lexeme = yytext(); return DIAGNOSTICAR; }
"nivelBateria"             { lexeme = yytext(); return NIVEL_BATERIA; }
"cargarBateria"            { lexeme = yytext(); return CARGAR_BATERIA; }
"cambiarNombre"            { lexeme = yytext(); return CAMBIAR_NOMBRE; }
"ajustarSonido"            { lexeme = yytext(); return AJUSTAR_SONIDO; }
"trazarRuta"               { lexeme = yytext(); return TRAZAR_RUTA; }
"patronMovimiento"         { lexeme = yytext(); return PATRON_MOVIMIENTO; }
"esperar"                  { lexeme = yytext(); return ESPERAR; }
"siProximidad"             { lexeme = yytext(); return SI_PROXIMIDAD; }


{MARCA}              { lexeme = yytext(); return MARCA; }
{TAMAÑO}             { lexeme = yytext(); return TAMAÑO; }
{DIGITO}             { lexeme = yytext(); return NUMERO; }
{COLOR}              { lexeme = yytext(); return COLOR; }
{L}({L}|{DIGITO})*"-"{L}({L}|{DIGITO})* 
                     { lexeme = yytext(); return PLACA; }
{L}({L}|{DIGITO})*   { lexeme = yytext(); return NAME; }
"\""{L}({L}|{DIGITO})*"\""   { lexeme = yytext(); return IDENTIFICADOR; }
{DIGITO}("."|{DIGITO})*
                     { lexeme = yytext(); return N_DECIMAL; }
{DIGITO}"°"
                     { lexeme = yytext(); return NUMERO_G; }



","                  { lexeme = yytext(); return COMA; }
"("                  { lexeme = yytext(); return PARENTESIS_ABIERTO; }
")"                  { lexeme = yytext(); return PARENTESIS_CERRADO; }
"\""                 { lexeme = yytext(); return COMILLA; }
"-"                  { lexeme = yytext(); return GUION; }
";"                  { lexeme = yytext(); return P_COMA; }
":"                  { lexeme = yytext(); return D_PUNTOS; }
":-"                 { lexeme = yytext(); return D_PG1; }
"-:"                 { lexeme = yytext(); return D_PG2; }
.                    { lexeme = yytext(); return ERROR; }
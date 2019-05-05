
%Tipos de preparacion
%[gr de cafe, gr de leche, gr de chocolate, ml de agua]
preparacion(espresso,[7,0,0,30]).
preparacion(americano,[7,0,0,60]).
preparacion(cortado,[7,3,0,50]).
preparacion(capuccino,[7,19,0,150]).
preparacion(latte,[7,9,0,90]).
preparacion(latte,[7,9,3,100]).

% Tamaños de taza: el numero indica el multiplicador de la cantidad de
% cada ingrediente
taza(grande,2).
taza(mediana,1).
taza(pequeña,1/2).

%Intensidad del cafe segun el tipo
intensidad(arabica,suave).
intensidad(robusta,fuerte).
intensidad(combinado,medio).
intensidad(descafeinado,descafeinado).

%Tiempo de preparacion segun estacion del año
tiempo(verano,60).
tiempo(primavera,90).
tiempo(invierno,120).

multiplicarLista(Numero,[H],[Salida]):- Salida is Numero*H.
multiplicarLista(Numero,[H|T],Salida):- multiplicarLista(Numero,T,X),Resultado is Numero*H, append([Resultado],X,Salida).

% prepararCafe(TamañoTaza, TipoPreparacion, TipoCafe, EstacionAño,
% Salida).

sePuedeUsar(Instalada,CantidadAgua,CantidadCafe,CantidadLeche):- Instalada = si, CantidadAgua >= 150, CantidadCafe >= 30, CantidadLeche >= 30.

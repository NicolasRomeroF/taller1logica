
%Tipos de preparacion
%[gr de cafe, gr de leche, gr de chocolate, ml de agua]
preparacion(espresso,[7,0,0,30]).
preparacion(americano,[7,0,0,60]).
preparacion(cortado,[7,3,0,50]).
preparacion(capuccino,[7,19,0,150]).
preparacion(latte,[7,9,0,90]).
preparacion(mokaccino,[7,9,3,100]).

% Tama�os de taza: el numero indica el multiplicador de la cantidad de
% cada ingrediente
taza(grande,2).
taza(mediana,1).
taza(peque�a,1/2).

%Intensidad del cafe segun el tipo
intensidad(arabica,suave).
intensidad(robusta,fuerte).
intensidad(combinado,medio).
intensidad(descafeinado,descafeinado).

%Tiempo de preparacion segun estacion del a�o
tiempo(verano,60).
tiempo(primavera,90).
tiempo(invierno,120).

multiplicarLista(Numero,[H],[Salida]):- Salida is Numero*H.
multiplicarLista(Numero,[H|T],Salida):- multiplicarLista(Numero,T,X),Resultado is Numero*H, append([Resultado],X,Salida).

prepararCafe(Tamaño, TipoP, TipoC, Estacion, Salida):- taza(Tamaño,T), preparacion(TipoP,[Comp1,Comp2,Comp3,Comp4]), intensidad(TipoC,Intensidad),tiempo(Estacion,Tiempo), S1 is Comp1*T, S2 is Comp2*T, S4 is Comp4*T, append([[S1],[S2],[S4],[Intensidad],[Tiempo]], Salida).


sePuedeUsar(Instalada,CantidadAgua,CantidadCafe,CantidadLeche):- Instalada = si, CantidadAgua >= 150, CantidadCafe >= 30, CantidadLeche >= 30.


%Tipos de preparacion
%[gr de cafe, gr de leche, gr de chocolate, ml de agua]
preparacion(espresso,[7,0,0,30]).
preparacion(americano,[7,0,0,60]).
preparacion(cortado,[7,3,0,50]).
preparacion(cappuccino,[7,19,0,150]).
preparacion(latte,[7,9,0,90]).
preparacion(mokaccino,[7,9,3,100]).

cantCafe(7).
cantLeche(espresso,0).
cantLeche(americano,0).
cantLeche(cortado,3).
cantLeche(cappuccino,19).
cantLeche(latte,9).
cantLeche(mokaccino,9).

cantChoc(espresso,0).
cantChoc(americano,0).
cantChoc(cortado,0).
cantChoc(cappuccino,0).
cantChoc(latte,0).
cantChoc(mokaccino,3).


cantAgua(espresso,30).
cantAgua(americano,60).
cantAgua(cortado,50).
cantAgua(cappuccino,150).
cantAgua(latte,90).
cantAgua(mokaccino,100).


% Tama�os de taza: el numero indica el multiplicador de la cantidad de
% cada ingrediente
taza(grande,2).
taza(mediana,1).
taza(pequeña,0.5).

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

division(Numero1, Numero2, Salida):- Salida is Numero1/Numero2.

buscarMenor(Tamaño, espresso, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantAgua(espresso,CantAgua),division(CantidadAgua,CantAgua,X2), append([[X1],[X2]],SalidaAux), min_list(SalidaAux,Salida).

buscarMenor(Tamaño, americano, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantAgua(americano,CantAgua),division(CantidadAgua,CantAgua,X2), append([[X1],[X2]],SalidaAux), min_list(SalidaAux,Salida).

buscarMenor(Tamaño, cortado, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantLeche(cortado,CantLeche), division(CantidadLeche,CantLeche,X2), cantAgua(cortado,CantAgua),division(CantidadAgua,CantAgua,X3), append([[X1],[X2],[X3]],SalidaAux), min_list(SalidaAux,Salida).

buscarMenor(Tamaño, cappuccino, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantLeche(cappuccino,CantLeche), division(CantidadLeche,CantLeche,X2), cantAgua(cappuccino,CantAgua),division(CantidadAgua,CantAgua,X3), append([[X1],[X2],[X3]],SalidaAux), min_list(SalidaAux,Salida).

buscarMenor(Tamaño, latte, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantLeche(latte,CantLeche), division(CantidadLeche,CantLeche,X2), cantAgua(latte,CantAgua),division(CantidadAgua,CantAgua,X3), append([[X1],[X2],[X3]],SalidaAux), min_list(SalidaAux,Salida).

buscarMenor(Tamaño, mokaccino, CantidadCafe,CantidadLeche, CantidadAgua,Salida):- cantCafe(CantCafe), division(CantidadCafe,CantCafe,X1), cantLeche(mokaccino,CantLeche), division(CantidadLeche,CantLeche,X2), cantAgua(mokaccino,CantAgua),division(CantidadAgua,CantAgua,X3),append([[X1],[X2],[X3]],SalidaAux), min_list(SalidaAux,Salida).

cantidadTazas(TamañoTaza, TipoPreparacion, TipoCafe, EstacionAño, CantidadCafe, CantidadLeche, CantidadAgua, Salida):- taza(TamañoTaza, Tamaño), buscarMenor(Tamaño, TipoPreparacion, CantidadCafe/Tamaño, CantidadLeche/Tamaño, CantidadAgua/Tamaño, SalidaAux), X1 is floor(SalidaAux), tiempo(EstacionAño, Tiempo),X2 is X1*Tiempo, append([[X1],[X2]], Salida).

sePuedeUsar(Instalada,CantidadAgua,CantidadCafe,CantidadLeche):- Instalada = si, CantidadAgua >= 150, CantidadCafe >= 30, CantidadLeche >= 30.

intensidadCafe(TipoCafe, TipoPreparacion, Salida):- intensidad(TipoCafe,Salida).
% Sentencia random prueba:
% ?-X is random (10).

% Punto 1
% Imprimir por pantalla 10 numeros aleatorios
% Aclaración (es una recursividad a la derecha)

aleatorio() :- numeros(1).

% Caso Base
numeros(10) :- X is random(10), write(X), nl.

% Caso general

numeros(C) :- C < 10,
    C1 is C + 1,
    X is random(10), 
    write(X), nl,
    numeros(C1).

% Otro ejercicio diferente
% Sumar N veces un numero
% Probar con sumar_n_veces(2,4,R).

sumar_n_veces(0,_,0).
sumar_n_veces(X,Y,R):- X =\= 0, suma(X,Y,0,0,R).

%Caso base
suma(X,Y,Y,A,A).

% Caso general
suma(X,Y,C,A,R) :- C < Y,
A1 is X + A,
C1 is C+1,
suma(X,Y,C1,A1,R).
% PARTE 3: Iteración con random e Impresión Recursiva

% Caso base
imprimir(1) :-
    random(1, 100, A),
    write(A), nl,
    write('fin'), nl,
    !. % Cut para cortar al final

% Caso general
imprimir(X) :-
    X > 1,
    random(1, 100, A),
    write(A), nl,
    X1 is X - 1,
    imprimir(X1).

% PRUEBA ?- imprimir(5).
% Salida: 
% 86
% 25
% 64
% 19
% 31
% fin
% true.

% Explicación caso base imprimir(1)
% En este caso, Prolog genera un único número aleatorio entre 1 y 100, lo muestra
% y luego imprime la palabra 'fin' para indicar que termino. El ! (cut) sirve para
% evitar que Prolog haga backtracking, de forma que el predicado se detiene en ese
% punto y la recursión no sigue. 

% EJERCICIO ADICIONAL

% Caso base multiplicar hasta 10
tabla(N, 10) :-
    R is N * 10,
    write(N), write(' * 10 = '), write(R), nl, 
    !. 

% Caso recursivo desde M hasta 10
tabla(N, M) :-
    M < 10,
    R is N * M, 
    write(N), write(' * '), write(M), write(' = '), write(R), nl,
    M1 is M + 1,
    tabla(N, M1).
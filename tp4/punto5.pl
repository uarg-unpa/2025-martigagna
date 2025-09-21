nodo(7, 4, 8).
nodo(4, 2, 9).
nodo(2, nil, nil).
nodo(9,nil, nil).
nodo(8, 5, 1).
nodo(5, nil, nil).
nodo(1, 6, nil).
nodo(6, nil, nil).

% Reglas
%PREORDEN 
% Caso base
preorden(nil) :- !.

% Caso general
preorden(R) :- write(R), nodo(R, HI, HD),
    preorden(HI), preorden(HD).

inorden(nil) :- !.
inorden(R) :- nodo(R, HI, HD),
    inorden(HI),
    write(R),
    inorden(HD).

posorden(nil) :- !.
posorden(R) :- nodo(R, HI, HD),
    posorden(HI),
    posorden(HD),
    write(R).
% Declarar predicados dinámicos
% En Prolog los hechos por defecto son estáticos, es decir, solo se pueden consultar, 
% pero no agregar ni eliminar mientras el programa correr. Por ello, es necesario utilizar dynamic,
% para indicar que esos predicados van a poder modificarse en tiempo de ejecución, permitiendo usar 
% asserta y assertz para agregar y retract para eliminar.
:- dynamic libro/2.
:- dynamic prestado/2.


libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").

% Regla: Un libro está disponible si no está prestado
disponible(Titulo) :- libro(Titulo, _), \+ prestado(Titulo, _).

% Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo, Autor) :- assertz(libro(Titulo, Autor)).

% Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo, Autor) :- asserta(libro(Titulo, Autor)).

% Procedimiento para registrar un préstamo
prestar(Titulo, Persona) :- 
    disponible(Titulo), 
    assertz(prestado(Titulo, Persona)).

% Consulta para ver todos los libros
listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Eliminar un libro

% Caso 1: el libro existe y no está prestado
eliminar_libro(Titulo) :-
    libro(Titulo, _),
    \+ prestado(Titulo, _),
    retract(libro(Titulo, _)),
    write('Libro eliminado: '), write(Titulo), nl.

% Caso 2: el libro está prestado
eliminar_libro(Titulo) :-
    prestado(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,
    fail. % Fuerza fracaso si está prestado

% Caso 3: el libro no existe
eliminar_libro(Titulo) :-
    \+ libro(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' no existe.'), nl,
    fail. % Fuerza fracaso si no existe

% Ejercicio adicional: eliminar préstamo
eliminar_prestamo(Titulo) :-
    retract(prestado(Titulo, Persona)),
    write(' Préstamo eliminado para libro: '), write(Titulo),
    write(' (estaba prestado a '), write(Persona), write(')'), nl.

eliminar_prestamo(Titulo) :-
    \+ prestado(Titulo, _),
    write('Error: no hay préstamo registrado para el libro '), write(Titulo), nl,
    fail.

% Prueba eliminar préstamo
% ?- eliminar_prestamo("el_principito").
% Salida: Préstamo eliminado para libro: el_principito (estaba prestado a juan)
%         true 

% ?- eliminar_prestamo("1984").
% Salida: Error: no hay préstamo registrado para el libro 1984
%         false.


% Pruebas con eliminar_libro

% ?- eliminar_libro("1984").
% Salida: Libro eliminado: 1984
% Primero Prolog busca en la base de hechos si existe libro("1984", Autor), como si existe
% verifica que no exista prestado("1984", _), no hay entonces continua y ejecuta 
% retract(libro("1984", _)) y elimina el hecho de la base.


% eliminar_libro("el_principito").
% Salida: Error: Libro el_principito está prestado.
%         false.
% Primero Prolog busca en la base de hechos si existe libro("el_principito", Autor), como si existe
% verifica si esta prestado y encuentra prestado("el_principito", "juan").
% Debido a que el libro esta prestado, entra en el segundo caso por lo tanto no elimina el libro e imprime el mensaje de error. 



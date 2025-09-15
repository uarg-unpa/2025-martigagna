producto(laptop, 800).  % producto(Nombre, Precio) 
producto(celular, 300). 
producto(tablet, 150). 
% Regla con cut: Clasifica productos como 'caro' (>500), 'medio' (200-500), o 'barato' (<200), 
% usando cut para cortar una vez encontrada la categoría. 

clasificar(Producto, Categoria) :-  
    producto(Producto, Precio),  
    Precio > 500,  
    Categoria = caro.
    !.  % Cut: No backtrack si caro
clasificar(Producto, Categoria) :-  
    producto(Producto, Precio),  
    Precio >= 200, Precio =< 500,  
    Categoria = medio,  
    !.  % Cut: No backtrack si medio 
clasificar(Producto, Categoria) :-  
    producto(Producto, Precio),  
    Precio < 200,  
    Categoria = barato. 

% Prueba con cut
% ?- clasificar(laptop, C).
% Salida: C = caro.

% Prueba sin cut
% ?- clasificar(laptop, C).
% Salida: C = caro ;
%         false.

% Con cut(!) Prolog se queda con Categoria = caro y no sigue buscando otras alternativas.
% Sin cut aunque ya encontro caro, Prolog hará backtracking y seguirá probando
% las otras reglas.

% Ejercicio adicional: es_oferta(Producto) si precio < 300
es_oferta(Producto) :-
    producto(Producto, Precio),
    Precio < 300, !,
    write(Producto), write(' está en oferta'), nl. 
es_oferta(Producto) :-
    producto(Producto, Precio), 
    Precio >=300, !,
    write(Producto), write(' no está en oferta'), nl, fail. 

% Prueba: es_oferta(tablet). 
% Salida: tablet está en oferta
%         true.

% Prueba: ?- es_oferta(celular).
% Salida: celular no está en oferta
%         false.

% Prueba: ?- es_oferta(laptop).
% Salida: laptop no está en oferta
%         false.
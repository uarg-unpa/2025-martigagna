% Se desea gestionar el precio de productos de un supermercado. Cada producto tiene un
% nombre, un precio y una categoría.
% 1. Crear la base de conocimientos con al menos 6 productos, asignando nombres, precios y
% categorías (por ejemplo, ‘E’, ‘F’, etc.).

:- dynamic producto/3.

producto(manzana, 50, e).
producto(frutilla, 80, e).
producto(leche, 150, f).
producto(pan, 100, f).
producto(jugo, 120, g).
producto(helado, 140, g).
producto(aceite, 180, f). 
producto(carne, 250, e).

% 2. Implementar un predicado recursivo “aumento_productos” que aplique un aumento del 5% 
% a todos los productos de la categoría E, actualizando sus precios en la base de hechos
% utilizando retract y assert.

aumento_productos :-
    producto(Nombre, Precio, e),
    retract(producto(Nombre, Precio, e)),
    PrecioNuevo is Precio * 1.05,
    assertz(producto(Nombre, PrecioNuevo, e)),
    write('Producto: '), write(Nombre),
    write(', Nuevo precio: '), write(PrecioNuevo),
    write(', Categoria: e'), nl,
    fail. % fuerza backtracking para seguir con el siguiente
aumento_productos. % termina cuando no hay mas

% Prueba: ?- aumento_productos.
% Salida: 
% Producto: manzana, Nuevo precio: 52.5, Categoria: e
% Producto: frutilla, Nuevo precio: 84.0, Categoria: e
% Producto: carne, Nuevo precio: 262.5, Categoria: e
% true.
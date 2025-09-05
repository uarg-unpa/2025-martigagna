padre(juan, pedro).
padre(juan, maria).
padre(pedro, ana).

abuelo(X, Z):- padre(X, Y), padre(Y, Z).

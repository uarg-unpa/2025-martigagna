hombre(jose).
hombre(bryan).
mujer(ana).
mujer(luz).

gusto(ana, cine).
gusto(luz, teatro).
gusto(bryan, fut).
gusto(jose, cine).

novios(M, H):- gusto(H, G), gusto(M, G).
pareja(M, H):- mujer(M), hombre(H).


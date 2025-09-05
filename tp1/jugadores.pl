jugador(mario, plataforma).
jugador(luigi, plataforma).
jugador(link, aventura).
juega_en(mario, super_mario).
juega_en(luigi, super_mario).
juega_en(link, zelda).
nivel(super_mario, facil).
nivel(zelda, dificil).

juego_genero(Jugador, Genero):- jugador(Jugador, Genero), juega_en(Jugador, Juego).
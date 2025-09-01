% HECHOS
pelicula(inception, ciencia_ficcion).
pelicula(forrest_gump, drama).
pelicula(jurassic_park, aventura).
pelicula(avengers, ciencia_ficcion).
pelicula(dunkerque, accion).
pelicula(titanic, drama).
pelicula(catch_me_if_you_can, comedia).

actor(leonardo_dicaprio, inception).
actor(leonardo_dicaprio, titanic).
actor(leonardo_dicaprio, catch_me_if_you_can).
actor(tom_hanks, forrest_gump).
actor(tom_hanks, catch_me_if_you_can).
actor(chris_evans, avengers).
actor(mark_ruffalo, avengers).

director(christopher_nolan, inception).
director(christopher_nolan, dunkerque).
director(steven_spielberg, jurassic_park).
director(steven_spielberg, catch_me_if_you_can).

actua_en_genero(NombreActor, Genero) :- actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, Genero).
colaboracion(NombreActor1, NombreActor2) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2.
director_de_genero(NombreDirector, Genero) :- director(NombreDirector, TituloPelicula), pelicula(TituloPelicula, Genero).
pelicula_con_colaboracion(TituloPelicula) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2.
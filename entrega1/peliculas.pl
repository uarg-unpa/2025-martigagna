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

% REGLAS
actua_en_genero(NombreActor, Genero) :- actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, Genero).
colaboracion(NombreActor1, NombreActor2) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2.
director_de_genero(NombreDirector, Genero) :- director(NombreDirector, TituloPelicula), pelicula(TituloPelicula, Genero).
pelicula_con_colaboracion(TituloPelicula) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2.


% CONSULTAS
% a) ¿Cuáles películas dirige Christopher Nolan?
% ?- director(christopher_nolan, TituloPelicula).
% Prolog buscara todos los hechos director(christopher_nolan, X).
% Se unifica con inception luego con dunkerque 
% Resultado: TituloPelicula = inception; dunkerque.

% b) ¿Cuáles actores actúan en películas de ciencia ficción?
% ?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
% Prolog busca peliculas con genero ciencia_ficcion: inception y avengers
% Con cada resultado unifica TituloPelicula con inception y avengers
% Para inception encuentra a leonardo_dicaprio y para avengers encuentra a chris_evans y mark_ruffalo
% Resultado: NombreActor = leonardo_dicaprio; chris_evans; mark_ruffalo.

% c) Lista todas las películas y sus géneros.
% ?- pelicula(TituloPelicula, Genero).
% Prolog recorre todos los hechos
% Devuelve uno por uno: inception, ciencia_ficcion - forrest_gump, drama - etc.


% d) ¿Hay algún actor que actúe en Inception y en otra película?
% ?- actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Busca actores de inception: leonardo_dicaprio
% Con ese mismo actor busca otras peliculas: titanic, catch_me_if_you_can
% Verifica que OtraPelicula sea distinto a inception
% Resultado: NombreActor = leonardo_dicaprio, OtraPelicula = titanic;
% NombreActor = leonardo_dicaprio, OtraPelicula = catch_me_if_you_can.



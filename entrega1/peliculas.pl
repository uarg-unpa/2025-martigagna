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
% Prolog buscará en la base hechos que coincidan con el primer argumento 'christopher_nolan'.
% Encuentra inception y dunkerque, unifica TituloPelicula con cada uno.
% Con backtracking devuelve primero inception, luego dunkerque.
% Salida:    TituloPelicula = inception;  
%            TituloPelicula = dunkerque.

% b) ¿Cuáles actores actúan en películas de ciencia ficción?
% ?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
% Primero busca en la base de hechos películas con género ciencia_ficcion 
% Para cada una (inception y avengers), unifica TituloPelicula y busca actores de esa película.
% Devuelve leonardo_dicaprio (inception), chris_evans y mark_ruffalo (avengers).
% Usa backtracking para recorrer todas las combinaciones posibles.

% Salida: 
%            TituloPelicula = inception,
%            NombreActor = leonardo_dicaprio ;
%            TituloPelicula = avengers,
%            NombreActor = chris_evans ;
%            TituloPelicula = avengers,
%            NombreActor = mark_ruffalo.


% c) Lista todas las películas y sus géneros.
% ?- pelicula(TituloPelicula, Genero).
% Prolog recorre todos los hechos 
% En cada paso unifica TituloPelicula con el nombre y Genero con su género.
% Va probando con cada hecho usando backtracking hasta agotar todas las opciones.
% Salida: TituloPelicula = inception,
% NombreActor = leonardo_dicaprio ;
% TituloPelicula = avengers,
% NombreActor = chris_evans ;
% TituloPelicula = avengers,
% NombreActor = mark_ruffalo.
% TituloPelicula = inception,
% Genero = ciencia_ficcion ;
% TituloPelicula = forrest_gump,
% Genero = drama ;
% TituloPelicula = jurassic_park,
% Genero = aventura ;
% TituloPelicula = avengers,
% Genero = ciencia_ficcion ;
% TituloPelicula = dunkerque,
% Genero = accion ;
% TituloPelicula = titanic,
% Genero = drama ;
% TituloPelicula = catch_me_if_you_can,
% Genero = comedia.


% d) ¿Hay algún actor que actúe en Inception y en otra película?
% ?- actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Busca actores de inception: leonardo_dicaprio
% Con ese mismo actor busca otras peliculas y unifica con titanic y catch_me_if_you_can
% Verifica que OtraPelicula sea distinto a inception con la condicion \=
% Salida: NombreActor = leonardo_dicaprio,
%         OtraPelicula = titanic ;
%         NombreActor = leonardo_dicaprio,
%         OtraPelicula = catch_me_if_you_can.


% CONSULTAS PROPIAS
% ¿Qué actores trabajaron en películas dirigidas por Steve Spielberg?
%
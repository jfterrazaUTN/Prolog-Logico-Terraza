% Primera Clase de Prolog - Logico - 24/06/24
% BASE DE CONOCIMIENTOS

escribio(elsaBornemann, socorro).
escribio(neilGaiman, sandman).
escribio(alanMoore, watchmen).
escribio(brianAzarello, cienBalas).
escribio(warrenEllis, planetary).
escribio(frankMiller, elCaballeroOscuroRegresa).
escribio(frankMiller, batmanAnioUno).
escribio(neilGaiman, americanGods).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).
escribio(brandonSanderson, mistborn).
escribio(hernanHess, demian).
escribio(richie, lenguajeC).
escribio(nik, gaturro18).

esComic(sandman).
esComic(cienBalas).
esComic(watchmen).
esComic(planetary).
esComic(elCaballeroOscuroRegresa).
esComic(batmanAnioUno).
esComic(spiderman).
esComic(onePiece).
esComic(gaturro18).

esArtistaDelNovenoArte(Artista):-
    escribio(Artista,Obra),
    esComic(Obra).

copiasVendidas(socorro, 100000).
copiasVendidas(sandman, 200000).
copiasVendidas(watchmen, 300000).
copiasVendidas(cienBalas, 40000).
copiasVendidas(planetary, 50000).
copiasVendidas(elCaballeroOscuroRegresa, 60000).
copiasVendidas(batmanAnioUno, 70000).
copiasVendidas(americanGods, 80000).
copiasVendidas(buenosPresagios, 90000).
copiasVendidas(buenosPresagios, 10000).
copiasVendidas(fundacion, 20000).
copiasVendidas(yoRobot, 30000).
copiasVendidas(elFinDeLaEternidad, 30000).
copiasVendidas(laBusquedaDeLosElementos, 40000).
copiasVendidas(martinFierro, 50000).
copiasVendidas(it, 60000).
copiasVendidas(misery, 70000).
copiasVendidas(carrie, 80000).
copiasVendidas(elJuegoDeGerald, 90000).
copiasVendidas(rayuela, 10000).
copiasVendidas(ficciones, 20000).
copiasVendidas(elAleph, 30000).
copiasVendidas(cuentosDeLaSelva, 40000).
copiasVendidas(cuentosDeLocuraAmorYMuerte, 50000).
copiasVendidas(mistborn, 1000001).
copiasVendidas(demian, 4).
copiasVendidas(lenguajeC, 0).
copiasVendidas(gaturro18, 18).

esBestSeller(UnaObra) :-
  copiasVendidas(UnaObra, CantidadVendida),
  CantidadVendida > 50000.

esBestSeller(UnaObra) :-
  copiasVendidas(cuentosDeLaSelva, CantidadVendida),
  copiasVendidas(UnaObra, CantidadVendida).

esReincidente(Artista) :-
  escribio(Artista, UnaObra),
  escribio(Artista, OtraObra),
  UnaObra \= OtraObra.

convieneContratar(Artista) :-
  esReincidente(Artista).

convieneContratar(Artista) :-
  escribio(Artista, UnaObra),
  esBestSeller(UnaObra).

leGustaA(gus, sandman).

leGustaA(gus, UnaObra):-
	escribio(isaacAsimov, UnaObra).

esLibro(Obra) :-
  escribio(_,Obra),
  not(esComic(Obra)).

/*Teniendo en cuenta la base de conocimientos que vimos en clase, 
traer resuelto para la clase que viene el siguiente pedido: 
Queremos saber si una obra es rioplatense, que es cuando la nacionalidad
de su artista es platense (Uruguay o Argentina).*/

%Trabajado en Clase 01-07

nacionalidad(elsaBornemann, argentina).
nacionalidad(jorgeLuisBorges, argentina).
nacionalidad(joseHernandez, argentina).
nacionalidad(julioCortazar, argentina).
nacionalidad(horacioQuiroga, uruguay).
nacionalidad(galeano, uruguay).
nacionalidad(neruda, chilena).

esObraRioPlatense(Obra):-
  escribio(Artista, Obra),
  esArtistaRioPlatense(Artista).

esArtistaRioPlatense(Artista):-
  nacionalidad(Artista, Nacionalidad),
  esNacionalidadRioPlatense(Nacionalidad).

esNacionalidadRioPlatense(argentina).
esNacionalidadRioPlatense(uruguay).

%-----%

%∀ x / P(x) -> Q(x)
%forall(antecedente, consecuente)

soloEscribioComics(UnArtista):-
  escribio(UnArtista, _), %Generador. Hace que mi predicado sea inversible
  forall(escribio(UnArtista, Obra), esComic(Obra)).

%functores de genero de libro
%novela(Tema, CantidadDeCapitulos)
%libroDeCuentos(CantidadDeCuentos)
%cientifico(Disciplina)
%bestSeller(Precio, CantidadDePaginas)

esDeGenero(it,novela(terror, 11)).
esDeGenero(ficciones, libroDeCuentos(17)).
esDeGenero(lenguajeC, libroCientifico(programacion)).
esDeGenero(harryPotter, bestSeller(32000, 636)).

estaBuena(Obra):-
  esDeGenero(Obra, Genero),
  esBuenGenero(Genero).

esBuenGenero(novela(terror, _)).

esBuenGenero(libroDeCuentos(Cantidad)):-
  Cantidad > 10.

esBuenGenero(bestSeller(Precio, Paginas)):-
  Precio/Paginas < 50.

esBuenGenero(novela(policial, Capitulos)):-
  Capitulos < 12.

esBuenGenero(libroCientifico(fisicaCuantica)).

%Usamos POLIMORFISMO para poder definir "esBuenGenero". 

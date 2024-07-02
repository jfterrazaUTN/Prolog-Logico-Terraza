%Solucion de Jose Francisco TERRAZA
%TP "Quien ayuda al Rasta" 

%Mi Universo ocurre en un Aula:

/*
estaEnElAula(persona, suerte).
seQuieren(persona1, persona2).
*/

estaEnElAula(rasta, 10).
estaEnElAula(polito, 7).
estaEnElAula(santi, 15).

rastaQuiereA(santi).
rastaQuiereA(polito).
politoQuiereA(rasta).
politoQuiereA(santi).
santiQuiereA(polito).

ayudaSantiA(UnaPersona):-
    santiQuiereA(UnaPersona),
    estaEnElAula(santi, SuerteDeSanti),
    estaEnElAula(UnaPersona, SuerteDeLaPersona),
    SuerteDeSanti > SuerteDeLaPersona.
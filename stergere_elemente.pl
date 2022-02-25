%Aparitii
%(i,i,o)

aparitii(_,[],0).
aparitii(E,[E|T],REZ):-
	aparitii(E,T,REZ1), REZ1 is REZ+1,!.
aparitii(E,[_|T],REZ):-
	aparitii(E,T,REZ).
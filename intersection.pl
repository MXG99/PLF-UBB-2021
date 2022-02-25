% Sa se scrie un predicat care intoarce intersectia a doua multimi.
% Model de flux (i,i,o) sau (i,i,i)
% intersectie (L1: lista 1, L2: lista 2, R: boolean sau lista)
% Model Matematic
%	                    		  {		[]; daca L1 este lista vida				
% intersectie(L1(l1l2..ln), L2) = { 	L1 + intersectie(l2l3..ln, L2)	; daca l1 este membru din L2
%                       		  {		intersectie(l2l3..ln, L2); altfel
e_membru(X,[X|_]).
e_membru(X,[_|COADA]):-
	e_membru(X,COADA).


intersectie([A|L1], L2, [A|R]) :-
	e_membru(A,L2), intersectie(L1,L2,R).
intersectie([A|L1], L2, R) :-
	\+ e_membru(A,L2), intersectie(L1,L2,R).
intersectie([],L2,[]).

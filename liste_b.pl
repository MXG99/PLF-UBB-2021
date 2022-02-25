% Definiti un predicat care determina succesorul unui numar reprezentat
% cifra cu cifra intr-o lista. De ex: [1 9 3 5 9 9] => [1 9 3 6 0 0]

% Model de flux: (i,o,o)
% Model matematic:
% succesor_carry(L1..Ln) = (1, [(L1 + 1) % 10]), n = 1 si (L1 + 1) > 9
%                          (0, [(L1 + 1)]), n = 1 si (L1 + 1) <= 9
%                          (1, (L1 + C1) % 10 (+) R1), C1 = 1 si (L1 + C1) > 9 unde (C1, R1) = succesor_carry(L2..Ln)
%                          (0, (L1 + C1) (+) R1), C1 = 1 si (L1 + C1) <= 9 unde (C1, R1) = succesor_carry(L2..Ln)
%                          (0, L1 (+) R1), C1 = 0 unde (C1, R1) = succesor_carry(L2..Ln)
% Model de flux: (i,o)                       
% successor(L1..Ln) = 1 (+) R1, C1 = 1 unde (C1, R1) = succesor_carry(L1..Ln)
%                    R, C1 = 0 unde (C1, R) = succesor_carry(L1..Ln)


succesor_carry([E], 1, [E2]) :- E1 is E + 1,
                                E1 > 9,
                                E2 is E1 mod 10.
                                
succesor_carry([E], 0, [E1]) :- E1 is E + 1,
                                E1 =< 9.
                                
succesor_carry([H|T], 1, R) :- succesor_carry(T, C1, R1),
                               C1 =:= 1,
                               H1 is H + C1,
                               H1 > 9,
                               H2 is H1 mod 10,
                               R = [H2|R1].

succesor_carry([H|T], 0, R) :- succesor_carry(T, C1, R1),
                               C1 =:= 1,
                               H1 is H + C1,
                               H1 =< 9,
                               R = [H1|R1].

succesor_carry([H|T], 0, R) :- succesor_carry(T, C1, R1),
                               C1 =:= 0,
                               R = [H|R1].
              
                               
succesor(L, R) :- succesor_carry(L, C, R1),
                  C =:= 1,
                  R = [C|R1].
                  
succesor(L, R) :- succesor_carry(L, C, R),
                  C =:= 0.


% Se da o lista eterogena, formata din numere intregi si liste de cifre.
% Pentru fiecare sublista sa se determine succesorul numarului reprezentat
% cifra cu cifra de lista respectiva. De ex:
% [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
% [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]
% Model de flux: (i,o)
%
%
% prelucrare_liste(L1...Ln) = [], n = 0
%                             succesor(L1) (+) prelucrare_liste(L2...Ln), L1 = lista  
%							  L1 (+) prelucrare_liste(L2...Ln), L1 != lista
 
      
prelucrare_liste([],[]).            
prelucrare_liste([H|T], [R1|R]) :-
	is_list(H),
	succesor(H, R1),
	prelucrare_liste(T,R).
	
prelucrare_liste([H|T], [H|R]) :-
	not(is_list(H)), 
	prelucrare_liste(T,R).
		
% Folosim doua predicate, unul de transformare a unei liste in numar si cealalta de transformare a unui numar intr-o lista.
% Apel de predicat transformare_lista_nr(L:Lista, X:0)
% Model de flux (i,o)


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
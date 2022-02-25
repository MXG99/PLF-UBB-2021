% sumaPar(L: lista, R: integer)
% L - lista de numere pentru care calculam suma numerelor pare
% R - rezultatul
% model de flux (i,o) sau (i,i)

Pr(E,L,[E|L]).

Pr(E,[H|T], [H|L1]):- Pr(E, T, L1).

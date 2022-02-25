% Sa se construiasca lista (m, ..., n), adica multimea numerelor intregi din intervalul [m, n].
% Model de flux: (i, i, o) sau (i, i, i)
% run(T - capatul inferior al intervalului, N - capatul superior al intervalului, R - rezultatul lista sau boolean)
% Model matematic
%					{ [], daca M = N
%	numere(M,N,R) = { numere(M,N-1) + N, altfel

numere(M,M,[]).
numere(M,N,R) :-
	N2 is N-1,
	numere(M,N2,R1),
	append(R1,[N],R).

run(T,N,R) :-
	M is T-1,
	numere(M,N,R).
	
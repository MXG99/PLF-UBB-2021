% Model matematic:
% generate_list(P, N) = [], P = N + 1
%                       P (+) generate_list(P + 1, N), altfel
% Model de flux (i, i, o)
generate_list(P, N, R) :-
	NN is N+1,
	P =:= NN,!,
	R = [].

generate_list(P, N, R) :-
	PP is P+1,
	generate_list(PP, N, R1),
	R = [P|R1].	

% Model matematic:
% generate_list_wrapper(N) = generate_list(1, N)	
generate_list_wrapper(N, L) :-
	generate_list(1, N, L).
	
% remove(X,L,T) T este lista cu X eliminat din L.
% Pentru T=[1], care lista satisface X = 2 => [1,2], [2,1]
% Model matematic:
% Non-determinist
% remove(E, L1..Ln) = L2..Ln, E = L1
%                     L1 (+) remove(E, L2..Ln)
% Model de flux: (i, o, i); desi modelul initial este (i, i, o)
remove(X,[X|T],T).
remove(X,[F|T],[F|T1]) :- remove(X,T,T1).


% Model matematic: 
%   Non-determinist
%	perm(L1...Ln) = []; daca n = 0
%					R; unde remove(L1, R) = perm(L2..Ln)		
% Model de flux: (i, o)
perm([X|Y],Z) :- perm(Y,W), remove(X,Z,W).
perm([],[]).

% Model matematic:
% abs_diff(V1, V2) = V1 - V2, V1 - V2 > 0
%                  = -(V1 - V2), altfel
% Model de flux: (i, i, o)
abs_diff(V1, V2, A) :-
	V is V1-V2,
	V < 0,
	A is V*(-1).

abs_diff(V1, V2, A) :-
	V is V1-V2,
	V >=0,
	A = V.

% Model matematic:
% verify(L1..Ln, M) = true, L = []
%                     verify(L2..Ln, M), abs_diff(L1, L2) >= M
%                     false, altfel
% Model de flux: (i,o)
verify([_],_).
verify([V1,V2|T], M) :- 
	abs_diff(V1, V2, A),
	A >= M, 
	verify([V2|T], M).

% Model matematic:
% Non-determinist
% solve(N, M) = perm(generate_list_wrapper(N)), verify(perm(generate_list_wrapper(N)), M) = true
% Model de flux:  (i, i, o)
solve(N, M, P) :-
	generate_list_wrapper(N, L),
	perm(L, P),
	verify(P, M).
mylength([],0):-!.
mylength([_|L],M):-
    mylength(L,M1),
    M=M1+1.
    
run(L):-
    write("N="),
    read(N),
    tipar(L,N).

tipar(L,N):-
    length(L,M),
    N>M,
    write("nu exista element"),
    nl,!.
tipar(L,N):-
    select(L,N,S),
    write("ELEMENT "),
    write(S),
    nl.

select([A|_],1,A):-!.
select([_|L],N,S):-
    N1 is N-1,
    select(L, N1, S).


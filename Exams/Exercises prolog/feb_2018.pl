getE(1,[H|L], [H]).
getE(I,[H|L], N):- I1 is I-1, getE(I1,L,N).

storeElem([],L2,[]).
storeElem([HI|LI], L2,Ris):- getE(HI,L2,N),storeElem(LI,L2,Z),append(N,Z,Ris).

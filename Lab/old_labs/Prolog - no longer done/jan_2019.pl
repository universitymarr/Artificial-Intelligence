num2list(0,[0]).
num2list(N,L):- N1 is N-1, num2list(N1,Z),append(Z,[N],L).

listnumbers([],[]).
listnumbers([H1,H2|T],L2):- H1>H2, listnumbers([H2|T],L2).
listnumbers([H|T],L2):-num2list(H,Z),listnumbers(T,W),append([Z],W,L2).

num2list2([],[]).
num2list2([H1,H2|T],Z):- H1<H2, num2list(H1,X),num2list2([H2|T],L), append([X],L,Z).
num2list2([H|T],Z):- num2list2(T,Z).

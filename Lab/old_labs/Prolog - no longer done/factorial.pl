factorial(0, 1).
factorial(Y, X) :- Y > 0, 
       Y1 is Y-1, 
       factorial(Y1, X1), 
       X is X1 * Y.

pow1(_,0,1).
pow1(B,E,Z) :- E>0, E1 is E-1,pow1(B,E1,Z1),Z is B * Z1 .


minimum(X,Y,Z) :- X >= Y,Z is Y.
minimum(X,Y,Z) :- X < Y,Z is X.

sum1(0,0).
sum1(N,Z):- N>0,N1 is N-1,sum1(N1,Z1), Z is N+Z1.


/*erd(X,Y) :- erdosnumber(X,0,Y).

erdosnumber(X,Y,Y) :- erdosnum(X,Y).
erdosnumber(X,Y,N) :- Y<10, Y1 is Y+1,erdosnumber(X,Y1,N).

erdosnum(erdos,0).
erdosnum(X,N) :- N>0, coauthor(X,Z),N1 is N-1,erdosnum(Z,N1).



coauthor(erdos,brachman).
coauthor(erdos,einstein).
coauthor(erdos,konolige).
coauthor(brachman,nardi).
coauthor(nardi,settembre).
coauthor(brachman,erdos).
coauthor(einstein,erdos).
coauthor(konolige,erdos).
coauthor(nardi,brachman).
coauthor(settembre,nardi).*/
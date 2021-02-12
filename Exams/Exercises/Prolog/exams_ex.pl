scal_product([],[],0).
scal_product([H1|T1],[H2|T2],N):- N1 is H1*H2, scal_product(T1,T2,Z), plus(N1,Z,N).


existpath(T,L):- existpath_aux(T,L,N),N=<1.

existpath_aux(void,L,0).
existpath_aux(tree(E,Left,Right),L,N):- member(E,L),existpath_aux(Left,L,N1), existpath_aux(Right,L,N2), N is min(N1,N2)+1.
existpath_aux(tree(E,Left,Right),L,N):- not(member(E,L)), existpath_aux(Left,L,N1), existpath_aux(Right,L,N2),N is min(N1,N2).

isassociative([]).
isassociative([[X,Y]|T]):- atom(X),isassociative(T).

findt([[H1,H2]|Tail], H1,H2).
findt([[H1,H2]|Tail], A, T):- findt(Tail,A,T).

findt2([],A,[A]):- !.
findt2([[H1,H2]|Tail], H1,[H2]).
findt2([[H1,H2]|Tail], A, T):- findt2(Tail,A,T).

subs(AL,[],[]):- !.
subs(AL,[H|Tail], Ris):- findt2(AL,H,T), subs(AL,Tail,Z),append(T,Z,Ris).

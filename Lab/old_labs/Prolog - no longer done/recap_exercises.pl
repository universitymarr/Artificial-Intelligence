prefix1([],[]).
prefix1([X],[X|_Y]).
prefix1([X|Xs],[X|Ys]) :- prefix1(Xs,Ys).

suffix1([],[]).
suffix1(X,X).
suffix1(Xs,[_Y|Ys]) :- suffix1(Xs,Ys).

index1([X|_], X, 1).
index1([_|Xs], E, Z):-index1(Xs, E, Z1),Z is Z1+1.

index2([[X|Xs]|_Ys], [X|Xs], 1).
index2([[_X|_Xs]|Ys], E, Z):-index2(Ys, E, Z1),Z is Z1+1.


get1([X|_Xs],1,X).
get1([_X|Xs],N,Z) :- N1 is N-1,get1(Xs,N1,Z).

get2([[X|Xs]|_Ys],1,[X|Xs]).
get2([[_X|_Xs]|Ys],N,[Z|Zs]) :- N1 is N-1,get2(Ys,N1,[Z|Zs]).

getD([[X|Xs]|Ys],I,Z) :- get2([[X|Xs]|Ys],I,Z1),get1(Z1,I,Z).


allE2([X,Y]) :- X==Y.
allE2([_X|Xs]) :- allE2(Xs).

allButOne2([X,Y]) :- X\==Y.
allButOne2([X,Y|Xs]) :- X\==Y,allE2([X|Xs]).
allButOne2([X,Y|Xs]) :- X\==Y,allE2([Y|Xs]).
allButOne2([X,Y|Xs]) :- X==Y,allButOne2(X|Xs).



albMax(tree(E,tree(E1,void,void),tree(E2,void,void))) :- E is max(E1,E2).
albMax(tree(_Element,Left,Right)) :- albMax(Left),albMax(Right).

filterAM2(In,Out) :- include(albMax,In,Out).

slice([X|_],1,1,[X]).
slice([X|Xs],1,K,[X|Ys]) :- K > 1, K1 is K - 1, slice(Xs,1,K1,Ys).
slice([_|Xs],I,K,Ys) :- I > 1, I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).

range(I,I,[I]).
range(N,M,[N|Z]):- N<M,N1 is N+1,range(N1,M,Z).

count_leaves(tree(_,void, void), 0).
count_leaves(tree(_,L,R), I) :- count_leaves(L, I2), count_leaves(R, I3), I is I2 + I3 + 1.

tree_to_list(tree(Element,void,void),[Element]).
tree_to_list(tree(Element,Left,Right),Z) :- tree_to_list(Left,LL),tree_to_list(Right,RL),append(LL,[Element|RL],Z).

count_int(tree(Element,Left,Right),Z) :-tree_to_list(tree(Element,Left,Right),C1),
length(C1,Z1),count_leaves(tree(Element,Left,Right),Z2),Z is Z1-Z2.

















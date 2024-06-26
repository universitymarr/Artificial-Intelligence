
/*Exam 15.01.18*/
list_to_tree(void,[]).
list_to_tree(tree(E,Left,Right),Z) :- list_to_tree(Left,ListLeft),list_to_tree(Right,ListRight),
append(ListLeft,[E|ListRight],Z).

max_list([X],X).
max_list([X|Xs], M):- max_list(Xs, M), M >= X.
max_list([X|Xs], X):- max_list(Xs, M), X >  M.

max_tree(tree(E,Left,Right),Z) :- list_to_tree(tree(E,Left,Right),Z1),max_list(Z1,Z).

/*Exam 15.02.18*/
get1([],_,[]).
get1([X|_Xs],1,X).
get1([_|Xs],N,Z) :- N1 is N-1,get1(Xs,N1,Z).

double_lists([],[_X|_Xs],[]).
double_lists([X|Xs],[Y|Ys],[Z|Zs]) :- get1([Y|Ys],X,Z),double_lists(Xs,[Y|Ys],Zs).

/*Exam 14.01.19*/
num2list(N, Z) :- num2list(0, N, Z).

num2list(N, N, [N]).
num2list(N0, N, [N0| List]) :-N0 < N, N1 is N0 + 1, num2list(N1, N, List).

listnumbers([],[]).
listnumbers([H1,H2|T],L2):- H1>H2, listnumbers([H2|T],L2).
listnumbers([H|T],L2):-num2list(H,Z),listnumbers(T,W),append([Z],W,L2). 


/*Exam 13.01.20*/

isLA([[X,Y]]):- X\==Y.
isLA([[_X,_Y]|Xs]) :- isLA(Xs).

makeLA([], []).
makeLA([[X,Y]|Xs], [[X,Y]| Z]) :- X\==Y, makeLA(Xs, Z).
makeLA([_X| Xs], Z) :- makeLA(Xs, Z).

/*Exam 10.02.20*/
isALBMAX(tree(E1,tree(E2,void,void),tree(E3,void,void))) :- E1 is max(E2,E3). 
isALBMAX(tree(_E,Left,Right)) :- isALBMAX(Left),isALBMAX(Right).

filterAM([tree(E,L,R)],[]) :- not(isALBMAX(tree(E,L,R))).
filterAM([tree(E,L,R)],[tree(E,L,R)]) :- isALBMAX(tree(E,L,R)).
filterAM([tree(_E,_L,_R)|Xs],Z) :- filterAM(Xs,Z).

/*Midterm 13.12.17*/
length1([],0).
length1([_X|Xs],Z) :- length1(Xs,Z1), Z is Z1+1.

less_than([[]],_,[[]]).
less_than([[X|Xs]],N,[[X|Xs]]) :- length1([X|Xs],Z),Z<N.
less_than([[X|Xs]],N,[]) :- length1([X|Xs],Z),Z>=N.
less_than([[X|Xs]|Ys],N,[[X|Xs]|Zss]) :- length1([X|Xs],Z),Z<N,less_than(Ys,N,Zss).
less_than([[X|Xs]|Ys],N,Zss) :- length1([X|Xs],Z),Z>=N,less_than(Ys,N,Zss).

/*Midterm 17.12.18*/
isAL([[X,_Y]]) :- atom(X).
isAL([[_X,_Y]|Ys]) :- isAL(Ys).

findT([[]],_,[]).
findT([[X,Y]|_Xs],X,Y).
findT([[X,Y]|Xs],Z,Z1) :- isAL([[X,Y]|Xs]),findT(Xs,Z,Z1).

subs([], _, []).
subs(_, [], []).
subs(X,[A|Xs], [A|Sub]):- findT(X, A, Z), Z == void, subs(X, Xs, Sub).
subs(X, [A|Xs], [Z|Sub]):- findT(X, A, Z), Z \== void, subs(X, Xs, Sub).


/*Midterm 18.12.19*/
get2([[]],_,[[]]).
get2([[X|Xs]|_Ys],1,[X|Xs]).
get2([[_X|_Xs]|Xss],N,[Z|Zs]) :- N1 is N-1,get2(Xss,N1,[Z|Zs]).

getD([[X|Xs]|Ys],N,Z) :- get2([[X|Xs]|Ys],N,Z1),get1(Z1,N,Z).

nthelement([X|_Rest], 0, X).
nthelement([_X|Xs], N, K) :- N1 is N-1, nthelement(Xs, N1, K).

getdiag(X, L):-getdiagRic(X, 0, L).
getdiagRic([], _, []).
getdiagRic([X|Xs], N, L) :- nthelement(X, N, K), getdiagRic(Xs, N+1, L1), append([K], L1, L).

/*Midterm 23.12.20*/

allE([X,Y]) :- X==Y.
allE([_X|Xs]) :- allE(Xs).

allButOne([X,Y]):- X\==Y.
allButOne([X,Y|Xs]) :- X\==Y,allButOne([Y|Xs]).
allButOne([X,Y|Xs]) :- X\==Y,allButOne([X|Xs]).
allButOne([X,X|Xs]) :- allButOne([X|Xs]).


/*Midterm 23.12.20 */

allE([X,Y]) :- X==Y.
allE([_X|Xs]) :- allE(Xs).


allButOne([X,Y]) :- X\==Y.
allButOne([X,Y|Xs]) :- allE([X|Xs]),X\==Y.
allButOne([X,Y|Xs]) :- allE([Y|Xs]),X\==Y.
allButOne([X,X|Xs]) :- allButOne([X|Xs]).

allButOne([X,Y|Z],X,Y) :- allButOne([X,Y|Z]),X\==Y.

/*Midterm 17.12.18 */

assList([[X,_Y]]) :-atom(X).
assList([[_X,_Y]|Xs]) :- assList(Xs). 

findT([[X,Y]],X,Y).
findT([[_X,_Xs]|Ys],Y,Z) :- findT(Ys,Y,Z).

subs([], _, []).
subs(_, [], []).
subs(X,[A|Xs], [A|Sub]):- findT(X, A, Z), Z == void, subs(X, Xs, Sub).
subs(X, [A|Xs], [Z|Sub]):- findT(X, A, Z), Z \== void, subs(X, Xs, Sub).

/*Midterm 13.12.17*/

all_less([],N):- N>0.
all_less([[X|Xs]|Ys],N) :- N>0,length([X|Xs],Z),Z<N,all_less(Ys,N).


/*Midterm 18.12.19 */

/*In this mode i obtain an element from a list given the index*/
get1([],_X,[]).
get1([X|_Xs],1,X).
get1([_X|Xs],I,R) :- I1 is I-1,get1(Xs,I1,R).

/*In this mode i obtain a list from a list of lists given the index	*/
get2([[]],_,[]).
get2([[X|Xs]|_Ys],1,[X|Xs]).
get2([[_X|_Xs]|Ys],I,Z) :- I1 is I-1,get2(Ys,I1,Z).

getD([[X|_Xs]|_Xss],1,X).
getD([[X|Xs]|Xss],I,Z) :- get2([[X|Xs]|Xss],I,Z1),get1(Z1,I,Z).

nthelement([X|_Rest], 0, X).
nthelement([_X|Xs], N, K) :- N1 is N-1, nthelement(Xs, N1, K).

getdiag(X, L):-getdiagRic(X, 0, L).
getdiagRic([], _, []).
getdiagRic([X|Xs], N, L) :- nthelement(X, N, K), getdiagRic(Xs, N+1, L1), append([K], L1, L).

/*Exam 13.01.20*/
isLA([[X,_Y]]) :- atom(X).
isLA([[_X,_Y]|Xs]) :- isLA(Xs).

makeLA([], []).
makeLA([[X,Y]|Xs], [[X,Y]| Z]) :- X\==Y, makeLA(Xs, Z).
makeLA([_X| Xs], Z) :- makeLA(Xs, Z).

makelistoffirst([], []).
makelistoffirst([[X,_Y]|Rest], [X|Z]):- makelistoffirst(Rest, Z).

makelistofsecond([], []).
makelistofsecond([[_X,Y]|Rest], [Y|Z]):- makelistofsecond(Rest, Z).

member1(X, [X|_]).
member1(X, [_|Ys]) :- member1(X, Ys).

dup([X|Rest]):- member1(X, Rest).
dup([_|Rest]):- dup(Rest).

one2one([]).
one2one([[]]).
one2one([_X,_Y]).
one2one(X):- makelistoffirst(X,Firsts), makelistofsecond(X, Seconds),not(dup(Firsts)), not(dup(Seconds)).

/*Exam 10.02.20*/

/*Example:
tree(10,tree(9,tree(8,void,void),tree(9,void,void)),tree(10,tree(10,void,void),tree(5,void,void)))
*/

my_max(X,Y,X) :- X>=Y.
my_max(Y,Y,X) :- Y>=X.

isAM(tree(Element,tree(Element2,void,void),tree(Element3,void,void))) :- my_max(Element,Element2,Element3).
isAM(tree(_Element,Left,Right)) :- isAM(Left),isAM(Right).

filterAM(In, Out) :-include(isAM,In,Out).

/*Exam 15.02.18*/
ind_val([],[_X|_Xs],[]).
ind_val([X|Xs],[Y|Ys],[Z|Zs]) :- get1([Y|Ys],X,Z),ind_val(Xs,[Y|Ys],Zs).

/*Exam 15.01.18*/


tree_to_list(void,[]).
tree_to_list(tree(E,Left,Right),Z) :-tree_to_list(Left,Z1),tree_to_list(Right,Z2),append(Z1,[E|Z2],Z).

max_tree(tree(Element,Left,Right),Z) :- tree_to_list(tree(Element,Left,Right),C),max_list(C,Z).







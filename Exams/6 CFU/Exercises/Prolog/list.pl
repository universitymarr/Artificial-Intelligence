/* member1(X,L) is true when X is an element of L */
member1(X,[X|_Xs]).
member1(X,[_Y|Ys]) :- member1(X,Ys).

/* append1(X,Y,Z) is true when Z is the concatenation of  X and Y */
append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).

/* prefix1(L1,L) is true when L1 is a prefix of L */
prefix1([],_Ys).
prefix1([X|Xs],[X|Ys]) :- prefix1(Xs,Ys).

/* reverse(L1,L2) is true when L2 is the reverse of L1 (same elements in reversed order)*/
reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys),append1(Ys,[X],Zs).

/* Length of one list */

len1([],0).
len1([_X|Xs],Z) :- len1(Xs,Z1),Z is Z1 + 1.

/* Write the PROLOG programs suffix,subset,intersection using lists to represent sets.*/
suffix1(Xs,Xs).
suffix1(Xs,[_Y|Ys]) :- suffix1(Xs,Ys).

subset([],_Xs).
subset([Y|Ys],Xs) :-member1(Y,Xs),subset(Ys,Xs).

intersection([],_Xs,[]).
intersection([Y|Ys],Xs,[Y|Z]) :- member1(Y,Xs),intersection(Ys,Xs,Z).
intersection([_Y|Ys],Xs,Z) :- intersection(Ys,Xs,Z).

/* Scalar product */
sp1([],[],0).
sp1([X|Xs],[Y|Ys],Z) :- sp1(Xs,Ys,Z1),Z is Z1 + (X*Y).

/*Subset between two lists */
subset1([], []).
subset1(_Xs, []).
subset1(Xs, [Y|Ys]) :- member1(Y, Xs),  subset1(Xs, Ys).

/*Intersection between two lists*/
intersection1([], _, []).
intersection1([X|Xs], Ys, [X|Zs]) :- member1(X, Ys), delete1(X, Ys, Yn), intersection1(Xs, Yn, Zs).
intersection1([_X|Xs], Ys, Zs) :- intersection1(Xs, Ys, Zs).


/*If the element X is the member of a list of lists*/
doublelist(X,[[X|_Xs]|_Ys]).
doublelist(Z,[[_X|Xs]|_Ys]) :- doublelist(Z,Xs).
doublelist(Z, [[]|Ys]) :- memberList(Z, Ys).

/*Delete one element from a list*/
delete1(X,[X|Xs],Xs).
delete1(Z,[X|Xs],[X|Zs]) :- delete1(Z,Xs,Zs).

/*Delete the last element from a list*/
deletelast([],[]).
deletelast([_X],[]).
deletelast([X|Xs],[X|Zs]) :- deletelast(Xs,Zs).

/*Write a PROLOG program that returns the path between two nodes of a graph,*/
/*represented through the relation arc(X,Y), through a depth-first visit.*/
connected(Node,Node,[]).
connected(Node1,Node2,[_X|Xs]) :- arc(Node1,Node3),connected(Node3,Node2,Xs).

/*Mean Value of a list*/
sum_list([],0,0).
sum_list([H|T],Length,Sum):-sum_list(T,L1,S1), Length is L1+1, Sum is S1+H. 
mean(L,M):-sum_list(L,Length,Sum), M is Sum/Length.

/*increment elements of list of 1*/
inc([],[]).
inc([X|Xs],[Y|Ys]) :- inc(Xs,Ys),Y is X+1.

/*Incapsulate list elements*/
encapsulate([],[]).
encapsulate([X|Xs],[[X]|Ys]):- encapsulate(Xs,Ys).

/*We add a zero between one element of a list and the following element*/
zeros([],[]).
zeros([X|Xs],[X,0|Ys]):- zeros(Xs,Ys).

/*We check if there are elements in common between two lists*/
disjoint([],_Ys).
disjoint([X|Xs],K) :- not(member1(X,K)), disjoint(Xs,K).


/*subset(L,K), which holds iff L is a subset of K*/
subset2([],_Ys).
subset2([X|Xs],K) :- member1(X,K), subset(Xs,K). 

/*union(L,K,M), which holds iff M is the union of L and K.*/
union2([],K,K).
union2([X|Xs],K,[X|Zs]) :- not(member1(X,K)), union2(Xs,K,Zs).
union2([X|Xs],K,Zs) :- member(X,K), union(Xs,K,Zs).

/*difference(L,K,M), which holds iff M is the difference of L and K.*/
difference([],_,[]).
difference([X|L],K,M) :- member(X,K), difference(L,K,M).
difference([X|L],K,[X|M]) :- not(member(X,K)), difference(L,K,M).

memberN([X|_Xs],X).
memberN([_X|Xs],Y) :- memberN(Xs,Y).

/*Exercise slides scalar product between two lists (vectors)*/
scalarmult([],[],0).
scalarmult([X|Xs],[Y|Ys],Z) :- scalarmult(Xs,Ys,Z1),Z is Z1 + (X*Y).

/* Obtain an element from a list given the index*/

get1([],_X,[]).
get1([X|_Xs],1,X).
get1([_X|Xs],I,R) :- I1 is I-1,get1(Xs,I1,R).

/*get the last element from a list*/
getLast([X],X).
getLast([_X|Xs], Y) :- getLast(Xs,Y).

/*Check if in a list there are duplicates*/

dupl([X|Xs]) :- member1(X,Xs).
dupl([_X|Xs]) :- dupl(Xs).


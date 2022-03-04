/*Write a PROLOG program that returns the n-th element of a list if it exists, false otherwise.*/
get1([X|_Xs],1,X).
get1([_X|Xs],Y,Z) :- Y1 is Y-1,get1(Xs,Y1,Z).

/* Write a PROLOG program that checks whether a list of atoms is palindrome using the above defined.*/
reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys),append1(Ys,[X],Zs).

append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).

equal1([X],[Y]) :- X==Y.
equal1([X|Xs],[X|Ys]) :- equal1(Xs,Ys).

palindrome([_X]).
palindrome([X,X]).
palindrome([X|Xs]) :- reverse1([X|Xs],Z),equal1([X|Xs],Z).

/*Write a PROLOG program that returns the last element of a list if it exists, false otherwise.*/
last1([X],X).
last1([_X,Y],Y).
last1([_X|Xs],Y) :-last1(Xs,Y).

/*Write a PROLOG program that takes a lists representing numbers digit by digit and returns the number represented in the list*/
list_to_number([X],X).
list_to_number([X|Xs],Y) :- length([X|Xs],Z),Z1 is Z-1,list_to_number(Xs,Y1),Y is Y1 + (X* 10^Z1).

/*Associative lists*/
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

/*Write a PROLOG program counting the elements of a list of lists.*/
length1([],0).
length1([_X|Xs],N) :- length1(Xs,N1),N is N1 +1.

length2([],0).
length2([D|Ys],N) :- length1(D,Z),length2(Ys,N1),N is N1 + Z.


/*Useful trees:
tree(4,tree(1,void,void),tree(2,void,void))
tree(1,tree(2,tree(4,void,void),tree(5,void,void)),tree(3,tree(6,void,void),tree(7,void,void)))
*/  

/*Write a PROLOG program which implements member for a binary tree.*/
memberTree(Element,tree(Element,_Left,_Right)).
memberTree(N,tree(_Element,Left,_Right)) :- memberTree(N,Left).
memberTree(N,tree(_Element,_Left,Right)) :- memberTree(N,Right).

/*Write a PROLOG program that, given in input a binary tree without the depth information on the nodes and a constant, returns the depth of a node containing the given constant.*/
get_depth(_,tree(void,_,_),0).
get_depth(Element,tree(Element,_Left,_Right),0).
get_depth(Element,tree(_Elem,_Left,Right),N):- get_depth(Element,Right,N1), N is N1+1.
get_depth(Element,tree(_Elem,Left,_Right),N):- get_depth(Element,Left,N1), N is N1+1.

/* Write a PROLOG program which returns a list containing all the nodes at a given depth D of a binary tree.*/
list_depth(void,_N,0).
list_depth(tree(Element,_Left,_Right),0,[Element]).
list_depth(tree(_Element,Left,Right),N,Z):- N1 is N-1,
list_depth(Left,N1,Z1),list_depth(Right,N1,Z2),append(Z1,Z2,Z).

isTreeWithDepth(void).
isTreeWithDepth(tree(node(Element,Prof),Left,Right)) :- get_depth3(Element,tree(Element,Left,Right),Prof),
														isTreeWithDepth(Left), isTreeWithDepth(Right).

/*Write a Prolog program that given a binary tree and a list of forbidden atoms, verifies that there exists a path from the root to a leaf that contains one occurrence of a forbidden atom.*/

convert(void, []).
convert(tree(Element, Left, Right), Rest) :-convert(Left, LeftList),convert(Right, RightList),append(LeftList, [Element|RightList], Rest).

isMemberOf(X,[X|_]).
isMemberOf(X,[_|Xs]):- isMemberOf(X,Xs).

allMembers([],_).
allMembers([X|Xs],Z):- allMembers(Xs,Z), isMemberOf(X,Z).

forbidden([X],[X]).
forbidden(tree(Element,Left,Right),Z) :- convert(tree(Element, Left, Right), X),allMembers(Z,X).



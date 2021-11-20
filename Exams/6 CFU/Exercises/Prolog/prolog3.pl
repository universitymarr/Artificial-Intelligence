memberlist(X,[X|_Xs]).
memberlist(X,[Y|_Ys]) :- memberlist(X,Y).
memberlist(X,[_Y|Ys]) :- memberlist(X,Ys).

/*binary tree(X) is true if X is a binary tree, that is:
- X is the empty tree.
- X is a structure with a node label binary trees. */

binary_tree(void).
binary_tree(tree(_Element,Left,Right)) :- binary_tree(Left), binary_tree(Right).

/* preorder (X,Y): Y is the list containing the elements of the
tree X, as encountered in the pre-order visit. */

preorder (void, [void]).
preorder (tree(X, Left, Right), CompleteList):- preorder(Left, LeftList), preorder(Right, RightList),
append([X|LeftList], RightList, CompleteList).

/*isotree(X,Y) is true if X and Y are isomorphic, that is:
- X and Y are both the empty tree
- X and Y have the same root element and the left and right
subtrees are isomorphic */

isotree(void,void).
isotree(tree(X,Left1,Right1),tree(X,Left2,Right2)) :-
isotree(Left1,Left2), isotree(Right1,Right2).
isotree(tree(X,Left1,Right1),tree(X,Left2,Right2)) :-
isotree(Left1,Right2), isotree(Right1,Left2).

/* breadth first(X,Y): Y is the list containing the elements of
the tree X, as encountered in the breadth-first visit. */

bf([], []).
bf([void | Rest], Ls):- bf(Rest, Ls).
bf([tree(I, Sx, Dx)| Rest], [I|Ls]):- append(Rest, [Sx, Dx], Nodes), bf(Nodes, Ls).


evalExpression1(plus(A,B), N):- evalExpression1(A, N1), evalExpression1(B, N2), N is N1+N2.
evalExpression1(minus(A,B), N):- evalExpression1(A, N1), evalExpression1(B, N2), N is N1-N2.
evalExpression1(mult(A,B), N):- evalExpression1(A, N1), evalExpression1(B, N2), N is N1*N2.
evalExpression1(frac(A,B), N):- evalExpression1(A, N1), evalExpression1(B, N2), N is N1 // N2.
evalExpression1(X, X).

my_length([], 0).
my_length([H|L],N) :- my_length(L,N1), N is N1 + 1.

/* findnode(tree,Elem) */
findnode(tree(X,_,_),X).
findnode(tree(_,L,R),E):- findnode(L,E).
findnode(tree(_,L,R),E):- findnode(R,E). 

/* atlevel(tree,N,Ris)*/
atlevel(void,_,Res):- Res=[].
atlevel(tree(X,_,_),1, Res) :- Res=[X].
atlevel(tree(_,L,R),N,Res) :- N1 is N-1,atlevel(L,N1,ResL), atlevel(R,N1,ResR),append(ResL,ResR,Res). 

/*binary tree with constant*/
binary_tree(void).
binary_tree(tree(node(_Element,_Prof),Left,Right)) :-
binary_tree(Left), binary_tree(Right).

/*depthNodeC(binary_tree cons,Elem,D) */
depthNodeC(tree(node(X,C),L,R),X,C).
depthNodeC(tree(node(E,C),L,R),X,D):- depthNode(L,X,D).
depthNodeC(tree(node(E,C),L,R),X,D):- depthNode(R,X,D).

/* findDepth withou cons and depth info*/

findDepth(tree(node(X,C),L,R),X,DT,DT).
findDepth(tree(node(E,C),L,R),X,D1,Ris):- Z is D1+1, findDepth(L,X,Z,Ris).
findDepth(tree(node(E,C),L,R),X,D1,Ris):- Z id D1+1, findDepth(R,X,Z,Ris).

 

/* VERIFICA ALBERO È BINARIO */

istree(void).
istree(tree(Elem,L,R)):- istree(L), istree(R).

/* COMPLETO ALBERO BINARIO BILANCIATO */

cbal_tree(0,void).
cbal_tree(N,t(x,L,R)) :- N > 0,
	N0 is N - 1, 
	N1 is N0//2, N2 is N0 - N1,
	distrib(N1,N2,NL,NR),
	cbal_tree(NL,L), cbal_tree(NR,R).

distrib(N,N,N,N) :- !.
distrib(N1,N2,N1,N2).
distrib(N1,N2,N2,N1).

/* SYMMETRIC BINARY TREE */

symmetric(void).
symmetric(tree(E,L,R)):- mirror(L,R).

mirror(void,void).
mirror(tree(E1,L1,R1),tree(E2,L2,R2)):- mirror(L1,R1),mirror(L2,R2).

/* COSTRUIRE BINARY TREE DA UNA LISTA */

construct(List,T):- construct_aux(List,T,void).
construct_aux([],T,T).
construct_aux([X|Xs],T,T0):- add(X,T0,T1),construct_aux(Xs,T,T1).

/* FUNZIONE CHE MI CONTROLLA CHE I MIN SONO A SX E MAX A SX  E AGGIUNGE AL BINARY TREE*/
add(X,void,tree(X,void,void)).
add(X,tree(Elem,L1,R),tree(Elem,L2,R)):- X=<Elem, add(X,L1,L2).
add(X,tree(Elem,L,R1),tree(Elem,L,R2)):- X>=Elem, add(X,R1,R2).

test_symmetric(List):- construct(List,T),symmetric(T).

/* ALBERO BILANCIATO AVL DATA ALTEZZA */

hbal_tree(0,void).
hbal_tree(1,tree(Elem,void,void)).
hbal_tree(H,tree(Elem,L,R)):- H>0,H1 is H-1, H2 is H-2,dist(H1,H2,HL,HR), hbal_tree(HL,L),hbal_tree(HR,R).

dist(H1,H2,H1,H2).
dist(H1,H2,H2,H1).
dist(H1,Z,H1,H1).

/* ALBERO BINARIO BILANCIATO MINIMO E MAX NUMERO DI NODI DATA ALTEZZA */

minNodes(0,0).
minNodes(1,1).
minNodes(H,N):- H>1, H1 is H-1, H2 is H-2, minNodes(H1,N1), minNodes(H2,N2), N is N1+N2.

maxNodes(H,N):- N is 2**H-1.

/* ALBERO BINARIO BILANCIATO ALTEZZA MIN E MAX DATO NUMERO DI NODI */

minHeigth(0,0).
minHeight(N,H):- N>0, N1 is N//2, minHeight(N1,H1), H is H1+1.

maxHeight(N,H):- maxHeight_aux(N,H,1,1).
maxHeight_aux(N,H,H1,N1):- N1>N, H is H1-1.
maxHeight_aux(N,H,H1,N1):- N1=<N, H2 is H1 +1, minNodes(H2,N2), maxHeight(N,H,H2,N2).

/* COSTRUIRE BINARY TREE HEIGTH-BALANCED DATO NUMERO DI NODI */
hbal_tree_nodes(N,T):- minHeight(N,HMIN),maxHeigth(N,HMAX),  between(HMIN,HMAX,H),
	hbal_tree(H,T), nodes(T,N).

/* CONTARE NUMERO FOGLIE */
count_leaves(void,0).
count_leaves(tree(E,void,void),1).
count_leaves(tree(E,L,R),N):- count_leaves(L,N1),count_leaves(R,N2), N is N1+N2.

/* LISTA CON FOGLIE */

leaves(void,[]).
leaves(tree(E,void,void),[E]).
leaves(tree(E,L,R),S):- leaves(L,S1),leaves(R,S2), append(S1,S2,S).

/* LISTA NODI INTERNI */

internals(void,[]).
internals(tree(E,void,void),[]).
internals(tree(E,L,R),[E|S]):- internals(L,S1),internals(R,S2),append(S1,S2,S).

/* LISTA NODI A LIVELLO L */

atlevel(void,0,[]).
atlevel(tree(E,Left,Right),1,[E]).
atlevel(tree(E,Left,Right),L,S):- L1 is L-1, atlevel(Left,L1,S1),atlevel(Right,L1,S2),append(S1,S2,S).

/* COSTRUIRE ALBERO BINARIO COMPLETO */

complete_binary_tree(N,T):- complete_binary_tree_aux(N,T,1).
complete_binary_tree_aux(N,void,Lev):- Lev>N.
complete_binary_tree_aux(N,tree(E,L,R),Lev):- Lev=<N, LL is 2*Lev, LR is 2*Lev+1, complete_binary_tree_aux(N,L,LL), complete_binary_tree_aux(N,R,LR).

 

 



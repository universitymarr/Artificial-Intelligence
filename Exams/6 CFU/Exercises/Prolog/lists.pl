/* LISTE */

/*PRODOTTO SCALARE*/
scalarprod([],[],0).
scalarprod([X|Xs],[Y|Ys],Z):- H is X*Y,scalarprod(Xs,Ys,Ris), Z is H + Ris.

pathFor(Tree,List) :- forbiddenNumber(Tree,List,Occ), Occ=<1.

forbiddenNumber(void,List,0).

forbiddenNumber(tree(Elem,Left,Right),List,Occ):- 
member(Elem,List),
forbiddenNumber(Left,List,Occ1),
forbiddenNumber(Right,List,Occ2),
Occ is min(Occ1,Occ2)+1.

forbiddenNumber(tree(Elem,Left,Right),List,Occ):-
not(member(Elem,List)),
forbiddenNumber(Left,List,Occ1),
forbiddenNumber(Right,List,Occ2),
Occ is min(Occ1,Occ2).

/* DUPLICATI LISTA */
dupli([],[]).
dupli([H1|Xs],[H1,H1|Ys]):- dupli(Xs,Ys).

dupli2(L1,N,L2):- dupli2_aux(L1,N,L2,N).

dupli2_aux([],Z,[],Y).
dupli2_aux([H1|T1],N,L2,0):- dupli2_aux(T1,N,L2,N). 
dupli2_aux([H1|T1],N,[H1|T2],N2) :- N2>0,K is N2-1,dupli2_aux([H1|T1],N,T2,K).

/* DROP LISTA */
drop(L1,K,L2):- drop_aux(L1,L2,K,K).

drop_aux([],[],K,N).
drop_aux([H1|T1],L2,K,1):- drop_aux(T1,L2,K,K).
drop_aux([H1|T1],[H1|T2],K,N):- N>1, W is N-1, drop_aux(T1,T2,K,W).

/* SPLIT LISTA */

split1(List,N,L1,L2):- split_aux(List,N,N,L1,L2).
split_aux([],N,K,[],[]).
split_aux([H1|T1],N,1,[H1],T1).
split_aux([H1|T1],N,K,[H1|T2],L2):- K>1, K1 is K-1, split_aux(T1,N,K1,T2,L2).

/* SLICE LISTA */
slice(List,N1,N2,L1):- slice_aux(List,N1,N1,N1,N2,L1).
slice_aux([],N1,N2,K1,K2,[]).
slice_aux([H1|T1],N1,N2,1,N1,[H1]).
slice_aux([H1|T1],N1,N2,1,K2,[H1|T2]):- K2 > N1,W is K2-1, slice_aux(T1,N1,N2,1,W,T2).
slice_aux([H1|T1],N1,N2,K1,K2,L1):- K1>0, J is K1-1, slice_aux(T1,N1,N2,J,K2,L1).

/* LENGTH LISTA */
length1([],0).
length1([H|T],N):- length1(T,N1), N is N1+1.

/* RUOTARE A DESTRA LISTA */
rotate([],N,[]).
rotate(L1,N,X):-N>=0, split1(L1,N,Z1,Z2), append(Z2,Z1,X).
rotate(L1,N,X):-N<0, length1(L1,N1), N2 is N1+N, split1(L1,N2,Z1,Z2), append(Z2,Z1,X).

/* RIMUOVERE ELEMENTO IN QUELLA POSIZIONE N DELLA LISTA */
remove_at(X,List,N,R):- remove_at_aux(X,List,N,N,R).
remove_at_aux(X,[],N,L,[]).
remove_at_aux([H1],[H1|T1],N,1,T1).
remove_at_aux(X,[H1|T1],N,K,[H1|T2]):- K>1, K1 is K-1,remove_at_aux(X,T1,N,K1,T2).


/* INSERIRE ELEMENTO NELLA LISTA */
insert_at(alpha,List,N,L):- insert_at_aux(alpha,List,N,N,L).
insert_at_aux(X,[],N,K,[]).
insert_at_aux(X,[H|T],N,1,[X,H|T]).
insert_at_aux(X,[H|T],N,K,[H|T1]):- K>1,K1 is K-1, insert_at_aux(X,T,N,K1,T1).

/* CREARE UNA LISTA DATO UN RANGE N1 E N2 */
range(N2,N2,[N2]).
range(N1,N2,[N1|T]):- N1=<N2, NN is N1+1, range(NN,N2,T).

/* CREARE UNA LISTA DATO UN NUMERO, LISTA DA 0 A N */
num2list(N,L):- num2list_aux(0,N,L).
num2list_aux(N,N,[N]).
num2list_aux(K,N,[K|T]):- K<N,K1 is K+1, num2list_aux(K1,N,T).


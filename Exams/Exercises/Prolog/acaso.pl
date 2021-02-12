countL([],0).
countL([H|T],N):- length(H,N1),countL(T,N2), N is N1+N2.


membertree(tree(X,L,R),X).
membertree(tree(X,L,R),E):-membertree(L,E).
membertree(tree(X,L,R),E):- membertree(R,E).


nodesD(tree(E,L,R),1,[E]).
nodesD(tree(E,L,R),D,L1):- D1 is D-1, nodesD(L,D1,LL),nodesD(R,D1,LR), append(LL,LR,L1).



bvd(tree(node(E,D),L,R)):- D is 0, bvd_aux(L,0),bvd_aux(R,0).

bvd_aux([],D).
bvd_aux(tree(node(E,D),L,R),D1):- D is D1+1,bvd_aux(L,D),bvd_aux(R,D).

/* finddepth(binary_tree, constant, D) */

finddepth(tree(node(E,D),L,R),E,D).
finddepth(tree(node(E,D),L,R),C,D1):- finddepth(L,C,D1).
finddepth(tree(node(E,D),L,R),C,D1):-finddepth(R,C,D1).

/* finwd(binary tree,constant,D) */ 

findwd(tree(E,L,R),E,0).
findwd(tree(E,L,R),C,D1):- findwd(L,C, D2), D1 is D2+1.
findwd(tree(E,L,R),C,D1):- findwd(R,C, D2), D1 is D2+1.

/* iso(binary tree,binary_treee) */

iso(T,L):- iso_aux(T,L,0).
iso_aux([],[],D).
iso_aux(tree(E,L,R), tree(node(E,D),L1,R1), D):- D1 is D+1,iso_aux(L,R1,D1),iso_aux(R,L1,D1).

/* checkAL(AL) */

checkAL([]).
checkAL([[H1,H2]|T]):- atom(H1), checkAL(T).

/* findt(AL,A,T) */

findt([],A,A).
findt([[H1,H2]|T],H1,H2).
findt([[H1,H2]|T],A,Term):- findt(T,A,Term).

/* subs(AL,LA,L) */

subs(AL,[],[]).
subs(AL,[H|T],L):- findt(AL,H,Z), subs(AL,T,W), append([Z],W,L).

/* scvect(V1,V2,R) */

scvect([],[],0).
scvect([H1|T1],[H2|T2],N):- H is H1*H2, scvect(T1,T2,R), N is H+R.


/* forbiddenelem(binary, L) */

forbiddenelem(T,L):- forbiddenelem_aux(T,L,N), N=<1.
forbiddenelem_aux([],L,0).
forbiddenelem_aux(tree(E,Left,Right),L,N):- member(E,L), forbiddenelem_aux(Left,L,NL), forbiddenelem_aux(Right,L,NR), N is min(NL,NR)+1.
forbiddenelem_aux(tree(E,Left,Right),L,N):- not(member(E,L)), forbiddenelem_aux(Left,L,NL), forbiddenelem_aux(Right,L,NR), N is min(NL,NR).


/* add_up_list(L,K) */

add_up_list(L,K):- add_up_list_aux(L,K,0).
add_up_list_aux([],[],N).
add_up_list_aux([H|T],[K1|T1],N):- K1 is H+N, add_up_list_aux(T,T1,K1).

/* merge(L,K,M) */

merge([],[],[]).
merge(L1,[],L1).
merge([],H1,H1).
merge([L1|T1],[K1|T2],M):- L1<K1, merge(T1,[K1|T2],Z), append([L1],Z,M).
merge([L1|T1],[K1|T2],M):- L1>=K1, merge([L1|T1],T2,Z), append([K1],Z,M).


/* twice(L,R) */

twice([],[]).
twice([H1|T1],R):- twice(T1,R1), append([H1,H1],R1,R).

/* combine1(L1,L2,L3) */

combine1([],[],[]).
combine1([H1|T1],[H2|T2],L3):- combine1(T1,T2,R),append([H1,H2],R,L3).


combine2([],[],[]).
combine2([H1|T1],[H2|T2],L3):- combine2(T1,T2,R),append([[H1,H2]],R,L3).

combine3([],[],[]).
combine3([H1|T1],[H2|T2],L3):- combine3(T1,T2,R),append([f(H1,H2)],R,L3).

f(H1,H2):- f([H1,H2]).

/* square (L,N) */

square(L,N):- length(L,R), square_aux(L,R,N).
square_aux([],R,0).
square_aux([H|T],R,N):- length(H,Z), Z=R,square_aux(T,R,N1), N is N1+1.


/**/

count([],0).
count([X|Y],W):- count(Y,W2), W is W2+1.

square3([[]],true).
square3([[X|Ys]|Zs],W):-square2([[X|Ys]|Zs],0,W).

square2([],Y,Y).
square2([[X|Ys]|Zs],A,W):- count([[X|Ys]|Zs],R),count([X|Ys],C),R is C-A, plus(A,1,K),square2(Zs,K,W).


/* ins_sort(L1,L2) */

ins_sort([],[]).
ins_sort([H1|T1], L2):- ins_sort(T1,L),insert_sort(H1,L,L2).

insert_sort(H1,[],[H1]).
insert_sort(H1,[H2|T2],L2):- H1=<H2, append([H1],[H2|T2],L2).
insert_sort(H1,[H2|T2],L2):- H1>H2, insert_sort(H1,T2,L3),append([H2],L3,L2).



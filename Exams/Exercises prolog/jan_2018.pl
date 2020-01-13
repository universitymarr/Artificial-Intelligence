
find_max([],0).
find_max(tree(E,[],[]),E).
find_max(tree(E,L,R),M):- find_max(L,ML),find_max(R,MR), M is max(ML,MR).

find_max_occ(T,M,Occ):- find_max(T,M), find_occ(T,M,Occ).
find_occ([],M,0).
find_occ(tree(E,[],[]),E,1).
find_occ(tree(E,L,R),E,N):- find_occ(L,M,N2), find_occ(R,M,N3), N is N2+N3+1.
find_occ(tree(E,L,R),M,N):- find_occ(L,M,N2), find_occ(R,M,N3), N is N2+N3.

find_occ2([],M,0).
find_occ2(tree(E,[],[]),E,1).
find_occ2(tree(E,L,R),E,N):- find_max(tree(E,L,R),M),find_occ2(L,M,N2), find_occ2(R,M,N3), N is N2+N3+1.
find_occ2(tree(E,L,R),M,N):- find_max(tree(E,L,R),M),find_occ2(L,M,N2), find_occ2(R,M,N3), N is N2+N3.

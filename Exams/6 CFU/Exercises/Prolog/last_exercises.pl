natural_number3(0).
natural_number3(s(X)) :- natural_number3(X).

plus3(0,X,X).
plus3(s(X),Y,s(Z)) :- plus3(X,Y,Z).

lesseq3(0,X) :- natural_number3(s(X)).
lesseq3(s(X),s(Y)) :- lesseq3(X,Y).

member3(X,[X|_Xs]).
member3(X,[_Y|Ys]) :- member3(X,Ys).

append3(Y,[],[Y]).
append3(Y,[X],[X,Y]).
append3(Y,[X|Xs],[X|Zs]) :- append3(Y,Xs,Zs).

prefix3([],[_X|_Xs]).
prefix3([X],[X|_Xs]).
prefix3([X|Xs],[X|Ys]) :- prefix3(Xs,Ys).

reverse3([],[]).
reverse3([X|Xs],Y) :- reverse3(Xs,Z),append3(X,Z,Y).

len3([],0).
len3([_X|Xs],N) :- len3(Xs,N1),N is N1+1.

times3(0,_,0).
times3(s(X),Y,Z) :- times(X,Y,XY),plus1(XY,Y,Z). 

exp3(s(_N),0,0).
exp3(0,s(_X),s(0)).
exp3(s(N),X,Y) :- exp3(N,X,Z), times3(Z,X,Y).
    
fac3(0,s(0)).
fac3(s(N),F) :- fac3(N,F1), times3(s(N),F1,F).
   
minimum3(N1,N2,N1) :- lesseq3(N1,N2).
minimum3(N1,N2,N2) :- lesseq3(N2,N1).

suffix3(X,X).
suffix3(Xs,[_Y|Ys]) :- suffix3(Xs,Ys). 

subset3([],_).
subset3([X|Xs],Ys) :- member3(X,Ys),subset3(Xs,Ys).

intersection3([],_X,[]).
intersection3([Y|Ys],Xs,[Y|Z]) :- member3(Y,Xs),intersection(Ys,Xs,Z).
intersection3([_Y|Ys],Xs,Z) :-intersection3(Ys,Xs,Z).

count_l3([],0).
count_l3([[Y|Ys]|Xs],Z) :- len3([Y|Ys],R),count_l3(Xs,Z1),Z is Z1+R.

memberTree3(E,tree(E,_L,_R)).
memberTree3(E,tree(_,L,_R)) :- member3(E,L).
memberTree3(E,tree(_,_L,R)) :- member3(E,R).

list_depth3(void,_N,0).
list_depth3(0,tree(E,_L,_R),E).
list_depth3(N,(_E,L,R),Z) :- N1 is N-1,list_depth3(N1,L,Z1),list_depth3(N1,R,Z2),append3(Z1,Z2,Z).

get_depth3(_,void,0).
get_depth3(_,tree(void,_,_),0).
get_depth3(E,tree(E,_L,_R),0).
get_depth3(E,tree(_D,L,_R),N) :- get_depth3(E,L,N1),N is N1+1.
get_depth3(E,tree(_D,_L,R),N) :- get_depth3(E,R,N1),N is N1+1.

twice([],[]).
twice([X],[X,X]).
twice([X,Y|Xs],[X,X,Y,Y|Zs]) :- twice(Xs,Zs).

second(Y,[_X,Y|_Xs]).

flatten3([], []).
flatten3([L|Ls], FlatL) :-flatten3(L, NewL),flatten3(Ls, NewLs),append(NewL, NewLs, FlatL).
flatten3(L, [L]).

list_to_term([X],X).
list_to_term([X|Xs],Z) :- list_to_term(Xs,Z1),Z is Z1+X.

mean3(X,Z) :- list_to_term(X,Z1),len3(X,Z2), Z is Z1/Z2.

encapsulate3([X],[[X]]).	
encapsulate3([X|Xs],[[X]|Zs]) :- encapsulate3(Xs,Zs).

conc3([],A,A).
conc3([X],[Y],[X,Y]).
conc3([X|Xs],Y,[X|Zs]) :- conc3(Xs,Y,Zs).

dupl([X|Xs]) :- member3(X,Xs).
dupl([_X|Xs]):-dupl(Xs).

delete3(X,[X|Xs],Xs).
delete3(Z,[X|Xs],[X|Zs]) :- delete3(Z,Xs,Zs).

more_than(_,[],[]).
more_than(N,[X|Xs],[X|Zs]) :- X>N,more_than(N,Xs,Zs).
more_than(N,[_X|Xs],Zs) :- more_than(N,Xs,Zs).

delete_all(_,[],[]).
delete_all(Z,[Z|Xs],Zs) :- !,delete_all(Z,Xs,Zs).
delete_all(Z,[X|Xs],[X|Zs]) :- delete_all(Z,Xs,Zs).

isTreeWithDepth(void).
isTreeWithDepth(tree(node(Element,Prof),Left,Right)) :- get_depth3(Element,tree(Element,Left,Right),Prof),
														isTreeWithDepth(Left), isTreeWithDepth(Right).



occ([],_,0).
occ([X],X,1).
occ([X|Xs],N,L) :- X==N,occ(Xs,N,L1),L is L1+1.
occ([X|Xs],N,L) :- X\==N,occ(Xs,N,L).


counRep([X|Xs],L) :- occ([X|Xs],X,L1),L1>1,counRep(Xs,L2),L is L2+1.
counRep([X|Xs],L) :- counRep(Xs,L).

foo([],[],[]).
foo([A|R1],[B|R2],[A,B|R]) :- A<B,foo(R1,R2,R).
foo([A|R1],[B|R2],R) :- A>=B,foo(R1,R2,R).




course(ai,timetab(tu,10,12),teacher(nardi,d),room(diag,b2)).
course(ai,timetab(we,10,12),teacher(nardi,d),room(diag,b2)).
course(ai,timetab(fr,10,12),teacher(nardi,d),room(diag,b2)).

teaches(Tea,Course) :- course(Course,Timetab,Tea,Room).

/*length(Course,Len) :- course(Course,timetab(Day,Start,End),Tea,Room),plus(Start,Len,End).*/

hasClass(Tea,Day) :-course(Course,timetab(Day,Start,End),Tea,Room).

busy(Room,Day,Time) :-course(Course,timetab(Day,Start,End),Tea,Room),Start =< Time, Time =< End.

plus1(0,X,X) :- natural_number(X).
plus1(s(X),Y,s(Z)):- plus1(X,Y,Z).
lesseq1(0,X) :- natural_number(X).
lesseq1(s(X),s(Y)) :- lesseq1(X,Y).

plus2(X,Y,Z):- Z is X+Y.

/* member1(X,L) is true when X is an element of L */
member1(X,[X|Xs]).
member1(X,[Y|Ys]) :- member1(X,Ys).

/* append1(X,Y,Z) is true when Z is the
concatenation of X and Y */
append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).


/* prefix(L1,L) is true when L1 is a prefix of L */
prefix1([],Zs).
prefix1([X|Xs],[X|Ys]) :- prefix1(Xs,Ys).
/* reverse(L1,L2) is true when L2 is the
reverse of L1 (same elements in reversed order */
reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys),
append1(Ys,[X],Zs).

len1([],0).
len1([_X|Xs],N) :-len1(Xs,N1), N1 is N-1.

sort1(Xs,Ys) :- permutation(Xs,Ys), ordered(Ys).
permutation(Xs,[Z|Zs]) :- select(Z,Xs,Ys),
permutation(Ys,Zs).
permutation([],[]).
ordered([]).
ordered([_X]).
ordered([X,Y|Ys]) :- X =< Y, ordered([Y|Ys]).
select(X,[X|Xs],Xs).
select(X,[Y|Ys],[Y|Zs]):-select(X,Ys,Zs).

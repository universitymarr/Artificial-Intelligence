suffix1([],[]).
suffix1([X|Xs],[Y|Ys]) :- suffix1(Xs,Ys).

member1(X,[X|Xs]).
member1(X,[Y|Ys]) :- member1(X,Ys).

subset1([],Ys).
subset1([X|Xs],[Y|Ys]) :- subset1(Xs,Ys),member1(X,[Y|Ys]).

intersection1([],Ys,[]):- !.
intersection1([X|Xs],[Y|Ys], [X|Zs]) :- member1(X,[Y|Ys]), intersection1(Xs,[Y|Ys],Zs).
intersection1([X|Xs],[Y|Ys], Zs) :- intersection1(Xs,[Y|Ys],Zs).


insert1(X, [], [X]):- !.
insert1(X, [Y|Ys], [X, Y|Ys]):- X=<Y, !.
insert1(X, [Y|Ys], [Y|Xs]):- insert1(X, Ys, Xs).

insertionSort1([], []):- !.
insertionSort1([X|Xs], [Y|Ys]):- insertionSort1(Xs, Zs), insert1(X, Zs, [Y|Ys]).


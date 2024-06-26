grandFather(X,Z) :- father(X,Y), father(Y,Z).
grandFather(X,Z) :- father(X,Y), mother(Y,Z).
son(X,Y) :- father(Y,X).
son(X,Y) :- mother(Y,X).
brother(X,Y) :- son(X,Z),son(Y,Z),dif(X,Y).
uncle(X,Y) :- son(Y,Z),brother(X,Z).
lover(X,Y) :-father(X,Z),mother(Y,Z).
descendant(X,Y):-son(X,Y). % 1
descendant(X,Y):-son(Z,Y),descendant(X,Z). % 2

descendant2(X,Y):-son(Z,Y),descendant2(X,Z). % 2
descendant2(X,Y):-son(X,Y). % 1

father(daniele,michela).
father(daniele,jacopo).
father(eriberto,daniele).
father(antonio,eriberto).
mother(alma,eriberto).
mother(annamaria,daniele).
mother(annamaria,marcello).
mother(annamaria,sandro).


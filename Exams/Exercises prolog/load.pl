grandFather(X,Z) :- father(X,Y), father(Y,Z).
grandFather(X,Z) :- father(X,Y), mother(Y,Z).

father(daniele,michela). % daniele is father of michela 
father(daniele,jacopo).  % daniele is father of jacopp 
father(eriberto,daniele).
father(antonio,eriberto).
father(sandro,giuseppe).

mother(alma,eriberto).  % alma is mother of eriberto 
mother(annamaria,daniele).
mother(annamaria,marcello).
mother(annamaria,sandro).

descendant(X,Y):- son(X,Y).
descendant(X,Y) :- son(Z,Y),descendant(X,Z). % means that Y is father of Z and recall recusively for Z

son(X,Y):- father(Y,X). % show father before mother
son(X,Y) :- mother(Y,X).

brother(X,Y):- son(X,Z), son(Y,Z), X\==Y.
cousin(X,Y):- son(X,Z),brother(Z,W),son(Y,W).

% DEADLOCK IF YOU PUT ONLY X IN YOUR "PROCEDURE" DESCENDANT(X,Y)
% QUERY SHOWS ONLY ASCENDANT OF X AND THEN DEADLOCK

% descendant(X,Y):- son(X,Y).
% descendant(X,Y):- descendant(X,Z),son(Z,Y). 
% son(X,Y):- father(Y,X).
% son(X,Y):- mother(Y,X).


% DEADLOCK IF YOU PUT ONLY X IN YOUR "PROCEDURE" DESCENDANT(X,Y)
% QUERY SHOWS NOTHING

% descendant(X,Y):- descendant(X,Z),son(Z,Y).
% descendant(X,Y):- son(X,Y).
% son(X,Y):- father(Y,X).
% son(X,Y):- mother(Y,X).
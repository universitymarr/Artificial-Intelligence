grandFather(X,Z) :- father(X,Y), father(Y,Z).
grandFather(X,Z) :- father(X,Y), mother(Y,Z).
son(X,Y) :- father(Y,X).
son(X,Y) :- mother(Y,X).
brother(X,Y) :- son(X,Z),son(Y,Z),dif(X,Y).
uncle(X,Y) :- son(Y,Z),brother(X,Z).
lover(X,Y) :-father(X,Z),mother(Y,Z).
cousin(X,Y) :- father(Z,X),mother(D,Y),brother(Z,D).
bigFather(X,Z) :- grandFather(X,M),father(M,Z).
bigFather(X,Z) :- grandFather(X,M),mother(M,Z).

/* cousin(X,Y) :- mother(Z,X),mother(D,Y),brother(Z,D).
cousin(X,Y) :- father(Z,X),mother(D,Y),brother(Z,D).
cousin(X,Y) :- mother(Z,X),father(D,Y),brother(Z,D).
cousin(X,Y) :- uncle(Z,X),mother(Z,Y) 
cognato(X,Z) :- lover(X,Y),brother(Y,Z).
cognato(X,Z) :- brother(X,Y),lover(Z,Y). */


father(fabrizio,antonio).
father(fabrizio,luca).
father(tony,fabrizio).
father(tony,simona).
father(pasquale,mena).
father(pasquale,luigi).
father(stefano,emanuele).
father(salvatore,tony).
mother(mena,antonio).
mother(mena,luca).
mother(pina,fabrizio).
mother(pina,simona).
mother(titina,luigi).
mother(titina,mena).
mother(simona,emanuele).	



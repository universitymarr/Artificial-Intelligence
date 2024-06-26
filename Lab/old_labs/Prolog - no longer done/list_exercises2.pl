/*Find the last element of a list.*/
last1([X],X).
last1([_X,Y],Y).
last1([_X|Xs],Y) :- last1(Xs,Y).

/*Find the last but one element of a list.*/
last2([_X],[]).
last2([X,_Y],X).
last2([_X|Xs],Y) :- last2(Xs,Y).

/*Find the K'th element of a list.*/
get1([],_,[]).
get1([X|_Xs],1,X).
get1([_X|Xs],N,Z) :- N1 is N-1,get1(Xs,N1,Z).

/*Find the number of elements of a list.*/
length1([],0).
length1([_X|Xs],Z) :- lenght1(Xs,Z1),Z is Z1 +1.

/*Reverse a list.*/
append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).

reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys),append1(Ys,[X],Zs).

/*Find out whether a list is a palindrome.*/
equal_list([],[]).
equal_list([X],[X]).
equal_list([X|Ys],[X|Yss]) :- equal_list(Ys,Yss).

palindrome([_X]).
palindrome([X|Xs]) :- reverse1([X|Xs],[Y|Ys]),equal_list([X|Xs],[Y|Ys]).

/*Eliminate consecutive duplicates of list elements.*/
compress([],[]).
compress([X],[X]).
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).

/*Pack consecutive duplicates of list elements into sublists.*/
pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

/*Use the previous problem to implement the so-called run-length encoding data compression method.Consecutive
duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.*/
encode(L1,L2) :- pack(L1,L), count(L,L2).

count([],[]).
count([[X|Xs]|Ys],[[N,X]|Zs]) :- length([X|Xs],N), count(Ys,Zs).

/*Duplicate the elements of a list.*/
dupli([],[]).
dupli([X],[X,X]).
dupli([X|Xs],[X,X|Zs]) :- dupli(Xs,Zs).

/*Duplicate the elements of a list a given number of times.*/
dupliTimes(L1,N,L2) :- dupliTimes(L1,N,L2,N).

dupliTimes([],_,[],_).
dupliTimes([_|Xs],N,Ys,0) :- dupliTimes(Xs,N,Ys,N).
dupliTimes([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupliTimes([X|Xs],N,Ys,K1).

/*Split a list into two parts; the length of the first part is given.*/
split1(X,0,[],X).
split1([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split1(Xs,N1,Ys,Zs).

/*Remove the K'th element from a list.*/
remove_at([],_,[]).
remove_at([_X,Y|Xs],1,[Y|Xs]).
remove_at([X|Xs],N,[X|Zs]) :- N1 is N-1, remove_at(Xs,N1,Zs).

/*Insert an element at a given position into a list.*/
conc([],Y,Y).
conc([X|Xs],Y,[X|Z]) :- conc(Xs,Y,Z).

insert_at(X,N,P,Z) :- split1(X,P-1,Z1,Z2),append(Z1,[N],Z3),conc(Z3,Z2,Z).

/*Create a list containing all integers within a given range.*/
create_list(I,I,[I]).
create_list(START,END,[START|Z]):- START < END, START1 is START +1,create_list(START1,END,Z). 


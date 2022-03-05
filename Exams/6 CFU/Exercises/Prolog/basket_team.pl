/* Exercise1 */
/* team(A,B,C,D,E) :- playmaker(A),guard(B),power_forward(C),small_forward(D),center(E).*/

/* Exercise2 and Exercise3 */
team(A,B,C,D,E) :- dif(A,B),dif(A,C),dif(A,D),dif(A,E),dif(B,C),dif(B,D),dif(B,E),dif(C,D),dif(C,E),dif(D,E),
playmaker(A),guard(B),forward(C),forward(D),center(E).
forward(A) :- power_forward(A);small_forward(A).

playmaker(bryant).
playmaker(jokic).
guard(james).
guard(green).

/* Exercise3 */
/*
guard(morant).
guard(jokic).
*/

power_forward(curry).
power_forward(doncic).
small_forward(durant).
small_forward(irving).
center(iguodala).
center(morant).


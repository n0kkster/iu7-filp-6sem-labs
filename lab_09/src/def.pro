find_grandparent(GP, GPGender, PGender, Child) :- 
    parent(GP, Parent),
    gender(GP, GPGender),
    parent(Parent, Child),
    gender(Parent, PGender).

max2(X, Y, X) :- X >= Y.
max2(X, Y, Y) :- X < Y.

max2_cut(X, Y, X) :- X >= Y, !.
max2_cut(_, Y, Y).

max3(X, Y, Z, X) :- X >= Y, X >= Z.
max3(X, Y, Z, Y) :- Y > X,  Y >= Z.
max3(X, Y, Z, Z) :- Z > X,  Z > Y.

max3_cut(X, Y, Z, X) :- X >= Y, X >= Z, !.
max3_cut(_, Y, Z, Y) :- Y >= Z, !.
max3_cut(_, _, Z, Z).

mother(M, Child) :- 
    parent(M, Child), 
    gender(M, female).

brother(B, Person) :- 
    mother(M, B), 
    mother(M, Person), 
    B \= Person, 
    gender(B, male).

sister(S, Person) :- 
    mother(M, S), 
    mother(M, Person), 
    S \= Person, 
    gender(S, female).

dever(Dever, Wife) :-
    married(Husband, Wife),
    brother(Dever, Husband).

zolovka(Zolovka, Wife) :-
    married(Husband, Wife),
    sister(Zolovka, Husband).

tyosha(Tyosha, Husband) :-
    married(Husband, Wife),
    mother(Tyosha, Wife).

parent(ivan, anna).
parent(ivan, boris).
parent(maria, anna).
parent(maria, boris).

parent(petr, dmitry).
parent(petr, elena).
parent(olga, dmitry).
parent(olga, elena).

parent(petr, maksim).
parent(olga, maksim).

parent(anna, kirill).
parent(dmitry, kirill).
parent(boris, svetlana).
parent(elena, svetlana).

married(ivan, maria).
married(petr, olga).
married(dmitry, anna).
married(boris, elena).

gender(ivan, male).
gender(petr, male).
gender(boris, male).
gender(dmitry, male).
gender(kirill, male).
gender(maksim, male).

gender(maria, female).
gender(olga, female).
gender(anna, female).
gender(elena, female).
gender(svetlana, female).
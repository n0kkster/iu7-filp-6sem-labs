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

parent(ivan, anna).
parent(ivan, boris).
parent(maria, anna).
parent(maria, boris).

parent(petr, dmitry).
parent(petr, elena).
parent(olga, dmitry).
parent(olga, elena).

parent(anna, kirill).
parent(dmitry, kirill).
parent(boris, svetlana).
parent(elena, svetlana).

gender(ivan, male).
gender(petr, male).
gender(boris, male).
gender(dmitry, male).
gender(kirill, male).

gender(maria, female).
gender(olga, female).
gender(anna, female).
gender(elena, female).
gender(svetlana, female).

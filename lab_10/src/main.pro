factorial(N, Result) :- 
    N >= 0,
    fact_tail(N, 1, Result).

fact_tail(0, Acc, Acc) :- !.
fact_tail(N, Acc, Result) :-
    N > 0,
    NewAcc is Acc * N,
    N1 is N - 1,
    fact_tail(N1, NewAcc, Result).


fibonacci(N, Result) :-
    N >= 0,
    fib_tail(N, 0, 1, Result).

fib_tail(0, A, _, A) :- !.
fib_tail(N, A, B, Result) :-
    N > 0,
    NextB is A + B,
    N1 is N - 1,
    fib_tail(N1, B, NextB, Result).


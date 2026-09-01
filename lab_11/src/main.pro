len(List, Length) :- 
    len_rec(List, 0, Length).

len_rec([], Acc, Acc) :- !.
len_rec([_|Tail], Acc, Length) :- 
    NewAcc is Acc + 1,
    len_rec(Tail, NewAcc, Length).


sum(List, Sum) :- 
    sum_rec(List, 0, Sum).

sum_rec([], Acc, Acc) :- !.
sum_rec([Head|Tail], Acc, Sum) :- 
    NewAcc is Acc + Head,
    sum_rec(Tail, NewAcc, Sum).


sum_odd_pos(List, Sum) :- 
    sum_odd_pos_rec(List, 0, Sum).

sum_odd_pos_rec([], Acc, Acc) :- !.
sum_odd_pos_rec([_], Acc, Acc) :- !.
sum_odd_pos_rec([_, Odd | Tail], Acc, Sum) :- 
    NewAcc is Acc + Odd,
    sum_odd_pos_rec(Tail, NewAcc, Sum).


filter_gt(List, V, Result) :- 
    filter_gt_rec(List, V, [], Result).

filter_gt_rec([], _, Acc, Acc) :- !.
filter_gt_rec([Head|Tail], V, Acc, Result) :- 
    Head > V, !, 
    filter_gt_rec(Tail, V, [Head|Acc], Result).
filter_gt_rec([_|Tail], V, Acc, Result) :- 
    filter_gt_rec(Tail, V, Acc, Result).


remove(List, Element, Result) :- 
    remove_rec(List, Element, [], Result).

remove_rec([], _, Acc, Acc) :- !.
remove_rec([Element|Tail], Element, Acc, Result) :- !,
    remove_rec(Tail, Element, Acc, Result).
remove_rec([Head|Tail], Element, Acc, Result) :- 
    remove_rec(Tail, Element, [Head|Acc], Result).


merge(List1, List2, Result) :- 
    prepend(List1, List2, Result).

prepend([], AccList, AccList) :- !.
prepend([Head|Tail], AccList, Result) :- 
    prepend(Tail, [Head|AccList], Result).
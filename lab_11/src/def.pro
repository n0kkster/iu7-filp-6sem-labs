tri_pos(List, Res) :- 
    tri_pos_rec(List, [], Res).

tri_pos_rec([], Acc, Acc) :- !.
tri_pos_rec([_], Acc, Acc) :- !.
tri_pos_rec([_, _], Acc, Acc) :- !.
tri_pos_rec([_, _, Third | Tail], Acc, Res) :- 
    tri_pos_rec(Tail, [Third|Acc], Res).
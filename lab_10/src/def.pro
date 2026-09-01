:- use_module(library(clpfd)).

is_scalar(X) :- var(X).
is_scalar(X) :- integer(X).

mult_scalar(S, N, Res) :- 
    is_scalar(N),% !,
    Res #= S * N.
mult_scalar(S, C + x * P, ResC + x * ResP) :-
    ResC #= S * C,
    mult_scalar(S, P, ResP).

mult_bx(B, P, 0 + x * ResP) :-
    mult_scalar(B, P, ResP).

add_poly(N1, N2, Res) :- 
    is_scalar(N1), is_scalar(N2), %!,
    Res #= N1 + N2.

add_poly(N, C + x * P, ResC + x * P) :- 
    is_scalar(N), %!,
    ResC #= N + C.
add_poly(C + x * P, N, ResC + x * P) :- 
    is_scalar(N), %!, 
    ResC #= C + N.

add_poly(C1 + x * P1, C2 + x * P2, C3 + x * P3) :-
    C3 #= C1 + C2,
    add_poly(P1, P2, P3).

transform(N, frac(N, 1)) :- is_scalar(N). %!.

transform(A + frac(B * x, NextExpr), frac(FinalP, FinalQ)) :-
    is_scalar(A), is_scalar(B),

    FinalQ = P_sub,	

    transform(NextExpr, frac(P_sub, Q_sub)),
    
    mult_scalar(A, P_sub, AP),
    mult_bx(B, Q_sub, BxQ),
    add_poly(AP, BxQ, FinalP).
    
to_standard(Horner, Std) :- 
    to_std_rec(Horner, 0, Std).

to_std_rec(0, _, 0) :- !.
to_std_rec(N, 0, N) :- integer(N), !.
to_std_rec(N, 1, N*x) :- integer(N), !.
to_std_rec(N, D, N*x^D) :- integer(N), !.

to_std_rec(0 + x * P, D, Rest) :- !,
    D1 #= D + 1,
    to_std_rec(P, D1, Rest).

to_std_rec(C + x * P, D, Res) :-
    D1 #= D + 1,
    to_std_rec(P, D1, PRest),
    format_term(C, D, PRest, Res).


format_term(C, 0, empty, C) :- !.
format_term(C, 1, empty, C*x) :- !.
format_term(C, D, empty, C*x^D) :- !.

format_term(C, 0, Rest, C + Rest) :- !.
format_term(C, 1, Rest, C*x + Rest) :- !.
format_term(C, D, Rest, C*x^D + Rest).

eval(N, _, N) :- integer(N).%, !.
eval(C + x * P, XVal, Res) :-
    eval(P, XVal, PVal),
    Res #= C + XVal * PVal.

calculate(Expr, XValue, Symbolic, Numeric) :-
    transform(Expr, frac(P, Q)),
    
    %to_standard(P, P_std),
    %to_standard(Q, Q_std),
	P = P_std,
	Q = Q_std,
    Symbolic = frac(P_std, Q_std),
    
    eval(P, XValue, P_num),
    eval(Q, XValue, Q_num),
    Q_num =\= 0.0,
    Numeric is float(P_num / Q_num).

calculate2(Expr, Symbolic) :-
    transform(Expr, frac(P, Q)),
    
    %to_standard(P, P_std),
    %to_standard(Q, Q_std),
	P = P_std,
	Q = Q_std,
    Symbolic = frac(P_std, Q_std).
    
get_A(0, 1) :- !.
get_A(I, 2) :- I mod 2 =:= 0, !.
get_A(I, I) :- I mod 2 =:= 1, !.

get_B(I, 1)  :- I mod 2 =:= 0, !.
get_B(I, -1) :- I mod 2 =:= 1, !.

build_exp(MaxDepth, MaxDepth, Expr) :- 
    get_A(MaxDepth, Expr), !.

build_exp(CurDepth, MaxDepth, A + frac(B * x, NextExpr)) :-
    CurDepth #< MaxDepth,
    get_A(CurDepth, A),
    get_B(CurDepth, B),
    NextDepth #= CurDepth + 1,
    build_exp(NextDepth, MaxDepth, NextExpr).

test_exp(Depth, XValue, Symbolic, Numeric) :-
    build_exp(0, Depth, Expr),
    calculate(Expr, XValue, Symbolic, Numeric).

test_exp2(Depth, Symbolic, Expr) :-
    build_exp(0, Depth, Expr),
    calculate2(Expr, Symbolic).

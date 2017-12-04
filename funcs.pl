len(0, []).
len(N, [_|L]) :- len(M, L), N is M+1.

max_num(A, B, B) :-
    A =< B.
max_num(A, B, A) :-
    B < A.

% TO DO: max list

fibb(0, 1).
fibb(1, 1).
fibb(N, A) :-
    N > 1,
    N1 is N - 1, fibb(N1, A2),
    N2 is N - 2, fibb(N2, A1),
    A is A1 + A2.

% The order of variables doesn't matter
nwd(A, 0, A).
nwd(0, A, A).
nwd(A, B, C) :-
   A \= 0,
   B \= 0,
   D is A mod B,
   nwd(B, D, C).



% Return TRUE if list L is sorted
orderedList([]).

orderedList([_]).

orderedList([L1,LX|LY]):-
    L1 =< LX,
    orderedList([LX|LY]).

% Mergesort Prolog Version
mergesortList([],[]).

mergesortList([L],[L]).

mergesortList(L, L).

mergesortList(L, Sort):-
    L = [_,_|_],
    % split list in half
    divideList(L, L1, L2),
    % sort left-hand half
    mergesortList(L1, Sort1),
    % sort right-hand half
    mergesortList(L2, Sort2),
    % merge made lists
    mergeList(Sort1, Sort2, Sort).

mergeList([], L, L).

mergeList(L, [], L):-
    L \= [].

mergeList([X|LX], [Y|LY], [X|L]):-
    X =< Y ,
    mergeList(LX, [Y|LY], L).

mergeList([X|LX], [Y|LY], [Y|L]):-
    X > Y,
    mergeList([X|LX], LY, L).

divideList(L,L1,L2):-
    splithalfList(L,L1,L2).

splithalfList(L,A,B):-
    half(L,[],A,B).

half(L, L, [], L).      % even LEN

half(L, [_|L], [], L).  % odd LEN

half([H|T], Acc, [H|L], B):-
    half(T,[_|Acc],L,B).

% Clear the screen of PrologSWI
clear :-
    format('~c~s~c~s', [0x1b, "[H", 0x1b, "[2J"]).

% Append from list.pl
append2([X|L1],L2,[X|L3]) :- append2(L1,L2,L3).
append2([],L,L).





append2([X|L1],L2,[X|L3]) :- append2(L1,L2,L3).
append2([],L,L).

% True if X is the last element of the list
% Example lastList( 1, [1,2,3,4]) returns false
% But     lastList( 4, [1,2,3,4]) returns true
lastList(X, [X|[]]).

lastList(X, [_|L1]):-
    lastList(X, L1).

% True if L2 is L1 without element X
deleteElement(_, [], []).

deleteElement(X, [X|L1], L2):-
    deleteElement(X, L1, L2).

deleteElement(X, [_|L1], [_|L2]):-
    deleteElement(X, L1, L2).

% True if L2 is L1 without 3 last elements
deleteLastTriple([_,_,_],[]).

deleteLastTriple([X|L1], [X|L2]):-
    deleteLastTriple(L1, L2).

% True if L2 is L1 in reverse order
reverseList([],[]).

reverseList([L1|LX], L2):-
    reverse(N, LX),
    append2(N, [L1], L2).

% True if L2 is L1 after one rotate to the left
% 1 2 3 4 5 L1
% 2 3 4 5 1 L2

shiftList([],[_|[]]).

shiftList([L1|LX], L2):-
    lastList(Y, L2),
    L1 is Y,
    shiftList(LX, L2).

shiftList([L1|LX], [L1|LY]):-
    shiftList(LX, LY).

% True if length of the list is even
evenListLength([]).

evenListLength([_|LX]):-
    oddListLength(LX).

% True if length of the list is odd
oddListLength([_|LX]):-
    evenListLength(LX).

% True if L2 contains squares of L1 elements
% mySquare return true if X is a square of Y, else false
mySquare(X, Y):-
    X is Y * Y.

quadratList([],[]).

quadratList([L1|LX], [L2|LY]):-
    mySquare(L2,L1),
    quadratList(LX, LY).

% True if L3 contains pairs of elements from L1 and L2, i.e.
% L3 = ([L11,L21],[L12,L22])
combineList([], [], []).
combineList([L1|LX], [L2|LY], [[LA|LH]|LZ]):-
    L1 is LA,
    L2 is LH,
    combineList(LX, LY, LZ).

% True if list L is a palindrome
% TO DO

% True if Y is right before X and Z right after X in list L
% (help function) True if element Y is found right before X
beforeList(X, [Y|[X|_]], Y).
beforeList(X, [_|[LX|LY]], Y):-
    beforeList(X, [LX|LY], Y).

beforeAfterList(X, L, Y, Z):-
    % Search for Y before X
    beforeList(X, L, Y),
    % Search for X before Z that equals Z after X
    beforeList(Z, L, X).

% True if L2 begining is equal to L1 begining to the moment of
% double X value in L1
isBeginOfList(X, [X|[X|_]], [X|[X|_]]).

isBeginOfList(X, [L1|LX], [L2|LY]):-
    L2 is L1,
    isBeginOfList(X, LX, LY).

% Clear the screen of PrologSWI
clear :-
    format('~c~s~c~s', [0x1b, "[H", 0x1b, "[2J"]).


























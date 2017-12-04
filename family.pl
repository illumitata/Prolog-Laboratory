female(mariola).
female(zofia).
female(kasia).
female(elzbieta).

male(jan).
male(stanislaw).
male(franek).
male(lukasz).

parent(elzbieta, zofia).

parent(zofia, lukasz).
parent(franek, lukasz).

parent(zofia, mariola).
parent(franek, mariola).

parent(mariola, jan).
parent(stanislaw, jan).
parent(mariola, kasia).
parent(stanislaw, kasia).

% Person1 is a child of Person2 IF Person2 is a parent of Person1
child(Person1, Person2):-
	parent(Person2, Person1).

% Person1 is a mother of Person2 IF
% Person1 is a female
% AND
% is a parent of Person1
mother(Person1, Person2):-
	female(Person1),
	parent(Person1, Person2).

% Person1 is a sister of Person2 IF
% Person1 is a female
% AND
% has same parents
sister(Person1, Person2):-
	female(Person1),
	parent(X, Person1),
	parent(Y, Person2),
	X == Y.

% Person has a child if Person is a parent of anybody
has_a_child(Person):-
	parent(Person, X),
	male(X).
has_a_child(Person):-
	parent(Person, X),
	female(X).

% Person1 is a grandparent of Person2 IF
% Person3 is a parent of Person2
% AND
% Person1 is a parent of Person3
grandparent( Person1, Person2 ):-
	parent( Person3, Person2 ),
	parent( Person1, Person3 ).

% Person1 is a predecessor of Person2 IF
% Parent of Person2 is Person1
% OR
% Parent of Parent of Parent...
predecessor(Person1, Person2):-
	parent(X, Person2),
    X == Person1.
predecessor(Person1, Person2):-
	parent(X, Person2),
	X \= Person2,
	predecessor(Person1, X).













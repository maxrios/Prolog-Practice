mother(max, carmen).
mother(val, carmen).
father(max, jose).
father(val, jose).
father(nick, max).
mother(annie, val).
father(joe, max).

parent(X,Y) :- mother(X,Y).
parent(X,Y) :- father(X,Y).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y), ancestor(X,Z).

%1. a)
fullSibling(X,Y) :- mother(X,Z), mother(Y,Z), father(X,M), father(Y,M).

%	b)
someSibling(X,Y) :- parent(X,Z), parent(Y,Z), X \= Y.
firstCousin(X,Y) :- parent(X,Z), parent(Y,A), someSibling(Z,A), X \= Y.

%2.
isReverse([],[]).
isReverse([A|X],Z) :- isReverse(X,Y), append(Y, [A], Z).

palindrome(X) :- isReverse(X,X).

%3. NOT FINISHED
intersect([],[],Z).
intersect([Head1|Tail1],[Head2|Tail2],Z) :- intersect(Tail1,Tail2,Y), append(Y,[Head1],Z).

%4. NOT FINISHED
/*
	
*/

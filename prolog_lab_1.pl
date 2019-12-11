%1.
oddIndices([], []).
oddIndices([X], [X]).
oddIndices([First, Second | Rest], Z) :- oddIndices(Rest, RestOdd), append([First], RestOdd, Z).

%2.
sublist([], _).
sublist([Head|Tail], [Head|Z]) :- sublist(Tail, Z).
sublist(Sub, [Head|Z]) :- sublist(Sub, Z).

%3.
max(A, B, B) :- A < B.
max(A, B, A) :- A > B.

maxlist([A], A).
maxlist([Head|Tail], A) :- maxlist(Tail, Max), max(Max, Head, A).

disjointRange([], _).
disjointRange([Head|Tail], Z) :- disjointRange(Tail, Z), maxlist(Z, Max), Max > Head.

%4. 
%splitter(L, L1, L2).
%merger(L1, L2, LN). 
%mergesort(L, LS).

splitter([], [], []).
splitter([A], [A], []).
splitter([First, Second|Tail], [First|L1], [Second|L2]) :- splitter(Tail, L1, L2).

merger([], [], []).
merger([A], [], [A]).
merger([L1Head|L1Tail], [L2Head|L2Tail], Z) :- merger(L1Tail, L2Tail, MergedList), 
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
splitter([], [], []).
splitter([A], [A], []).
splitter([First, Second|Tail], [First|L1], [Second|L2]) :- splitter(Tail, L1, L2).

merger(L, [], L).
merger([], L, L).
merger([L1Head|L1Tail], [L2Head|L2Tail], [L1Head|Z]) :- L1Head =< L2Head, merger(L1Tail, [L2Head|L2Tail], Z).
merger([L1Head|L1Tail], [L2Head|L2Tail], [L2Head|Z]) :- L2Head =< L1Head, merger([L1Head|L1Tail], L2Tail, Z).

mergesort([], []).
mergesort([A], [A]).
mergesort([First, Second|Tail], LS) :-  splitter([First, Second|Tail], Split1, Split2), mergesort(Split1, Merge1), mergesort(Split2, Merge2), merger(Merge1, Merge2, LS).

%5.
%a. Insert a car by specifying the make and year. [X]
%b. Delete all cars of a certain make. [X]
%c. Check if a certain car exists in the database. [X] 
%d. List all cars of a specific year. []

addToInven(Make, Year, PreInventory, [car(Make, Year)|PreInventory]).

deleteAllCars(M, [], []).
deleteAllCars(Make, [car(Make,_)|PreInvTail], PostInventory) :- deleteAllCars(Make, PreInvTail, PostInventory).
deleteAllCars(Make, [PreInvHead|PreInvTail], [PreInvHead|PostInventory]) :- deleteAllCars(Make, PreInvTail, PostInventory).

findCar(Make, Year, Inventory) :- member(car(Make, Year), Inventory). 

specificYear(Year, [], []).
specificYear(Year, [car(Make, Year)|Inventory], CarsForYear) :- append([car(Make, Year)], CarsForYear1, CarsForYear), specificYear(Year, Inventory, CarsForYear1).
specificYear(Year, [InvHead|Inventory], CarsForYear) :- specificYear(Year, Inventory, CarsForYear).
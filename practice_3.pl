%reverse a list of values.
reverse(List1, List2) :- reversePaste(List1, [], List2).

%reversePaste uses an accumulator, the middle argument, to keep the results so far. 
reversePaste([Car|Cdr], List2, M) :- reversePaste(Cdr, [Car|List2], M).

%The second reversePaste acts as a base model to pass the reverse argument back over to reverse, which does not want to see an accumulator.
reversePaste([], List2, List2).


%flatten a list of values.
flatten([], []) :- !. 
flatten([Car|Cdr], FlatList) :- 
	!,
	flatten(Car, NewCarList),
	flatten(Cdr, NewCdrList),
	append(NewCarList, NewCdrList, FlatList).
flatten(Car, [Car]).

%NOTES: ! also know as "cut" prevents backtracking. It will cut the calls once a true statement has been met.
%This flatten function will break up every element in the list into its own list, then it will combine them all into a new list.
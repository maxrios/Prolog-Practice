%1.
oddIndices([], []).
oddIndices([X], [X]).
oddIndices([First, Second | Rest], Z) :- oddIndices(Rest, RestOdd), append([First], RestOdd, Z).

%2.
/*
	Notes for sublist:

	Objective:
		We want to find the first parameter's elements inside of the second parameter in the given order.

	Steps:
		Compare the head of the first parameter to each element in the second parameter until there is a match,
		then compare the tail of the first parameter to see if all elements are found consecutively in second
		parameter. 

		Utilization of member can be used to find if the Head of the first parameter is found within the second 
		parameter.
*/

sublist([], _).
sublist([Head|Tail], Z) :- member(Head, Z), sublist(Tail, Z).


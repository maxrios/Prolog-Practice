%[X|R] is represented the same as car and cdr. Putting them in the brackets cons variables X and R.
%The anonymous variable inside of the pair acts as a new variable on every occurence. 
contains(X, [X|_]).
contains(X, [_|R]) :- contains(X, R).

%R represents cdr of the list.
%The first remove statement is inherently true. Compares the X and Y variables to see if they´re true. 
remove(X, [X|R], R).
remove(X, [F|R], [F|S]) :- remove(X, R, S).

%Checks if the conclusion will match up with what you are trying to prove, and if it does, check the conditions. 
max(A, B, B) :- A < B.
%Other versions
%max(A, B, A) :- B < A.
%Uses the order of statements. This allows the following statement to act as an else-statement. 
max(A, B, A).


%Reverse practice
isReverse([], []).
isReverse([X], [X]).
isReverse([X|Y], Z) :- isReverse(Y, Y2), append(Y2, [X], Z).
%[X|R] is represented the same as car and cdr. Putting them in the brackets cons variables X and R.
%The anonymous variable inside of the pair acts as a new variable on every occurence. 
contains(X, [X|_]).
contains(X, [_|R]) :- contains(X, R).

%R represents cdr of the list.
remove(X, [X|R], R).
remove(X, [F|R], [F|S]) :- remove(X, R, S).


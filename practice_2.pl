energized(nick).
energized(kyle).
busy(nick).
hasSnacks(kyle).

driving(X) :- energized(X), not(busy(X)).
roadTrip(X) :- driving(X), hasSnacks(X).

carModel(max, f150).
carModel(kyle, f150).
carModel(nick, f150).

shareCar(X, Y) :- carModel(X, Z), carModel(Y, Z), X\=Y.

isACar([f150, f350, tucson]).

student(max).
student(jack).
student(ashley).

class(max, algo).
class(jack, algo).
class(ashley, calc).
class(jack, calc).

shareClass(X, Y) :-class(X, Z),class(Y, Z),X\=Y.

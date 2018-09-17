
fib(0, 1).
fib(1, 1).
% this one blows the stack. why?
% fib(N, X) :- fib(N - 1, Y), fib(N - 2, Z), X is Y + Z.
fib(N, X) :- N1 is N - 1, N2 is N - 2, fib(N1, X1), fib(N2, X2), X is X1 + X2.

factorial(1, 1).
% factorial(X, Y) :- factorial(X - 1, Z), Y = X * Z.
factorial(X, Y) :- X1 is X - 1, factorial(X1, Z), Y is X * Z.


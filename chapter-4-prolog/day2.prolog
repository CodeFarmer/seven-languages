

fib(0, 1).
fib(1, 1).
% this one blows the stack. why?
% fib(N, X) :- fib(N - 1, Y), fib(N - 2, Z), X is Y + Z.
fib(N, X) :- N1 is N - 1, N2 is N - 2, fib(N1, X1), fib(N2, X2), X is X1 + X2.

factorial(1, 1).
% factorial(X, Y) :- factorial(X - 1, Z), Y = X * Z.
factorial(X, Y) :- X1 is X - 1, factorial(X1, Z), Y is X * Z.

% three-tower Hanoi

hanoi_move(1, Source, Dest, _, Moves) :- Moves = [(Source, Dest)].
hanoi_move(N, Source, Dest, Other, Moves) :-
    M is N - 1,
    hanoi_move(M, Source, Other, Dest, LMoves),
    append(LMoves, [(Source, Dest) | RMoves], Moves),
    hanoi_move(M, Other, Dest, Source, RMoves).

% listy things

reverse_list([], []).
reverse_list([H | T], R) :- reverse(T, TR), append(TR, [H], R).

smallest([H|[]], H).
smallest([H|T], H) :- smallest(T, X), H < X.
smallest([H|T], X) :- smallest(T, X), H >= X.

% insertion sort

isort(Thing, [], [Thing]).
isort(Thing, [H | T], [Thing , H | T]) :- Thing < H.
isort(Thing, [H | T], [H | SortedTail]) :- Thing >= H, isort(Thing, T, SortedTail).
isort([], []).
isort([H | T], Sorted) :- isort(T, SortedT),
			  isort(H, SortedT, Sorted).
			  
% quicksort! do iiiiit.



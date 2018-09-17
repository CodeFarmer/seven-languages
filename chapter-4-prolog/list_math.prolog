
count(0, []).
count(Count, [_ | Tail]) :- count(TailCount, Tail),
			       Count is TailCount + 1.

sum(0, []).
sum(Sum, [Head | Tail]) :- sum(TailSum, Tail),
			   Sum is TailSum + Head.

average(Average, List) :- count(C, List), sum(S, List), Average is S / C.

concat([], List, List).
concat([H|T], List, [H | R]) :- concat(T, List, R).


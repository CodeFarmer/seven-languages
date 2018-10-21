-module(day2).
-export([findAssoc/2]).
-export([itemTotals/1]).
-export([winner/1]).


findAssoc(_, []) ->
    undefined;

findAssoc(Key, [{K, V} | T]) ->
    if
	Key == K ->
	    V;
	true -> findAssoc(Key, T)
    end.


itemTotals(Items) -> 
    lists:map(fun({Item, Quantity, Price}) -> {Item, Quantity * Price} end, Items).


% this would be a working solution if 'undefined' didn't match things too :facepalm:
winner([X, X, X,
        _, _, _,
        _, _, _]) -> X;
winner([_, _, _,
        X, X, X,
        _, _, _]) -> X;
winner([_, _, _,
        _, _, _,
        X, X, X]) -> X;
winner([X, _, _,
        X, _, _,
        X, _, _]) -> X;
winner([_, X, _,
        _, X, _,
        _, X, _]) -> X;
winner([_, _, X,
        _, _, X,
        _, _, X]) -> X;
winner([X, _, _,
        _, X, _,
        _, _, X]) -> X;
winner([_, _, X,
        _, X, _,
        X, _, _]) -> X;
winner(L) ->
    case lists:all(fun(X) -> X /= undefined end, L) of
	true ->
	    no_winner;
	_ -> cat
    end.


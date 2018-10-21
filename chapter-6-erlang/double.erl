-module(double).
-export([double_all/1]).

double_all([]) ->
    [];
double_all([H|T]) ->
    [H + H | double_all(T)].


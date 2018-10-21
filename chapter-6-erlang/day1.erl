-module(day1).
-export([wordCount/1]).
-export([countToTen/0]).
-export([matchSuccess/1]).


isWordChar(Ch) ->
    if 
	(Ch >= 65) and (Ch =< 122) ->
	    true;
	true -> 
	    false
    end.
    

wordCount(Count, _, "") ->
    Count;

wordCount(Count, IsInWord, [H|T]) ->
    if
	not IsInWord ->
	    case isWordChar(H) of
		true -> wordCount(Count + 1, true, T);		    
		false -> wordCount(Count, false, T)
	    end;
	true -> wordCount(Count, isWordChar(H), T)
    end.

wordCount(String) ->
    wordCount(0, false, String).


countToTen(Num) ->
    if
	Num > 10 ->
	    nil;
	true -> io:fwrite("~.B~n", [Num]),
		countToTen(Num + 1)
    end.

countToTen() ->
    countToTen(1).


matchSuccess(success) ->
    "success";
matchSuccess({error, Message}) ->
    string:concat("error: ", Message).


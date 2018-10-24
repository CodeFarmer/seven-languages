-module(otp_translate).
-behavior(gen_server).
-export([handle_call/3,
	 handle_cast/2,
	 handle_info/2,
         init/1]).


translate(Message) ->
    case Message of
	"casa" ->
	    "house";
	"blanca" ->
	    "white";
	_ -> "I don't understand."
    end.


handle_call(Request, {_, _}, _) ->
	    {reply, translate(Request), nil}.

handle_noreply(X) ->
    io:format("~p~n", [translate(X)]),
    {noreply, nil}.
    
handle_cast(Request, _) ->
    handle_noreply(Request).


% this is the one that gets called when you do Pid ! "blanca"
handle_info(Info, _) ->
    handle_noreply(Info).


init(_) ->
    io:format("otp_translate: init(_)~n"),
    {ok, nil}.

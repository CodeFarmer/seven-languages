-module(otp_supervisor).
-behavior(supervisor).
-export([init/1]).


init(_) ->
    {ok,
     {#{},
      [#{id => translator,
	 start => {otp_translate, start_link, []}}]}
     }.

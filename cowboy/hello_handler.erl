-module(hello_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    Teller = teller:get(), 
    Headers = [#{<<"content-type">> => <<"text/html">>}],
    Body = ,
    Req = cowboy_req:reply(200, Headers, Body, Req0),
    {ok, Req, State}.

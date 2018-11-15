-module(counterServer).
-behaviour(gen_server).

-export([start_link/0]).
-export([inc/0,reset/0, getValue/0]).
-export([init/1, handle_call/3, handle_cast/2,]).

%maak een server die get, reset en getValue

start_link() ->
    gen_server:start_link({local, counterServer}, counterServer, [], []).

init(_State) ->
    {ok, 0}.

handle_call(getValue, _From, StateServer) ->
    {reply, StateServer, StateServer}.

handle_cast(inc, StateServer) ->
    {noreply, StateServer + 1}.

handle_cast(reset, StateServer) ->
    {noreply, 0}.

inc(stateServer) ->
    gen_server:cast:(counterServer,inc).

reset(stateServer) ->
    gen_server:cast:(counterServer,reset).

getValue(stateServer) ->
    gen_server:cast:(counterServer,getValue).

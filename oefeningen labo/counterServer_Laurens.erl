-module(counterServer).
-behaviour(gen_server).

-export([start_link/0]).
-export([inc/0, reset/0,getValueFun/0]).
-export([init/1, handle_call/3, handle_cast/2]).

%Maak een server die reset, increment en get

start_link() ->
    gen_server:start_link({local, eenNaam},?MODULE, [], []).

getValueFun() ->
	gen_server:call(eenNaam,getValue).

	
inc() ->
	gen_server:cast(eenNaam,inc).
	
reset() ->
	gen_server:cast(eenNaam,reset).
	
init(_State) ->

    {ok, 0}.


handle_call(getValue, _From, State) ->
	{reply,State,State}.
	
handle_cast(inc, State) ->
	%We krijgen een boodschap van iemand, maar die verwacht geen antwoord
	%We passen enkel onze State aan naargelang de boodschap
    {noreply, State+1};
	
handle_cast(reset, _State) ->
	%We krijgen een boodschap van iemand, maar die verwacht geen antwoord
	%We passen enkel onze State aan naargelang de boodschap
    {noreply, 0}.
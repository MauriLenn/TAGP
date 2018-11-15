-module(publish_subscriber).
-export([start/0,init/0]).

start() ->
	Pid = spawn(?MODULE,init,[]),
	register(server,Pid).
	
init() ->
	%ets:new('brandweerCentrale',[set,public,named_table,{keypos,1}]),
	loop([]).

loop(Subscribers) ->
	receive
	{broadcast,Msg} -> broadcast(Subscribers,Msg), loop(Subscribers);
	{addSubscriber,Pid} -> addSubscriber(Subscribers,Pid);
	{removeSubscriber, Subscriber} -> removeSubscriber(Subscribers,Subscriber);
	{printList, "weergeef tabel"} -> printList(Subscribers);
	stop -> ok
	end.

broadcast(List,Msg) -> broadcast(List,[],Msg).

broadcast([Pid | Rest], Acc, Msg) ->
	Pid ! Msg,
	broadcast(Rest, [Pid | Acc], Msg);

broadcast([], Acc, _Msg) ->
	List = lists:reverse(Acc),
	loop(List).

addSubscriber(Subscribers, Pid) ->
	List = Subscribers++[Pid],
	loop(List).

removeSubscriber(Subscribers, Subscriber) ->
	List = lists:delete(Subscriber,Subscribers),
	loop(List).

printList(L) -> printList(L,[]).

printList([],[]) ->
	io:fwrite("[]");

printList([],Accu) ->
	io:fwrite("]");
	
printList([A|Rest],[]) ->
	io:fwrite("["),
	io:fwrite(integer_to_list(A)),
	printList(Rest,[A]);
	
printList([A|Rest],Accu) ->
	io:fwrite(","),
	io:fwrite(integer_to_list(A)),
	printList(Rest,[A|Accu]).

%introducing erlang 


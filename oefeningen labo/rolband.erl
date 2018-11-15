-module(rolband).
-export([update/2,update/4,init/0,newPos/3]).

init() -> update(20,[{p1,123},{p2,443},{p3,973}]).

update(DT,List) -> update(DT,List,[],0).

update(DT,[],Acc, _) -> lists:reverse(Acc);

update(DT,[{Pid,Pos}|T],Acc,StopPos) ->
	update(DT,T,[{Pid, newPos(Pos,DT,StopPos)}|Acc],StopPos).
	
newPos(Pos,DT,StopPos) -> max(Pos - 10*DT, StopPos).	
	
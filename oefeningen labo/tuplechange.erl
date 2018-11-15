-module(tuplechange).
-export([transformeer/1]).

transformeer(L) -> transformeer(L,[]).
transformeer([],Accu) -> keerom(Accu);
transformeer([{a,X}|T],Accu) -> transformeer(T,[{a,X*X}|Accu]);
transformeer([{b,X}|T],Accu) -> transformeer(T,[{b,X+10}|Accu]);
transformeer([{c,_X}|T],Accu) -> transformeer(T,[{a,'niks'}|Accu]);
transformeer([H|T],Accu) -> transformeer(T,[H|Accu]).

keerom(L) -> keerom(L,[]).
keerom([],Accu) -> Accu;
keerom([H|T],Accu) -> keerom(T,[H|Accu]).


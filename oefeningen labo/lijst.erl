-module(lijst).
-export([keerom/1]).

keerom(L) -> keerom(L,[]).
keerom([],Accu) -> Accu;
keerom([H|T],Accu) -> keerom(T,[H|Accu]).
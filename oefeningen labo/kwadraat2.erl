-module(kwadraat2).
-export([kwadrateer/1]).

kwadrateer(L) -> kwadrateer(L,[]).
kwadrateer([],Accu) -> Accu;
kwadrateer([H|T],Accu) -> kwadrateer([H*H|Accu],T).
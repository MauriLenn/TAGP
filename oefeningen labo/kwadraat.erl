-module(kwadraat).
-export([kwadrateer/1]).

kwadrateer(L) -> kwadrateer(L,[]).
kwadrateer([],Accu) -> Accu;
kwadrateer([H|T],Accu) -> kwadrateer(T,[H*H|Accu]).

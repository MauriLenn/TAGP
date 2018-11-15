-module(test).
-export([f/1]).

f(a) -> 2;
f(b) -> "2";
f(c) -> [1,2,3];
f(d) -> nil.

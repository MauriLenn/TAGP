-module(torensVanHanoi).
-export([hanoi/4]).

hanoi(1,P1,_,P3) -> io:fwrite("Beweeg"),
					io:fwrite("P1"),
					io:fwrite(" naar "),
					io:fwrite("P2"),
					io:fwrite("~n");% ; omdat functie wordt hergebruikt
hanoi(N,P1,P2,P3) -> 
		hanoi(N-1,P1,P3,P2),
		hanoi(1,P1,P2,P3), %eerste P = start, tweede P = hulp, derde P = target
		hanoi(N-1,P2,P1,P3).
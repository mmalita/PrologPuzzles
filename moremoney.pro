/* file: Puzzles/moremoney.pro Cryptarithmetic.
   SEND+
   MORE
   -----
   MONEY
Solution is: [S,E,N,D,M,O,R,Y]=[9, 5, 6, 7, 1, 0, 8, 2],
Assign different values 0-9 to all letters S,E,N,D,M,O,R,Y in such a way that the equation holds
***************************/
start(Sol) :- Sol = [S,E,N,D,M,O,R,Y],
	between(1,9,S), between(0,9,E),between(0,9,N),between(0,9,D), 
	between(1,9,M), between(0,9,O),between(0,9,R),between(0,9,Y),
	is_set(Sol),   %% works but very slow! 
    SendMore is 1000*S + 100*E + 10*N + D + 1000*M + 100*O + 10*R + E,
	Money is 10000*M + 1000*O + 100*N + 10*E + Y,
	SendMore = Money,
	write('Sol=').
/******************** TODO***********************
start(Sol) :-    Sol = [S,E,N,D,M,O,R,Y],
	%% numlist(0,9,Ln), % Ln
    %%%mysubset([S,E,N,D,M,O,R,Y,_],Ln),
    S \== 0, M \== 0, %% cannot start with 0
    SendMore is 1000*S + 100*E + 10*N + D + 1000*M + 100*O + 10*R + E,
	Money is 10000*M + 1000*O + 100*N + 10*E + Y,
	SendMore = Money,
	write('Sol=').
*****************************************/
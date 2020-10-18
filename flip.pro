/* File: Puzzles/flip.pro   Author: Mark Herod - Student 2005   
   Title: Flipping Coins
Place 3 coins with their indicated side facing up as shown.
In 3 moves arrange the coins so that all three have the same side facing up.
A move counts of flipping 2 coins over to their opposite side.
		H	T 	H
Note: (Always different configuration) 
Flipping the pair of outer coins 3 times doesn't count!
	state(s) = node is graph 
	[head, tail, head] = [h,t,h]
	?- start,fail.
	[h, t, h]
	[t, h, h]
	[h, h, t]
	[t, t, t]

	[h, t, h]
	[h, h, t]
	[t, h, h]
	[t, t, t]
**********************************************/
start:- initial(S),path(S,[],Sol),
        reverse(Sol,Res),length(Sol,4),
        prettyprint(Res).

%% at the beginning All are on the same bank
	initial([h,t,h]).
%% 
	final([h,h,h]).
    final([t,t,t]).

path(Node,Path,[Node|Path]):- final(Node).
path(Node,Path,Sol):- move(Node,N1),\+member(N1,Path),                    
                      path(N1,[Node|Path],Sol).
%% 
	opp(h,t).  
	opp(t,h).

prettyprint(L):- forall(member(X,L),(write(X),nl)).

move([A,B,C],[A1,B1,C]):- opp(A,A1),opp(B,B1).  % first two coins
move([A,B,C],[A1,B,C1]):- opp(A,A1),opp(C,C1).  % two coins
move([A,B,C],[A,B1,C1]):- opp(C,C1),opp(B,B1).  % last two coins 

/*	File: Puzzles/river.pro  	Author(sol): M. Malita IMPROVE!
	Problem:	Cross River
There are 4 adults who want to cross a river. 
They come upon a boy and a girl playing in a rowboat.
The boat can hold either two children or one adult.
Can the adults succeed in crossing the river? If so, how?
  	?- start.
	Bank   AE CE AW CW  
	%% Bank Adult-East-Bank Children-East-Bank Adult-West-Bank Children-West-Bank
	[east, 4, 2, 0, 0]
	[west, 4, 0, 0, 2]
	[east, 4, 1, 0, 1]
	[west, 3, 1, 1, 1]
	[east, 3, 2, 1, 0]
	[west, 3, 0, 1, 2]
	[east, 3, 1, 1, 1]
	[west, 2, 1, 2, 1]
	[east, 2, 2, 2, 0]
	[west, 2, 0, 2, 2]
	[east, 2, 1, 2, 1]
	[west, 1, 1, 3, 1]
	[east, 1, 2, 3, 0]
	[west, 1, 0, 3, 2]
	[east, 1, 1, 3, 1]
	[west, 0, 1, 4, 1]
	[east, 0, 2, 4, 0]
	[west, 0, 0, 4, 2]
***********************************************************/
initial([east,4,2,0,0]).	final([west,0,0,4,2]).
start:-    	initial(S),path(S, [], Sol),
		reverse(Sol,Res),mywrite(Res).
boat(A,K):- member([A, K], [[1,0],[0,1],[0,2]]).
move([east, Ae1, Ke1, Aw1, Kw1], [west, Ae2, Ke2, Aw2, Kw2]):-
		boat(A,K), 
		Ae1>=A,Ke1>=K,
		Ae2 is Ae1 - A,
		Ke2 is Ke1 - K,
		Aw2 is Aw1 + A,
		Kw2 is Kw1 + K.
move([west, Ae1, Ke1, Aw1, Kw1], [east, Ae2, Ke2, Aw2, Kw2]):-
		boat(A,K), 
		Aw1 >= A,Kw1 >= K,
		Ae2 is Ae1 + A,
		Ke2 is Ke1 + K,
		Aw2 is Aw1 - A,
		Kw2 is Kw1 - K.	

path(N, Path, [N|Path]):-  final(N).
path(N, Path, Sol):- move(N, NI),\+member(NI, Path),path(NI, [N|Path], Sol).

mywrite(L):- write('Bank AE CE AW CW'),nl,forall(member(X,L),(write(X),nl)).

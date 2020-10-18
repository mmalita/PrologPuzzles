/* File: Puzzles/magic.pro Author: MM+David Grello- AI-class 2002
Title: Magic Square. Generate all the possible 3 x 3 magic squares with numbers from digits from 1 to 9 (the digits occur just once)	(the sum on each line and column is the same).
Uses SWI predicate: permutation/2, sum_list/2
?- findall(X,(X=[A,B,C,D,E,F,G,H,I],square(X)),length(L,N).
L = [[1,5,9,6,7,2,8,3,4],[1,5,9,8,3,4,6,7,2],... ]
N = 72
There are 72 solutions. All have the same sum=15
?- start,fail.
Magic Square 3x3 
	5-9-1
	3-4-8
	7-2-6
Magic Square 3x3 
	5-1-9
	3-8-4
	7-6-2
Magic Square 3x3 
	9-5-1
	4-3-8
	2-7-6
**************************************************************/
start:-	S=[A,B,C,D,E,F,G,H,I],
		permutation([1,2,3,4,5,6,7,8,9],S),
		sum_list([A,B,C],N), sum_list([D,E,F],N), 
		sum_list([G,H,I],N),
		sum_list([A,D,G],N), sum_list([B,E,H],N), 
		sum_list([C,F,I],N),write_square(S).
	
write_square([A,B,C,D,E,F,G,H,I]):- write(A-B-C),nl,
                write(D-E-F),nl, 
                write(G-H-I),nl,nl.
/* File: Puzzles/disorder.pro Solution: Mihaela Malita
Title: Disorder. Rearrange the numbers in the figure in such a way that 
consecutive numbers do not TOUCH each other. 
They cannot align side by side, ups and downs or diagonally.
	1				A
2	3	4		B	C	D
5	6	7		E	F	G
	8				H
?- start,false.
     2
5    8     4
3    1     6
     7
     2
5    8     6
3    1     4
     7
     2
6    8     5
4    1     3
     7
     7
3    1     4
5    8     6
     2
     7
4    1     3
6    8     5
     2
     7
4    1     5
6    8     3
     2
******************************************************/
start:-	S=[A,B,C,D,E,F,G,H],permutation([1,2,3,4,5,6,7,8],S),
		shape(S),write_square(S).

consec(X,Y) :-  1 is abs(X - Y).

shape([A,B,C,D,E,F,G,H]):-	
		not(consec(A,B)),not(consec(A,C)),not(consec(A,D)),
        not(consec(B,C)),not(consec(B,E)),not(consec(B,F)),
        not(consec(C,E)),not(consec(C,F)),not(consec(C,D)),not(consec(C,G)),
		not(consec(D,G)),not(consec(D,F)),not(consec(E,F)),not(consec(E,H)),
		not(consec(F,H)),not(consec(F,G)).
	
write_square([A,B,C,D,E,F,G,H]):-	tab(5),write(A),nl,
                write(B), tab(4), write(C),tab(5),write(D),nl, 
                write(E), tab(4), write(F),tab(5),write(G),nl,
				tab(5), write(H),nl. 
/* File: Puzzles/sudoku.pro        Author: MMalita
Title:  Sudoku GENERATOR.          From: http://www.sudoku.com/           
all ints 1-9 no repeats blocks (9) also do not repeat
SWI predicate: permutation/2  and is_set/1
?- start.
[1, 2, 3, 4, 5, 6, 7, 8, 9]
[7, 8, 9, 1, 2, 3, 4, 5, 6]
[4, 5, 6, 7, 8, 9, 1, 2, 3]
[9, 1, 2, 3, 4, 5, 6, 7, 8]
[6, 7, 8, 9, 1, 2, 3, 4, 5]
[3, 4, 5, 6, 7, 8, 9, 1, 2]
[8, 9, 1, 2, 3, 4, 5, 6, 7]
[7, 2, 3, 5, 6, 1, 4, 8, 9]
[5, 6, 4, 8, 9, 7, 2, 3, 1]
**************************************************************/
start:-	Nine=[1,2,3,4,5,6,7,8,9],
    S=[L1,L2,L3,L4,L5,L6,L7,L8,L9],
    permutation(L1,Nine),
    permutation(L2,Nine),good(L1,L2),
    different(L2,L1),
	permutation(L3,Nine),good(L1,L3),good(L2,L3),
    different(L3,L1),different(L3,L2),
	permutation(L4,Nine),
     different(L1,L4),different(L2,L4),different(L3,L4),        
     permutation(L5,Nine),good(L4,L5),
	different(L1,L5),different(L2,L5),different(L3,L5), 
	different(L4,L5),
	permutation(L6,Nine),good(L4,L6),good(L5,L6),
	different(L1,L6),different(L2,L6),different(L3,L6), 
	different(L4,L6),different(L5,L6),
     permutation(L7,Nine),
	different(L1,L7),different(L2,L7),different(L3,L7), 
	different(L4,L7),different(L5,L7),different(L6,L7), 
	permutation(L8,Nine),good(L7,L8),
	different(L1,L8),different(L2,L8),different(L3,L8), 
	different(L4,L8),different(L5,L8),different(L6,L8), 
	different(L7,L8),
 	permutation(L9,Nine),good(L7,L9),good(L8,L9),
    different(L1,L9),different(L2,L9),different(L3,L9), 
	different(L4,L9),different(L5,L9),different(L6,L9), 
	different(L7,L9),different(L8,L9),
	write_square(S).
        
write_square(S):- nl,forall(member(X,S),(write(X),nl)),nl.

/* two lines are different:
	if they do not have any elements on the same position.
?- different([a,b],[b,a]).
true
?- different([a,b],[a,a]).
false
************************************************/
different([],[]).
different([H1|T1],[H2|T2]):- H1\=H2,different(T1,T2).

/* If two lines cover the same block add the condition:
[A1,A2,A3 |A4,A5,A6, | A7,A8,A9]
[B1,B2,B3 |B4,B5,B6, | B7,B8,B9])
Elements from the same block are different that is
[A1,A2,A3,B1,B2,B3] is a set.
*************************************************************/
good([A1,A2,A3,A4,A5,A6,A7,A8,A9],[B1,B2,B3,B4,B5,B6,B7,B8,B9]):-
    is_set([A1,A2,A3,B1,B2,B3]),
    is_set([A4,A5,A6,B4,B5,B6]),
    is_set([A7,A8,A9,B7,B8,B9]).
                                                                          
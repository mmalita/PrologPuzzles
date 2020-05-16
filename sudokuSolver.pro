/*File: Puzzles/sudokuSolve.pro Author: Mihaela Malita
Title:  SUDOKU Solver. From: http://www.sudoku.com/
A sort of Magic Square 9 x9
all integers: 1-9 fill on lines and columns (no repeats)
also blocks (9) do not repeat
SWI predicates: permutation/2  and is_set/1      
**************************************************************/
%% start:- write('Enter known positions?'),read(S),solve(S).
        
start:-S=[[_, _, _, 3, 4, 2, _, _, _],
	  [5, 4, _, _, 7, _, _, 8, _],
	  [_, _, 2, _, _, 5, 4, _, 6],
	  [_, 6, _, 2, _, _, _, _, _],
	  [3, _, 8, _, _, _, 2, _, 4],
	  [_, _, _, _, _, 8, _, 7, _],
	  [6, _, 9, 1, _, _, 5, _, _],
	  [_, 3, _, _, 8, _, _, 1, 9],
	  [_, _, _, 5, 3, 9, _, _, _]],
          solve(S).

write_square(S):- nl,forall(member(X,S),(write(X),nl)),nl.
/*
two lines are different if they do not have any elements on the same position.
?- different([a,b],[b,a]).
true
?- different([a,b],[a,a]).
false
----------------------------------*/
different([],[]).
different([H1|T1],[H2|T2]):- \+var(H1),\+var(H2),
                             H1\=H2,different(T1,T2),!.
different([H1|T1],[H2|T2]):- different(T1,T2),!.

/*
Integers do not repeat in blocks 3x3
----------------------------------*/
good([A1,A2,A3,A4,A5,A6,A7,A8,A9],[B1,B2,B3,B4,B5,B6,B7,B8,B9]):-
    notvars([A1,A2,A3,B1,B2,B3],G1),
    notvars([A4,A5,A6,B4,B5,B6],G2),
    notvars([A7,A8,A9,B7,B8,B9],G3),
    is_set(G1),is_set(G2),is_set(G3).

/*
Collect non variables from lines:
?- notvars([_,2,_,_,5,_,7,_,9,1],L).
L = [2, 5, 7, 9, 1] 
----------------------------------*/
notvars(L,G):-findall(X,(member(X,L),\+var(X)),G).

solve(S):-  Nine=[1,2,3,4,5,6,7,8,9],
        S=[L1,L2,L3,L4,L5,L6,L7,L8,L9],
        write_square(S),
        permutation(L1,Nine),   %% Line 1
        %%write_square(S),
        good(L1,L2),good(L1,L3),
        different(L1,L4),different(L1,L5),
        different(L1,L6),different(L1,L7),
        different(L1,L9),different(L1,L9),
	write_square(S),
        permutation(L2,Nine),   %% Line 2
        good(L1,L2),good(L2,L3),
 	different(L2,L4),different(L2,L5),different(L2,L6),        
 	different(L2,L7),different(L2,L8),different(L2,L9), 
 	write_square(S),
        permutation(L3,Nine),   %% Line 3
        good(L3,L1),good(L3,L2),
 	different(L3,L4),different(L3,L5),different(L3,L6),        
 	different(L3,L7),different(L3,L8),different(L3,L9), 
 	write_square(S),
	permutation(L4,Nine),   %% Line 4
        different(L4,L1),different(L4,L2),different(L4,L3),        
 	different(L4,L5),different(L4,L6),different(L4,L7), 
        different(L4,L8),different(L4,L9), 
 	write_square(S),
	permutation(L5,Nine),   %% Line 5
        good(L5,L4),
        different(L5,L1),different(L5,L2),different(L5,L3),        
 	different(L5,L6),different(L5,L7), 
        different(L5,L8),different(L5,L9), 
 	write_square(S),
	permutation(L6,Nine),   %% Line 6
 	good(L6,L4),good(L6,L5),
        different(L6,L1),different(L6,L2),different(L6,L3), 
        different(L6,L7),different(L6,L8),different(L6,L9),       
 	write_square(S),
        permutation(L7,Nine),   %% Line 6
 	different(L7,L1),different(L7,L2),different(L7,L3), 
        different(L7,L4),different(L7,L5),different(L7,L6),
        different(L7,L8),different(L7,L9),       
 	write_square(S),
	permutation(L8,Nine),   %% Line 6
 	good(L8,L7),good(L8,L9),
        different(L8,L1),different(L8,L2),different(L8,L3), 
        different(L8,L4),different(L8,L5),different(L8,L6),
       	write_square(S).


                                                                    
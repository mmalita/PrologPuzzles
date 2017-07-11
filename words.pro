/*  File: Puzzles/words.pro (Sol): Mihaela Malita IMPROVE!
    Title:  For finding word squares    3x3  
	Generates word squares.
A word square is an arrangement of letters in a square such that each row and each column is a word in the dictionary. 
	?- start.
	Solution for wordsquare	
	t-a-b
	e-p-a
	n-e-t
Algorithm:
0) Fix your vocabulary (lexicon).
1) Write down your square with variables:
        A-B-C
		D-E-F
		G-H-I
2) Put condition: all row and columns are words:
   For rows:     
	word([A,B,C]).  word([D,E.F]).  word([G,H,I]).  
   For colums:   
	word([A,D,G]).  word([B,E.H]).  word([C,F,I]).  
3) Put together all the variables you look for in one predicate. 
        wordsq(A,B,C,D,E,F,G,H,I).
4) Write start. Look for all solutions.
*****************************************************/
/*       data base with words */
word([t,a,b]).	word([e,p,a]).
word([b,a,t]).	word([t,e,n]).
word([t,a,n]).	word([r,a,t]).
word([r,a,n]).	word([a,t,e]).
word([j,a,b]).	word([j,o,e]).
word([b,e,t]).	word([a,p,e]).
word([n,e,t]).	word([a,p,t]).
word([o,f,t]).	word([o,p,t]).

wordsq(A,B,C,D,E,F,G,H,I):-   word([A,B,C]),word([D,E,F]),                   
      			      word([G,H,I]),word([A,D,G]),                 
       			      word([B,E,H]),word([C,F,I]).                   
/* Just one solution   
start:- write('Solution for wordsquare\n'),
	wordsq(A,B,C,D,E,F,G,H,I),
        write(A-B-C),nl,
        write(D-E-F),nl,
	write(G-H-I).
---------------------------------------------*/
/* All solutions   */
start:- 	write('Solution for wordsquare\n'),
		forall(wordsq(A,B,C,D,E,F,G,H,I),
         	(write('\nWord Square:\n'),
          	write(A-B-C),nl,
	  	write(D-E-F),nl,
	  	write(G-H-I))).
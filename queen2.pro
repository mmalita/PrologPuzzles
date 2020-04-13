/* File: Puzzles/queen2.pro  also see: Bratko's textbook  
Title: Eight Queens problem 
Is it possible to place eight queens on an empty chessboard so 
that no queen is attacking any other, i.e., no two queens are in the same row, 
the same column, or along the same diagonal? 
	?- start(S),write(S),false.
	[1/4,2/2,3/7,4/3,5/6,6/8,7/5,8/1] 
	[1/4,2/7,3/5,4/2,5/6,6/1,7/3,8/8]	
 	..
Comments (MM): this is a way of generating Alternate Sign Matrices-ASM  
that is matrices which have the sum 1 on each row and each column, but only that subset which 
does not include  (-1).
Their number is known and easy to find. The number of the ASM of (n x n)was an open problem till '95.
*****************************************************/
start(S):- S=[1/Y1,2/Y2,3/Y3,4/Y4,5/Y5,6/Y6,7/Y7,8/Y8],
           permutation([Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8],[1,2,3,4,5,6,7,8]),
	       list_comb(2,S,L),
           all_prop(not_diagonal,L).

not_diagonal([X/Y,X1/Y1])- A is abs(X-X1),B is abs(Y-Y1),A \= B.

/* mem1(Lr,L). For comb/3. Does not generate [a,b] and [b,a]. 	
	?- mem1([X,Y],[a,b,c]).
	[a,b][a,c][b,c]
*/
mem1([],Y).
mem1([H|T],Y):-member(H,Y),rest(H,Y,New),mem1(T,New).
/* rest(A,L,R). Returns the rest of the list after the first occurrence of A. 
	| ?- rest(a,[a,b,c,d],I).	I = [b,c,d]
	| ?- rest(a,[b,c,d],I).		I = []
*/
rest(A,L,R):-Y=[A|R],append(X,Y,L),!.
/* comb(N,L,Res). Combinations. Arrangements without " order".	
	| ?- comb(2,[a,b,c],I).
	I = [a,b] ;	I = [a,c] ;	I = [b,c] ;
*/
comb(N,L,X):-length(X,N),mem1(X,L).
/* list_comb(N,L,Res).	
	?-  list_comb(2,[a,b,c,d],L).
	L = [[a,b],[a,c],[a,d],[b,c],[b,d],[c,d]]
*/
list_comb(N,L,Res):- findall(X,comb(N,L,X),Res).
%%all_prop(Prop,L) - checks if all elements in a list have a certain property
all_prop(P,L):-forall(member(X,L),(F=..[P,X],call(F))).
/*	
| ?- findall(S,start(S),L),write(L),length(L,N).
[1 / 1,2 / 5,3 / 8,4 / 6,5 / 3,6 / 7,7 / 2,8 / 4]
[1 / 1,2 / 6,3 / 8,4 / 3,5 / 7,6 / 4,7 / 2,8 / 5]
[1 / 1,2 / 7,3 / 4,4 / 6,5 / 8,6 / 2,7 / 5,8 / 3]
....
[1 / 7,2 / 5,3 / 3,4 / 1,5 / 6,6 / 8,7 / 2,8 / 4]
[1 / 8,2 / 2,3 / 4,4 / 1,5 / 7,6 / 5,7 / 3,8 / 6]
[1 / 8,2 / 2,3 / 5,4 / 3,5 / 1,6 / 7,7 / 4,8 / 6]
[1 / 8,2 / 3,3 / 1,4 / 6,5 / 2,6 / 5,7 / 7,8 / 4]
[1 / 8,2 / 4,3 / 1,4 / 3,5 / 6,6 / 2,7 / 7,8 / 5]
N = 92
*/
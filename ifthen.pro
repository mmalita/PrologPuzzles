/*   	File: Puzzles/ifthen.pro     	Author: If Then (sol MM)
	Title: The false Statements
1. Only one of these statements is false
2. Only two of these statements is false
3. Only three of these statements is false
4. Only four of these statements is false
5. All five of these statements is false
Which if any is true?
?- start.
I = [false,false,false,true,false] ;
*/
start:- find(I),write(I).
/* mem/2: tests/generates if all the elements in the first list are 
members in the second list.
| ?- mem([X,Y,Z],[a,b]).
X = Y = Z = a ;
X = Y = a ,Z = b ;
X = Z = a ,Y = b ;
X = a ,Y = Z = b ;
X = b ,Y = Z = a ;
X = Z = b ,Y = a ;
X = Y = b ,Z = a ;
X = Y = Z = b ;		There are 2^3 = 8 solutions.
*/
mem([],_L).
mem([H|T],L):- member(H,L),mem(T,L).

find([A1,A2,A3,A4,A5]) :-  mem([A1,A2,A3,A4,A5],[true,false]),
                           Sol=[A1,A2,A3,A4,A5],
                           count(false,Sol,N),
		((A1-> N=1 ) ; (\+ A1 -> \+ N=1)),
		((A2-> N=2 ) ; (\+ A2 -> \+ N=2)),
		((A3-> N=3 ) ; (\+ A3 -> \+ N=3)),
		((A4-> N=4 ) ; (\+ A4 -> \+ N=4)),
		((A5-> N=5 ) ; (\+ A5 -> \+ N=5)).

/* counts how many times an element (A) occurs in a list (first level)
?- count(b,[a,b,c,b],N).
N=2
*/
count(_A,[],0).
count(A,[A|T],N):- count(A,T,N1),N is N1+1,!.
count(A,[_|T],N):- count(A,T,N).




/* File: Puzzles/secretNumber.pro Author: Mihaela Malita
Title:  Problem 60. Secrete Number I. Giant book of Mensa Mind Challenges
Sort of MASTERMIND.
You have to guess a SECRET = 5 digit integer (0-9) no repeats.
You know that the SECRET has in common with the following numbers (R (Right) 
means one digit in common different place, B(Bingo) means one digit in common in the same place)
8951 - RR
2169 - RB
3694 - RB
4721 - RB
1237 - RRR
?- start(I).
[3,7,1,9]
*************************************************/
start(S):-  S=[X,Y,Z,W],   %% to check S=[3,7,1,9],
			mem(S,[1,2,3,4,5,6,7,8,9]),is_set(S),
			intersection([8,9,5,1],S,L1),length(L1,2), % 2 elements in common
			intersection([2,1,6,9],S,L2),length(L2,2),samePlace(S,[2,1,6,9],[_]), 
			% 2 elements in common and 1 same position
			intersection([3,6,9,4],S,L3),length(L3,2),samePlace(S,[3,6,9,4],[_]),
			intersection([4,7,2,1],S,L4),length(L4,2),samePlace(S,[4,7,2,1],[_]),
			intersection([1,2,3,7],S,L5),length(L5,3), % 3 elements in common
            write(S).
			
/* Find elements the same in the same position
?- samePlace([a,b],[b,a],R).
R=[]
?- samePlace([a,b],[a,a],R).
false.
-----------------------------------------------------*/
samePlace([],[],[]).
samePlace([H|T1],[H|T2],[H|R]):- samePlace(T1,T2,R).
samePlace([_|T1],[_|T2],R):- samePlace(T1,T2,R).                         

mem([],L).
mem([H|T],L):-member(H,L),mem(T,L).
/* 	File: Puzzles/phone.pro	Author: Mihaela Malita
Title: Transforms phone numbers written with digits in words.
*/
/* a -97  e-101  i- 105 o-111 u-117 y-121  ?- two_vowels(soap).
	vowel(V):-member(V,[97,101,105,111,117,121]).
	two_vowels(Word):-name(Word,Lw),append(_,[V1,V2|_],Lw),vowel(V1),vowel(V2).
*/
	key(1,[1]).
	key(2,[a,b,c]).
	key(3,[d,e,f]).
	key(4,[g,h,i]).
	key(5,[j,k,l]).
	key(6,[m,n,o]).
	key(7,[p,r,s]).
	key(8,[t,u,v]).
	key(9,[w,x,y]).
	key(0,[0]).

	phone([],[]).
	phone([N|T],[X|R]):-key(N,Letters),member(X,Letters),phone(T,R).
/* same as
possible(D,Let):-key(D,L),member(Let,L).
?- possible(2,F).
F = a ;
F = b ;
F = c.
?- maplist(possible,[1,2,3],R).
R = [1, a, d] ; R = [1, a, e] ; R = [1, a, f] ; R = [1, b, d] ;
R = [1, b, e] ; R = [1, b, f] ; R = [1, c, d] ; R = [1, c, e] ;
R = [1, c, f].
phone2(P,R):- findall(S,maplist(possible,[1,2,3],S),R).
***************************************************************/
/*
start:-write('your phone as a list(ex:[4,3,6,6]? '),read(Phone),
         (phone(Phone,L),write(L),nl,false).	
*/
	vowel(a).	vowel(e).	vowel(i).	vowel(o).	vowel(u).	vowel(y).	

/* has_vowels([m,a,r,y]),2).  */
	has_vowels([],0).
	has_vowels([H|T],N):- vowel(H),has_vowels(T,K),N is K+1,!.
	has_vowels([_|T],N):- has_vowels(T,N). 

	start:-write('Your phone as a list (ex:[4,3,6,6]='),read(Phone),
        	 (phone(Phone,L),(has_vowels(L,2),write(L),nl ; true),false).	

/*	Discussion. How many possiblities there are?
	Improve program using name/2.
*/
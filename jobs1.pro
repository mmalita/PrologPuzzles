/* File: Puzzles/jos1.pro   Author: (Sol MM)	
   Title: Finding the profession
Smith, Baker, Carpenter and Tailor have each a profession
(smith, baker, carpenter, tailor) but not showed by their names.
Each of them has a son.
But the sons also do not have the profession showed by their name.
If you know that:
1) no son has the same profession as his father has
and
2) Baker has the same profession as Carpenter's son has
and
3) Smith's son is a baker.
find the professions of the parents and sons.
*/
professions([smith,baker,carpenter,tailor]). % list of professions
/* S = Smith's profession 	   			B = Baker's profession 
   C = Carpenter's profession	   		T = Tailor's profession
   Son_S = Smith son's profession 		Son_B = Baker son's profession 
   Son_C = Carpenter son's profession	Son_T = Tailor son's profession
*/
sol([S,B,C,T],[Son_S,Son_B,Son_C,Son_T]):-
	professions(L),
	member(S,L),S\=smith,
	member(B,L),B\=baker,
	member(C,L),C\=carpenter,
	member(T,L),T\=tailor,
	is_set([S,B,C,T]),
/* The sons do not have the same profession as their name shows */
	member(Son_S,L),Son_S\=smith,	
	member(Son_B,L),Son_B\=baker,
	member(Son_C,L),Son_C\=carpenter,
	member(Son_T,L),Son_T\=tailor,
	is_set([Son_S,Son_B,Son_C,Son_T]),
/* The sons do not have the same profession as their fathers either */
	S \= Son_S,
	B \= Son_B,
	C \= Son_C,
	T \= Son_T,
    B=Son_C, 		% Baker has the same profession as Carpenter's son. 
   	Son_S=baker. 	% Smith's son is a baker
/* File: Puzzles/costume.pro  Solution MMalita
From: Dell- Math Puzzles Logic Problems,	Jan 2002 p.15
Title: The costume ball 
1	Four couples in all
	Attended a costume ball.
2	The lady dressed as a cat
	Arrived with her husband Matt.
3	Two couples were already there,
	One man dressed like a bear.
4	First to arrive wasn't Vince,
	But he got there before the Prince.
5	The witch (not Sue) is married to Chuck,
	Who was dressed as Donald Duck.
6	Mary came in after Lou, 
	Both were there before Sue.
7	The Gipsy arrived before Ann,
	Neither is wed to Batman.
8	If Snow White arrived after Tess,
	Then how was each couple dressed?
?- sol(I),write(I),fail.
I= [[lou,bear,tess,gipsy],[vince,batman,mary,snow_white],[matt,prince,sue,cat],
    [chuck,donald_duck,ann,witch]] %%(There is only one solution.)
				          second     third        last
[[Man,Costume_man,Woman,Costume_woman],[_,_,_,_],[_,_,_,_],[_,_,_,_]]
**********************************************************/
boy([vince,chuck,lou,matt]). 		
girl([sue,mary,ann,tess]).
costume_boy([batman,donald_duck,prince,bear]).
costume_girl([witch,gipsy,cat,snow_white]).

start(Sol):-  boy(B),girl(W),costume_boy(Cb),costume_girl(Cw),
	   Sol=[[M1,Cb1,W1,Cw1],[M2,Cb2,W2,Cw2],[M3,Cb3,W3,Cw3],[M4,Cb4,W4,Cw4]], % 1
	   member([matt,_,_,cat],Sol), 					% 2
       Sol=[X1,X2,[matt,_,_,cat],_],				% 3 
	   (member(bear,X1) ; member(bear,X2)),			% 3
       before([vince,_,_,_],[_,prince,_,_],Sol),    % 4
	   member([chuck,donald_duck,X,witch],Sol), 	% 5
	   before([lou,_,_,_],[_,_,mary,_],Sol),		% 6
       before([_,_,mary,_],[_,_,sue,_],Sol),		% 6
	   before([_,G1,_,gipsy],[_,A1,ann,_],Sol),		% 7
	   before([_,_,tess,_],[_,_,_,snow_white],Sol), % 8
	   permutation([M1,M2,M3,M4],B),
	   permutation([Cb1,Cb2,Cb3,Cb4],Cb),
	   permutation([W1,W2,W3,W4],W),
	   permutation([Cw1,Cw2,Cw3,Cw4],Cw),
  	   vince \== M1,					% 4  
	   X\== sue,     					% 5                  
	   G1 \== batman, A1 \== batman. 	% 7

before(X,Y,L):- append(_,[X|R],L),member(Y,R).
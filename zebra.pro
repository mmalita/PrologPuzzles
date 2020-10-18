/* File: Puzzles/zebra.pro
   Title: Finding the zebra
There are  15 facts and 2 questions:
Who has a zebra and who drinks water?
1) There are 5 colored houses in a row, each having an owner, which has an animal,
a favorite cigarette, a favorite drink.
 2) The English lives in the red house. 
 3) The Spanish has a dog. 
 4) They drink coffee in the green house. 
 5) The Ukrainian drinks tea. 
 6) The green house is to the right of the white house. 
 7) The Winston smoker has a serpent. 
 8) In the yellow house they smoke Kool. 
 9) In the middle house they drink milk.
 10) The Norwegian lives in the first house from the left. 
 11) The Chesterfield smoker lives near the man with the fox. 
 12) In the house near the house with the horse they smoke Kool. 
 13) The Lucky Strike smoker drinks juice. 
 14) The Japanese smokes Kent. 
 15) The Norwegian lives near the blue house. 
Uses: SWI: member/2,length/2
We represent the houses as a list with 5 lists from left to right:
Sol = [[Man, Animal, Cigarette, Drink, Color], [..],[..],[..],[..] ]

?- start(S),write_list(S),fail.
[norwegian,fox,kool,water,yellow]
[ukrainian,horse,chesterfield,tea,blue]
[english,snake,winston,milk,red]
[japonese,zebra,kent,coffee,green]
[spanish,dog,lucky,juice,white]
no
*/
near(X,Y,L):-nextto(X,Y,L) ; nextto(Y,X,L).

start:- length(Sol,5),				% 1
	member([english,_,_,_,red],Sol), 		% 2
	member([spanish,dog,_,_,_],Sol),  		% 3
	member([_,_,_,coffee,green],Sol),		% 4
	member([ukrainian,_,_,tea,_],Sol),		% 5 
	nextto([_,_,_,_,white],[_,_,_,_,green], Sol), % 6
	member([_,snake,winston,_,_],Sol), 		% 7
	member([_,_,kool,_,yellow],Sol),		% 8
	Sol= [_,_,[_,_,_,milk,_],_,_],			% 9	
    Sol= [[norwegian,_,_,_,_],_,_,_,_],   	% 10
	near([_,_,chesterfield,_,_],[_,fox,_,_,_],Sol), % 11
	near([_,_,kool,_,_],[_,horse,_,_,_], Sol),	% 12
	member([_,_,lucky,juice,_],Sol),			% 13
	member([japonese,_,kent,_,_],Sol),			% 14
	near([norwegian,_,_,_,_],[_,_,_,_,blue],Sol), 	% 15
	member([_,_,_,water,_],Sol),  	% someone drinks water
	member([_,zebra,_,_,_],Sol),	% someone has a zebra
	write(Sol).  			

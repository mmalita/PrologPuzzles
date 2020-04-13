/* File: Puzzles/soccer.pro 
88. giant book of Mensa Mind challenges 2003 isbn 1-4027-1049-6
Five soccer teams United, County, Rovers Albion and Thistle took part in a league tournament. 
Their colors were white,yellow,green and red blue. No teams were tied in the standings at the 
end. From the following information determine for each team its captain, colors, 
and position in which it finished in the league.
1. Rovers did not win the league, but finished higher than the 4th
2. Neither Albion nor the team in green finished in the top three.
3. Evans captained the team in yellow.
4. Cooke's team finished a head of County which was captained by Dixon.
5. Allen's team finished second and Boyle's team finished last
6. the team in white finished lower than both united and the team in blue but above Evan's team.
7. Albion was not the green team and United was not the blue team.
solution Team=[team,captain,color]
S=[[united,cooke,red],[rovers,allen,blue],[county,dixon,white],[albion,evans,yellow],[thistle,boyle,green]]
************************************************************************************/                                   
start:- S=[T1,T2,T3,T4,T5],
           T1=[H1,N1,C1], T2=[H2,allen,C2], T3=[H3,N3,C3], T4=[H4,N4,C4], T5=[H5,boyle,C5],
           Colors=[yellow,red,blue,white,green],
		   Teams=[united,albion,rovers,thistle,county],
		   permutation([C1,C2,C3,C4,C5],Colors),
		   permutation([H1,H2,H3,H4,H5],Teams),
		    H1 \== rovers, before([rovers,_,_],T4,S),  %1
		    member([_,evans,yellow],S), 		%2
			([albion,_,_]=T4 ; [albion,_,_]=T5 ),
			([_,_,green]=T4 ; [_,_,green]=T5 ), %2
			member([albion,_,Ca],S),Ca \== green, 
		    member([united,_,Cu],S),Cu \== blue, %7
			before([_,cooke,_],[county,dixon,_],S),
		    before([united,_,_],[_,_,white],S), %6
		    before([_,_,blue],[_,_,white],S),   %6
		    before([_,_,white],[_,evans,_],S),  %6
			forall(member(T,S),(write(T),nl)). %6

before(X,Y,L):-append(_,[X|T],L),member(Y,T).		   
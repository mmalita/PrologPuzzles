/*   File: Puzzle/jazz.pro     (solution MM)
    Title: Sounds Logical?   From: Dell- Math Puzzles Logic Problems,	Jan 2002 p.15
" Giant Book of Challenging Thinking Puzzles",
Michael A. DiSPezio,Sterling Pub. House, ISBN  1-4027-1090-9, 2003 
Saturdays and Sundays are the days that Sheila, Ramon and Niko shop together for music. The CD's they purchase are either rock or jazz. When they visit the music store, each person will purchase one and only one CD. Here are the rules that givern their selections: 
	1. Either Sheila or Ramon will pick rock, but not both of them.
	2. If Sheila picks rock, Niko picks jazz.
	3. Niko and Ramon do not both pick jazz.
	Which one of the three purchased a jazz CD on Saturday and a Rock CD on Sunday.

S1= sheila buys on Saturday  S2= sheila buys on Sunday
R1= ramon buys on Saturday  R2= ramon buys on Sunday
N1= niko buys on Saturday  N2= niko buys on Sunday
Solution = [S1,R1,N1,S2,R2,N2]
?- start.
     SATURDAY           SUNDAY       
Sheila Ramon Niko Sheila Ramon Niko
jazz  rock  jazz  jazz  rock  jazz  
****************************************************/
start:- find(Sol), mywrite(Sol),nl.
mywrite(L) :- write('   SATURDAY           SUNDAY       '),nl,
	      write('Sheila Ramon Niko Sheila Ramon Niko'),nl,
              forall(member(X,L),(write(X),write('  '))).
/*
find(Sol):- Sol =  [S1,R1,N1,S2,R2,N2],
        member(S1,[jazz,rock]),
        member(S2,[jazz,rock]),
        member(N1,[jazz,rock]),
        member(N2,[jazz,rock]),
        member(R1,[jazz,rock]),
        member(R2,[jazz,rock]),
        is_set([S1,R1]), %% 2. If Sheila picks rock, Niko picks jazz.
        is_set([S2,R2]), %% that is different
	not([N1,R1]=[jazz,jazz]), %% 3. Niko and Ramon do not both pick jazz.
	not([N2,R2]=[jazz,jazz]),
        (S1=jazz ; (S1=rock,N1=jazz) ) , %% if sheila picks jazz does not matter
        (S2=jazz ; (S2=rock,N2=jazz)).   %% %% is sheila picks rock, Nick has jazz
*/
/* Fill an empty list with elements from another list
?- mem([X,Y,Z],[a,b]).
X = a Y = a Z = a ;
X = a Y = a Z = b ;
X = a Y = b Z = a ;
X = a Y = b Z = b ;
X = b Y = a Z = a ;
X = b Y = a Z = b ;
X = b Y = b Z = a ;
X = b Y = b Z = b ;
**************************************/ 
mem([],Y).
mem([H|T],Y):-member(H,Y),mem(T,Y).

find(Sol):- Sol =  [S1,R1,N1,S2,R2,N2],
        mem(Sol,[jazz,rock]),
        is_set([S1,R1]), %% 2. If Sheila picks rock, Niko picks jazz.
        is_set([S2,R2]), %% that is different
		not([N1,R1]=[jazz,jazz]), %% 3. Niko and Ramon do not both pick jazz
		not([N2,R2]=[jazz,jazz]),
        (S1=jazz ; (S1=rock,N1=jazz) ) , %% is sheila picks jazz does not matter
        (S2=jazz ; (S2=rock,N2=jazz)).   %% %% is sheila picks rock, Nick has jazz


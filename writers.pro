/* File: Puzzles/writers.pro  Author: solution Mihaela Malita
Title: What do they write? From: Adrian Atanasiu: www.be-logic.ro
Six writers travel in a train in the same wagon, we shall call them 
Black, Yellow, Blue, Green, Red and White.
One is  essayist, one is historian, one write pamphlets, one is novelist, 
one is play writer and poet.
Each of them wrote a book that is read by some other person in the wagon.
 1. Mr. Black reads essays.
 2. Mr. Blue does not like to sit in the corner in the direction of the train.
 3. Mr. Yellow sits between the essay guy and pamphlet guy.
 4. Mr. Red sits near the play writer.
 5. The essayist  sits in front of the historian.
 6. Mr. Green reads theater.
 7. Mr. Yellow is the brother in law of the novelist.
 8. Mr. Black is staying in a corner and does not like history.
 9. Mr. Green sits in front of the novelist.
10. Mr. Red reads a book of pamphlets.
11. Mr. White never reads poems.
What kind of writer is  each person?
[[X1,W1,R1] = [Last_name, Writes, Reads]
1 2 3
4 5 6
Uses SWI:  nextto/3,  
nth1(?Index, ?List, ?Elem) Succeeds  when  the  Index-th element  of  List unifies  with  Elem. Counting starts at 1.
********************************************************/
rez([[green,pamphlets,_],[black,novels,_],[white,poems,_],[yellow,theater,_],[blue,history,_],[red,essays,_]]).

corner(I):- member(I,[1,3,4,6]).
vis_a_vis(I,J):-  3 is abs(I-J).  %% I is J+3 ; J is I+3.
near(X,Y,L):- nextto(X,Y,L) ; nextto(Y,X,L).

start(S):- S=[[X1,W1,R1],[X2,W2,R2],[X3,W3,R3],[X4,W4,R4],[X5,W5,R5],[X6,W6,R6]],
        Type=[novels,poems,theater,pamphlets,history,essays],
    member([black,_,essays],S),    %% 1. Mr. Black reads essays.
	member([green,_,theater],S), 	%% 6. Mr. Green reads theater.
	member([red,_,pamphlets],S), 	%% 10. Mr. Red reads a book of pamphlets.
	%% 3. Mr. Yellow sits between the essay guy and pamphlet guy.
       	( S=[[_,essays,_],[yellow,_,_],[_,pamphlets,_],_,_,_] ;
	  S=[_,_,_,[_,essays,_],[yellow,_,_],[_,pamphlets,_]] ),
 	near([red,_,_],[_,theater,_],S), 	%% 4. Mr. Red sits near the playwriter.
	%% 9. Mr. Green sits in front of the novelist.
        nth1(Ng,S,[green,_,_]),nth1(Nn,S,[_,novels,_]),vis_a_vis(Nn,Ng),
        permutation([X1,X2,X3,X4,X5,X6],[black,blue,green,red,yellow,white]),
        permutation([W1,W2,W3,W4,W5,W6],Type),
        permutation([R1,R2,R3,R4,R5,R6],Type),
        W1\==R1,W2\==R2,W3\==R3,W4\==R4,W5\==R5,W6\==R6,
        %% 7. Mr. Yellow is the brother in law of the novelist.
	not(member([yellow,novels,_],S)),
      	%% 2. Mr. Blue does not like to sit in the corner in the direction of the train.
        nth1(Nbb,S,[blue,_,_]), Nbb\==6,     
        %% 8. Mr. Black is staying in a corner and does not like history.
	nth1(Nb,S,[black,_,_]),corner(Nb), 
	not(member([black,history,_],S)),
   	%% 5. The essayist  sits in front of the historian.	
	nth1(Ne,S,[_,essays,_]), nth1(Nh,S,[_,history,_]),
        vis_a_vis(Ne,Nh),  
        %% 11. Mr. Red reads a book of pamphlets.
	not(member([white,_,poems],S)).
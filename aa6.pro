/* File: Puzzles/aa6.pro Author: (sol MM)
Title: Thursday Party From: Adrian Atanasiu http://www.be-logic.ro
Four ladies meet each week on Thursday to play bridge.
On each meeting they decide what everyone has to bring for the next meeting.
1. Mrs. Andrew will  bring chocolate cake.
2. Neither Mrs. Brown, nor Vivien, nor Ann Clark will bring cookies.
3. Rachel, which is not from Davidson's family, will bring coffee.
4. Mary will not bring the wine.
Find the whole name of each lady and what is she supposed to bring next week?
Final = [[ LastName, FirstName, Bring]...]
Solutions found with the program: ?- start(I).
I = [[clark,ann,wine],[davidson,mary,cookie],
[brown,rachel,cofee],[andrew,vivien,chocolate]] ;
****************************************************************/
start(Final):- Final=[[_,_,wine],[_,_,cookie],[_,_,cofee],[_,_,_]],
			member([andrew,_,chocolate],Final),
			member([brown,_,Bb],Final), Bb \== cookie,
			member([_,vivien,Bv],Final),Bv \== cookie,
            member([clark,ann,Ba],Final), Ba \== cookie,
            member([_,mary,Bm],Final), Bm \== wine,
            member([davidson,_,_],Final), 
            member([X,rachel,cofee],Final), X \== davidson.
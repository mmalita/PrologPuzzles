/* File: Puzzles/arch.pro
Arch Friends  from http://brownbuffalo.sourceforge.net  Author: Mark T. Zegarelli
Publication: Dell Logic Puzzles, Issue: April, 1998, Page: 7 Stars: 1
Harriet, upon returning from the mall, is happily describing her four shoe purchases to her friend Aurora. 
Aurora just loves the four different kinds of shoes that Harriet bought (ecru espadrilles, fuchsia flats, purple pumps, and suede sandals), but Harriet can't recall at which different store 
(Foot Farm, Heels in a Handcart, The Shoe Palace, or Tootsies) she got each pair. 
Can you help these two figure out the order in which Harriet bought each pair of shoes, and where she bought each? 
1. Harriet bought fuchsia flats at Heels in a Handcart.
2. The store she visited just after buying her purple pumps was not Tootsies.
3. The Foot Farm was Harriet's second stop.
4. Two stops after leaving The Shoe Place, Harriet bought her suede sandals.
Determine: Order - Shoes - Store 
?-start(X).
S=[[pumps,shoePlace],[espadrilles,footFarm],[sandals,tooties],[flats,heelsHandcart]].
Solution by % © Copyright Doug Edmunds 2000
First, purple pumps, The Shoe Place 
Second, ecru espadrilles, Foot Farm 
Third, suede sandals, Tooties 
Fourth, fuchsia flats, Heels in a Handcart 
*******************************************************/                                   
start(S):- S=[[H1,T1],[H2,T2],[H3,T3],[H4,T4]],
	   Shoes=[pumps,espadrilles,sandals,flats],
	   Stores=[shoePlace,footFarm,tooties,heelsHandcart],
	   permutation([H1,H2,H3,H4],Shoes), 
	   permutation([T1,T2,T3,T4],Stores),
	   member([flats,heelsHandcart],S),		%% 1. Harriet bought fuchsia flats at Heels in a Handcart.
	   nth1(2,S,[_,footFarm]),				%% 3. The Foot Farm was Harriet's second stop.
	   nth1(N1,S,[pumps,_]),				%% 2. The store she visited just after buying her purple pumps was not Tootsies.
	   nth1(N2,S,[_,tooties]), not(N2 is N1+1),
	   nth1(N3,S,[_,shoePlace]),  %% 4. Two stops after leaving The Shoe Place, Harriet bought her suede sandals
 	   nth1(N4,S,[sandals,_]), N4 is N3 + 2.
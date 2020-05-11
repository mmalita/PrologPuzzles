/*  File: Puzzles/buffalo.pro 
Title: Babysitting Author: Scott Marley	http://brownbuffalo.sourceforge.net
Publication: Dell Logic Puzzles April, 1998	Page: 7 Stars: 1
Each weekday, Bonnie takes care of five of the neighbors' children. The children's names are Keith, Libby, Margo, Nora, and Otto; last names are Fell, Gant, Hall, Ivey, and Jule. Each is a different number of years old, from two to six. Can you find each child's full name and age? 
1. One child is named Libby Jule.
2. Keith is one year older than the Ivey child, 
   who is one year older than Nora.
3. The Fell child is three years older than Margo.
4. Otto is twice as many years old as the Hall child.
USES SWI:member/2, permutation/2
?- start(S),write_list(S),fail.
[keith,fell,5]
[libby,jule,6]
[margo,hall,2]
[nora,grant,3]
[otto,ivey,4] 
*********************************************/
start(Sol):- F=[keith,libby,margo,nora,otto],
             L= [fell,grant,hall,ivey,jule],
	     Sol=[[F1,L1,A1],[F2,L2,A2],[F3,L3,A3],[F4,L4,A4],[F5,L5,A5]],
         F=[F1,F2,F3,F4,F5],    % if order is not important!
	     member([libby,jule,_],Sol),	% 1
	     permutation([L1,L2,L3,L4,L5],L), % write correspondence
   	     permutation([A1,A2,A3,A4,A5],[2,3,4,5,6]),
member([keith,_,AgeK],Sol),member([_,ivey,AgeI],Sol),AgeK is AgeI+1,% 2
	     member([nora,_,AgeN],Sol),AgeI is AgeN+1,
	     member([margo,_,AgeM],Sol),
	     member([_,fell,AgeF],Sol),AgeF is 3+AgeM, %3
	     member([otto,_,AgeO],Sol),member([_,hall,AgeH],Sol),AgeO is AgeH*2. %4

write_list(L):-forall(member(X,L),(write(X),nl)).

/* There are two types of restrictions:
a) positive ones- when you fill the Solution
b) negative ones where you need the space to be instantiated already:
not X doesn't have sense unless you know from where to take X
! always put a) before b)
*/
/* File: Puzzles/lunch2.pro   Author: solution MMalita
   Title: Insider Trading  From:  Dell- Math Puzzles Logic Problems, Jan 2002, p 36.
Kids are notorious for trading their lunches away, and the kids at 
PT Elementary are no exception. Mrs. Day, the lunch lady recently watched four 
big-time traders at work, swapping everything their parents had packed. 
She had trouble keeping it all straight, but shrugged when she realized 
that May and her friends each finished with a sandwich, piece of fruit, 
and a dessert (one was a brownie).
Can you untangle the " insider trading" and determine what each child 
ate and who brought it to school?
1. Each child swapped with each friend exactly once, 
   always trading like items
2. The child who ate the apple also gobbled up the chocolate cupcake.
3. Jay traded his fruit for Ray's orange.
4. One child bought a bologna sandwich and a banana to school.
5. The child who ate the turkey sandwich also ate the grapes.
6. The child who ate the ham cheese sandwich traded away the cookie 
	Mom had packed.
7. Ray enjoyed Faye's peanut butter sandwich.
8. The child who ate Joy's sandwich also ate the candy bar.
| ?- start(S).
[may,bologna,turkey,banana,grapes,cupcake,candy_bar]
[jay,turkey,bologna,apple,orange,brownie,cookie]
[ray,ham_cheese,peanut,orange,apple,candy_bar,cupcake]
[faye,peanut,ham_cheese,grapes,banana,cookie,brownie]
*/
/* 	1) capture the constants and classify them
	2) Variable space: B= Brought 	E = Eaten
sol([[Child,Sandwich_B,Sandwich_E,Fruit_B,Fruit_E,Dessert_B,Dessert_E],
     [Child,Sandwich_B,Sandwich_E,Fruit_B,Fruit_E,Dessert_B,Dessert_E],
     [Child,Sandwich_B,Sandwich_E,Fruit_B,Fruit_E,Dessert_B,Dessert_E],
     [Child,Sandwich_B,Sandwich_E,Fruit_B,Fruit_E,Dessert_B,Dessert_E],
     [Child,Sandwich_B,Sandwich_E,Fruit_B,Fruit_E,Dessert_B,Dessert_E]]).
Order is not important in this example. that is why we write
Child= [C1,C2,C3,C4], otherwise we get all combinations.
*/
  
start(Sol):- Dessert=[candy_bar,cupcake,cookie,brownie],
			 Fruit=[grapes,orange,apple,banana],
			 Sand=[turkey,peanut,ham_cheese,bologna],
			 Child=[may,jay,ray,faye],Child=[C1,C2,C3,C4],
             Sol=[[C1,Sb1,Se1,Fb1,Fe1,Db1,De1],[C2,Sb2,Se2,Fb2,Fe2,Db2,De2],[C3,Sb3,Se3,Fb3,Fe3,Db3,De3],
 		  [C4,Sb4,Se4,Fb4,Fe4,Db4,De4]],
%3. Jay traded his fruit for Ray's orange. 
	member([jay,Sbjay,_,Fbjay,orange,_,_],Sol),
%8. The child who ate Jay's sandwich also ate the candy bar. 	 
	member([_,_,Sbjay,_,_,_,candy_bar],Sol),
%5. The child who ate the turkey sandwich also ate the grapes. 	
	member([_,_,turkey,_,grapes,_,_],Sol),
%7. Ray enjoyed Faye's peanut butter sandwich. 	
	member([ray,Sbfaye,peanut,orange,Fbjay,_,_],Sol),
	member([faye,peanut,Sbfaye,_,_,_,_],Sol),
%2. The child who ate the apple also gobbled up the chocolate cupcake
	member([_,_,_,_,apple,_,cupcake],Sol),
%4. One child bought a bologna sandwich and a banana to school
	member([_,bologna,_,banana,_,_,_],Sol),
%6. The child who ate the ham cheese sandwich traded away the cookie
	member([_,_,ham_cheese,_,_,cookie,_],Sol),	
%1. Each child swapped with each friend exactly once, always trading like items
	permutation([Sb1,Sb2,Sb3,Sb4],Sand),
	permutation([Se1,Se2,Se3,Se4],Sand),
    permutation([Fb1,Fb2,Fb3,Fb4],Fruit),
	permutation([Fe1,Fe2,Fe3,Fe4],Fruit),
    permutation([Db1,Db2,Db3,Db4],Dessert),
	permutation([De1,De2,De3,De4],Dessert),
    list_comb(2,Sol,Pairs),all_prop(intersection_2,Pairs).

/* %1. Each child swapped with each friend exactly once,always trading like items
All the pairs have intersection_2 means 2 items in common
Take all the pairs (only once) and see if they have exactly 
2 elements in common:
*/
intersection_2([X,Y]):-intersection(X,Y,R),length(R,2).
/* mem1(Lr,L). For comb/3. Same as mem/2 but does not generate [a,b] and [b,a]. 	
	?- mem1([X,Y],[a,b,c]).
	[a,b][a,c][b,c]
*/
mem1([],_Y).
mem1([H|T],Y):-member(H,Y),rest(H,Y,New),mem1(T,New).

rest(A,L,R):-Y=[A|R],append(_X,Y,L),!.
/* comb(N,L,Res). Combinations. Arrangements without " order".	
	| ?- comb(2,[a,b,c],I).
	I = [a,b] ;	I = [a,c] ;	I = [b,c] ;
*/
comb(N,L,X):-length(X,N),mem1(X,L).
/* list_comb(N,L,Res).	
	?-  list_comb(2,[a,b,c,d],L).
	L = [[a,b],[a,c],[a,d],[b,c],[b,d],[c,d]]
*/
list_comb(N,L,Res):- findall(X,comb(N,L,X),Res).
/* all_prop(P,L). All elements from a list (first level) have property Prop. 
EX: check if all are integers in a list 
?- P=integer,L=[1,2,3],forall(member(X,L),(F=..[P,X],call(F))).
P = integer,L = [1, 2, 3].
*/
all_prop(P,L):-forall(member(X,L),(F=..[P,X],call(F))).

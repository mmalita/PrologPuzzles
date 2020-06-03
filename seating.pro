/* File: Puzzles/seating.pro
   Title: Now seating
Suppose 2 boys and 3 girls go to the theater and they all sit on the same row. 
The row has only 5 seats.
1. Generate all different ways they can sit in such a way that the boys 
are at the end of the row. Count them.
2. Generate all different ways they can sit in such a way that girls 
are at the end of the row. Count them.
3. Generate all different ways they can sit in such a way that boys sit 
between the girls.
?- findall(S,start1(S),L),length(L,N),write(N).
L = [[b1, g1, g2, g3, b2], [b1, g2, g1, g3, b2], ...]
N = 12 
?- findall(S,start2(S),L),length(L,N),write(N).
L = [[g1, g3, b1, b2, g2], [g1, g3, b2, b1, g2], [g1, b1, g3, b2, g2], ...]
N = 24 
****************************************************************/
start1(Sol):- Sol=[X,_Y,_Z,_U,V],permutation([X,V],[b1,b2]),
              permutation(Sol,[b1,b2,g1,g2,g3]).
          
start2(Sol):- Sol=[X,_Y,_Z,_U,V],member(X,[g1,g2,g3]),
				member(V,[g1,g2,g3]),permutation(Sol,[b1,b2,g1,g2,g3]).

start3(Sol):- Sol=[X,Y,Z,U,V],permutation([X,Z,V],[g1,g2,g3]),
				permutation([Y,U],[b1,b2]).
 
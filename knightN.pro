/* File: Puzzles/knightN.pro
   Title:  Knight from corner to corner on a 3x3 board  Luger: page 650.
Can the chess piece called horse/knight move from corner 
up-left(1,1) to corner right-down (N,N) on chessboard NxN.
The knight makes L-shaped moves 
over two in one direction and then over one in a perpendicular direction 
	--------------------
	1 1  |	1,2   |	1,3
	--------------------
	2,1   |	2,2   |	2,3
	--------------------
	3,1   |	3,2   |	3,3

General solution for Board N x N. Generate the board.
?- start.
Number of squares in the chess board? 3.
[ (1, 1), (2, 3), (3, 1), (1, 2), (3, 3)]
[ (1, 1), (3, 2), (1, 3), (2, 1), (3, 3)]
*****************************************************/	
:- dynamic(final/1).
initial((1,1)).  /* knight starts from square (1,1) */

move((L1,C1),(L2,C2),N):- member((Dx,Dy),[(1,2),(2,1),(1,-2),(-2,-1),(-2,1),(-1,-2),(-1,2),(2,-1)]),
        	L2 is L1 + Dx,between(1,N,L2),
        	C2 is C1 + Dy,between(1,N,C2).

path(_N,Node,Path,Path):- final(Node).
path(N,Node,Path,Sol):- move(Node,Node1,N),\+member(Node1,Path),
                       	path(N,Node1,[Node1|Path],Sol).

%% be careful: retract(final/1). %before your start once more
start:-	write('Size of your board? '),read(N),
        assert(final((N,N))),  %% the lower-right corner
	    initial(Start),path(N,Start,[Start],Res),
        reverse(Res,Sol),write(Sol),nl,false.		


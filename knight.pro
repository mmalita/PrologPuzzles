/* File: Puzzles/knight.pro
Title:  Knight’s Tour 3x3 board        Luger: page 650.
Can the chess piece called horse/knight move around an empty 
chessboard and touch each of the 3 x 3 squares once and only once? 
The knight makes L-shaped moves (over two in one direction and 
then over one in a perpendicular 	direction). 
Write a program to find out and display the path. 
The knight starts from the up-left corner.
		----------------- 
		1   |	2   |	3
		-----------------
		4   |	5   |	6
		-----------------
		7   |	8   |	9
----------------------------------------------------------*/
move(1,6).	move(1,8). move(2,9).	move(2,7).	
move(3,4).	move(3,8). move(4,9).	move(4,3).
move(6,7).	move(6,1). move(7,6).	move(7,2).
move(8,1).	move(8,3). move(9,2).	move(9,4).
/*
Solution 1. If there is a path says yes.
	?- path(1,9).
	true.
	?- path(1,5).
	ERROR: Out of local stack
path(Z,Z).
path(X,Y):- move(X,W),path(W,Y).
----------------------------------------------------------*/
/* Solution 2. 	Keep track of visited nodes using a predicate 
called: visited(?Node)
	?- path(1,9).
	Yes
	?- path(1,5).
	No
:- dynamic visited/1.
path(Z,Z).
path(X,Y):- move(X,W),\+visited(W),assert(visited(W)),path(W,Y).

start:- retractall(visited(_)),path(1,9).
----------------------------------------------------------*/
/*Solution 3. Build the path in a list L
?- path(1,9,[1]).
true
?- path(1,5,[1]).
false
path(Z,Z,L).
path(X,Y,L):- move(X,W),\+member(W,L),path(W,Y,[W|L]).
----------------------------------------------------------*/
/*Solution 4.  Build and display the path in a list L
?- path(1,5,[1],L).
false
?- path(1,9,[1],L).
L = [9, 7, 6, 1] ;
L = [9, 2, 7, 6, 1] ;
L = [9, 4, 3, 8, 1] ;
L = [9, 2, 7, 6, 1] ;
L = [9, 4, 3, 8, 1] ;

path(Z,Z,L,L).
path(X,Y,L,R):- move(X,W),\+member(W,L),path(W,Y,[W|L],R).
---------------------------------------------------------*/
/*Graph (nodes and arcs): path in a graph
We interpret the move(Node1,Node2) as arc in a graph with Nodes 1-9.
Our problem is to find a path between to given Nodes S, 
F: initial(S) and final(F)
All the possible paths (from 1 to 9):
	?-start,false.
	[9,2,7,6,1]
	[9,4,3,8,1]
----------------------------------------------------------*/
%% Finding a path in graph used for finding a path from 1 to 9
initial(1).		%% 1 is initial node
final(9).			%% 9 is final node
%% Starting Node is Start, Sol is a list of Nodes 
%% beginning with Start ending with the final Node.
start:- initial(Start),path(Start,[],Sol),
        reverse(Sol,Res),write(Res).

path(Node,Path,[Node|Path]):- final(Node).
path(Node,Path,Sol):- move(Node,N1),\+member(N1,Path),
		      	path(N1,[Node|Path],Sol).

/* 	File: Puzzles/lashlight.pro 	Author: MM
   	Title: Four Men Crossing a Bridge (from Microsoft interview process)
There are four men who would all like to cross a rickety old bridge. 
The old bridge will only support 2 men at a time, and it is night time, so every 
crossing must use the one flashlight that they all share. 
The four men each have different walking speeds; the fastest each of them can 
cross is 1 minute, 2 minutes, 5 minutes, and 10 minutes. If they pair up, since 
they must share the flashlight, they can only cross in the time that it would take 
the slower of the two. Given that the shortest time to get them all across is 
17 minutes total, how should they all cross?
We describe the problem as Nodes in a graph and the solution means to find a path from
the initial node to the final node.
state = node is graph
state = [Time,Flash_place,a(l),b(l),c(l),d(l)] 
Bank can be left (l) or right (r).  Thus Flash_place is l or r.
| ?- start,false.
Found sol=[17,r,a(r),b(r),c(r),d(r)]
[15,l,a(l),b(l),c(r),d(r)]
[14,r,a(r),b(l),c(r),d(r)]
[4,l,a(r),b(l),c(l),d(l)]
[2,r,a(r),b(r),c(l),d(l)]
[0,l,a(l),b(l),c(l),d(l)]
Found sol=[17,r,a(r),b(r),c(r),d(r)]
[15,l,a(l),b(l),c(r),d(r)]
[13,r,a(l),b(r),c(r),d(r)]
[3,l,a(l),b(r),c(l),d(l)]
[2,r,a(r),b(r),c(l),d(l)]
[0,l,a(l),b(l),c(l),d(l)]
*/
start:- initial(S),path(S,[],Sol),write('Found sol='),forall(member(X,Sol),(write(X),nl)).

path(N,P,[N|P]):- final(N).
path(N,P,Sol):- arc(N,N1),\+member(N1,P),path(N1,[N|P],Sol).

initial([0,l,a(l),b(l),c(l),d(l)]). %% start l=left r=right
final([17,r,a(r),b(r),c(r),d(r)]). %% in the end all on the same side

opp(l,r).  opp(r,l). %%opposite
/* time for crossing the bridge - time is a system predicate */
tim(a,1).	tim(b,2).	tim(c,5).	tim(d,10).

/* define the arcs (or move conditions from a state node) to another state(node) */
arc([T1,X,a(A1),b(B1),c(C1),d(D1)], [T2,Y,a(A2),b(B2),c(C2),d(D2)]):- opp(X,Y),
        ((X=C1,A2=A1,B2=B1,D2=D1,C2=Y,tim(c,Tc), T2 is T1+Tc); /* c moves alone */
	(X=B1,D2=D1,A2=A1,C2=C1,B2=Y,tim(b,Tb), T2 is T1+Tb);  /* b moves alone */
	(X=A1,D2=D1,B2=B1,C2=C1,A2=Y,tim(a,Ta), T2 is T1+Ta); /* a moves alone */ 
	(X=D1,B2=B1,C2=C1,A2=A1,D2=Y,tim(d,Td), T2 is T1+Td); 	/* d moves alone */
	(X=C1,X=D1,A1=A2,B1=B2,C2=Y,D2=Y,tim(c,Tc),tim(d,Td), M is max(Tc,Td),T2 is T1+M); 
	(X=B1,X=D1,A1=A2,C1=C2,B2=Y,D2=Y,tim(b,Tb),tim(d,Td), M is max(Tb,Td),T2 is T1+M); 
	(X=A1,X=D1,B1=B2,C1=C2,A2=Y,D2=Y,tim(a,Ta),tim(d,Td), M is max(Ta,Td),T2 is T1+M); 
	(X=B1,X=C1,A2=A1,D2=D1,B2=Y,C2=Y,tim(b,Tb),tim(c,Tc), M is max(Tb,Tc),T2 is T1+M); 
	(X=A1,X=C1,B1=B2,D1=D2,A2=Y,C2=Y,tim(a,Ta),tim(c,Tc), M is max(Ta,Tc),T2 is T1+M); 
	(X=A1,X=B1,C1=C2,D1=D2,A2=Y,B2=Y,tim(a,Ta),tim(b,Tb), M is max(Ta,Tb),T2 is T1+M)), T2 < 18.
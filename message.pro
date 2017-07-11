/* 	File:   Puzzles/message.pro	Author: M. Malita
        Title:  Message sending
Email is out of order at St. Mary's College and the teacher wants 
to tell Robert something urgent.
The teacher meets Craig and asks him to tell Robert she wants to speak with him. 
Craig says that if he meets Robert its OK, but else he will send the message to everyone he meets and the message will go further.
Each student tells each student he meets that the teacher waits for Robert in her office.
The students meet each other (we don't know in what order):
1) Craig meets John and Jason
2) Jason meets Kiki and Adam and David
3) Adam meets Scott and Jeremy
4) Jeremy meets John and Scott
5) Kiki meets Chris
6) Chris meets David and Adam
7) David meets Robert
Do you think the teacher will wait for ever in her office until Robert comes?
Display all the possible paths from Craig to Robert.
Ex:-  ?- start,nl,false.
[ro,da,ch,ki,ja,ad,je,jo,cr]
[ro,da,ja,ad,je,jo,cr]
[ro,da,ja,ki,ch,ad,je,jo,cr]
[ro,da,ch,ad,je,jo,cr]
[ro,da,ch,ki,ja,ad,sc,je,jo,cr]
[ro,da,ja,ad,sc,je,jo,cr]
[ro,da,ja,ki,ch,ad,sc,je,jo,cr]
[ro,da,ch,ad,sc,je,jo,cr]
[ro,da,ch,ki,ja,cr]
[ro,da,ch,ad,ja,cr]
[ro,da,ja,cr]
*/
arc(cr,jo).	arc(cr,ja).	
arc(ja,ki).	arc(ja,ad).	arc(ja,da).
arc(ad,sc).	arc(ad,je).
arc(je,jo).	arc(je,sc).
arc(ki,ch). 	
arc(ch,da).	arc(ch,ad).
arc(da,ro).
arc1(Y,X):- arc(X,Y);arc(Y,X).

initial(cr). final(ro).
start:- initial(S),bkt(S,[],Sol),write(Sol).

bkt(Node,Path,[Node|Path]):- final(Node).
bkt(Node,Path,Sol):- arc1(Node,N1), not(member(N1,Path)),
                     bkt(N1,[Node|Path],Sol).

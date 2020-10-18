/* File: Puzzles/gradepuzzle.pl Author: sol M.Malita
From: http://cis2000.bizland.com/puzzles07.htm
Five friends in the sixth form took the same combination of A - level subjects.
Each obtained a different grade in each subject taken, and no two students had the same grade 
in the same subject. From the information given below, can you work out the full details 
of each student's results?
- Andrew outscored Bridget in Physics, and Neil in Math. 
- Wendy was the only girl to get a "C" grade, but she managed no "A" grades.. 
- The pupil with an "E" in Math gained a "B" in Chemistry, but was not awarded a "C" in Physics. 
- Paul's Physics grade was a "D" and his highest grade was a "C". 
- The "B" in Math did not go to the same student as the "E" in Physics. 
- Bridget's best result was in Chemistry, but her Math grade was lower than Paul's 
What are the obtained grade for each subject by each student?
-------------------------------------------------------------
Solution.
Andrew had A in Math, C in Chemistry and B in Physics.
Bridget had D in Math, A in Chemistry and E in Physics.
Neil had E in Math, B in Chemistry and A in Physics.
Paul had C in Math, E in Chemistry and D in Physics.
Wendy had B in Math, D in Chemistry and C in Physics.
Solution in Prolog.
| ?- start(I).
[[andrew,a,c,b],[bridget,d,a,e],[neil,e,b,a],[paul,c,e,d],[wendy,b,d,c]]
****************************************************************/
/* S= [[Name,Math,Chemistry,Physics],[Name,Math,Chemistry,Physics],..] */
grades([a,b,c,d,e]).
start(S):-
    S=[[andrew,Am,Ac,Ap],[bridget,Bm,Bc,Bp],[neil,Nm,Nc,Np],[paul,Pm,Pc,Pp],[wendy,Wm,Wc,Wp]],
    Pp=d, % Paul's Physics grade was a "D" 
% no two students had the same grade in the same subject
	permutation([Ac,Nc,Pc,Bc,Wc],[a,b,c,d,e]),
	permutation([Am,Nm,Pm,Bm,Wm],[a,b,c,d,e]),
	permutation([Ap,Np,Pp,Bp,Wp],[a,b,c,d,e]),	
% Each obtained a different grade in each subject taken
	is_set([Am,Ac,Ap]),is_set([Nm,Nc,Np]),
	is_set([Pm,Pc,Pp]),is_set([Bm,Bc,Bp]),
	is_set([Wm,Wc,Wp]),
    first([Pm,Pc,Pp],c), %  and his(Paul) highest grade was a "C"
% Andrew outscored Bridget in Physics, and Neil in Math
	first([Ap,Bp],Ap),first([Am,Nm],Am),
% Wendy was the only girl to get a "C" grade, but she managed no "A" grades 
	\+member(c,[Bm,Bc,Bp]), 	% Brigdet (was the other girl) and she has no C
	\+member(a,[Wm,Wc,Wp]), 	% Wendy has no A
    first([Bm,Bc,Bp],Bc), 		% Bridget's best result was in Chemistry
	first([Pm,Bm],Pm), 			% but her Math grade was lower than Paul's 
% The "B" in Math did not go to the same student as the "E" in Physics 
	member([_,b,_,Y],S),Y\==e,
	member([_,e,b,Gradep],S),	% The pupil with an "E" in Math gained a "B" in Chemistry, 
    Gradep\==c. % but was not awarded a "C" in Physics
/* first/2 finds the best grade
?-first([b,c,d,a],R).
R=a
*/
first(L,F):- sort(L,R),R=[F|_].
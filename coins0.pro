/* File: Puzzles/coins0.pro Author: Mihaela Malita
Give us sum and transform it in coins. US coins are: 
1 Quater = 25 cents
1 Dime   = 10 cents
1 Niquel = 5 cents
1 Penny  = 1 cent
   	
?-   start.
Transform in coins. What sum? 86.
S=86   Q=3   D=1   N=0   P=1   
Continue(y/n)? y.
Transform in coins. What sum? 99.
S=99   Q=3   D=2   N=0   P=4   
Continue(y/n)? n.
***************************************************/
coins(S):- possible([S,Q,D,N,P]),
           write('Sum='),write(S),tab(3),	
           write('Q='),write(Q),tab(3),
           write('D='),write(D),tab(3),
           write('N='),write(N),tab(3),
           write('P='),write(P),tab(3).

possible([S,Q,D,N,P]):-  
		between(0,4,P),
		between(0,19,N),
		between(0,9,D),
		between(0,4,Q),
        S is Q * 25 + D * 10 + N * 5 + P.

start:- write('Transform in coins. What sum?'),read(S),coins(S),yes_or_no.

yes_or_no:-write('Continue(y/n)? '),read(X),(X=n; X=no; X=nu; X=q ).


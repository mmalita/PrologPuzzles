/* File: Puzzles/anagram.pro
   Title: Generates all anagrams of given a word
?-start.
Write your name? ale.
here are the anagrams:
ale     lae     lea     ael     eal     ela 

Uses SWI predicates: permutation/2, name/2
?- atom_codes(mel,I).
I = [109, 101, 108] 
?- atom_codes('Turing',L).
L = [84, 117, 114, 105, 110, 103] 
?- atom_codes(X,[100,101,102]).
X = def 
*************************************************************/	
start:-write('Write your name? '),read(X),
		write('\nhere are the anagrams:\n'),
		atom_codes(X,L),permutation(L,R),atom_codes(Word,R),
		write(Word),tab(5),false.
		
		
		
		
	
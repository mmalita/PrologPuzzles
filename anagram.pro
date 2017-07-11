/* File: Puzzles/anagram.pro
   Title: Generates all anagrams of given a word
?-start.
Write your name? ale.
here are the anagrams:
ale     lae     lea     ael     eal     ela 

Uses SWI predicates: permutation/2, name/2
?- name(mel,I).
I = [109, 101, 108] 
?- name('Turing',L).
L = [84, 117, 114, 105, 110, 103] 
?- name(X,[100,101,102]).
X = def 
*************************************************************/	
start:-write('Write your name? '),read(X),
		write('\nhere are the anagrams:\n'),
		name(X,L),permutation(L,R),name(Word,R),
		write(Word),tab(5).
		
		
		
		
	
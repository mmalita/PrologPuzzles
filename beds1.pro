/* File: Puzzles/beds1.pro	Author: sol MMalita
Title: Bunk beds From:  http://eduplace.com/math/brain/65-294.html
All 6 girls in the junior cabin at camp sleep in bunk beds. 
Each girl has a different color blanket on her bed. 
The beds are lined up in a row with red, black, yellow, brown, blue and green blankets.
1. Reeva and Haley is closest to the door.
2. The color of the blankets on the bottom bunks all begin with the same letter
3. The color of Beth's blanket doesn't begin with the same letter as the beginning of her name
4. The blue blanket is under the red blanket.
5. Liza and Kayla like their lower bunks.
6. Kayla is in the middle bed.
7. Zoe doesn't share a bunk with Kayla.
8. The brown blanket is at the end of a row.
9. The yellow is above the black blanket.
Sol= [[Name,Color],[Name,Color],...]
They are in the following order bottom, up, bottom, up 
from left to right
?- start(I).
I = [[reeva,black],[haley,yellow],[kayla,blue],[beth,red],[liza,brown],[zoe,green]] ;
I = [[reeva,blue],[haley,red],[kayla,black],[beth,yellow],[liza,brown],[zoe,green]] ;
I = [[haley,black],[reeva,yellow],[kayla,blue],[beth,red],[liza,brown],[zoe,green]] ;
I = [[haley,blue],[reeva,red],[kayla,black],[beth,yellow],[liza,brown],[zoe,green]] ;
*************************************************************/
start(Sol):- Sol=[[N1,C1],[N2,C2],[kayla,C3],[N4,C4],[N5,C5],[N6,C6]],((N1=reeva,N2=haley);(N2=reeva,N1=haley)),  /* 1.*/
           member(C1,[black,blue,brown]), /* 2 */
		member(C3,[black,blue,brown]),
		member(C5,[black,blue,brown]),
           member([blue,red],[[C1,C2],[C3,C4],[C5,C6]]), /* 4 */
                member(liza,[N1,N5]),	 /* 5 */
                member(zoe,[N1,N2,N4,N5,N6]),
                brown=C5, 			/* 8 */
                member([black,yellow],[[C1,C2],[C3,C4],[C5,C6]]), /* 9 */
                member(green,[C1,C2,C3,C4,C5,C6]),
                member([beth,C],Sol),member(C,[red,yellow,green]),   /* 3 */
		N4\=zoe. /* 7 */		
               

                
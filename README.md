# Wall Mirror Plotting

Repo containing code and pictures relating to plotting mirrors on my wall.

### Story:
* I moved into a new apartment with lots of wall space
* I wanted to put an array of mirrors on my wall
* I didn't know what design/arrangement I should use to put the mirrors on the wall
* I wrote this R script to plot where to put the mirrors on the wall
* I put the mirrors on the wall
* Now I have mirrors on my wall

### Picture of lots of wall space:
![alt tag](https://github.com/jeremypmobley/mirrors/blob/master/output/blankwall.jpg)

### Mirrors:
![alt tag](https://ll-us-i5.wal.co/asr/4f69bfd3-59b1-4ea6-8053-a9650799c6ab_1.484d1a595025c169e727dad4bc7208c5.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF)

### Plot of mirrors:
![alt tag](https://github.com/jeremypmobley/mirrors/blob/master/output/mirrors_plotted.png)

### Picture of mirrors on wall:
![alt tag](https://github.com/jeremypmobley/mirrors/blob/master/output/wallmirrors.jpg)

### How the code works:

Pseudo-code

```
for each mirror:
	(x,y) <- coordinates of mirror center
	while overlap with other mirrors is TRUE:
		(x,y) <- coordinates of mirror center
	centers <- (x,y)
```

Key things to place mirrors: 
 * No overlap
 * No out-of-bounds

A buffer was built into the logic of choosing the initial mirror center coordinates. So instead of choosing a random number between 0 and 60 for the height a number was chosen between (0 + circle radius + buffer) and (60 - circle radius - buffer).

After each new circle's center coordinates are chosen the circle is checked to make sure it does not overlap with any of the previous circles.  A buffer was built so that not only did no mirrors overlap but that there was a minimum space gap between the edges of the mirrors. So the distance between the centers of the mirrors must exceed the sum of the radius of each of the circles plus the minimum space gap buffer.

If these conditions were not met, new center coordinates are chosen.


### Next Steps:
- Finish this README doc
	- Add better description of story

Mirrors - https://www.walmart.com/ip/Mainstays-5-Piece-Mirror-Set-Black/21001984


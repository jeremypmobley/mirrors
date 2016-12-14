# Wall Mirror Plotting

Repo containing code and pictures relating to plotting mirrors on my wall.

### Story:
* I moved into a new apartment with lots of wall space
* I wanted to put an array of mirrors on my wall
* I didn't know what design/arrangement I should use to put the mirrors on the wall
* I wrote this R script to plot where to put the mirrors on the wall
* I put the mirrors on the wall
* Now I have mirrors on my wall

### Plot of Mirrors:
![alt tag](https://github.com/jeremypmobley/mirrors/blob/master/output/mirrors_plotted.png)

### Picture of Mirrors:
![alt tag](https://github.com/jeremypmobley/mirrors/blob/master/output/wallmirrors.jpg)

### How it works:

Pseudo-code

```
for each mirror:
	(x,y) <- coordinates of mirror center
	while overlap with other mirrors TRUE:
		(x,y) <- coordinates of mirror center
	centers <- (x,y)
```

### Next Steps:
- Finish this README doc
	- Add picture of blank wall
	- Add better description of story



# Author: Jeremy Mobley
# Program to randomize the location of the mirrors on my wall

# Heavily based on code found at the following:
#https://www.r-bloggers.com/plotting-non-overlapping-circles/
#https://www.r-bloggers.com/circle-packing-with-r/



# list of circles to draw
mirrors2sets <- sort(c(7,7,9,9, 7,7,9,9,11), decreasing = TRUE)

# function to draw circle
draw.circle <- function(x, y, r, col) { 
  lines( cos(seq(0, 2*pi, pi/180)) * r + x, sin(seq(0, 2*pi, pi/180)) * r + y, col=col)
}

# function to calculate distance
calc_distance <- function(x1, y1, x2, y2){sqrt((x2 - x1)^2 + (y2 - y1)^2)}

# function to check overlap between new point and existing circle
check_overlap <- function(xcord1, ycord1, radius1, xcord2, ycord2, radius2, min_separation){
  distance <- calc_distance(xcord1, ycord1, xcord2, ycord2)
  min_distance <- radius1 + radius2
  return(sum(distance<(min_distance + min_separation)))
}


set.seed(123)
wall_height <- 60
wall_width <- 120
min_separation <- 12
min_boundary <- 2
placement_tries <- 0
num_mirrors_to_draw <- length(mirrors2sets)
mat <- data.frame(matrix(ncol=3, nrow=num_mirrors_to_draw))
for (i in 1:num_mirrors_to_draw) {
  circle_rad <- mirrors2sets[i]/2
  x <- runif(1, circle_rad + min_boundary, wall_width - circle_rad - min_boundary)
  y <- runif(1, circle_rad + min_boundary, wall_height - circle_rad - min_boundary)
  if (i > 1){
    # check if new mirror overlaps with previously placed mirrors
    prev_mirror <- (1:(i-1))
    while(check_overlap(x, y, circle_rad, mat$X2[prev_mirror], mat$X3[prev_mirror], 
                        mat$X1[prev_mirror], min_separation) > 0){
      x <- runif(1, circle_rad + min_boundary, wall_width - circle_rad - min_boundary)
      y <- runif(1, circle_rad + min_boundary + 6, wall_height - circle_rad - min_boundary)
      placement_tries <- placement_tries + 1
      }
    }
  # add mirror to matrix of placed mirrors
  mat[i,] <- c(circle_rad,x,y)
}
print(paste0("number of overlap attempts to place mirror: ", placement_tries))


# plot circles
plot(0, type="n", xlim=c(0,wall_width), ylim=c(0,wall_height), ylab="", xlab="", xaxt='n', yaxt='n')
for(i in 1:nrow(mat)){
  draw.circle(mat$X2[i], mat$X3[i], mat$X1[i], col=rgb(0,0,0))
}


# save out mirror center placements as csv
setwd("~/GitHub/mirrors")




# calculate new particle position
PtclMove <- function(step, size) {
  # move particle in x and y direction
  step$x <- step$x + (step$dir.x * step$speed)
  step$y <- step$y + (step$dir.y * step$speed)
  # check for wall collision and redirect
  if(abs(step$x) >= size){
    step$dir.x <- step$dir.x * (-1)
    step$x <- size + sign(step$dir.x) * (step$x - size)
  }
  if(abs(step$y) >= size){
    step$dir.y <- step$dir.y * (-1)
    step$y <- size + sign(step$dir.y) * (step$y - size)
  }
  return(step)
}

# outer boundary box size
box.size <- 1000

# number of simulation steps
steps <- 50

# create data.frame with initial particle position and direction/speed
ptcl <- data.frame(x = 0, y = 300, dir.x = 0.71, dir.y = 0.71, speed = 100)

# plot initial particle distribution
png(file = "pic00000.png")
plot(ptcl$x, ptcl$y, 
     type = "p", 
     xlim = c(-box_size, box_size), 
     ylim = c(-box_size, box_size),
     xlab = "",
     ylab = "")
dev.off()

# move particle to new position and plot to numbered file
for (i in 1:steps) {
  png(file = sprintf("pic%05d.png", i))
  ptcl <- PtclMove(ptcl, box.size)
  plot(ptcl$x, ptcl$y, 
       type = "p", 
       xlim = c(-box_size, box_size), 
       ylim = c(-box_size, box_size),
       xlab = "",
       ylab = "")
  dev.off()
}



### use imagemagic script to generate an animation of the outputet plots.

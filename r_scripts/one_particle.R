# calculate new particle position
MovePtcl <- function(step, size) {
  # move particle in x and y direction
  step$x <- step$x + (step$dir_x * step$speed)
  step$y <- step$y + (step$dir_y * step$speed)
  # check for wall collision and redirect
  if(abs(step$x) >= size){
    step$dir_x <- step$dir_x * (-1)
    step$x <- size + sign(step$dir_x) * (step$x - size)
  }
  if(abs(step$y) >= size){
    step$dir_y <- step$dir_y * (-1)
    step$y <- size + sign(step$dir_y) * (step$y - size)
  }
  return(step)
}

# outer boundary box
box_size <- 1000
steps <- 50

ptcl <- data.frame(x = 0, y = 300, dir_x = 0.71, dir_y = 0.71, speed = 100)
ptcl <- MovePtcl(ptcl, box_size)


### use imagemagic script to generate an animation of the outputet plots.

graphics.off()
rm(list=ls())
   
x <- seq(from=1, to=20, by=0.1)
y <- sin(x)
plot(x, y, type="l")
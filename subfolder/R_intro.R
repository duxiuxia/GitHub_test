# Introduction to R

# Written by Xiuxia Du in January, 2015.



graphics.off()
rm(list=ls())


setwd("/Users/xdu4/Google Drive/Ocean_2/Teaching/Statistics/2015_Spring/R")

# #######################################
# vectors and indexing
# #######################################
weight <- c(60, 72, 57, 90, 95, 72)
weight[1]
weight[2:4]
weight[6] <- 199



# #######################################
# vectorized arithmetic
# #######################################
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight / height^2


# #######################################
# matrix and indexing
# #######################################
x <- matrix(1:6, nrow=2)
x <- matrix(1:6, nrow=2, byrow=T)
x[2,] # get the entire second row
x[,2] # get the entire second column
x[2,3] # get a particular element



# #######################################
# list
# #######################################
n <- c(2,3,5)
s <- c("aa", "bb", "cc", "dd", "ee")
b <- c(T, F, T, F, F)
x <- list(n, s, b, 3)

# list slicing
x[2]
x[c(2,4)]

# member reference
x[[2]]
x[[2]][1] <- "ta"
x[[2]]
s

# named list members
v <- list(bob=c(2,3,5), john=c("aa", "bb"))
# list slicing
v["bob"] # retrieve a list slice with the single square bracket [] operator
v[c("john", "bob")]
# member reference
v[["bob"]] # use the double square bracket [[]] to reference a list member directly
# a named list member can also be referenced directly with the "$" operator 
# in lieu of hte double square bracket
v$bob 






# #######################################
# functions
# #######################################
source("myFunctions.R")

library("multtest")
data(golub)
i <- 30
x <- golub[i,]
re <- mySummary(x)
re$mean
re$IQR



mySum <- function(x,y) {
  z <- x+y
  return(z)
} 
x <- 2
y <- 3
z <- mySum(x, y)








# #######################################
# control structures
# #######################################
x <- 4
if (x==3) {
  print("x is correct")
}else {
  print("x is wrong")
}
  







# #######################################
# data frame
# #######################################
n = c(2, 3, 5) 
s = c("aa", "bb", "cc")
b = c(TRUE, FALSE, TRUE)
df = data.frame(n, s, b) 
mtcars[1,2] # data retrieval
mtcars["Mazda RX4", "cyl"]
nrow(mtcars)    # number of data rows
ncol(mtcars)    # number of columns
help(mtcars)
head(mtcars) # preview the data frame
mtcars[[9]] # reference a data frame column with the [[]] operator
mtcars[["am"]] # reference the same column by its name
mtcars$am # retrieve with the $ operator in lieu of the [[]] operator
mtcars[,"am"]
mtcars[1] # column slicing using numeric indexing
mtcars["mpg"] # column slicing using name indexing
mtcars[c("mpg", "hp")]
mtcars[24,] # row slicing using numeric indexing
mtcars[c(3, 24),] 
mtcars["Camaro Z28",] # row slicing using name indexing
mtcars[c("Datsun 710", "Camaro Z28"),]






# #######################################
# data import
# #######################################
mydata = read.csv("mydata.csv")



# #######################################
# permuation and combination
# #######################################
perm(n=5, k=2, replace=F)








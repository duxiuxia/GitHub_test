# This is a collection of functions for doing basic statistics.

# Written by Xiuxia Du in January 2015.

# Repository on GitHub





# mySummary is a function to calculate the key features of a data vector
mySummary <- function(x){
  myMean <- mean(x)
  myMedian <- median(x)
  myVar <- var(x)
  mySd <- sd(x)
  myIQR <- IQR(x)
  
  result <- list(mean=myMean, median=myMedian, var=myVar, sd=mySd, IQR=myIQR)
  return(result)
}






# permutation and combination
# This function perm() calculates the number of permutations to pick k out of n DISTINCT objects.
perm <- function(n, k, replace) {
  if (replace==T) {
    return(n^k)
  } else {
    return(factorial(n) / factorial(n-k))
  }
  
}

comb <- function(n, k){
  return(factorial(n) / (factorial(n-k) * factorial(k)))
}








# binomial distribution and plotting
myBinomial <- function(n, p) {
  x <- 0:n
  y <- choose(n, x) * p^x * (1-p)^(n-x)
  return(y)
}
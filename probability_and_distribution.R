# Started by Xiuxia Du in January 2015.
# Added contents in February 2015.


rm(list=ls())
graphics.off()

setwd("/Users/xdu4/Google Drive/Ocean_2/Teaching/Statistics/2015_Spring/R")
source("myFunctions.R")


# #######################################
# permutation
# #######################################
S1 <- perm(n=10, k=5, replace=F)
S2 <- perm(n=10, k=5, replace=T)




# #######################################
# discreate density
# #######################################
out_path <- "/Users/xdu4/Google Drive/Ocean_2/Teaching/Statistics/2015_Spring/Lectures/Figure/RV"
out_file_name <- "geometric_density.pdf"
out_file_full_name <- paste(out_path, out_file_name, sep=.Platform$file.sep)
pdf(out_file_full_name)
density <- numeric(10)
x <- 1:10
for (i in x) {
  density[i] <- 0.5^i
}
plot(x, density, type="h")
dev.off()




# #######################################
# bionomial distribution
# #######################################
n <- 100
x <- 0:n
p <- 0.5
binomPDF <- dbinom(x, size=n, prob=p)
pdf("/Users/xdu4/Downloads/bionomial.pdf")
plot(x, binomPDF, type="h", xlab="k", ylab="probability")
legend("topright", c(paste("n=", n), paste("p=", p)))
dev.off()




# example in lecture notes 
p <- 0.25
n <- 3
k <- 1
re <- dbinom(x=k, size=n, prob=p)
1-dbinom(x=0, size=n, prob=p)



p <- 0.75
n <- 3
k <- 1
re <- dbinom(x=k, size=n, prob=p)
1-dbinom(x=0, size=n, prob=p)






# produce CDF and quantile plots
n <- 10
p <- 0.3
x <- 0:n
re_d <- dbinom(x=x, size=n, prob=p)
re_p <- pbinom(q = x, size=n, prob=p)
quantile_interval <- c(0.1, 0.3, 0.5, 0.7, 0.9)
quantile <- qbinom(p=quantile_interval, size=n, prob=p)
pdf("/Users/xdu4/Downloads/bionomial.pdf")
par(mfrow=c(1,3))
plot(x, re_d, type="h", main="PDF", xlab="k", ylab="", xlim=c(-1, n+1), ylim=c(0, 1.1))
legend("topright", c(paste("n=", n), paste("p=", p)))
plot(x, re_p, type="s", main="CDF", xlab="k", ylab="", xlim=c(-1, n+1), ylim=c(0, 1.1))
legend("topright", c(paste("n=", n), paste("p=", p)))
plot(quantile, quantile_interval, type="h", main="quantile", xlab="k", ylab="", xlim=c(-1, n+1), ylim=c(0, 1.1))
legend("topright", c(paste("n=", n), paste("p=", p)))
dev.off()




# produce random numbers following a binomial distribution
number_of_points <- 10000
n <- 100
p <- 0.1
re_d <- dbinom(x=0:n, size=n, prob=p)
re_r <- rbinom(n=number_of_points, size=n, prob=p)

pdf("/Users/xdu4/Downloads/bionomial.pdf")
par(mfrow=c(1,2))
plot(0:n, re_d, type="h", xlim=c(-1, n), ylim=c(0, 0.2), xlab="k", ylab="", main="PDF")
hist(re, xlim=c(-1, n), ylim=c(0, 0.2), freq=F, xlab="k", ylab="", main="histogram")
dev.off()






# produce a binomial PDF plot
n <- 3
p <- 0.5
re <- myBinomial(n, p)
pdf("/Users/xdu4/Downloads/bionomial.pdf")
plot(0:n, re, type="h", col="red", main="bionomial PDF", xlab="k", ylab="probability")
legend("topright", c(paste("n=", n), paste("p=", p)))
dev.off()







# ##################################################
# purine example in lecture notes
# ##################################################
x <- 2
re_density <- dbinom(x, size=n, prob=p) # the probability of having 2 purines

# the probability of having less than or equal to 2 purines
x <- 2
re_dist <- pbinom(q = x, size=n, prob=p) # 

# the probability of having [3, 7]
lower <- 3
upper <- 7
pbinom(q=upper, size=n, prob=p) - pbinom(lower-1, size=n, prob=p)
re_prob <- pbinom()


# the probability of having >= 10 purines
x <- 15
re <- 1 - pbinom(q=x-1, size=n, prob=p)


x <- c(0, .5, .75, 1)
re <- qbinom(p = x, size=n, prob=p)

N <- 1000
rbinom(N, size=n, prob=p)
hist(rbinom(N, size=n, prob=p))



# #######################################
# quantile
# #######################################
x <- 1:100
re <- quantile(x, prob=c(0, 0.25, 0.5, 0.75, 1))

quantile(x <- rnorm(1001)) # Extremes & Quartiles by default








# #######################################
# normal distribution
# #######################################
# PDF
mu <- 0
sigma_square <- 0.2
x <- seq(from=-5, to=5, by=0.1)
re_d <- dnorm(x, mean=mu, sd=sqrt(sigma_square))
plot(x, re_d, type="l", col="blue")

mu <- 0
sigma_square <- 1
re_d <- dnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_d, type="l", col="red")

mu <- 0
sigma_square <- 5
re_d <- dnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_d, type="l", col="orange")


mu <- -2
sigma_square <- 0.5
re_d <- dnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_d, type="l", col="green")


# CDF
mu <- 0
sigma_square <- 0.2
x <- seq(from=-5, to=5, by=0.1)
re_p <- pnorm(x, mean=mu, sd=sqrt(sigma_square))
plot(x, re_p, type="l", col="blue")

mu <- 0
sigma_square <- 1
re_p <- pnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_p, type="l", col="red")

mu <- 0
sigma_square <- 5
re_p <- pnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_p, type="l", col="orange")


mu <- -2
sigma_square <- 0.5
re_p <- pnorm(x, mean=mu, sd=sqrt(sigma_square))
points(x, re_p, type="l", col="green")


# 3-sigma rule
mu <- 0
sigma <- 1
pnorm(sigma, mean=mu, sd=1) - pnorm(-sigma, mean=mu, sd=1)
pnorm(2*sigma, mean=mu, sd=1) - pnorm(-2*sigma, mean=mu, sd=1)
pnorm(3*sigma, mean=mu, sd=1) - pnorm(-3*sigma, mean=mu, sd=1)



# cholesterol example
mu <- 219
sigma <- 50
lower <- mu - 5*sigma
upper <- mu + 5*sigma
x <- seq(from=lower, to=upper, by=0.1)
re_d <- dnorm(x, mean=mu, sd=sigma)
plot(x, re_d, type="l", col="black")

pnorm(200, mean=mu, sd=sigma)





# standard normal distribution
mu1 <- 0
sigma1 <- 0.3
x <- seq(from=-5, to=5, by=0.01)
re_d <- dnorm(x, mean=mu1, sd=sigma1)
pdf("/Users/xdu4/Downloads/normal.pdf")
plot(x, re_d, type="l", col="blue", lwd=2, xlab="x", ylab="f(x)", main="standardization")

mu2 <- 0
sigma2 <- 1
re_d <- dnorm(x, mean=mu2, sd=sigma2)
points(x, re_d, type="l", col="red", lwd=3)
legend("topright", c(paste("mu=", mu1, ", sigma=", sigma1, sep=""), paste("mu=", mu2, ", sigma=", sigma2, sep="")), col=c("blue", "red"), lty=c(1,1), lwd=c(2,3))
dev.off()




mu1 <- -3
sigma1 <- 2.2
x <- seq(from=-10, to=5, by=0.01)
re_d <- dnorm(x, mean=mu1, sd=sigma1)
pdf("/Users/xdu4/Downloads/normal.pdf")
plot(x, re_d, type="l", col="blue", lwd=2, xlab="x", ylab="f(x)", main="standardization", xlim=c(-10, 4), ylim=c(0, 0.5))

mu2 <- 0
sigma2 <- 1
re_d <- dnorm(x, mean=mu2, sd=sigma2)
points(x, re_d, type="l", col="red", lwd=3)
legend("topright", c(paste("mu=", mu1, ", sigma=", sigma1, sep=""), paste("mu=", mu2, ", sigma=", sigma2, sep="")), col=c("blue", "red"), lty=c(1,1), lwd=c(2,3))
dev.off()





# #######################################
# normal approximation to binomial
# #######################################
# plot the binomial PDF
n <- 60
p <- 0.3
x <- 0:n
pdf("/Users/xdu4/Downloads/binomial.pdf")
re_d <- dbinom(x=x, size=n, prob=p)
plot(x, re_d, type="h", xlab="k", ylab="p(k)")
dev.off()



# plot the binomial PDF and normal PDF together
n <- 60
p <- 0.3
x <- 0:n
pdf("/Users/xdu4/Downloads/binomial.pdf")
re_d <- dbinom(x=x, size=n, prob=p)
plot(x, re_d, type="h", xlab="k", ylab="PDF", main="normal approx. to binomial (PDF)")

mu <- n*p
sigma_squared <- n*p*(1-p)
x <- seq(from=0, to=n, by=0.01)
re_dnorm <- dnorm(x, mean=mu, sd=sqrt(sigma_squared))
points(x, re_dnorm, type="l", col="red", lwd=2)
dev.off()




# plot the binomial CDF and normal CDF together
n <- 60
p <- 0.3
x <- 0:n
pdf("/Users/xdu4/Downloads/binomial.pdf")
re_pbinom <- pbinom(q=x, size=n, prob=p)
plot(x, re_pbinom, type="s", xlab="k", ylab="CDF", lwd=2, main="normal approx. to binomial (CDF)")

mu <- n*p
sigma_squared <- n*p*(1-p)
x <- seq(from=0, to=n, by=0.01)
re_pnorm <- pnorm(q=x, mean=mu, sd=sqrt(sigma_squared))
points(x, re_pnorm, type="l", col="red", lwd=2)
legend(45,0.9, c("binomial", "normal"), col=c("black", "red"), lty=c(1,1), lwd=c(2,2))
dev.off()



# calculate
n <- 60
p <- 0.3
x <- 9
re <- pbinom(q=x, size=n, prob=p)

mu <- n*p
sigma_squared <- n*p*(1-p)
re_appro <- pnorm(q=x, mean=mu, sd=sqrt(sigma_squared))


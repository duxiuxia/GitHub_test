# Descriptive statistics

# Written by Xiuxia Du in January, 2015.


graphics.off()
rm(list=ls())

setwd("/Users/xdu4/Google Drive/Ocean_2/Teaching/Statistics/2015_Spring/R")


source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("multtest")
library(multtest)



################################
# get data
################################
data(golub)
golub.cl 
# numeric vector indicating the tumor class, 
# 27 acute lymphoblastic leukemia (ALL) cases (code 0) 
# and 11 acute myeloid leukemia (AML) cases (code 1).
golub.gnames
# a matrix containing the names of the 3051 genes for 
# the expression matrix golub. The three columns correspond 
# to the gene index, ID, and Name, respectively.
nrow(golub)
ncol(golub)
dim(golub)



################################
# measures of central tendency
################################
# get the mean gene expression level of the first
# gene in all AML patients 
x <- golub[1, golub.cl==1]
y <- mean(x) 
x_appended <- append(x, 100)
y_new <- mean(x_appended)
sort(x)
median(x)



################################
# measures of spread/variation
################################
var(x)
sd(x)
range(x)
min(x)
max(x)


i <- 25
x <- golub[i, golub.cl==1]
quantile(x)
IQR(x)



################################
# data display
################################
# scatter plot
i <- 25
plot(golub[i,])

plot(golub[i,golub.cl==0])

plot(golub[i, golub.cl==1])

plot(golub[i,golub.cl==0], col="green")

pdf("graph.pdf")
plot(1:27, golub[i, golub.cl==0], col="black", main="scatter plot", xlab="index", ylab="gene expression", xlim=c(0,39), ylim=c(-1.4, 1.7))
points(28:38, golub[i, golub.cl==1], col="red")
dev.off()


# histogram
x <- c(rep(0, 100), rep(10, 100))
hist(x)

myBins <- seq(from=0, to=10, by=1)
hist(x, breaks=myBins)

myBins <- seq(from=-0.5, to=10.5, by=1)
hist(x, breaks=myBins)

hist(golub[i,])

pdf("graph.pdf")
myBins <- seq(from=-1.5, to=2, by=0.25)
hist(golub[i,], myBins, main="histogram", xlab="gene expression level", ylab="count")
dev.off()
## Sample R script
## Author: Matthew Lundquist
## Date: 12-20-2017

## Create vector of 10 random numbers between 1 and 1000 with replacement
x <- sample(1:1000, 10, replace = T)

## Create another vector of 10 randowm numbers between 1 and 1000 with replacement
y <- sample(1:1000, 10, replace = T)

## plot the result
plot(x, y)

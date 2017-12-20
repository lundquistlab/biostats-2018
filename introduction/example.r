## Sample R script
## Author: Matthew Lundquist
## Date: 12-20-2017

## Create vector of 10 random numbers between 1 and 1000 with replacement
x <- sample(1:1000, 10, replace = T)

## Create another vector of 10 randowm numbers between 1 and 1000 with replacement
y <- sample(1:1000, 10, replace = T)

## Plot the result
plot(x, y)

## Data input

## Inputting data in R from .txt file

## Read in iris.txt and name it iris (make sure first row is
## recognized as column names
iris <- read.table("iris.txt", h = T)

## Call the data to make sure it is inputted correctly
iris

## Basic analysis

## Mean Sepal.Length
sepal.mean <- mean(iris$Sepal.Length)
sepal.mean

## Standard Deviation Sepal.Length
sepal.sd <- sd(iris$Sepal.Length)
sepal.sd

## Standard Error Sepal.Lenth
sepal.se <- sepal.sd/sqrt(length(iris$Sepal.Length))
sepal.se


## Median Petal.Width
petal.median <- median(iris$Petal.Width)
petal.median

## Mean Petal.Length for just setosa
setosa.petal <- mean(iris$Petal.Length[iris$Species == "setosa"])
setosa.petal


## Summary statistics for all observations and factors
summary(iris)

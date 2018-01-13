## Week 2 .R script
## Author: Matthew Lundquist
## Date: 2018-1-12

## This is my first R program, it prints "Hello World"
print("Hello World")

## Inputting data in R from .csv file
  
## Read in iris.txt and name it iris (make sure first row is
## recognized as column names

iris <- read.csv("iris.csv", h = T)
     
## Call the data to make sure it is inputted correctly

iris

# We can navigate the data using $ in R
names(iris) # This tells us what each of the columns are named, these are X-values

length(iris$Sepal.Length) # How many Sepal.Length observations dow e have? (Notice it is case-sensitive)
iris$Sepal.Length # This will show all of those Sepal.Length observations 

## Short hand for above
length(iris[,1])
iris[,1]

## You can also look at particular observations
iris$Sepal.Length[10]
## or
iris[10,1]

## The 5th column is our grouping variable, we can see how many groups
nlevels(iris$Species)
## And what those levels are
levels(iris$Species)

## If you just want the "setosa" data, you can subset the data
iris_setosa <- subset(iris, iris$Species == "setosa") # Nottice that I used a "<-" to assign a name to my new data

## If you are just interested in Petal.Length of setosa, you can just subset that column
iris$Petal.Length[iris$Species == "setosa"]

## If you want to export your subsetted data, you can do that easily too

write.csv(iris_setosa, "iris_2.csv", row.names = FALSE)

## Calculations
x <- 1
y <- 2

x + y # or
sum(x, y)

## Means

## What is the average Sepal.Length in Iris?
sum(iris$Sepal.Length) / length(iris$Sepal.Length) # or
mean(iris$Sepal.Length) 

## You can use subsetting to caclulat the average Sepal.Length in Iris setosa?
mean(iris$Sepal.Length[iris$species == "setosa"]) # or
mean(iris_setsa$Sepal.Length) # if you already subsetted the data

## Summary stats
summary(iris)

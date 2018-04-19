---
title: Homework 10
author: Matthew Lundquist
---

## Question 9.1

```r

## Data
n <- c(104, 116, 84, 77, 61, 84, 81, 72, 61, 97, 84)
h <- c(108, 118, 89, 71, 66, 83, 88, 76, 68, 96, 81)

## Run a paired t-test because each pair of n and h were measured on the same day

t.test(n, h, paired = TRUE)

## Paired t-test

## data:  n and h
## t = -1.6215, df = 10, p-value = 0.136
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -4.9640939  0.7822757
## sample estimates:
## mean of the differences
##              -2.090909
```

## Question 9.2

This is the same as above but we use `wilcox.test()` instead. If there are ties
between data, R complains that it can't calculate the "exact" p-value. We can
suppress this but simply setting `exact = FALSE` in in the Wilcox Test function.

```r

## Data
n <- c(104, 116, 84, 77, 61, 84, 81, 72, 61, 97, 84)
h <- c(108, 118, 89, 71, 66, 83, 88, 76, 68, 96, 81)

wilcox.test(n, h, paired = TRUE, exact = FALSE)

##	Wilcoxon signed rank test with continuity correction

## data:  n and h
## V = 16, p-value = 0.1416
## alternative hypothesis: true location shift is not equal to 0

```

You can ignore the warning message about exact p-values. Notice that in R the test
statistic is **V**, but in the book it is **T**

## Question 12.2

```r

plants <- read.csv("block.csv", h = T)
plants

## Treatment
## Total
tt1 <- sum(plants$height[plants$variety == "v1"])
tt2 <- sum(plants$height[plants$variety == "v2"])
tt3 <- sum(plants$height[plants$variety == "v3"])
tt4 <- sum(plants$height[plants$variety == "v4"])

## Mean
tm1 <- mean(plants$height[plants$variety == "v1"])
tm2 <- mean(plants$height[plants$variety == "v2"])
tm3 <- mean(plants$height[plants$variety == "v3"])
tm4 <- mean(plants$height[plants$variety == "v4"])

## Block
## Total
bt1 <- sum(plants$height[plants$block == "b1"])
bt2 <- sum(plants$height[plants$block == "b2"])
bt3 <- sum(plants$height[plants$block == "b3"])
bt4 <- sum(plants$height[plants$block == "b4"])
bt5 <- sum(plants$height[plants$block == "b5"])
bt6 <- sum(plants$height[plants$block == "v6"])

## Mean
bm1 <- mean(plants$height[plants$block == "b1"])
bm2 <- mean(plants$height[plants$block == "b2"])
bm3 <- mean(plants$height[plants$block == "b3"])
bm4 <- mean(plants$height[plants$block == "b4"])
bm5 <- mean(plants$height[plants$block == "b5"])
bm6 <- mean(plants$height[plants$block == "b6"])

## Cell means

## Grand Total
gt <- sum(plants$height)

## Grand Mean
gm <- mean(plants$height)

total.SS <- sum((plants$height - gm)^2) # 214.86
total.df <- length(plants$height) - 1 # 23

treatment.SS <- 6 * ((tm1 - gm)^2 + (tm2 - gm)^2 + (tm3 - gm)^2 + (tm4 - gm)^2)
block.SS <- 4 * ((bm1 - gm)^2 + (bm2 - gm)^2 + (bm3 - gm)^2 + (bm4 - gm)^2 + (bm5 - gm)^2 + (bm6 - gm)^2)

error.SS <- total.SS - (treatment.SS + block.SS)

summary(aov(height ~ variety + block, data = plants))

##              Df Sum Sq Mean Sq F value   Pr(>F)
## variety      3 188.54   62.85 144.437 2.74e-11 ***
## block        5  19.79    3.96   9.098 0.000386 ***
## Residuals   15   6.53    0.44
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

```

## Question 12.3 with Iman-Davenport

```r
plants <- read.csv("block.csv", h = T)

friedman.test(plants$height, groups = plants$variety, blocks = plants$block)

## Friedman rank sum test

## data:  plants$height, plants$variety and plants$block
## Friedman chi-squared = 18, df = 3, p-value = 0.0004398

## Check our Friedman chi-sqared:
a <- 4
b <- 6

FX <- 12 / (b * a * (a + 1)) * sum(c(18^2, 24^2, 12^2, 6^2)) - 3 * b * (a + 1)
## 18

```

There is not a good built-in way to run an Iman-Davenport test in R, so we need to run it
manually, however, Google search `imanDavenportTest()` from the `scmamp` package
if you want to use that to get F<sub>F</sub>:

```r
a <- 4
b <- 6
FX <- 18

FF <- ((b - 1) * FX) / (b * (a - 1)) - (FX)


F.crit <- 3.29 ## From table B.4

```
Unfortunately, we can't run an Iman-Davenport test on this data because we end up with
a 0 denominator; 18 is the smallest F possible.

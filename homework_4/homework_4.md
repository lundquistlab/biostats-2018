Homework 4
================

## Chapter 6

Do exercises 6.1, 6.2, 6.3, 6.4, 6.5, 6.6

### 6.1

In this question we are given weights and their frequencies. You need to
remember that for each weight (Xi) there are fi observations. We need to
use the `rep()` function like we did in
[homework 1](https://github.com/mlundquist/biostats-2018/blob/master/homework_1/homework_1.org)
to get all of the observations in a vector.

``` r
weight <- c(4.0, 4.3, 4.5, 4.6, 4.7, 4.8, 4.9, 5.0, 5.1)
fi <- c(2, 3, 5, 8, 6, 5, 4, 3, 1)

Xi <- rep(x = weight, times = fi) 
```

Now we can calculate symmetry (a)

``` r
n <- length(Xi)
message(c("n=", n))
```

    ## n=37

``` r
Xbar <- mean(Xi)
message(c("Xbar=", round(Xbar, 2)))
```

    ## Xbar=4.65

``` r
epsilon3 <- sum((Xi - Xbar)^3)
message(c("epsilon3=", round(epsilon3, 3)))
```

    ## epsilon3=-0.405

``` r
epsilon2 <- sum((Xi - Xbar)^2)
message(c("epsilon2=", round(epsilon2, 3)))
```

    ## epsilon2=2.292

``` r
symmetry <- (sqrt(n) * epsilon3) / sqrt(epsilon2^3)
message(c("symmetry=", round(symmetry, 3)))
```

    ## symmetry=-0.71

As you can see, we our data is negatively skewed.

Let’s calculate kurtosis now (b)

``` r
epsilon4 <- sum((Xi - Xbar)^4)
message(c("epsilon4=", round(epsilon4, 3)))
```

    ## epsilon4=0.511

``` r
kurtosis <- (n * epsilon4) / epsilon2^2
message("kurtosis=", round(kurtosis, 3)) 
```

    ## kurtosis=3.598

Skewness (c)

Here we need to look at the data in numerical
    order

``` r
cat(Xi)
```

    ## 4 4 4.3 4.3 4.3 4.5 4.5 4.5 4.5 4.5 4.6 4.6 4.6 4.6 4.6 4.6 4.6 4.6 4.7 4.7 4.7 4.7 4.7 4.7 4.8 4.8 4.8 4.8 4.8 4.9 4.9 4.9 4.9 5 5 5 5.1

and calculate the Q1, Q3, and the median (Q2).

``` r
X1 <- (n + 1)/4 # 9.5
Q1 <- mean(Xi[9:10])
message("Q1=", Q1)
```

    ## Q1=4.5

``` r
Q2 <- median(Xi)
message(c("Q2=", Q2))
```

    ## Q2=4.7

``` r
X3 <- n + 1 - X1 # 28.5
Q3 <- mean(Xi[28:29])
message("Q3=", Q3)
```

    ## Q3=4.8

Now we can calculate quantile skewness

``` r
skewness <- (Q3 + Q1 - 2*Q2) / (Q3 - Q1)
message("skewness=", round(skewness, 3))  
```

    ## skewness=-0.333

Notice that skewness is -0.333, but is erroneously reported as -0.100 in
the back of the textbook

Now we can calculate quantile kurtosis (d)

We did not go over the equation in class, but you can find it on page 36
of your text book. You can get the rest from the book.

To save time, I included them below.

``` r
O1 <- 4.3
O3 <- 4.6
O5 <- 4.8
O7 <- 4.9

kurtosis <- ((O7 - O5) + (O3 - O1)) / (Q3 - Q1)
message("kurtosis=", round(kurtosis, 3))  
```

    ## kurtosis=1.333

### 6.2

Proportion of population =\> 78.0 g (a)

``` r
## Convert to Z
Z <- (78 - 63.5) / 12.2 
message(c('Z=', round(Z, 2)))
```

    ## Z=1.19

``` r
## P(Z => 1.19) = 0.1170, find this on table on pg. 676

## In R you can use pnorm() function
P <- pnorm(78, 63.5, 12.2, lower.tail = FALSE)
message(c("P=", round(P, 3)))
```

    ## P=0.117

Proportion of population =\< 78.0 g (b)

``` r
P <- pnorm(78, 63.5, 12.2, lower.tail = TRUE)
message(c("P=", round(P, 3)))
```

    ## P=0.883

This one is really easy, `0.117 * 1000` = 117 (c)

A random individual \< 41.0 g? (d)

``` r
## Convert to Z
Z <- (41 - 63.5) / 12.2 
message(c('Z=', round(Z, 2)))
```

    ## Z=-1.84

``` r
## P(Z =< 1.84) = 0.0.0329, find this on table on pg. 676

## In R you can use pnorm() function
P <- pnorm(41, 63.5, 12.2, lower.tail = TRUE)
message(c("P=", round(P, 3)))
```

    ## P=0.033

### 6.3

Body weight between 60 and 70 g (a)

``` r
P1 <- pnorm(60, 63.5, 12.2, lower.tail = TRUE)
P2 <- pnorm(70, 63.5, 12.2, lower.tail = FALSE)

P <- 1 - P1 - P2
message(c("P=", round(P, 3)))
```

    ## P=0.316

Between 50 and 60 g (slightly different from book, 0.2524) (b)

``` r
P1 <- pnorm(50, 63.5, 12.2, lower.tail = TRUE)
P2 <- pnorm(60, 63.5, 12.2, lower.tail = TRUE)
P2
```

    ## [1] 0.3871001

``` r
P <- P2 - P1
message(c("P=", round(P, 3)))
```

    ## P=0.253

## 6.4

This is looking for sigma Xbar (a)

``` r
sigmaXbar <- sqrt((12.2^2/10))
message(c("sigmaXbar=", round(sigmaXbar, 2)))
```

    ## sigmaXbar=3.86

``` r
Z <- (65.0 - 63.5) / sigmaXbar
message("From table, P= 0.3483")
```

    ## From table, P= 0.3483

`P(Z = -0.39) = 0.3483, P(Z =< 60) = 0.1814`, `0.3483 - 0.1814` = 0.1669
(c)

### 6.5

First lets input the data and standard error of the mean and the legal
limit

``` r
pollutant <- c(10.25, 10.37, 10.66, 10.47, 10.56, 10.22, 10.44, 10.38, 10.63, 10.40, 10.39, 10.26, 10.32, 10.35, 10.54, 10.33, 10.48, 10.68)

SE <- 0.24
ll <- 10
```

We now need to run a one-tailed hypothesis test (a)

``` r
Z <- (mean(pollutant) - ll) / SE
message(c("Z=", round(Z, 2))) 
```

    ## Z=1.79

``` r
CV <- 0.0367 # Find in Z table
message(c("CV<0.05=", CV < 0.05))
```

    ## CV<0.05=TRUE

Because 0.0367 \< 0.05, we reject the null hypothesis that the levels of
pollutants are below the legal limit

95% confidence intervals (remember that this is a one-tailed test, so we
are looking at 5% of the area under only one side of the curve) (b)

``` r
PZ_1 <- 1.645
L1 <- mean(pollutant) - PZ_1 * SE
message(c("L1=", round(L1, 3))) 
```

    ## L1=10.035

``` r
# L2 = infinity
```

### 6.6

Calculate SE

``` r
SE <- sqrt(89.06 / 24)
message(c("SE=", round(SE, 2)))
```

    ## SE=1.93

Calculate 99% confidence limits (two tail) (a)

``` r
Z <- 2.575
Xbar <- 61.4

L1 <- Xbar - (Z * SE)
message(c("L1=", round(L1, 3)))
```

    ## L1=56.44

``` r
L2 <- Xbar + (Z * SE)
message(c("L2=", round(L2, 3)))
```

    ## L2=66.36

Calculate 95% confidence limits (two tail) (b)

``` r
Z <- 1.960
Xbar <- 61.4

L1 <- Xbar - (Z * SE)
message(c("L1=", round(L1, 3)))
```

    ## L1=57.624

``` r
L2 <- Xbar + (Z * SE)
message(c("L2=", round(L2, 3)))
```

    ## L2=65.176

Calculate 90% confidence limits (two tail) (c)

``` r
Z <- 1.645
Xbar <- 61.4

L1 <- Xbar - (Z * SE)
message(c("L1=", round(L1, 3)))
```

    ## L1=58.231

``` r
L2 <- Xbar + (Z * SE)
message(c("L2=", round(L2, 3)))
```

    ## L2=64.569

## Chapter 7

Do exercise 7.1 Plus Calculate the 95% CI for the population mean and do
exercise 7.2, 7.3, ~~7.4 (a-d)~~, 7.6

## 7.1

Input data

``` r
x <- c(26, 24, 29, 33, 25, 26, 23, 30, 31, 30, 28, 27, 29, 26, 28)
lunar <- 29.5
```

Hypothesis test

``` r
## Hand calculate: 
x_var <- var(x)
message(c("variance=", round(x_var, 3)))
```

    ## variance=7.524

``` r
t <- (mean(x) - lunar) / sqrt(x_var / 15)
message(c("t=", round(t, 3)))
```

    ## t=-2.589

``` r
df = length(x) - 1
message(c("df=", df))
```

    ## df=14

Your CV should equal 2.145 which is \< 2.589, therefore we reject our
null that Xbar = 29.5 days.

You can have R do this for you, and it also includes the 95% confidence
intervals. I will let you calculate those on your own.

``` r
t.test(x, mu = lunar)
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  x
    ## t = -2.5886, df = 14, p-value = 0.02145
    ## alternative hypothesis: true mean is not equal to 29.5
    ## 95 percent confidence interval:
    ##  26.14767 29.18567
    ## sample estimates:
    ## mean of x 
    ##  27.66667

Notice, that while R gives you what it calls the “confidence intervals,”
it is actually giving you **confidence limits**. You need to find the
difference of one of them from the mean to get the confidence interval.
E.g. `29.186-27.667` = 1.519, which is actually your positive confidence
interval.

## 7.2

Data

``` r
x <- c(28, 27, 29, 29, 30, 30, 31, 30, 33, 27, 30, 32, 31)
mu <- 32
```

This is a one-tailed test

``` r
## Hand calculate: 
x_var <- var(x)
message(c("variance=", round(x_var, 3)))
```

    ## variance=3.192

``` r
t <- (mean(x) - mu) / sqrt(x_var / 13)
message(c("t=", round(t, 3)))
```

    ## t=-4.502

``` r
df = length(x) - 1
message(c("df=", df))
```

    ## df=12

Since this is a one-tailed test, make sure you read the values off the
correct part of the table. Your CV should equal 1.782 which is \< 4.502,
therefore we reject the null that Xbar =\> 32 mmol/kg.

In R:

``` r
t.test(x, mu = mu, alternative="less")
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  x
    ## t = -4.5017, df = 12, p-value = 0.0003623
    ## alternative hypothesis: true mean is less than 32
    ## 95 percent confidence interval:
    ##      -Inf 30.65243
    ## sample estimates:
    ## mean of x 
    ##  29.76923

## 7.3

This one is probably best done on paper, but we can calculate the 95%
confidence intervals.

Data

``` r
## January
Xbar.Jan <- 0.458
SE.Jan <- 0.026
df.Jan <- 13 - 1

## February
Xbar.Feb <- 0.413
SE.Feb <- 0.027
df.Feb <- 12 - 1

## March
Xbar.Mar <- 0.327 
SE.Mar <- 0.018
df.Mar <- 17 - 1
```

January 95% confidence intervals. Notice we have no idea what the
population mean is so we use t and our df instead of Z

``` r
t <- 2.179

CI <- t * SE.Jan
message(c("CI=", round(CI, 3)))
```

    ## CI=0.057

Februrary 95% confidence intervals.

``` r
t <- 2.201

CI <- t * SE.Feb
message(c("CI=", round(CI, 3)))
```

    ## CI=0.059

March 95% confidence intervals.

``` r
t <- 2.120
CI <- t * SE.Mar
message(c("CI=", round(CI, 3)))
```

    ## CI=0.038

I will have a plot of this in the future, but for now just do it by
hand.

## 7.6

Data, notice that this is a finite population

``` r
N <- 200
n <- 50
xbar <- 53.87
s2 <- 9.89^2
SE <- sqrt((s2 / n) * (1 - n / N))
message(c("SE=", round(SE, 3)))
```

    ## SE=1.211

``` r
df <- n - 1
```

95% confidence interval from above data (a)

``` r
t <- 2.011
CI <- t * SE
message(c("CI=", round(CI, 3)))
```

    ## CI=2.436

95% confidence interval from hypothetical sample of 100, this will
change the SE and the df (b)

Data

``` r
n <- 100
SE <- sqrt((s2 / n) * (1 - n / N))
message(c("SE=", round(SE, 3)))
```

    ## SE=0.699

``` r
df <- n - 1
```

95% confidence interval

``` r
t <- 1.984
CI <- t * SE
message(c("CI=", round(CI, 2)))
```

    ## CI=1.39

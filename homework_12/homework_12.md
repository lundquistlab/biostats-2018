# Homework 12

## Question 19.1

Data
```r
x <- c(59, 52, 42, 59, 24, 24, 40, 32, 63, 57, 36, 24)
y <- c(298, 303, 233, 287, 236, 245, 265, 233, 286, 290, 264, 239)
n <- length(x) # 12
```
a:
```r
sum.xy <- sum((x - mean(x)) * (y - mean(y))) # 3807.667
x2 <- sum((x - mean(x))^2) # 2450.667
y2 <- sum((y - mean(y))^2) # 8048.917

r <- sum.xy / sqrt(x2 * y2) # 0.86
``
b:

```r
r^2 # 0.735
```
c:

```r
Sr <- sqrt((1 - 0.735) / (n - 1))
t <- r / Sr
```

d:

```r
z <- 0.5 * log((1 + r) / (1 - r))
O.z <- sqrt(1 / (n - 3))
CI <- 1.96 * O.z

L1 <- z - CI
L2 <- z + CI

(exp(2 * L1) - 1) / (exp(2 * L1) + 1)

(exp(2 * L2) - 1) / (exp(2 * L2) + 1)

```

In R:

```r
cor.test(~ y + x)

## 	Pearson's product-moment correlation

## data:  y and x
## t = 5.2667, df = 10, p-value = 0.0003645
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.5579556 0.9592557
## sample estimates:
##       cor
## 0.8573301
```

## Question 19.2

a: t = 5.524 (or 5.38 if you rounded early), t<sub>0.05(1)inf</sub> = 1.872, reject H<sub>o</sub>

b:

```r
zeta.null <- 0.5 * log((1 + 0.5) / (1 - 0.5))
Z <- (z - zeta.null) / O.z
```

## Question 19.3

a:

```r
r1 <- -0.44
n1 <- 24

r2 <- -0.40
n2 <- 30

z1 <- 0.5 * log((1 + r1) / (1 - r1))
z2 <- 0.5 * log((1 + r2) / (1 - r2))

Z <- (z1 - z2) / sqrt((1 / (n1 - 3)) + (1 / (n2 - 3)))
Z
```

## Question 19.6

a:

```r
d2i <- (rank(x) - rank(y))^2
## 0.25 16 30.25 2.25 1 9 1 6.25 16 1 1 4

rs <- 1 - ((6 * sum(d2i)) / (n^3 - n))
```
b: (r<sub>s</sub>)<sub>0.05(2),12</sub> = 0.587, reject H<sub>o</sub>

In R:
```r
cor.test(~ y + x, method = "spearman")

## Spearman's rank correlation rho

## data:  y and x
## S = 88.928, p-value = 0.01319
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##     rho
## 0.6890631
```

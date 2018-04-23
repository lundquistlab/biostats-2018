
# Exercise 17.1

## a
```r
## Linear Regression

x <- c(-18, -15, -10, -5, 0, 5, 10, 19)
y <- c(5.2, 4.7, 4.5, 3.6, 3.4, 3.1, 2.7, 1.8)

b <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
## b = -0.0878
a <- mean(y) - b * mean(x)
## a = 3.471
```

## b
```r
## ANOVA

SYY <- sum((y - mean(y))^2) # Total SS = 8.915
Sdf <- length(y) - 1 # Total df = 7
RSS <- b * sum((x - mean(x)) * (y - mean(y))) # Regression SS = 8.754
Rdf <- 1 # Regression df = 1 by definition
ESS <- SYY - RSS # Error (residual) SS = 0.170
Edf <- Sdf - 1 # Error df = 6

## In R
model.temp <- lm(y ~ x)
summary(aov(model.temp))

##              Df Sum Sq Mean Sq F value   Pr(>F)
## x            1  8.745   8.745   308.9 2.18e-06 ***
## Residuals    6  0.170   0.028
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

```

## b
```r
## T test
n <- length(x) # or length(y)

df <- n - 2
EMS <- ESS / Edf
sum.x2 <- sum(x^2) - (sum(x)^2) / length(x)
Sb <- sqrt(EMS / sum.x2 ) ## standard error = 0.0049
t <- (b - 0) / Sb # -17.58

# In R
model.temp <- lm(y ~ x)
summary(model.temp)

## Call:
## lm(formula = y ~ x)

## Residuals:
##      Min       1Q   Median       3Q      Max
## -0.31022 -0.07552  0.03168  0.11685  0.15099

## Coefficients:
##              Estimate   Std. Error t value Pr(>|t|)
## (Intercept)  3.471422   0.060123   57.74 1.81e-09 ***
## x           -0.087759   0.004993  -17.58 2.18e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 0.1682 on 6 degrees of freedom
## Multiple R-squared:  0.9809,	Adjusted R-squared:  0.9778
## F-statistic: 308.9 on 1 and 6 DF,  p-value: 2.177e-06
```

## c
```r
## Standard error of estimates
sqrt(EMS) # 0.17
```

## d
```r
## Coefficient of determination
R2 <- RSS/SYY # R^2 = 0.981
```

## e
```r
## 95% confidence intervals
## t_0.5(2), 6  * Sb
2.447 * Sb # 0.0122
## -0.0878 /pm 0.0122
```
# Exercise 17.2

## a
```r
Y.hat <- a + (b) * 15 # 2.155
```
## b
```r
s.Y.hat <- sqrt(EMS * (1/n + ((15 - mean(x))^2) / sum.x2))
CI <- 2.447 * s.Y.hat
L1 <- Y.hat - CI # 1.90
L2 <- Y.hat + CI # 2.41
```
## Exercise 17.3
# a
```r
temp <- read.csv("temp.csv", h = T)

b <- sum((temp$x - mean(temp$x)) * (temp$y - mean(temp$y))) / sum((temp$x - mean(temp$x))^2) # 9.73
a <- mean(temp$y) - b * mean(temp$x) # 44.27

```
# b
```r
TSS <- sum((temp$y - mean(temp$y))^2) # 22895.24

RSS <- b * sum((temp$x - mean(temp$x)) * (temp$y - mean(temp$y))) # 21577
RMS <- RSS / 1 # 21577

ESS <- TSS - RSS # 1318
EDF <- 20 - 1 # 19
EMS <- ESS / EDF
EMS # 69

## In R

model.2 <- lm(y ~ x, data = temp)
summary(aov(model.2))

##              Df Sum Sq Mean Sq F value  Pr(>F)
## x            1  21577   21577     311 3.1e-13 ***
## Residuals   19   1318      69
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
# c
```r
Sxy <- sqrt(EMS) # 8.33

```
## d
```r
R2 <- RSS/TSS # R^2 = 0.94
```

## e
```r
n <- 3
GY <- mean(temp$y)
Yb1 <- n * (mean(temp$y[1:3]) - GY)^2
Yb2 <- n * (mean(temp$y[4:6]) - GY)^2
Yb3 <- n * (mean(temp$y[7:9]) - GY)^2
Yb4 <- n * (mean(temp$y[10:12]) - GY)^2
Yb5 <- n * (mean(temp$y[13:15]) - GY)^2
Yb6 <- n * (mean(temp$y[16:18]) - GY)^2
Yb7 <- n * (mean(temp$y[19:21]) - GY)^2

AGSS <- sum(c(Yb1, Yb2, Yb3, Yb4, Yb5, Yb6, Yb7)) # 22089.9

WGSS <- TSS - AGSS # 805.33
DFL <- AGSS - RSS # 513.045
F.values <- (DFL / 5) / (WGSS / (21 - 7)) ## 1.78
Fcrit <- 2.96 # Fail to reject null
```

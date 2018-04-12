---
Title: April 10 R meeting
Author: Matthew Lundquist
---

# Two-way ANOVA from homework 9

I put the data in a .csv file for ease of use

```r
ad <- read.csv("../homework_9/amino.csv", h = T)

## y ~ x1 + x2... xn + x1:x2, data = data

## LM method
model.1 <- lm(amino ~ species + sex + species:sex, data = ad)
model.2 <- lm(amino ~ species * sex, data = ad) ## This is equivalent but uses short-hand

## Check our assumptions using a plot
anova(model.1)
png("plots/anova.png")
par(mfrow = c(2,2))

plot(model.1)
dev.off()
## Check for equal variances

bartlett.test(amino ~ species, data = ad)
bartlett.test(amino ~ sex, data = ad)

## Non-parametric ANOVA
## kruskal.test(amino ~ species, data = ad)

## install.packages("car")
## library(car)
## Anova(model.1) ## Type II Anova if you have unequal sample sizes

##              Df Sum Sq Mean Sq F value   Pr(>F)
## species      2  55.26   27.63  13.082  0.00031 ***
## sex          1 138.72  138.72  65.679 2.04e-07 ***
## species:sex  2   6.89    3.45   1.631  0.22331
## Residuals   18  38.02    2.11
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

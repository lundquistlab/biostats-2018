# Homework 13

## Question 22.1

a) Between 0.25 and 0.10

b) 0.10 < &chi;<sup>2</sup> &ge; 8.668 < 0.25

c) &chi;<sup>2</sup><sub>0.05,4</sub> = 9.488

d) &chi;<sup>2</sup><sub>0.01,8</sub> = 20.090

## Question 22.2

a:
```r
fi <- c(13, 26, 31, 14, 28, 14)
fi_hat <- rep(126/length(fi), length(fi))

chi2 <- sum((fi - fi_hat)^2 / fi_hat)
chi2
```

b:
```r
## NCG
fi <- c(13, 14, 14)
fi_hat <- rep(sum(fi)/length(fi), length(fi))

chi2 <- sum((fi - fi_hat)^2 / fi_hat)
chi2

## AWM
fi <- c(26, 31, 28)
fi_hat <- rep(sum(fi)/length(fi), length(fi))

chi2 <- sum((fi - fi_hat)^2 / fi_hat)
chi2


## Two groups (Use Yate's correction)
ncg <- sum(13, 14, 14)
awm <- sum(26, 31, 28)
fi_hat <- rep(sum(c(ncg, awm))/length(c(ncg, awm)), length(c(ncg, awm)))

chi2_c <- sum((abs(c(ncg, awm) - fi_hat) - 0.5)^2 / fi_hat)
chi2_c
```
## Question 22.3

```r
fi <- c(44, 54)
fi_hat <- rep(sum(fi)/2, 2)

chi2_c <- sum((abs(fi - fi_hat) - 0.5)^2 / fi_hat)
chi2_c


```

## Question 23.1a

```r
## Totals
males <- c(163, 135, 71, 43)
females <- c(86, 77, 40, 38)

n <- sum(c(males, females))

male_total <- sum(males)
female_total <- sum(females)

C <- males + females

fi_hat_male <- (male_total * C) / n
fi_hat_female <- (female_total * C) / n

fi <- c(males, females)
fi_hat <- c(fi_hat_male, fi_hat_female)

chi2 <- sum((fi - fi_hat)^2 / fi_hat)

df <- (2 - 1) * (4 - 1)

## Table

birds <- rbind(males, paste("(", fi_hat_male, ")", sep = ""), females, paste("(", fi_hat_female, ")", sep = ""), C)
birds <- cbind(birds, c(sum(males), paste(""), sum(females), paste(""), paste("n = ", n)))

rownames(birds) <- c("Male", "", "Female", "", "Total" )
colnames(birds) <- c("Spring", "Summer", "Fall", "Winter", "R")

library(knitr)
kable(birds)

```

|       |Spring             |Summer             |Fall               |Winter             |R        |
|:------|:------------------|:------------------|:------------------|:------------------|:--------|
|Male   |163                |135                |71                 |43                 |412      |
|       |(157.102603369066) |(133.758039816233) |(70.0336906584992) |(51.1056661562021) |         |
|Female |86                 |77                 |40                 |38                 |241      |
|       |(91.8973966309342) |(78.2419601837672) |(40.9663093415008) |(29.8943338437979) |         |
|Total  |249                |212                |111                |81                 |n =  653 |

## Question 23.2a

```r

east <- c(14, 29)
west <- c(12, 38)

n <- sum(c(east, west))

e_total <- sum(east)
w_total <- sum(west)

C <- east + west

fi_hat_e <- (e_total * C) / n
fi_hat_w <- (w_total * C) / n

fi <- c(east, west)
fi_hat <- c(fi_hat_e, fi_hat_w)

chi2 <- sum((fi - fi_hat)^2 / fi_hat)
df <- 1

## Table

rabies <- rbind(east, paste("(", fi_hat_e, ")", sep = ""), west, paste("(", fi_hat_w, ")", sep = ""), C)
rabies <- cbind(rabies, c(sum(east), paste(""), sum(west), paste(""), paste("n = ", n)))

rownames(rabies) <- c("E", "", "W", "", "Total" )
colnames(rabies) <- c("with rabies", "without rabies", "R")

library(knitr)
kable(rabies)

```

|      |with rabies        |without rabies     |R       |
|:-----|:------------------|:------------------|:-------|
|E     |14                 |29                 |43      |
|      |(12.0215053763441) |(30.9784946236559) |        |
|W     |12                 |38                 |50      |
|      |(13.9784946236559) |(36.0215053763441) |        |
|Total |26                 |67                 |n =  93 |

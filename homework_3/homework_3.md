
# Table of Contents

1.  [Question 1](#org09fa1fb)
2.  [Question 2](#org32c09da)
3.  [Question 3](#orgf81f011)



<a id="org09fa1fb"></a>

# Question 1

Exercises 5.1, 5.2, 5.3, 5.4, 5.5, 5.7
5.8, 5.10, 5.12, 5.13, 5.14

5.1

    ## a
    3 * 2 # 6
    ## b
    combos <- c("HG","HP", "MG", "MP", "LG", "LP") 

5.2

    
    3 * 4 * 2 ## 24

5.3

    
    2^23 # 8,388,608 gametes

5.4

    
    ## 5_P_5
    factorial(5) # 120

5.5

    
    ## 12_P_5
    factorial(12) / factorial(12-5) # 95,040

5.7

    
    ## n_C_x
    ## 9_C_5
    factorial(9) / (factorial(5) * factorial(9-5)) # 126

5.8

    
    O <- 2672/5400 # 0.49
    A <- 0.38
    B <- 0.09
    AB <- 0.04

5.10

    
    ## a P(A)
    A # 0.38
    
    ## b P(A or AB) = P(A) + P(AB)
    A + AB # 0.42

5.12

    
    ## You can check your answers using a Punnett Square
    
    ## a
    ## P(A and a)
    PAa <- 0.5 * 1 # 0.5
    
    ## b
    ## P(a and a) 
    Paa <- 0.5 * 1 # 0.5
    
    ## c
    ## P(A and A)
    PAA <- 0.5 * 0 # 0

5.13

    
    ## deck = 52
    
    ## a
    ## P(Q of clubs)
    PQC <- (1/4) * (1/13) # 0.0192
    
    ## b
    ## P(Black Queen) 
    QBC <- (1/2) * (1/13) # 0.0384
    
    ## c
    ## P(Black Face Card)
    PBFC <- (1/2) * (3/13) # 0.1153

5.14

    
    ## 2 W, 4 B
    ## 2 W, 2 B
    ## 3 W, 2 B
    
    ## a
    ## P(WWW)
    PWWW <- (2/6) * (2/4) * (3/5) ## 0.1000
    
    ## b
    ## P(exactly 2W)
    P2W <- (2/6 * 2/4 * 2/5) + (2/6 * 2/4 * 3/5) + (4/6 * 2/4 * 3/5) # 0.3667
    P2W
    ## c
    ## P(at least 2W)
    PAL2W <- 0.3667 + 0.10 # 0.4667


<a id="org32c09da"></a>

# Question 2

24.1

    
    P2 <- factorial(6) / (factorial(2) * factorial(4)) * (0.3)^2 * (0.7)^4 # 0.3241
    
    ## or 
    
    dbinom(2, size = 6, prob = 0.3)

24.2

    
    P2 <- factorial(5) / (factorial(4) * factorial(1)) * (0.22)^4 * (0.78)^1 # 0.0091
    
    ## or 
    
    dbinom(4, size = 5, prob = 0.22)


<a id="orgf81f011"></a>

# Question 3

In a pool of balls, 30% are red balls and 70% are blue balls. 
You are asked to pick 10 balls, what is the probability of getting 
3 red balls and 7 blue balls? What is the probability of getting 
5 red balls and 5 blue balls? What is the probability of 
getting more than 3 red balls? 

    
    ## A
    P1 <- factorial(10) / (factorial(3) * factorial(7)) * (0.3)^3 * (0.7)^7 # 0.2668
    
    ## or 
    
    dbinom(3, size = 10, prob = 0.3)
    
    ## B
    P2 <- factorial(10) / (factorial(5) * factorial(5)) * (0.3)^5 * (0.7)^5 # 0.1029
    
    ## or 
    
    dbinom(5, size = 10, prob = 0.3)
    
    ## A
    P3 <- 1 - (factorial(10) / (factorial(3) * factorial(7)) * (0.3)^3 * (0.7)^7) -
          (factorial(10) / (factorial(2) * factorial(8)) * (0.3)^2 * (0.7)^8) -
          (factorial(10) / (factorial(1) * factorial(9)) * (0.3)^1 * (0.7)^9) -
          (factorial(10) / (factorial(0) * factorial(10)) * (0.3)^0 * (0.7)^10) # 0.3504
    
    ## or 
    
    1 - dbinom(3, size = 10, prob = 0.3) - dbinom(2, size = 10, prob = 0.3) - dbinom(1, size = 10, prob = 0.3) - dbinom(0, size = 10, prob = 0.3)


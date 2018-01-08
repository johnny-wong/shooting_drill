# Analytical solution
#https://en.wikipedia.org/wiki/Absorbing_Markov_chain

# Transient state matrix
Q <- function(perc = 0.75, lower = -5, upper = 7){
    t = length(seq(from = -5, to = 7)) - 2
    Q <- matrix(0, nrow = t, ncol = t)
    
    # insert perc values
    i <- 1:(t-1)
    for (row in i){
        Q[row, row + 1] <- perc
    }
    
    # insert 1-perc values
    for (row in i[-length(i)]){
        Q[row + 2, row] <- 1 - perc
    }
    Q[2, 1] <- 1 - perc
    
    return(Q)
}

# Absorbent state matrix
R <- function(perc = 0.75, lower = -5, upper = 7){
    t = length(seq(from = -5, to = 7)) - 2
    R <- matrix(0, nrow = t, ncol = 2)
    
    R[1,1] <- 1 - perc
    R[t, 2] <- perc
    return(R)
}

# Canonical form
P <- function(perc = 0.75, lower = -5, upper = 7){
    t = length(seq(from = -5, to = 7)) - 2
    Q <- Q(perc, lower, upper)
    R <- R(perc, lower, upper)
    I <- diag(2)
    Zero <- matrix(0, ncol = t, nrow = 2)
    
    QR <- cbind(Q, R)
    ZeroI <- cbind(Zero, I)
    
    P <- rbind(QR, ZeroI)
    return(P)
}

# Fundamental matrix
N <- function(perc = 0.75, lower = -5, upper = 7){
    t = length(seq(from = -5, to = 7)) - 2
    N <- solve(diag(t) - Q(perc, lower, upper))
    return(N)
}

# Absorbing probability matrix
B <- function(perc = 0.75, lower = -5, upper = 7){
    B <- N(perc, lower, upper) %*% R(perc, lower, upper)
    return(B)
}

# Function determining probability of success
prob_success <- function(perc = 0.75, lower = -5, upper = 7){
    B <- B(perc, lower, upper)
    
    return(B[-lower, 2])
}

#TODO vectorise prob_success

#TODO create other functions: expected steps, 


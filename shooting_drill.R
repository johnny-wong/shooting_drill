simulate_drill <- function(lower = -5, upper = 7, perc = 0.75){
  score <- 0
  while ((score > lower) && (score < upper)){
    if (runif(1) < perc){
      score <- score + 1
    } else {
      score <- score - 2
    }
  }
  
  if (score <= lower){
    result <- 0
  } else {
    result <- 1
  }
  return(result)
}

simulate_drills <- function(n = 1, lower = -5, upper = 7, perc = 0.75){
  num_won <- vector(mode = 'numeric', length = length(perc))
  for (j in 1:length(perc)){
    for (i in 1:n){
      num_won[j] <- num_won[j] + simulate_drill(lower, upper, perc[j])
    }
  }
  return(num_won)
}
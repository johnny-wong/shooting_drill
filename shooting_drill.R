simulate_drill <- function(lower = -5, upper = 7, perc = 0.75){
  score <- 0
  while ((score > lower) && (score < upper)){
    if (runif(1) < perc){
      score <- score + 1
    } else {
      score <- score - 2
    }
  }
  
  if (score == lower){
    result <- 1
  } else {
    result <- 0
  }
  return(result)
}

#TODO make perc a vector so you can output the vector of results with diff shooting percentages


simulate_drills <- function(n = 1, lower = -5, upper = 7, perc = 0.75){
  num_won <- 0
  for (i in 1:n){
    num_won <- num_won + simulate_drill(lower, upper, perc)
  }
  return(num_won)
}
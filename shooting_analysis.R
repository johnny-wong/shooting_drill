library(ggplot2)

source('Shooting_drill.R')
source('analytical_soln')

perc <- seq(from = 0, to = 1, by = 0.01)
sim_num <- 10000
win_rate_sim <- simulate_drills(n = sim_num, perc = perc)/sim_num

ggplot(data = NULL, aes(x = perc, y = win_rate)) + geom_point() +
  labs(y = 'Success rate', x = 'True shooting percentage') +
  ggtitle('Shooting drill success rate against true shooting percentage')

win_rate_true <- vector(mode = "numeric", length = length(perc))
for (i in 1:length(perc)){
    win_rate_true[i] <- prob_success(perc[i])
}

win_rate_true

# TODO: melt into a long dataframe and plot against each other
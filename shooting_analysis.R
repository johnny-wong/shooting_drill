library(ggplot2)

source('Shooting_drill.R')

perc <- seq(from = 0, to = 1, by = 0.01)
sim_num <- 10000
win_rate <- simulate_drills(n = sim_num, perc = perc)/sim_num

ggplot(data = NULL, aes(x = perc, y = win_rate)) + geom_point() +
  labs(y = 'Success rate', x = 'True shooting percentage') +
  ggtitle('Shooting drill success rate against true shooting percentage')

plot(x = perc, y = win_rate)

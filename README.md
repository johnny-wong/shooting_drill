# shooting_drill
Functions that simulate a basketball shooting drill

# Context
The shooting drill works as follows. The player starts on 0 points. If they makes a shot, then they add 1 to their score. If they miss then they subtract 2. The drill is lost when the player reaches -5, or the drill is won when they reach 7.

# Functions
simulate_drill(lower = -5, upper = 7, perc = 0.75)
Simulates a single drill allowing for changes to the score limits and shooting percentage.


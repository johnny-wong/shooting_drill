# -*- coding: utf-8 -*-
"""
Created on Sun Jan  7 16:12:28 2018

@author: Johnny Wong
"""
import numpy as np

def simulate_drill(lower = -5, upper = 7, perc = 0.7):
	score = 0
	shots = 0
	while (score > lower and score < upper):
		if np.random.rand() < perc:
			score += 1
		else:
			score -= 2
		shots += 1
	
	if score <= lower:
		result = 0
	else:
		result = 1

	return result, shots


def simulate_drills(n = 1, lower = -5, upper = 7, perc = 0.7):
	num_won = 0
	total_shots_taken = 0
	for j in range(n):
		result, shots_taken = simulate_drill(lower, upper, perc)
		num_won += result
		total_shots_taken += shots_taken
		
	return num_won, total_shots_taken

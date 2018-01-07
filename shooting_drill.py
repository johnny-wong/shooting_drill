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

'''
def simulate_drills(n = 1, lower = -5, upper = 7, perc = 0.7):
	perc = np.array(list(perc)) #TODO 
	num_won = list(range(perc))
	for i in range(len(perc)):
		for j in range(n):
			num_won[i] += simulate_drill(perc = perc[i])
		
	return num_won
'''
#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

x_Axis = [1, 2, 4, 6, 8]

for size in ["64", "1024", "4096"]:
	outFile = "./gol" + size + ".out"
	fp = open(outFile)

	fig, ax = plt.subplots()
	y_Axis = []

	for i in range(5):
		line = fp.readline()
		t = float(line.split(" ")[6])
		y_Axis.append(t)
	ax.plot(x_Axis, list(map(lambda x: y_Axis[0]/x, y_Axis)), marker='o')
	ax.plot(x_Axis, x_Axis, linestyle='--', color='red')
	fp.close()

	plt.title(size + "x" + size + ": Speedup per Thread Count")
	ax.grid(True)
	ax.set_xlabel("Thread Count")
	ax.set_ylabel("Speedup")
	plt.savefig("./gol" + size + "_speedup.png", bbox_inches="tight")
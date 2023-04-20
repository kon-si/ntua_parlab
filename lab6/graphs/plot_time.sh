#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

x_Axis = ["8", "16", "32", "64"]

for exec in ["jacobi", "seidel"]:
	outFile = "./" + exec + "_scal.out"
	fp = open(outFile)

	for size in ["2048", "4096", "6144"]:
		y_Axis = []
		comp_time = []

		for i in range(3):
			line = fp.readline()
		for i in range(4):
			line = fp.readline()
			c = float(line.split(" ")[12])
			comp_time.append(c)
			t = float(line.split(" ")[16])
			y_Axis.append(t)
		print(comp_time)
		fig, ax = plt.subplots()
		ax.bar(x_Axis, y_Axis, width=0.9, label="Messaging Time")
		ax.bar(x_Axis, comp_time, width=0.9, label="Computation Time")
		lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Implemantation")
		lgd.get_frame().set_edgecolor('black')
		plt.title(size + "x" + size + ": Execution Time per Process Number")
		ax.set_xlabel("Process Number")
		ax.set_ylabel("Execution Time (sec)")
		plt.savefig("./" + exec + "_" + size + ".png", bbox_inches="tight")

	fp.close()
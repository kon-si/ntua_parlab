#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

for i in ["1024", "2048", "4096"]:
	outFile = "./run_fw_pr_" + i + ".out"
	fp = open(outFile)
	x_Axis = ["1", "2", "4", "8", "16", "32", "64"]
	fig, ax = plt.subplots()
	for bsize in range(6):
		y_Axis = []
		for nthr in range(7):
			line = fp.readline()
			t = float(line.split()[3])
			y_Axis.append(t)
		ax.plot(x_Axis, y_Axis, label=line.split()[2].replace(',', ''), marker='o')
	fp.close()

	# ax.set_xscale("log", base=2)
	# formatter = ticker.ScalarFormatter(useMathText=True)
	# formatter.set_scientific(False) 
	# ax.xaxis.set_major_formatter(formatter)

	plt.title(i + ": Execution Time per Thread Count")
	lgd = plt.legend(bbox_to_anchor=(1.1, 1), loc='upper center', title="Block Size")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Thread Count")
	ax.set_ylabel("Execution Time (sec)")
	plt.savefig("./" + i + ".png", bbox_inches="tight")
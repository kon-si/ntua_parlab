#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

outFile = "./run_kmeans_naive_2.out"
fp = open(outFile)
x_Axis = ["Sequential", "1", "2", "4", "8", "16", "32", "64"]
fig, ax = plt.subplots()
y_Axis = []
for nthr in range(8):
	line = fp.readline()
	t = float(line)
	y_Axis.append(t)
ax.bar(x_Axis, y_Axis, label='256, 16, 16, 10', width=0.9)
fp.close()

# ax.set_xscale("log", base=2)
# formatter = ticker.ScalarFormatter(useMathText=True)
# formatter.set_scientific(False) 
# ax.xaxis.set_major_formatter(formatter)

plt.title("Execution Time per Thread Count")
lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size, Coords, Clusters, Loops")
lgd.get_frame().set_edgecolor('black')
# ax.grid(True)
ax.set_xlabel("Thread Count")
ax.set_ylabel("Execution Time (sec)")
plt.savefig("./kmeans_naive_2.png", bbox_inches="tight")
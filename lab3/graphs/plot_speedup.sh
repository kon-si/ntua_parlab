#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

x_Axis = ["1", "2", "4", "8", "16", "32", "64"]
fig, ax = plt.subplots()
for lock in ["nosync", "atomic", "critical"]:
	outFile = "./" + lock + ".out"
	fp = open(outFile)
	y_Axis = []
	for nthr in range(7):
		line = fp.readline()
		t = float(line)
		y_Axis.append(t)
	ax.plot(x_Axis, list(map(lambda x: y_Axis[0]/x, y_Axis)), label=lock, marker='o')
	fp.close()

# ax.set_xscale("log", base=2)
# formatter = ticker.ScalarFormatter(useMathText=True)
# formatter.set_scientific(False) 
# ax.xaxis.set_major_formatter(formatter)

plt.title("Speedup per Thread Count")
lgd = plt.legend(loc='upper right', bbox_to_anchor=(1.25, 1), title="Lock Type")
lgd.get_frame().set_edgecolor('black')
ax.grid(True)
ax.set_xlabel("Thread Count")
ax.set_ylabel("Speedup")
plt.savefig("./kmeans_lock_speedup_atom_crit.png", bbox_inches="tight")
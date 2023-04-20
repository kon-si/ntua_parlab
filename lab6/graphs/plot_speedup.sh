#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

x_Axis = ["2", "4", "8", "16", "32", "64"]

outFile1 = "./jacobi_scal.out"
fp1 = open(outFile1)
outFile2 = "./seidel_scal.out"
fp2 = open(outFile2)

for size in ["2048", "4096", "6144"]:
	fig, ax = plt.subplots()
	jy_Axis = []
	gy_Axis = []

	line = fp1.readline()
	seq_t = float(line.split(" ")[16])
	for i in range(6):
		line = fp1.readline()
		t = float(line.split(" ")[16])
		jy_Axis.append(t)

	line = fp2.readline()
	seq_t = float(line.split(" ")[16])
	for i in range(6):
		line = fp2.readline()
		t = float(line.split(" ")[16])
		gy_Axis.append(t)

	ax.plot(x_Axis, list(map(lambda x: seq_t/x, jy_Axis)), label="Jacobi", marker='o')
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, gy_Axis)), label="Gauss-Seidel SOR", marker='o')

	plt.title(size + "x" + size + ": Speedup per Process Number")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Implemantation")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Process Number")
	ax.set_ylabel("Speedup")
	plt.savefig("./" + size + "_speedup.png", bbox_inches="tight")

fp1.close()
fp2.close()
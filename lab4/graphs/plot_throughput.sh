#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

for i in ["cgl", "fgl", "lazy", "nb", "opt"]:
	x_Axis = ["Serial", "1", "2", "4", "8", "16", "32", "64", "128"]
	y_Axis_1024_1 = []
	y_Axis_1024_2 = []
	y_Axis_1024_3 = []
	y_Axis_1024_4 = []
	y_Axis_8192_1 = []
	y_Axis_8192_2 = []
	y_Axis_8192_3 = []
	y_Axis_8192_4 = []

	fp = open("run_serial.out")

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_1024_1.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_1024_2.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_1024_3.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_1024_4.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_8192_1.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_8192_2.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_8192_3.append(t)

	line = fp.readline()
	line = fp.readline()
	line = fp.readline()
	t = float(line.split()[7])
	y_Axis_8192_4.append(t)

	fp.close()

	outFile = "./run_" + i + ".out"
	fp = open(outFile)
	
	for lines in range(8):
		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_1024_1.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_1024_2.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_1024_3.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_1024_4.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_8192_1.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_8192_2.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_8192_3.append(t)

		line = fp.readline()
		line = fp.readline()
		t = float(line.split()[7])
		y_Axis_8192_4.append(t)

	fp.close()

	fig, ax = plt.subplots()
	ax.plot(x_Axis, y_Axis_1024_1, label="100/0/0", marker='o')
	ax.plot(x_Axis, y_Axis_1024_2, label="80/10/10", marker='o')
	ax.plot(x_Axis, y_Axis_1024_3, label="20/40/40", marker='o')
	ax.plot(x_Axis, y_Axis_1024_4, label="0/50/50", marker='o')

	plt.title(i + " (1024): Throughput per Thread Count")
	lgd = plt.legend(bbox_to_anchor=(1.14, 1), loc='upper center', title="Workload")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Thread Count")
	ax.set_ylabel("Throughput (Kops/sec)")
	plt.savefig("./" + i + "_1024_throughput.png", bbox_inches="tight")

	fig, ax = plt.subplots()
	ax.plot(x_Axis, y_Axis_8192_1, label="100/0/0", marker='o')
	ax.plot(x_Axis, y_Axis_8192_2, label="80/10/10", marker='o')
	ax.plot(x_Axis, y_Axis_8192_3, label="20/40/40", marker='o')
	ax.plot(x_Axis, y_Axis_8192_4, label="0/50/50", marker='o')

	plt.title(i + " (8192): Throughput per Thread Count")
	lgd = plt.legend(bbox_to_anchor=(1.14, 1), loc='upper center', title="Workload")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Thread Count")
	ax.set_ylabel("Throughput (Kops/sec)")
	plt.savefig("./" + i + "_8192_throughput.png", bbox_inches="tight")
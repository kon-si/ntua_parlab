#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

outFile = "./run_kmeans.out"
fp = open(outFile)
x_Axis = ["32", "64", "128", "256", "512", "1024"]

for coords in ["2", "16"]:
	ny_Axis = []
	ty_Axis = []		
	sy_Axis = []

	for i in range(9):
		line = fp.readline()
	line = fp.readline()
	seq_t = float(line.split()[6])
	for i in range(7):
		line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])
		ny_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])
		ty_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])
		sy_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	fig, ax = plt.subplots()
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, ny_Axis)), label='256, ' + coords + ', 16, 10', marker='o')
	plt.title("Naive: Speedup per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size, Coords, Clusters, Loops")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Speedup")
	plt.savefig("./kmeans_cuda_naive_" + coords + "_speedup.png", bbox_inches="tight")

	fig, ax = plt.subplots()
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, ny_Axis)), label='Naive', marker='o')
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, ty_Axis)), label='Transpose', marker='o')
	plt.title("Transpose: Speedup per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size = 256, Coords = " + coords + ", Clusters = 16, Loops = 10")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Speedup")
	plt.savefig("./kmeans_cuda_transpose_" + coords + "_speedup.png", bbox_inches="tight")

	fig, ax = plt.subplots()
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, ny_Axis)), label='Naive', marker='o')
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, ty_Axis)), label='Transpose', marker='o')
	ax.plot(x_Axis, list(map(lambda x: seq_t/x, sy_Axis)), label='Shared', marker='o')
	plt.title("Shared: Speedup per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size = 256, Coords = " + coords + ", Clusters = 16, Loops = 10")
	lgd.get_frame().set_edgecolor('black')
	ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Speedup")
	plt.savefig("./kmeans_cuda_shared_" + coords + "_speedup.png", bbox_inches="tight")

fp.close()
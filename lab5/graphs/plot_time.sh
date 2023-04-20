#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

outFile = "./run_kmeans.out"
fp = open(outFile)
x_Axis = ["Sequential", "32", "64", "128", "256", "512", "1024"]

for coords in ["2", "16"]:
	ny_Axis = []
	ty_Axis = []
	sy_Axis = []

	for i in range(9):
		line = fp.readline()
	line = fp.readline()
	t = float(line.split()[6])/1000
	ny_Axis.append(t)
	ty_Axis.append(t)
	for i in range(7):
		line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])/1000
		ny_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])/1000
		ty_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	for i in range(6):
		for i in range(13):
			line = fp.readline()
		line = fp.readline()
		t = float(line.split()[6])/1000
		sy_Axis.append(t)
		for i in range(7):
			line = fp.readline()

	fig, ax = plt.subplots()
	ax.bar(x_Axis, ny_Axis, label='256, ' + coords + ', 16, 10', width=0.9)
	plt.title("Naive: Execution Time per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size, Coords, Clusters, Loops")
	lgd.get_frame().set_edgecolor('black')
	# ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Execution Time (sec)")
	plt.savefig("./kmeans_cuda_naive_" + coords + ".png", bbox_inches="tight")

	fig, ax = plt.subplots()
	ax.bar(x_Axis, ty_Axis, label='256, ' + coords + ', 16, 10', width=0.9)
	plt.title("Transpose: Execution Time per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size, Coords, Clusters, Loops")
	lgd.get_frame().set_edgecolor('black')
	# ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Execution Time (sec)")
	plt.savefig("./kmeans_cuda_transpose_" + coords + ".png", bbox_inches="tight")

	fig, ax = plt.subplots()
	ax.bar(x_Axis, ty_Axis, label='256, ' + coords + ', 16, 10', width=0.9)
	plt.title("Shared: Execution Time per Block Size")
	lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Size, Coords, Clusters, Loops")
	lgd.get_frame().set_edgecolor('black')
	# ax.grid(True)
	ax.set_xlabel("Block Size")
	ax.set_ylabel("Execution Time (sec)")
	plt.savefig("./kmeans_cuda_shared_" + coords + ".png", bbox_inches="tight")

fp.close()
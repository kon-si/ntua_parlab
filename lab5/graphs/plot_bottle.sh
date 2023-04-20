#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

x_Axis = ["32", "64", "128", "256", "512", "1024"]

for coords in ["2", "16"]:
    outFile = "./Sz-256_Coo-" + coords + "_Cl-16.csv"
    fp = open(outFile)
    line = fp.readline()

    fig1, ax1 = plt.subplots()
    fig2, ax2 = plt.subplots()
    fig3, ax3 = plt.subplots()
    fig4, ax4 = plt.subplots()

    for version in ["Naive", "Transpose", "Shared"]:
        loop_gpu = []
        loop_cpu = []
        loop_gpu_cpu = []
        loop_cpu_gpu = []

        for i in range(6):
            line = fp.readline()
            av_loop_t = float(line.split(",")[2])

            loop_gpu.append(float(line.split(",")[5])/av_loop_t*100)
            loop_cpu.append(float(line.split(",")[6])/av_loop_t*100)
            loop_gpu_cpu.append(float(line.split(",")[7])/av_loop_t*100)
            loop_cpu_gpu.append(float(line.split(",")[8])/av_loop_t*100)

        ax1.plot(x_Axis, loop_gpu, label=version, marker='o')
        ax2.plot(x_Axis, loop_cpu, label=version, marker='o')
        ax3.plot(x_Axis, loop_gpu_cpu, label=version, marker='o')
        ax4.plot(x_Axis, loop_cpu_gpu, label=version, marker='o')

    ax1.title.set_text("Average GPU Time per Loop")
    lgd1 = fig1.legend(loc='upper center', bbox_to_anchor=(1.01, 0.6), title="Version")
    lgd1.get_frame().set_edgecolor('black')
    ax1.grid(True)
    ax1.set_xlabel("Block Size")
    ax1.set_ylabel("Percentage of Time")
    fig1.savefig("./loop_gpu_" + coords + ".png", bbox_inches="tight")

    ax2.title.set_text("Average CPU Time per Loop")
    lgd2 = fig2.legend(loc='upper center', bbox_to_anchor=(1.01, 0.6), title="Version")
    lgd2.get_frame().set_edgecolor('black')
    ax2.grid(True)
    ax2.set_xlabel("Block Size")
    ax2.set_ylabel("Percentage of Time")
    fig2.savefig("./loop_cpu_" + coords + ".png", bbox_inches="tight")

    ax3.title.set_text("Average GPU-CPU Transfer Time per Loop")
    lgd3 = fig3.legend(loc='upper center', bbox_to_anchor=(1.01, 0.6), title="Version")
    lgd3.get_frame().set_edgecolor('black')
    ax3.grid(True)
    ax3.set_xlabel("Block Size")
    ax3.set_ylabel("Percentage of Time")
    fig3.savefig("./loop_gpu_cpu_" + coords + ".png", bbox_inches="tight")

    ax4.title.set_text("Average CPU-GPU Transfer Time per Loop")
    lgd4 = fig4.legend(loc='upper center', bbox_to_anchor=(1.01, 0.6), title="Version")
    lgd4.get_frame().set_edgecolor('black')
    ax4.grid(True)
    ax4.set_xlabel("Block Size")
    ax4.set_ylabel("Percentage of Time")
    fig4.savefig("./loop_cpu_gpu_" + coords + ".png", bbox_inches="tight")

    fp.close()
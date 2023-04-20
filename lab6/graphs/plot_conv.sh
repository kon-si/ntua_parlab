#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt, ticker

n1 = ["Jacobi"]
n2 = ["Gauss-Seidel"]
ttime1 = [222.299765]
ttime2 = [2.102703]
comptime1 = [39.007633]
comptime2 = [0.350638]
convtime1 = [4.713692]
convtime2 = [0.074107]

fig, ax = plt.subplots(1,2)
ax[0].bar(n1, ttime1, width=0.1, label="Messaging Time")
ax[0].bar(n1, comptime1, width=0.1, label="Computation Time")
ax[0].bar(n1, convtime1, width=0.1, label="Convergence Time")

ax[1].bar(n2, ttime2, width=0.1, label="Messaging Time")
ax[1].bar(n2, comptime2, width=0.1, label="Computation Time")
ax[1].bar(n2, convtime2, width=0.1, label="Convergence Time")

lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15), title="Implemantation")
lgd.get_frame().set_edgecolor('black')
plt.title("Execution Time per Process Number")
ax[0].set_ylabel("Execution Time (sec)")
plt.savefig("./conv.png", bbox_inches="tight")
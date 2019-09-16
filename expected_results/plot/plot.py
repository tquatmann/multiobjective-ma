import numpy as np
from numpy import genfromtxt
overapprox = genfromtxt('overapproximation.csv', delimiter=',', skip_header=1)
underapprox = genfromtxt('underapproximation.csv', delimiter=',', skip_header=1)
boundaries = genfromtxt('boundaries.csv', delimiter=',', skip_header=1)

import matplotlib.pyplot as plt
plt.margins(0)
plt.fill(boundaries[:,0], boundaries[:,1], 'r', alpha=1)
plt.fill(overapprox[:,0], overapprox[:,1], 'w', alpha=1)
plt.fill(underapprox[:,0], underapprox[:,1], 'g', alpha=1)
plt.show()

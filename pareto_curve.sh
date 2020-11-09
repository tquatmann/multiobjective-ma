#!/bin/bash

source settings.sh

LOGS_DIR=$LOGS_ROOT/plot
mkdir -p $LOGS_DIR

rm -f $LOGS_DIR/*.csv

# create a python script for plotting the result
cat >$LOGS_DIR/plot.py <<EOL
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
EOL

#invoke storm and the python script
$STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs12_3.ma --prop $BENCHMARK_DIR/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm --multiobjective:exportplot $LOGS_DIR/
cd $LOGS_DIR
python3 plot.py &
cd ..

echo "done"

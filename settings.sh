#!/bin/bash

# Memory available to Prism (comment out for default)
# What we set in the paper:
PRISM_JAVAMAXMEM="20g" 
PRISM_JAVASTACKSIZE="-4g"

# Paths to Storm, Prism, IMCA
STORM_EXECUTABLE=$HOME/storm/build/bin/storm
PRISM_EXECUTABLE=$HOME/prism/bin/prism
IMCA_EXECUTABLE=$HOME/imca/bin/imca

# Paths to model data, log file destination
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BENCHMARK_DIR=$SCRIPT_DIR/models
$LOGS_ROOT=$SCRIPT_DIR/logs
mkdir -p $LOGS_ROOT # Create if it does not exist

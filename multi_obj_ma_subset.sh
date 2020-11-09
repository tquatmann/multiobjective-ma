#!/bin/bash

source settings.sh

LOGS_DIR=$LOGS_ROOT/multi-ma-logs-subset
mkdir -p $LOGS_DIR

{ time timeout 7200 $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs10_2.ma --prop $BENCHMARK_DIR/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee $LOGS_DIR/storm_eta0.01-jobs10_2-2.log

{ time timeout 7200 $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma --prop $BENCHMARK_DIR/ma/polling/polling2.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee $LOGS_DIR/storm_eta0.01-pollingN3_Q3-2.log

{ time timeout 7200 $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/mutex/mutex.ma --prop $BENCHMARK_DIR/ma/mutex/mutex1.csl -const N=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee $LOGS_DIR/storm_eta0.01-mutexN2-1.log

{ time timeout 7200 $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma --prop $BENCHMARK_DIR/ma/stream/stream1.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee $LOGS_DIR/storm_eta0.001-streamN250-1.log

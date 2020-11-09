#!/bin/bash

source settings.sh

LOGS_DIR=$LOGS_ROOT/single-ma
mkdir -p $LOGS_DIR

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs10_2.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs1.csl  -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-jobs10_2-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs10_2.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-jobs10_2-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs12_3.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs1.csl  -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-jobs12_3-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs12_3.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-jobs12_3-2.log


{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/mutex/mutex.ma -const N=2 --prop $BENCHMARK_DIR/ma/mutex/singleobjective/mutex1.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-mutex2-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/mutex/mutex.ma -const N=2 --prop $BENCHMARK_DIR/ma/mutex/singleobjective/mutex2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-mutex2-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=3,Q=3 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling1.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-polling3_3_1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=3,Q=3 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-polling3_3_3.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=4,Q=4 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling1.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-polling4_4-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=4,Q=4 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-polling4_4-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=250 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream1.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-stream250-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=250 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-stream250-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=30 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream1.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-stream30-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=30 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-multi-stream30-2.log


{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs10_2.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs1_single.csl  -tm -stats ; } |& tee  $LOGS_DIR/storm-single-jobs10_2-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs10_2.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-jobs10_2-6.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs12_3.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs1_single.csl  -tm -stats ; } |& tee  $LOGS_DIR/storm-single-jobs12_3-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/jobs/jobs12_3.ma --prop $BENCHMARK_DIR/ma/jobs/singleobjective/jobs2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-jobs12_3-2.log


{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/mutex/mutex.ma -const N=2 --prop $BENCHMARK_DIR/ma/mutex/singleobjective/mutex1_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-mutex2-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/mutex/mutex.ma -const N=2 --prop $BENCHMARK_DIR/ma/mutex/singleobjective/mutex2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-mutex2-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=3,Q=3 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling1_single.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-single-polling3_3-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=3,Q=3 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-polling3_3-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=4,Q=4 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling1_single.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-single-polling4_4-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/polling/polling.ma -const N=4,Q=4 --prop $BENCHMARK_DIR/ma/polling/singleobjective/polling2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-polling4_4-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=250 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream1_single.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-single-stream250-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=250 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-stream250-2.log

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=30 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream1_single.csl -tm -stats ; } |& tee  $LOGS_DIR/storm-single-stream30-1.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/ma/stream/stream.ma -const N=30 --prop $BENCHMARK_DIR/ma/stream/singleobjective/stream2_single.csl --precision 0.01 -tm -stats ; } |& tee  $LOGS_DIR/storm-single-stream30-2.log


{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs10_2-1.ma -min -et ; } |& tee  $LOGS_DIR/imca-jobs10_2_1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs10_2-2.ma -max -tb -T 1.25 -e 0.01 ; } |& tee  $LOGS_DIR/imca-jobs10_2-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs12_3-1.ma -min -et ; } |& tee  $LOGS_DIR/imca-jobs12_3_1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs12_3-2.ma -max -tb -T 1.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-jobs12_3-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/mutex/imca/mutex2-1.ma -max -tb -T 1.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-mutex2-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/mutex/imca/mutex2-2.ma -max -tb -T 0.5 -e 0.01 ; } |& tee  $LOGS_DIR/imca-mutex2-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling3_3-1.ma -max -er ; } |& tee  $LOGS_DIR/imca-polling3_3-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling3_3-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-polling3_3-2.log


{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling4_4-1.ma -max -er ; } |& tee  $LOGS_DIR/imca-polling4_4-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling4_4-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-polling4_4-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream30-1.ma -min -er ; } |& tee  $LOGS_DIR/imca-stream30-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream30-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-stream30-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream250-1.ma -min -er ; } |& tee  $LOGS_DIR/imca-stream250-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream250-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  $LOGS_DIR/imca-stream250-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs10_2-1.ma -min -et -val ; } |& tee  $LOGS_DIR/imca-val-jobs10_2-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs10_2-2.ma -max -tb -T 1.25 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-jobs10_2-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs12_3-1.ma -min -et -val ; } |& tee  $LOGS_DIR/imca-val-jobs12_3-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/jobs/imca/jobs12_3-2.ma -max -tb -T 1.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-jobs12_3-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/mutex/imca/mutex2-1.ma -max -tb -T 1.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-mutex2-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/mutex/imca/mutex2-2.ma -max -tb -T 0.5 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-mutex2-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling3_3-1.ma -max -er -val ; } |& tee  $LOGS_DIR/imca-val-polling3_3-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling3_3-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-polling3_3-2.log


{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling4_4-1.ma -max -er -val ; } |& tee  $LOGS_DIR/imca-val-polling4_4-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/polling/imca/polling4_4-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-polling4_4-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream30-1.ma -min -er -val ; } |& tee  $LOGS_DIR/imca-val-stream30-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream30-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-stream30-2.log

{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream250-1.ma -min -er -val ; } |& tee  $LOGS_DIR/imca-val-stream250-1.log
{ time $IMCA_EXECUTABLE  $BENCHMARK_DIR/ma/stream/imca/stream250-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  $LOGS_DIR/imca-val-stream250-2.log

#!/bin/bash

mkdir logs_single

{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/singleobjective/jobs1.csl  -tm -stats ; } |& tee  logs_single/storm-multi-jobs10_2-1.log
{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/singleobjective/jobs2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-jobs10_2-2.log

{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/singleobjective/jobs1.csl  -tm -stats ; } |& tee  logs_single/storm-multi-jobs12_3-1.log
{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/singleobjective/jobs2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-jobs12_3-2.log


{ time ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma -const N=2 --prop models/ma/mutex/singleobjective/mutex1.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-mutex2-1.log
{ time ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma -const N=2 --prop models/ma/mutex/singleobjective/mutex2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-mutex2-2.log

{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=3,Q=3 --prop models/ma/polling/singleobjective/polling1.csl -tm -stats ; } |& tee  logs_single/storm-multi-polling3_3_1.log
{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=3,Q=3 --prop models/ma/polling/singleobjective/polling2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-polling3_3_3.log

{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=4,Q=4 --prop models/ma/polling/singleobjective/polling1.csl -tm -stats ; } |& tee  logs_single/storm-multi-polling4_4-1.log
{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=4,Q=4 --prop models/ma/polling/singleobjective/polling2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-polling4_4-2.log

{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=250 --prop models/ma/stream/singleobjective/stream1.csl -tm -stats ; } |& tee  logs_single/storm-multi-stream250-1.log
{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=250 --prop models/ma/stream/singleobjective/stream2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-stream250-2.log

{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=30 --prop models/ma/stream/singleobjective/stream1.csl -tm -stats ; } |& tee  logs_single/storm-multi-stream30-1.log
{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=30 --prop models/ma/stream/singleobjective/stream2.csl --multiobjective:precision 0.01 -tm -stats ; } |& tee  logs_single/storm-multi-stream30-2.log


{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/singleobjective/jobs1_single.csl  -tm -stats ; } |& tee  logs_single/storm-single-jobs10_2-1.log
{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/singleobjective/jobs2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-jobs10_2-6.log

{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/singleobjective/jobs1_single.csl  -tm -stats ; } |& tee  logs_single/storm-single-jobs12_3-1.log
{ time ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/singleobjective/jobs2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-jobs12_3-2.log


{ time ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma -const N=2 --prop models/ma/mutex/singleobjective/mutex1_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-mutex2-1.log
{ time ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma -const N=2 --prop models/ma/mutex/singleobjective/mutex2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-mutex2-2.log

{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=3,Q=3 --prop models/ma/polling/singleobjective/polling1_single.csl -tm -stats ; } |& tee  logs_single/storm-single-polling3_3-1.log
{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=3,Q=3 --prop models/ma/polling/singleobjective/polling2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-polling3_3-2.log

{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=4,Q=4 --prop models/ma/polling/singleobjective/polling1_single.csl -tm -stats ; } |& tee  logs_single/storm-single-polling4_4-1.log
{ time ~/storm/build/bin/storm --prism models/ma/polling/polling.ma -const N=4,Q=4 --prop models/ma/polling/singleobjective/polling2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-polling4_4-2.log

{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=250 --prop models/ma/stream/singleobjective/stream1_single.csl -tm -stats ; } |& tee  logs_single/storm-single-stream250-1.log
{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=250 --prop models/ma/stream/singleobjective/stream2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-stream250-2.log

{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=30 --prop models/ma/stream/singleobjective/stream1_single.csl -tm -stats ; } |& tee  logs_single/storm-single-stream30-1.log
{ time ~/storm/build/bin/storm --prism models/ma/stream/stream.ma -const N=30 --prop models/ma/stream/singleobjective/stream2_single.csl --precision 0.01 -tm -stats ; } |& tee  logs_single/storm-single-stream30-2.log


{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs10_2-1.ma -min -et ; } |& tee  logs_single/imca-jobs10_2_1.log
{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs10_2-2.ma -max -tb -T 1.25 -e 0.01 ; } |& tee  logs_single/imca-jobs10_2-2.log

{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs12_3-1.ma -min -et ; } |& tee  logs_single/imca-jobs12_3_1.log
{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs12_3-2.ma -max -tb -T 1.0 -e 0.01 ; } |& tee  logs_single/imca-jobs12_3-2.log

{ time ~/imca/bin/imca  models/ma/mutex/imca/mutex2-1.ma -max -tb -T 1.0 -e 0.01 ; } |& tee  logs_single/imca-mutex2-1.log
{ time ~/imca/bin/imca  models/ma/mutex/imca/mutex2-2.ma -max -tb -T 0.5 -e 0.01 ; } |& tee  logs_single/imca-mutex2-2.log

{ time ~/imca/bin/imca  models/ma/polling/imca/polling3_3-1.ma -max -er ; } |& tee  logs_single/imca-polling3_3-1.log
{ time ~/imca/bin/imca  models/ma/polling/imca/polling3_3-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  logs_single/imca-polling3_3-2.log


{ time ~/imca/bin/imca  models/ma/polling/imca/polling4_4-1.ma -max -er ; } |& tee  logs_single/imca-polling4_4-1.log
{ time ~/imca/bin/imca  models/ma/polling/imca/polling4_4-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  logs_single/imca-polling4_4-2.log

{ time ~/imca/bin/imca  models/ma/stream/imca/stream30-1.ma -min -er ; } |& tee  logs_single/imca-stream30-1.log
{ time ~/imca/bin/imca  models/ma/stream/imca/stream30-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  logs_single/imca-stream30-2.log

{ time ~/imca/bin/imca  models/ma/stream/imca/stream250-1.ma -min -er ; } |& tee  logs_single/imca-stream250-1.log
{ time ~/imca/bin/imca  models/ma/stream/imca/stream250-2.ma -min -tb -T 2.0 -e 0.01 ; } |& tee  logs_single/imca-stream250-2.log

{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs10_2-1.ma -min -et -val ; } |& tee  logs_single/imca-val-jobs10_2-1.log
{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs10_2-2.ma -max -tb -T 1.25 -e 0.01 -val ; } |& tee  logs_single/imca-val-jobs10_2-2.log

{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs12_3-1.ma -min -et -val ; } |& tee  logs_single/imca-val-jobs12_3-1.log
{ time ~/imca/bin/imca  models/ma/jobs/imca/jobs12_3-2.ma -max -tb -T 1.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-jobs12_3-2.log

{ time ~/imca/bin/imca  models/ma/mutex/imca/mutex2-1.ma -max -tb -T 1.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-mutex2-1.log
{ time ~/imca/bin/imca  models/ma/mutex/imca/mutex2-2.ma -max -tb -T 0.5 -e 0.01 -val ; } |& tee  logs_single/imca-val-mutex2-2.log

{ time ~/imca/bin/imca  models/ma/polling/imca/polling3_3-1.ma -max -er -val ; } |& tee  logs_single/imca-val-polling3_3-1.log
{ time ~/imca/bin/imca  models/ma/polling/imca/polling3_3-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-polling3_3-2.log


{ time ~/imca/bin/imca  models/ma/polling/imca/polling4_4-1.ma -max -er -val ; } |& tee  logs_single/imca-val-polling4_4-1.log
{ time ~/imca/bin/imca  models/ma/polling/imca/polling4_4-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-polling4_4-2.log

{ time ~/imca/bin/imca  models/ma/stream/imca/stream30-1.ma -min -er -val ; } |& tee  logs_single/imca-val-stream30-1.log
{ time ~/imca/bin/imca  models/ma/stream/imca/stream30-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-stream30-2.log

{ time ~/imca/bin/imca  models/ma/stream/imca/stream250-1.ma -min -er -val ; } |& tee  logs_single/imca-val-stream250-1.log
{ time ~/imca/bin/imca  models/ma/stream/imca/stream250-2.ma -min -tb -T 2.0 -e 0.01 -val ; } |& tee  logs_single/imca-val-stream250-2.log

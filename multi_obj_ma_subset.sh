#!/bin/bash

mkdir logs_subset

{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs_subset/storm_eta0.01-jobs10_2-2.log

{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs_subset/storm_eta0.01-pollingN3_Q3-2.log

{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex1.csl -const N=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs_subset/storm_eta0.01-mutexN2-1.log

{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs_subset/storm_eta0.001-streamN250-1.log

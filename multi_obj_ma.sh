#!/bin/bash
mkdir logs/


# storm_eta0.01

# job scheduling
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs10_2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs12_3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs17_2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs10_2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs12_3-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs17_2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs10_2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs12_3-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs17_2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs10_2-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs12_3-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-jobs17_2-4.log

# polling
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=3,Q=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=4,Q=4 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN4_Q4-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=3,Q=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q3-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=4,Q=4 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN4_Q4-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=3,Q=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q3-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=4,Q=4 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN4_Q4-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=3,Q=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q2-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=3,Q=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN3_Q3-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=4,Q=4 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-pollingN4_Q4-4.log

# stream
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=30 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN30-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=250 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN250-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=1000 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN1000-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=30 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN30-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=250 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN250-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=1000 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN1000-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=30 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN30-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=250 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN250-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=1000 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN1000-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=30 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN30-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=250 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN250-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=1000 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-streamN1000-4.log

# mutex
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex1.csl -const N=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-mutexN2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex1.csl -const N=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-mutexN3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex2.csl -const N=2 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-mutexN2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex2.csl -const N=3 --multiobjective:precision 0.01 -stats -tm ;} |& tee logs/storm_eta0.01-mutexN3-2.log

# storm_eta0.001

# job scheduling
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs10_2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs12_3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs1.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs17_2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs10_2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs12_3-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs2.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs17_2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs10_2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs12_3-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs3.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs17_2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs10_2.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs10_2-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs12_3.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs12_3-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/jobs/jobs17_2.ma --prop models/ma/jobs/jobs4.csl --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-jobs17_2-4.log

# polling
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=3,Q=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=3,Q=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling1.csl -const N=4,Q=4 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN4_Q4-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=3,Q=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=3,Q=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q3-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling2.csl -const N=4,Q=4 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN4_Q4-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=3,Q=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q2-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=3,Q=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q3-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling3.csl -const N=4,Q=4 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN4_Q4-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=3,Q=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q2-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=3,Q=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN3_Q3-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/polling/polling.ma --prop models/ma/polling/polling4.csl -const N=4,Q=4 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-pollingN4_Q4-4.log

# stream
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=30 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN30-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN250-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream1.csl -const N=1000 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN1000-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=30 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN30-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN250-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream2.csl -const N=1000 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN1000-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=30 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN30-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN250-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream3.csl -const N=1000 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN1000-3.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=30 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN30-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=250 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN250-4.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/stream/stream.ma --prop models/ma/stream/stream4.csl -const N=1000 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-streamN1000-4.log

# mutex
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex1.csl -const N=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-mutexN2-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex1.csl -const N=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-mutexN3-1.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex2.csl -const N=2 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-mutexN2-2.log
{ time timeout 7200 ~/storm/build/bin/storm --prism models/ma/mutex/mutex.ma --prop models/ma/mutex/mutex2.csl -const N=3 --multiobjective:precision 0.001 -stats -tm ;} |& tee logs/storm_eta0.001-mutexN3-2.log

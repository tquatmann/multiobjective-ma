#!/bin/bash
 
source settings.sh

LOGS_DIR=$LOGS_ROOT/multi-mdp
mkdir -p $LOGS_DIR

{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus2_3_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus2_3_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus2_3_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus2_4_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus2_4_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus2_4_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus2_5_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus2_5_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus2_5_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus3_3_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus3_3_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus3_3_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus3_4_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus3_4_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus3_4_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/consensus/consensus3_5_2.nm --prop $BENCHMARK_DIR/mdp/consensus/consensus3_5_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_1_consensus3_5_2.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf/zeroconf4.nm --prop $BENCHMARK_DIR/mdp/zeroconf/zeroconf4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_2_zeroconf4.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf/zeroconf6.nm --prop $BENCHMARK_DIR/mdp/zeroconf/zeroconf6_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_2_zeroconf6.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10.nm --prop $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_3_zeroconf-tb4_10.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14.nm --prop $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_3_zeroconf-tb4_14.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team2obj_3.nm --prop $BENCHMARK_DIR/mdp/team/team2obj_3_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_4_team2obj_3.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team3obj_3.nm --prop $BENCHMARK_DIR/mdp/team/team3obj_3_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_5_team3obj_3.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team2obj_4.nm --prop $BENCHMARK_DIR/mdp/team/team2obj_4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_4_team2obj_4.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team3obj_4.nm --prop $BENCHMARK_DIR/mdp/team/team3obj_4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_5_team3obj_4.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team2obj_5.nm --prop $BENCHMARK_DIR/mdp/team/team2obj_5_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_4_team2obj_5.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/team/team3obj_5.nm --prop $BENCHMARK_DIR/mdp/team/team3obj_5_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_5_team3obj_5.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf/zeroconf8.nm --prop $BENCHMARK_DIR/mdp/zeroconf/zeroconf8_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_2_zeroconf8.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14.nm --prop $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_3_zeroconf-tb2_14.log 
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/scheduler/scheduler05.nm --prop $BENCHMARK_DIR/mdp/scheduler/scheduler05_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_6_scheduler05.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/scheduler/scheduler25.nm --prop $BENCHMARK_DIR/mdp/scheduler/scheduler25_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_6_scheduler25.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/scheduler/scheduler50.nm --prop $BENCHMARK_DIR/mdp/scheduler/scheduler50_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_6_scheduler50.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/dpm/dpm100.nm --prop $BENCHMARK_DIR/mdp/dpm/dpm100_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_7_dpm100.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/dpm/dpm200.nm --prop $BENCHMARK_DIR/mdp/dpm/dpm200_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_7_dpm200.log
{ time $STORM_EXECUTABLE --prism $BENCHMARK_DIR/mdp/dpm/dpm300.nm --prop $BENCHMARK_DIR/mdp/dpm/dpm300_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  $LOGS_DIR/storm_7_dpm300.log

{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_3_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus2_3_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_4_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus2_4_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_5_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus2_5_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_3_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus3_3_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_4_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus3_4_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_5_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_1_consensus3_5_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf4.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_2_zeroconf4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf6.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf6_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_2_zeroconf6.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_3_zeroconf-tb4_10.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_3_zeroconf-tb4_14.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_3.nm  $BENCHMARK_DIR/mdp/team/team2obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_4_team2obj_3.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_3.nm  $BENCHMARK_DIR/mdp/team/team3obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_5_team3obj_3.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_4.nm  $BENCHMARK_DIR/mdp/team/team2obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_4_team2obj_4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_4.nm  $BENCHMARK_DIR/mdp/team/team3obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_5_team3obj_4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_5.nm  $BENCHMARK_DIR/mdp/team/team2obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_4_team2obj_5.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_5.nm  $BENCHMARK_DIR/mdp/team/team3obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_5_team3obj_5.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf8.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf8_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_2_zeroconf8.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_3_zeroconf-tb2_14.log 
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler05.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler05_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_6_scheduler05.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler25.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler25_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_6_scheduler25.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler50.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler50_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_6_scheduler50.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm100.nm  $BENCHMARK_DIR/mdp/dpm/dpm100_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_7_dpm100.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm200.nm  $BENCHMARK_DIR/mdp/dpm/dpm200_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_7_dpm200.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm300.nm  $BENCHMARK_DIR/mdp/dpm/dpm300_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  $LOGS_DIR/prism_7_dpm300.log

{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_3_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus2_3_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_4_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus2_4_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus2_5_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus2_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus2_5_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_3_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus3_3_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_4_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus3_4_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/consensus/consensus3_5_2.nm  $BENCHMARK_DIR/mdp/consensus/consensus3_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_1_consensus3_5_2.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf4.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_2_zeroconf4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf6.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf6_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_2_zeroconf6.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_3_zeroconf-tb4_10.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_3_zeroconf-tb4_14.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_3.nm  $BENCHMARK_DIR/mdp/team/team2obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_4_team2obj_3.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_3.nm  $BENCHMARK_DIR/mdp/team/team3obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_5_team3obj_3.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_4.nm  $BENCHMARK_DIR/mdp/team/team2obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_4_team2obj_4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_4.nm  $BENCHMARK_DIR/mdp/team/team3obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_5_team3obj_4.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team2obj_5.nm  $BENCHMARK_DIR/mdp/team/team2obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_4_team2obj_5.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/team/team3obj_5.nm  $BENCHMARK_DIR/mdp/team/team3obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_5_team3obj_5.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf/zeroconf8.nm  $BENCHMARK_DIR/mdp/zeroconf/zeroconf8_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_2_zeroconf8.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14.nm  $BENCHMARK_DIR/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_3_zeroconf-tb2_14.log 
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler05.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler05_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_6_scheduler05.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler25.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler25_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_6_scheduler25.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/scheduler/scheduler50.nm  $BENCHMARK_DIR/mdp/scheduler/scheduler50_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_6_scheduler50.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm100.nm  $BENCHMARK_DIR/mdp/dpm/dpm100_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_7_dpm100.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm200.nm  $BENCHMARK_DIR/mdp/dpm/dpm200_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_7_dpm200.log
{ time $PRISM_EXECUTABLE $BENCHMARK_DIR/mdp/dpm/dpm300.nm  $BENCHMARK_DIR/mdp/dpm/dpm300_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  $LOGS_DIR/prism-gs_7_dpm300.log

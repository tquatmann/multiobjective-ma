#!/bin/bash

mkdir logs_mdp
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus2_3_2.nm --prop models/mdp/consensus/consensus2_3_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus2_3_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus2_4_2.nm --prop models/mdp/consensus/consensus2_4_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus2_4_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus2_5_2.nm --prop models/mdp/consensus/consensus2_5_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus2_5_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus3_3_2.nm --prop models/mdp/consensus/consensus3_3_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus3_3_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus3_4_2.nm --prop models/mdp/consensus/consensus3_4_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus3_4_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/consensus/consensus3_5_2.nm --prop models/mdp/consensus/consensus3_5_2_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_1_consensus3_5_2.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf/zeroconf4.nm --prop models/mdp/zeroconf/zeroconf4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_2_zeroconf4.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf/zeroconf6.nm --prop models/mdp/zeroconf/zeroconf6_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_2_zeroconf6.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf-tb/zeroconf-tb4_10.nm --prop models/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_3_zeroconf-tb4_10.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf-tb/zeroconf-tb4_14.nm --prop models/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_3_zeroconf-tb4_14.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team2obj_3.nm --prop models/mdp/team/team2obj_3_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_4_team2obj_3.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team3obj_3.nm --prop models/mdp/team/team3obj_3_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_5_team3obj_3.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team2obj_4.nm --prop models/mdp/team/team2obj_4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_4_team2obj_4.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team3obj_4.nm --prop models/mdp/team/team3obj_4_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_5_team3obj_4.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team2obj_5.nm --prop models/mdp/team/team2obj_5_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_4_team2obj_5.log
{ time ~/storm/build/bin/storm --prism models/mdp/team/team3obj_5.nm --prop models/mdp/team/team3obj_5_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_5_team3obj_5.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf/zeroconf8.nm --prop models/mdp/zeroconf/zeroconf8_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_2_zeroconf8.log
{ time ~/storm/build/bin/storm --prism models/mdp/zeroconf-tb/zeroconf-tb2_14.nm --prop models/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_3_zeroconf-tb2_14.log 
{ time ~/storm/build/bin/storm --prism models/mdp/scheduler/scheduler05.nm --prop models/mdp/scheduler/scheduler05_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_6_scheduler05.log
{ time ~/storm/build/bin/storm --prism models/mdp/scheduler/scheduler25.nm --prop models/mdp/scheduler/scheduler25_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_6_scheduler25.log
{ time ~/storm/build/bin/storm --prism models/mdp/scheduler/scheduler50.nm --prop models/mdp/scheduler/scheduler50_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_6_scheduler50.log
{ time ~/storm/build/bin/storm --prism models/mdp/dpm/dpm100.nm --prop models/mdp/dpm/dpm100_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_7_dpm100.log
{ time ~/storm/build/bin/storm --prism models/mdp/dpm/dpm200.nm --prop models/mdp/dpm/dpm200_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_7_dpm200.log
{ time ~/storm/build/bin/storm --prism models/mdp/dpm/dpm300.nm --prop models/mdp/dpm/dpm300_pareto.pctl --multiobjective:precision 0.001 -tm -stats ; } |& tee  logs_mdp/storm_7_dpm300.log

{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_3_2.nm  models/mdp/consensus/consensus2_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus2_3_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_4_2.nm  models/mdp/consensus/consensus2_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus2_4_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_5_2.nm  models/mdp/consensus/consensus2_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus2_5_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_3_2.nm  models/mdp/consensus/consensus3_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus3_3_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_4_2.nm  models/mdp/consensus/consensus3_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus3_4_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_5_2.nm  models/mdp/consensus/consensus3_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_1_consensus3_5_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf4.nm  models/mdp/zeroconf/zeroconf4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_2_zeroconf4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf6.nm  models/mdp/zeroconf/zeroconf6_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_2_zeroconf6.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb4_10.nm  models/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_3_zeroconf-tb4_10.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb4_14.nm  models/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_3_zeroconf-tb4_14.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_3.nm  models/mdp/team/team2obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_4_team2obj_3.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_3.nm  models/mdp/team/team3obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_5_team3obj_3.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_4.nm  models/mdp/team/team2obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_4_team2obj_4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_4.nm  models/mdp/team/team3obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_5_team3obj_4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_5.nm  models/mdp/team/team2obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_4_team2obj_5.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_5.nm  models/mdp/team/team3obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_5_team3obj_5.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf8.nm  models/mdp/zeroconf/zeroconf8_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_2_zeroconf8.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb2_14.nm  models/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_3_zeroconf-tb2_14.log 
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler05.nm  models/mdp/scheduler/scheduler05_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_6_scheduler05.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler25.nm  models/mdp/scheduler/scheduler25_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_6_scheduler25.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler50.nm  models/mdp/scheduler/scheduler50_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_6_scheduler50.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm100.nm  models/mdp/dpm/dpm100_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_7_dpm100.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm200.nm  models/mdp/dpm/dpm200_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_7_dpm200.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm300.nm  models/mdp/dpm/dpm300_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g ; } |& tee  logs_mdp/prism_7_dpm300.log

{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_3_2.nm  models/mdp/consensus/consensus2_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus2_3_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_4_2.nm  models/mdp/consensus/consensus2_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus2_4_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus2_5_2.nm  models/mdp/consensus/consensus2_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus2_5_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_3_2.nm  models/mdp/consensus/consensus3_3_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus3_3_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_4_2.nm  models/mdp/consensus/consensus3_4_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus3_4_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/consensus/consensus3_5_2.nm  models/mdp/consensus/consensus3_5_2_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_1_consensus3_5_2.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf4.nm  models/mdp/zeroconf/zeroconf4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_2_zeroconf4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf6.nm  models/mdp/zeroconf/zeroconf6_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_2_zeroconf6.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb4_10.nm  models/mdp/zeroconf-tb/zeroconf-tb4_10_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_3_zeroconf-tb4_10.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb4_14.nm  models/mdp/zeroconf-tb/zeroconf-tb4_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_3_zeroconf-tb4_14.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_3.nm  models/mdp/team/team2obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_4_team2obj_3.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_3.nm  models/mdp/team/team3obj_3_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_5_team3obj_3.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_4.nm  models/mdp/team/team2obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_4_team2obj_4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_4.nm  models/mdp/team/team3obj_4_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_5_team3obj_4.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team2obj_5.nm  models/mdp/team/team2obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_4_team2obj_5.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/team/team3obj_5.nm  models/mdp/team/team3obj_5_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_5_team3obj_5.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf/zeroconf8.nm  models/mdp/zeroconf/zeroconf8_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_2_zeroconf8.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/zeroconf-tb/zeroconf-tb2_14.nm  models/mdp/zeroconf-tb/zeroconf-tb2_14_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_3_zeroconf-tb2_14.log 
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler05.nm  models/mdp/scheduler/scheduler05_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_6_scheduler05.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler25.nm  models/mdp/scheduler/scheduler25_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_6_scheduler25.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/scheduler/scheduler50.nm  models/mdp/scheduler/scheduler50_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_6_scheduler50.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm100.nm  models/mdp/dpm/dpm100_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_7_dpm100.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm200.nm  models/mdp/dpm/dpm200_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_7_dpm200.log
{ time ~/prism-4.3.1-linux64/bin/prism models/mdp/dpm/dpm300.nm  models/mdp/dpm/dpm300_pareto.pctl -paretoepsilon 0.001 -sparse -javamaxmem 20g -gs ; } |& tee  logs_mdp/prism-gs_7_dpm300.log

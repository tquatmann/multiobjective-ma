
// Stochastic Job Scheduling, based on []
// Encoding by Junges & Quatmann
// RWTH Aachen University
// Please cite Quatmann et al: Multi-objective Model Checking of Markov Automata
ma

const int N = 10;
const int K = 2;
const double x_j1 = 1.0;
const double x_j2 = 2.0;
const double x_j3 = 3.0;
const double x_j4 = 1.5;
const double x_j5 = 2.5;
const double x_j6 = 1.7;
const double x_j7 = 2.7;
const double x_j8 = 1.2;
const double x_j9 = 2.2;
const double x_j10 = 1.8;
formula is_running = r_j1 + r_j2 + r_j3 + r_j4 + r_j5 + r_j6 + r_j7 + r_j8 + r_j9 + r_j10 > 0;
formula num_finished = f_j1 + f_j2 + f_j3 + f_j4 + f_j5 + f_j6 + f_j7 + f_j8 + f_j9 + f_j10;
module main
	r_j1 : [0..1];
	r_j2 : [0..1];
	r_j3 : [0..1];
	r_j4 : [0..1];
	r_j5 : [0..1];
	r_j6 : [0..1];
	r_j7 : [0..1];
	r_j8 : [0..1];
	r_j9 : [0..1];
	r_j10 : [0..1];
	f_j1 : [0..1];
	f_j2 : [0..1];
	f_j3 : [0..1];
	f_j4 : [0..1];
	f_j5 : [0..1];
	f_j6 : [0..1];
	f_j7 : [0..1];
	f_j8 : [0..1];
	f_j9 : [0..1];
	f_j10 : [0..1];
	<> (r_j1 = 1)  -> x_j1 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j1' = 1);
	<> (r_j2 = 1)  -> x_j2 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j2' = 1);
	<> (r_j3 = 1)  -> x_j3 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j3' = 1);
	<> (r_j4 = 1)  -> x_j4 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j4' = 1);
	<> (r_j5 = 1)  -> x_j5 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j5' = 1);
	<> (r_j6 = 1)  -> x_j6 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j6' = 1);
	<> (r_j7 = 1)  -> x_j7 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j7' = 1);
	<> (r_j8 = 1)  -> x_j8 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j8' = 1);
	<> (r_j9 = 1)  -> x_j9 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j9' = 1);
	<> (r_j10 = 1)  -> x_j10 : (r_j1' = 0) & (r_j2' = 0) & (r_j3' = 0) & (r_j4' = 0) & (r_j5' = 0) & (r_j6' = 0) & (r_j7' = 0) & (r_j8' = 0) & (r_j9' = 0) & (r_j10' = 0) & (f_j10' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j1 = 0) -> 1: (r_j1' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j2 = 0) -> 1: (r_j2' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j3 = 0) -> 1: (r_j3' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j4 = 0) -> 1: (r_j4' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j5 = 0) -> 1: (r_j5' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j6 = 0) -> 1: (r_j6' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j7 = 0) -> 1: (r_j7' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j8 = 0) -> 1: (r_j8' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j9 = 0) -> 1: (r_j9' = 1);
	[] (!is_running) & (num_finished = 9) & (f_j10 = 0) -> 1: (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j2 = 0) -> 1: (r_j1' = 1) & (r_j2' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j3 = 0) -> 1: (r_j1' = 1) & (r_j3' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j4 = 0) -> 1: (r_j1' = 1) & (r_j4' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j5 = 0) -> 1: (r_j1' = 1) & (r_j5' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j6 = 0) -> 1: (r_j1' = 1) & (r_j6' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j7 = 0) -> 1: (r_j1' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j8 = 0) -> 1: (r_j1' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j9 = 0) -> 1: (r_j1' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j1 = 0) & (f_j10 = 0) -> 1: (r_j1' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j3 = 0) -> 1: (r_j2' = 1) & (r_j3' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j4 = 0) -> 1: (r_j2' = 1) & (r_j4' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j5 = 0) -> 1: (r_j2' = 1) & (r_j5' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j6 = 0) -> 1: (r_j2' = 1) & (r_j6' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j7 = 0) -> 1: (r_j2' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j8 = 0) -> 1: (r_j2' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j9 = 0) -> 1: (r_j2' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j2 = 0) & (f_j10 = 0) -> 1: (r_j2' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j4 = 0) -> 1: (r_j3' = 1) & (r_j4' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j5 = 0) -> 1: (r_j3' = 1) & (r_j5' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j6 = 0) -> 1: (r_j3' = 1) & (r_j6' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j7 = 0) -> 1: (r_j3' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j8 = 0) -> 1: (r_j3' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j9 = 0) -> 1: (r_j3' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j3 = 0) & (f_j10 = 0) -> 1: (r_j3' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j5 = 0) -> 1: (r_j4' = 1) & (r_j5' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j6 = 0) -> 1: (r_j4' = 1) & (r_j6' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j7 = 0) -> 1: (r_j4' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j8 = 0) -> 1: (r_j4' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j9 = 0) -> 1: (r_j4' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j4 = 0) & (f_j10 = 0) -> 1: (r_j4' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j5 = 0) & (f_j6 = 0) -> 1: (r_j5' = 1) & (r_j6' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j5 = 0) & (f_j7 = 0) -> 1: (r_j5' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j5 = 0) & (f_j8 = 0) -> 1: (r_j5' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j5 = 0) & (f_j9 = 0) -> 1: (r_j5' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j5 = 0) & (f_j10 = 0) -> 1: (r_j5' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j6 = 0) & (f_j7 = 0) -> 1: (r_j6' = 1) & (r_j7' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j6 = 0) & (f_j8 = 0) -> 1: (r_j6' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j6 = 0) & (f_j9 = 0) -> 1: (r_j6' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j6 = 0) & (f_j10 = 0) -> 1: (r_j6' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j7 = 0) & (f_j8 = 0) -> 1: (r_j7' = 1) & (r_j8' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j7 = 0) & (f_j9 = 0) -> 1: (r_j7' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j7 = 0) & (f_j10 = 0) -> 1: (r_j7' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j8 = 0) & (f_j9 = 0) -> 1: (r_j8' = 1) & (r_j9' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j8 = 0) & (f_j10 = 0) -> 1: (r_j8' = 1) & (r_j10' = 1);
	[] (!is_running) & (num_finished <= 8) & (f_j9 = 0) & (f_j10 = 0) -> 1: (r_j9' = 1) & (r_j10' = 1);
endmodule
init
	r_j1 = 0 &
	r_j2 = 0 &
	r_j3 = 0 &
	r_j4 = 0 &
	r_j5 = 0 &
	r_j6 = 0 &
	r_j7 = 0 &
	r_j8 = 0 &
	r_j9 = 0 &
	r_j10 = 0 &
	f_j1 = 0 &
	f_j2 = 0 &
	f_j3 = 0 &
	f_j4 = 0 &
	f_j5 = 0 &
	f_j6 = 0 &
	f_j7 = 0 &
	f_j8 = 0 &
	f_j9 = 0 &
	f_j10 = 0
endinit
label "all_jobs_finished" = num_finished=N;
label "half_of_jobs_finished" = num_finished=5;
label "slowest_before_fastest" = f_j1=1 & f_j3=0;
rewards "avg_waiting_time"
 true : (N-num_finished)/N;
endrewards

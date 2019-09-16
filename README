# Markov Automata with Multiple Objectives

This repository contains benchmark files for multi-objective model checking
of Markov Automata


## Multi-objective model checking with Storm

We have integrated multi-objective model checking of Markov Automata (MAs) 
and Markov Decision Processes (MDPs) into the model checker Storm. 
Please visit www.stormchecker.org to obtain a recent versio of Storm.
When storm has been installed, it can be invoked via
	path/to/storm/build/bin/storm (OPTIONS)
where (OPTIONS) is a list of options. For example,
	cd models/ma/jobs/
	path/to/storm/build/bin/ --prism jobs10_2.ma --prop jobs1.csl --multiobjective:precision 0.01
checks the multi-objective query given in the file jobs1.csl on the Markov
Automaton described in the file jobs10_2.ma with a precision of \eta=0.01.

Markov Automata are specified in the PRISM Language, where probabilistic
transitions are described with the standard syntax for PRISM commands:
	[] guard -> prob_1 : update_1 + ... + prob_n : update_n;
while Markovian transitions are denoted as follows:
	<> guard -> rate_1 : update_1 + ... + rate_n : update_n;

Below, we list the most relevant options for multi-objective model checking wit Storm.

* `--help` displays the most important options for Storm
* `--help all` displays all the options for Storm
* `--prism (FILE)` sets the input model file in the PRISM input language.
* `--prop (PROPERTY)` sets the considered property (i.e., multi-objecctive query).
  (PROPERTY) can either be a path to a file containing the property or the property itself,
  e.g., `--prop 'multi(Pmin=? [F "fail"], Rmax=? [F "done"])'`
* `-const (CONST)` sets unspecified constants of the model, e.g., -const N=3,Q=2
* `-stats -tm` displays additional statistics of the computation
* `--precision (EPSILON)` sets the precision of the underlying value-iteration solver to (EPSILON)
* `--multiobjective:precision (ETA)` sets the precision of the approximation of the Pareto curve to (ETA)
* `--multiobjective:maxsteps (i)` limits the number of performed refinement steps to (i)
` --multiobjective:exportplot (DIRECTORY)`  Saves various data for plotting the approximation of the Pareto curve.
  Only works if exactly two objectives are considered. The data is stored into files located at (DIRECTORY)*.csv

More information can be found on the website of Storm:

http://www.stormchecker.org/documentation/usage/running-storm.html
http://www.stormchecker.org/documentation/usage/properties.html


## Benchmarking scripts

We provide a few scripts that can help with the execution of the benchmarks.
Note that a user might need to adapt the paths in these scripts to make them work on his or her machine.

* `./pareto_curve.sh`  invokes Storm in a way that it exports the resulting over- and under-approximation in .csv files located at `~/Desktop/plot/`.
Afterwards, a simple python script is invoked to display the result.
* `./multi_obj_ma.sh`  calls Storm for different MA case studies and objectives and stores the output into different log files located at `~/Desktop/logs/`.
* `./multi_obj_ma_subset.sh` only considers a small subset of the MA benchmarks.
* `./multi_obj_mdp.sh` calls Storm and PRISM for the different case studies. The resulting log files are stored in `~/Desktop/logs_mdp/`. 
For PRISM, we consider standard value iteration (see log files "prism_*.log") and Gauss-Seidel value iteration (see log files "prism-gs_*.log").
* `./single_obj_ma.sh` calls Storm and IMCA for the different case studies. The resulting log files are stored in `~/Desktop/logs_single/`. 
We consider IMCA with and without enabling expected-time value iteration (see log files "imca-val*.log" and "imca-*.log", respectively)


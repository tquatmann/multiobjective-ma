import sys, os, re, json, functools
from collections import OrderedDict

# Settings

known_errors = dict()
known_errors["ERROR: -9"] = "MO"
known_errors["ERROR: 137"] = "MO"
known_errors["Exception in thread \"main\" java.lang.OutOfMemoryError"] = "MO"
known_errors["Error: We only support steady state (long-run) rewards"] = ""
known_errors["Exception in thread \"main\" java.lang.ArrayIndexOutOfBoundsException"] = ""
known_errors["Error: Iterative method did not converge within 10000 iterations."] = "no convergence"
known_errors["ERROR (StandardPcaaWeightVectorChecker.cpp:43): There is no Pareto optimal scheduler that yields finite reward for all objectives. This is not supported."] = "$\infty$ reward detected"
known_errors["Error: Pareto curve generation is currently only supported for 2 objectives."] = "${>}2$ objectives not supported"
scriptdir = os.path.dirname(os.path.realpath(__file__)) # directory of this script
outputdir = os.path.join(scriptdir, "output/")


# Auxiliary functions        
    
def find_all(input_str, search_str, start = 0):
    # Returns an array of all (non-overlapping) occurences of search_str
    assert len(search_str) > 0
    pos = input_str.find(search_str, start)
    if pos < 0:
        return []
    else:
        return [pos] + find_all(input_str, search_str, pos + len(search_str))
        
def find_before_after(input_str, search_str, start = 0):
    # like str.find, but also returns the first position after the search str (or -1 if it does not occur)
    pos = input_str.find(search_str, start)
    if pos < 0:
        return pos, pos
    else:
        return pos, pos + len(search_str)

def get_line_content(line, before, after):
    if line.startswith(before) and line.endswith(after):
        start = len(before)
        end = -len(after)
        return line[start:end]
    return None

def set_entry(data, key, value):
    if value is not None:
        assert key not in data, "Multiple keys '{}' in data".format(key)
        data[key] = value

def set_objective_counts(data):
    if "objcount" in data:
        all_obj = int(data["objcount"])
        unb = int(data["unbobjcount"])
        rew = int(data["totobjcount"]) - unb
        data["objcounts"] = "({},{},{})".format(unb, rew, all_obj-unb-rew)
        data["rewobjcount"] = str(rew)
        data["bndobjcount"] = str(all_obj-unb-rew)

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False
        
def read_data_from_logfile(logfiledir, logfilename):
    result = OrderedDict()
    set_entry(result, "log", logfilename)
    # obtain data from filename
    for tool in ["storm","prism","imca"]:
        if logfilename.startswith(tool):
            set_entry(result,"tool", tool)
    for config in ["eta0.001","eta0.01", "gs", "val", "multi", "single"]:
        if config in logfilename:
            set_entry(result,"config",config)
            if config.startswith("eta"):
                set_entry(result, "precision", "-2" if "eta0.01"==config else "-3")
    if result["tool"] == "storm" and "config" in result:
        result["toolcfg"] = r"\storm (" + result["config"] + ")"
    else:
        result["toolcfg"] = "\\" + result["tool"]
    for benchmark in ["jobs", "mutex","polling","stream","consensus","dpm","scheduler","team","zeroconf","zeroconf-tb"]:
        if benchmark in logfilename:
            if benchmark != "zeroconf" or "zeroconf-tb" not in logfilename:
                set_entry(result, "benchmark", benchmark)
                pos1 = logfilename.find(benchmark) + len(benchmark)
                pos2 = len(logfilename) - 4
                for i in range(1,5):
                    if "-{}.log".format(i) in logfilename:
                        set_entry(result,"propertyid", str(i))
                        pos2 -= 2
                set_entry(result,"instance", logfilename[pos1:pos2].replace("N","").replace("Q",""))
    set_entry(result, "instance-pretty", "-".join(result["instance"].split("_")).replace("--","-").replace("2obj-", "").replace("3obj-",""))
    set_entry(result, "benchmark-pretty", "job scheduling" if result["benchmark"] == "jobs" else result["benchmark"])
    if result["benchmark"] == "mutex": result["benchmark"] = "zmutex" # make mutex appear at the end..
    if is_number(result["instance"]):
        result["instance"] = "0" * (4-len(result["instance"])) + result["instance"] # add leading zeros so that 0030 < 1000
    # obtain data from file contents
    logdata = OrderedDict()
    with open(os.path.join(logfiledir, logfilename), 'r') as logfile:
        input_model_info = 0 # Whether we currently see information regarding the input model
        untimed_obj_count = 0
        for line in logfile:            
            # check if this line indicates a known error
            for known_error_message in known_errors:
                if known_error_message in line: set_entry(result, "error-message", known_errors[known_error_message])
            # go through the header of the file (inserted by our scripts)
            set_entry(result, "command", get_line_content(line, "\tCommand being timed: ", "\n"))
            set_entry(result, "walltime-str", get_line_content(line, "\tElapsed (wall clock) time (h:mm:ss or m:ss): ", "\n"))
            set_entry(result, "error", get_line_content(line, "\tExit status: ", "\n"))
            if result["tool"] == "storm":
                if "config" not in result or result["config"] != "single":
                    if line.startswith("Time for model construction:"): input_model_info = 1
                    if input_model_info > 0:
                        if line.startswith("Model type: \t"):
                            set_entry(result, "modeltype", "mdp" if "MDP" in line else "ma")
                        set_entry(result, "inputstates", get_line_content(line, "States: \t","\n"))
                        set_entry(result, "inputtransitions", get_line_content(line, "Transitions: \t","\n"))
                        set_entry(result, "inputchoices", get_line_content(line, "Choices: \t","\n"))
                        set_entry(result, "inputmarkovianstates", get_line_content(line, "Markovian St.: \t","\n"))
                        set_entry(result, "inputmaxrate", get_line_content(line, "Max. Rate: \t","\n"))
                        set_entry(result, "inputmaxrate", get_line_content(line, "Max. Rate.: \t","\n"))
                        if line == "-------------------------------------------------------------- \n":
                            input_model_info = 2 if input_model_info == 1 else 0
                    set_entry(result, "wwcount", get_line_content(line, "Pareto Curve Approximation Algorithm terminated after "," refinement steps.\n"))
                    set_entry(result, "ppcount", get_line_content(line, ""," Pareto optimal points found:\n"))
                    set_entry(result, "objcount", get_line_content(line, "The query considers "," objectives:\n"))
                    set_entry(result, "lraobjcount", get_line_content(line, "Number of Long-Run-Average Reward Objectives (after preprocessing): ",".\n"))
                    set_entry(result, "totobjcount", get_line_content(line, "Number of Total Reward Objectives (after preprocessing): ",".\n"))
                    if line.startswith("Original: Pmax=?") or line.startswith("Original: Pmin=?"):
                        if "Preprocessed: R[exp]{\"obj" in line and "true U<=" not in line:
                            untimed_obj_count += 1
                    if line.startswith("Solving multi-objective query took"):
                        pos = line.find("seconds for preprocessing and ")
                        if pos > 0:
                            set_entry(result, "itertime", get_line_content(line[pos:], "seconds for preprocessing and ","s seconds for analyzing the preprocessed model).\n"))
                set_entry(result, "checktime", get_line_content(line, "Time for model checking: ","s.\n"))
            elif result["tool"] == "prism":
                set_entry(result, "itertime", get_line_content(line, "Multi-objective value iterations took "," s.\n"))
                set_entry(result, "checktime", get_line_content(line, "Time for model checking: ","seconds.\n"))
                if line.startswith("Result: [(") and line.endswith("] (value in the initial state)\n"):
                    set_entry(result, "ppcount", str(line.count(",") + 1))
            elif result["tool"] == "imca":
                set_entry(result, "checktime", get_line_content(line, "Computation Time: ", " seconds\n"))
            else: assert False, "Unexpected tool name: '{}'".format(result["tool"])
        assert not input_model_info > 0, "Input model info did not end."        
    # Set derived data
    
    if "error" in result and result["error"] == "0": del result["error"]
    walltimecolons = [-1] + find_all(result["walltime-str"], ":") + [len(result["walltime-str"])]
    walltime_in_sec = 0.0
    for i in range(len(walltimecolons)-1):
        walltime_in_sec *= 60.0
        walltime_in_sec += float(result["walltime-str"][walltimecolons[i]+1:walltimecolons[i+1]])
    result["walltime"] = walltime_in_sec
    if "error" in result and result["error"] == "124":
        set_entry(result, "timeout", int(result["walltime"]))
        del result["error"]
    
    set_entry(result, "unbobjcount", str(untimed_obj_count))
    set_objective_counts(result)
    if "objcount" in result and result["objcount"] == "1":
        if result["rewobjcount"] == "1":
            result["singleobj"] = r"$\mathbb{E}_1$"
        else:
            assert result["bndobjcount"] == "1", "unexepected obj count"
            i = "1"
            if result["benchmark"] == "jobs": i = "2"
            if result["benchmark"] == "zmutex" and result["propertyid"] == "2": i = "4"
            result["singleobj"] = r"$\mathbb{P}^{\le}_" + i + "$"
            
    
    # Some sanity checks
    if "error-message" in result and "error" not in result: result["error"] = True
    assert "error" not in result or "error-message" in result, "Unexpected error '{}' occured.".format(result["error"])

    return result

def find_redundant_information_in_entries(data, key):
    result = None
    resulting_entry = None
    for entry in data:
        if key in entry:
            if resulting_entry is None:
                result = entry[key]
                resulting_entry = entry
            else:
                if result != entry[key]:
                    print("ERROR: Mismatching information '{}': {} says {} but {} says {}".format(key, resulting_entry["log"], result, entry["log"], entry[key]))
    if result is None:
        # print("Unable to find information '{}' in {}".format(key, "\n\t".join([e["log"] for e in data])))
        return ""
    return result

def get_column_for_entry(column_criteria, entry):
    column = []
    for crit in column_criteria:
        for key in crit:
            if key in entry:
                column.append(crit[key].replace("%v", str(entry[key])))
    return column

def get_row_for_entry(row_id_keys, entry):
    row = []
    for key in row_id_keys:
        if key in entry:
            row.append(entry[key])
        else:
            row.append("None")
    return row
                  
def find_unique_entry_for_column(data, column_criteria, column):
    result = None
    for entry in data:
        if column == get_column_for_entry(column_criteria, entry):
            if result is None:
                result = entry
            else:
                print("ERROR: Multiple entries for the same column '{}' exist.".format(column))
    return result

def number_to_small_string(number):
    if number > 9999:
        result = "{:.0e}".format(number)
    elif number < 1:
        if number < 0.001:
            if number < 1e-40:
                result = "0"
            else: result = "{:.0e}".format(number)
        else:
            result = str(float("{:.3f}".format(number)))
    else:
        result = "{:.4g}".format(number)
    epos = result.find("e")
    if epos >= 0:
        result = result[:epos] + r"{\cdot} 10^{" + str(int(result[epos+1:])) + r"}"
    return result

def time_to_string(time):
    if time < 1:
        if time >= 0.01:
            return "{:.2f}".format(time)
        else:
            return "${<}\,0.01$"
    elif time > 999:
        return "{:.4g}".format(time)
    else:
        return "{:.3g}".format(time)
    
def create_table(data, outputfilename, kind):
    # Create some maps that map keys to displayed column names
    row_id_keys = OrderedDict() # How a row is identified
    row_id_keys["benchmark"] = None
    row_id_keys["instance"] = None
    if kind == "multima":
        row_id_keys["instance-pretty"] = "N(-K)"
        row_id_keys["inputstates"] = r"\#states"
        row_id_keys["precision"] = r"$\log_{10}{\eta}$"
    elif kind == "multimdp":
        row_id_keys["instance-pretty"] = "instance"
    elif kind == "madetails":
        row_id_keys["instance-pretty"] = "N(-K)"
    elif kind == "singlema":
        row_id_keys["instance-pretty"] = "N(-K)"    
        row_id_keys["propertyid"] = None
    
    benchmark_data_keys = OrderedDict() # Which additional data for a row is present
    if kind == "multima":
        pass
    elif kind == "multimdp":
        benchmark_data_keys["inputstates"] = r"\#states"
        benchmark_data_keys["objcounts"] = r"$(\lozenge, \mathrm{ER}, \le)$"
    elif kind == "madetails":
        benchmark_data_keys["inputstates"] = r"\#states"
        benchmark_data_keys["inputchoices"] = r"\#choices"
        benchmark_data_keys["inputtransitions"] = r"\#transitions"
        benchmark_data_keys["inputmarkovianstates"] = r"\#MS"
        benchmark_data_keys["inputmaxrate"] = r"$\lambda_\mathrm{max}$"
    elif kind == "singlema":
        benchmark_data_keys["inputstates"] = r"\#states"
        benchmark_data_keys["singleobj"] = r"$\mathbb{O}$"
    
    # The contents of the remaining columns (organized in a hierachical way). 
    # First, columns are distinguished via the first criterion
    # Columns where the first criterion matches will be distinguished by the second criterion and so on.
    # One Criterion can consist of multiple (key, column name)-pairs. If the first key is not present, the second one will be considered and so on.
    # If no key is present, it is assumed that the other criteria in the hirachy already uniquely specify the data entry, i.e., the criterion will be ignored
    # In the column name, we replace %v with the actual value
    column_criteria = []
    if kind == "multima":
        column_criteria.append(OrderedDict( [("propertyid", r"%v$(\lozenge, \mathrm{ER}, \lozenge^I)$")] ))
    elif kind == "multimdp":
        column_criteria.append(OrderedDict( [("tool", r"\%v")] ))
    elif kind == "madetails":
        pass
    elif kind == "singlema":
        column_criteria.append(OrderedDict( [("toolcfg", r"%v")] ))
        
    row_id_cols=len([rid for rid in row_id_keys if row_id_keys[rid] is not None])

    # The number of columns / rows we actually use for each result cell
    if kind == "multima":
        result_cell_columns = 2 
    elif kind == "multimdp":
        result_cell_columns = 4
    elif kind == "madetails":
        result_cell_columns = 0
    elif kind == "singlema":
        result_cell_columns = 1
    result_cell_rows = 1
    
    def column_compare(c1, c2):
        if c1 == c2: return 0
        for i in range(len(column_criteria)):
            if c1[i] != c2[i]:
                cols = list(column_criteria[i].values())
                for j in range(len(column_criteria[i])):
                    column_criteria_id = cols[j][:cols[j].find("%")]
                    if c1[i].startswith(column_criteria_id) and not c2[i].startswith(column_criteria_id):
                        return 1
                    elif c2[i].startswith(column_criteria_id) and not c1[i].startswith(column_criteria_id):
                        return -1
                if c1[i] < c2[i]: return -1
                if c2[i] < c1[i]: return 1
    
    # get the rows and columns of the table
    rows = []
    excluded_rows = [] #potentially filtered out rows
    result_columns = []
    for entry in data:
        row = get_row_for_entry(row_id_keys, entry)
        if row not in rows:
            rows.append(row)
        column = get_column_for_entry(column_criteria, entry)
        if column not in result_columns:
            result_columns.append(column)
    rows.sort()
    result_columns.sort(key=functools.cmp_to_key(column_compare))
    columns = [ ["Benchmark", c] for c in row_id_keys.values() if c is not None ]  + [ ["Data", c] for c in benchmark_data_keys.values() ]
    num_meta_columns = len(columns)
    columns += result_columns
    
    # now get the cells, starting with the header row(s)
    num_header_rows = max([len(column) for column in columns])
    cells = []
    #cells.append(r"\toprule[1.5pt]")
    current_benchmark_name = ""
    for i in range(max(2,len(column_criteria))):
        j = 0
        cells.append([])
        firstcolumn = True
        while j < len(columns):
            cell = columns[j][i] if i < len(columns[j]) else ""
            multicolumnsize = 1
            j = j+1
            while j < len(columns):
                next_cell = columns[j][i] if i < len(columns[j]) else None
                if next_cell is not None and next_cell == cell:
                    multicolumnsize += 1
                else:
                    break
                j = j+1
            if j-1 >= num_meta_columns:
                multicolumnsize *= result_cell_columns
            if multicolumnsize == 0: continue
            rightdelim = ""
            if kind == "multima" and j in [3,4,5,6]: rightdelim += "|"
            if kind == "multimdp" and j in [3,4]: rightdelim += "|"
            if kind == "singlema" and j in [3,4,5]: rightdelim += "|"
            if kind == "multima" and "lozenge" in cell: cell = cell[1:] # strip away the property index
            cells[-1].append("\multicolumn{}{}{}".format(r"{"+str(multicolumnsize)+r"}", r"{c" + rightdelim + r"}" if firstcolumn else r"{c" + rightdelim + r"}" , r"{" + cell +r"}" )) # could add a | on the very left here
            firstcolumn = False
    # insert the remaining rows
    for row in rows:
        # collect all benchmark data relevant for this row
        row_data = [entry for entry in data if row == get_row_for_entry(row_id_keys, entry) and get_column_for_entry(column_criteria, entry) in columns]
        if current_benchmark_name != row_data[0]["benchmark-pretty"]:
            cells.append(r"\midrule")
            rightdelim = ""
            if kind == "multima": rightdelim = "|"
            cells.append(r"\multicolumn{" + str(num_meta_columns) + r"}{c" + rightdelim + r"}{\textbf{" + row_data[0]["benchmark-pretty"] + r"}}")
            if (result_cell_columns > 0):
                for i in range(len(row_data)):
                    entry = row_data[i]
                    rightdelim = ""
                    if kind == "multima":
                        rightdelim = "|" if i+1 < len(row_data) else ""
                        content = "$" + entry["objcounts"] + "$"
                    else:
                        content = "" 
                    cells[-1] += r" & \multicolumn{" + str(result_cell_columns) + r"}{c" + rightdelim + r"}{" + content + r"} "
            cells.append(r"\\" + "\n" + r"\midrule")
        current_benchmark_name = row_data[0]["benchmark-pretty"]
        for rowindex in range(result_cell_rows):
            cells.append([])
            # now fill the columns
            globalcolumnindex = 0
            for column in columns:
                    if len(column) == 0: continue
                    cell = None
                    if column[0] == "Benchmark":
                        for i in range(len(row_id_keys)):
                            if column[1] == list(row_id_keys.values())[i]:
                                if kind != "multima" or column[1] == row_id_keys["precision"]:
                                    cell = [row[i]]
                                elif kind == "multima" and row_data[0]["precision"] == "-2":
                                    cell = [r"\multirow{2}{*}{" + row[i] + r"}"]
                                else:
                                    cell = [""]
                    elif column[0] == "Data":
                        for key in benchmark_data_keys:
                            if column[1] == benchmark_data_keys[key]:
                                
                                cell_contents = str(find_redundant_information_in_entries(row_data, key)).split(" / ")
                                cell_contents = ["${}$".format(number_to_small_string(float(cell_content))) if is_number(cell_content) else cell_content for cell_content in cell_contents]
                                if rowindex < len(cell_contents):
                                    if rowindex == result_cell_rows - 1:
                                        cell = [" / ".join(cell_contents[rowindex:])]
                                    elif rowindex + 1 == len(cell_contents) and result_cell_rows > len(subrows):
                                            cell = [r"\multirow{" + str(result_cell_rows + 1 - len(cell_contents)) + r"}{*}{" + cell_contents[rowindex] + r"}" ]
                                    else:
                                        cell = [cell_contents[rowindex]]
                                else:
                                    cell = [""]
                    else:
                        # get the entry matching this column
                        entry = find_unique_entry_for_column(row_data, column_criteria, column)
                        cell = []
                        for columnindex in range(result_cell_columns):
                            # check whether there is a time out, error, etc
                            if entry is None or "error-message" in entry or "timeout" in entry:
                                if entry is None:
                                    cell_str = ""
                                elif "error-message" in entry:
                                    cell_str = entry["error-message"]
                                elif "timeout" in entry:
                                    cell_str = "TO"
                                if rowindex == 0 and columnindex == 0:
                                    if result_cell_columns > 1:
                                        rightdelim = ""
                                        if cell_str != "":
                                            if kind == "multima" and globalcolumnindex < 6: rightdelim = "|"
                                            if kind == "multimdp" and globalcolumnindex < 4: rightdelim = "|"
                                        cell.append(r"\multicolumn{" + str(result_cell_columns) + r"}{c" + rightdelim + r"}{" + cell_str + r"}")
                                    elif result_cell_rows == 1:
                                        cell.append(cell_str)
                                    else:
                                        cell.append("")
                            else:
                                # get the information displayed for this entry

                                # Branch on rowindex and columnindex
                                
                                assert rowindex == 0, "Did not expect to have multiple rows here."
                                if kind == "multima":
                                    if columnindex == 0:
                                        cell.append(entry["ppcount"])
                                    if columnindex == 1:
                                        cell.append(time_to_string(float(entry["walltime"])))
                                elif kind == "multimdp":
                                    if columnindex == 0:
                                        if "ppcount" in entry:
                                            cell.append(entry["ppcount"])
                                        else:
                                            cell.append("--")
                                    if columnindex == 1:
                                        if "itertime" in entry:
                                            cell.append(time_to_string(float(entry["itertime"])))
                                        else:
                                            cell.append("--")
                                    if columnindex == 2:
                                        if "checktime" not in entry: print(entry)
                                        cell.append(time_to_string(float(entry["checktime"])))
                                    if columnindex == 3:
                                        cell.append(time_to_string(float(entry["walltime"])))
                                elif kind == "singlema":
                                    if columnindex == 0:
                                        cell.append(time_to_string(float(entry["checktime"])))
                    assert cell is not None, "Unable to find entry for row '{}' and column '{}'".format(row, column)
                    cells[-1] += cell
                    globalcolumnindex += 1
    #cells.append(r"\bottomrule[1.5pt]")
    with open(outputfilename, 'w') as outfile:
        latex_columndefstring = "{}{}{}{}".format("c" * row_id_cols, "r" * len(benchmark_data_keys),"|" if result_cell_columns > 0 else "", "|".join(["r" * result_cell_columns] * len(result_columns)))
        outfile.write(r"\begin{tabular}{" + latex_columndefstring + "}\n")
        for row in cells:
            if isinstance(row, str):
                outfile.write(row + "\n")
            else:
                outfile.write(" & ".join(row) + r"\\" + "\n")
        outfile.write(r"\end{tabular}" + "\n")
        
        
def create_csv(data, outputfilename, othertool):
    TIMEOUT_VALUE = 7200 * 2
    MEMOUT_VALUE = TIMEOUT_VALUE * 2
    ERROR_VALUE = MEMOUT_VALUE * 8
    NOT_SUPPORTED_VALUE = ERROR_VALUE * 2
    
    row_id_keys = ["benchmark", "instance", "propertyid"]
    benchmark_data_columns = ["benchmark"]
    
    table = OrderedDict()
    table["header"] = benchmark_data_columns + ["storm", othertool]
    
    for entry in data:        
        row_id = "_".join(get_row_for_entry(row_id_keys, entry))
        if row_id in table:
            # assert same data
            i = 0
            for c in benchmark_data_columns:
                assert entry[c].replace("zmutex","mutex") == table[row_id][i], "Inconsistent data for {}".format(row_id)
                i += 1
        else:
            # insert data for this row
            table[row_id] = [entry[c].replace("zmutex","mutex") for c in benchmark_data_columns] + [str(NOT_SUPPORTED_VALUE)] * len(["storm", othertool])   
        
        # insert tool result
        selected_tool_index = 0
        for selected_tool in ["storm", othertool]:
            if entry["tool"] == selected_tool:
                tool_value = ERROR_VALUE
                if "timeout" in entry and entry["timeout"]:
                    tool_value = TIMEOUT_VALUE
                elif "error-message" in entry:
                    if entry["error-message"] == "MO":
                        tool_value = MEMOUT_VALUE
                    elif entry["error-message"] == "-":
                        tool_value = NOT_SUPPORTED_VALUE
                elif "checktime" in entry:
                    tool_value = entry["checktime"]
                table[row_id][len(benchmark_data_columns) + selected_tool_index] = str(tool_value)
            selected_tool_index += 1
        
    with open(outputfilename, 'w') as outfile:
        for row in table:
            outfile.write(";".join(table[row]) + "\n")
    
    
def parse_logfile_contents(logfiledir):
    logfiles = os.listdir(logfiledir)
    logfiles = sorted(logfiles)
    # parse the contents of the logfiles
    data = OrderedDict()
    for logfilename in logfiles:
        try:
            data[logfilename] = read_data_from_logfile(logfiledir, logfilename)
        except AssertionError as e:
            print("Error while reading data for logfile '{}':\n\t{}".format(logfilename, e))
    return data

def filter_fastest(data, tool):
    instances = OrderedDict()
    output = OrderedDict()
    for entry in data:
        if data[entry]["tool"] == tool:
            inst_id = (data[entry]["benchmark"], data[entry]["instance"], data[entry]["propertyid"] if "propertyid" in data[entry] else None)
            if inst_id in instances:
                instances[inst_id].append(entry)
            else:
                instances[inst_id] = [entry]
        else:
            output[entry] = data[entry]
    for inst_id in instances:
        fastest_time = None
        fastest_entry = None
        for entry in instances[inst_id]:
            if "walltime" in data[entry]:
                curr = float(data[entry]["walltime"])
                if fastest_time is None:
                    fastest_time = curr
                    fastest_entry = entry
                elif fastest_time > curr:
                    fastest_time = curr
                    fastest_entry = entry
        if fastest_entry is None:
            fastest_entry = instances[inst_id][0]
        output[fastest_entry] = data[fastest_entry]
    return output

if __name__ == "__main__":
    print("This script can be used to create latex tables and .csv files once enough experiments have been run.")
    print("Saving output to '{}'.".format(outputdir))
    if not os.path.exists(outputdir):
        os.makedirs(outputdir)
    if len(sys.argv) < 2:
        print("Usage: \n\t{0} <logdir>.".format(sys.argv[0]));
        exit(1)
        
    logfilebasedir = sys.argv[1];
    data = parse_logfile_contents(os.path.join(logfilebasedir, "multi-ma-logs/"))
    create_table([entry for entry in data.values() ], os.path.join(outputdir, "maRes.tex"), "multima")
    create_table([entry for entry in data.values() ], os.path.join(outputdir, "maDetails.tex"), "madetails")
    print("Produced multi-ma results.")
    data = parse_logfile_contents(os.path.join(logfilebasedir, "multi-mdp/"))
    data = filter_fastest(data, "prism")
    create_table([entry for entry in data.values() ], os.path.join(outputdir, "mdpresults.tex"), "multimdp")
    create_csv(data.values(), os.path.join(outputdir, "mdpScatterPlot.csv"), "prism")
    print("Produced multi-mdp results.")
    data = parse_logfile_contents(os.path.join(logfilebasedir, "single-ma/"))
    data = filter_fastest(data, "imca")
    create_table([entry for entry in data.values() ], os.path.join(outputdir, "singleobjresults.tex"), "singlema")
    entries_to_delete = []
    for entry in data:
        if data[entry]["tool"] == "storm" and "config" in data[entry] and data[entry]["config"] == "single":
            entries_to_delete.append(entry)
    for entry in entries_to_delete: del(data[entry])        
    create_csv(data.values(), os.path.join(outputdir, "singleObjScatterPlot.csv"), "imca")
    print("Produced single-ma results.")
    print("Run the following command to create the file results.pdf containing tables and plots.\n\tcd {}; pdflatex results.tex".format(outputdir))
    
    with open(os.path.join(outputdir, "results.tex"), 'w') as outputfile:
        outputfile.write(r"""\documentclass{article}

\usepackage{amsmath,amssymb,amsfonts}
\usepackage[usenames,dvipsnames]{color}
\usepackage{xcolor}
\usepackage{booktabs}

\usepackage{paralist}
\usepackage{multirow}
\usepackage{multicol}
\usepackage{subfigure}
\usepackage{graphicx}
\usepackage{tikz} 
\usepackage{pgfplots}
\usepackage{hyperref}
\usepackage{array}

\usetikzlibrary{arrows,decorations.pathmorphing,positioning,fit,trees,shapes,shadows,automata,calc,patterns} 


\newcommand{\storm}{\texttt{Storm}}
\newcommand{\prism}{\texttt{PRISM}}
\newcommand{\imca}{\texttt{IMCA}}

\begin{document}
\title{Results of Experiments}
\maketitle

\begin{tikzpicture}
\begin{axis}[
width=4.4cm,
height=4.4cm,
xmin=0.005,
ymin=0.005,
ymax=200,
xmax=200,
xmode=log,
ymode=log,
axis x line=bottom,
axis y line=left,
x label style={at={(axis description cs:0.5,0.01)},anchor=north},
y label style={at={(axis description cs:0.11,.5)},anchor=south},
ytick={0.001, 0.1, 1, 10, 100}, 
yticklabels={0.001, 0.1, 1, 10, 100}, 
xtick={0.001, 0.1, 1, 10, 100},
xticklabels={0.001, 0.1, 1, 10, 100},
xlabel=\storm,
ylabel=\prism,
yticklabel style={font=\tiny},
xticklabel style={rotate=290, anchor=west, font=\tiny},
legend style={font=\tiny,at={(axis cs:10,0.01)},anchor=south west}]
\addplot[ 
scatter/classes={
	consensus={mark=diamond*,blue!70!black,mark size=1.5},%
	zeroconf={mark=triangle*,red,mark size=1.5},%
	zeroconf-tb={mark=*,brown!70, mark size=1.5},%
	dpm={mark=pentagon*,green!40!black, mark size=1.5},
	team={mark=square*,mark size=1.5}
},
scatter,only marks,
scatter src=explicit symbolic]
table[x=storm,y=prism,meta=benchmark, col sep=semicolon]
{mdpScatterPlot.csv};
\addplot[no marks,forget plot] coordinates
{(0.005,0.005) (200,200) };
\legend{consensus,zeroconf,zeroconf-tb,dpm,team}
\end{axis}
\end{tikzpicture} 
\hfill
\begin{tikzpicture}
\begin{axis}[
width=4.4cm,
height=4.4cm,
xmin=0.001,
ymin=0.001,
ymax=30000,
xmax=30000,
xmode=log,
ymode=log,
axis x line=bottom,
axis y line=left,
x label style={at={(axis description cs:0.5,0.01)},anchor=north},
y label style={at={(axis description cs:0.11,.5)},anchor=south},
ytick={0.001, 0.1, 1, 10, 100, 1000, 10000}, 
yticklabels={0.001, 0.1, 1, 10, 100, 1000, 10000}, 
xtick={0.001, 0.1, 1, 10, 100, 1000, 10000},
xticklabels={0.001, 0.1, 1, 10, 100, 1000, 10000},
xlabel=\storm,
ylabel=\imca,
yticklabel style={font=\tiny},
xticklabel style={rotate=290, anchor=west, font=\tiny},
legend style={font=\tiny,at={(axis cs:400,0.003)},anchor=south west}]

\addplot[ 
scatter/classes={
	jobs={mark=diamond*,blue!70!black,mark size=1.5},%
	polling={mark=triangle*,red,mark size=1.5},%
	stream={mark=*,brown!70, mark size=1.5},%
	mutex={mark=pentagon*,green!40!black, mark size=1.5}%%
},
scatter,only marks,
scatter src=explicit symbolic]
table[x=storm,y=imca,meta=benchmark, col sep=semicolon]
{singleObjScatterPlot.csv};

\addplot[no marks,forget plot] coordinates
{(0.001,0.001) (30000,30000) };
\legend{jobs,polling,stream,mutex}
\end{axis}
\end{tikzpicture} 

\begin{table}[tb]
	\centering
	\caption{Experimental results for multi-objective MAs.}
	\input{maRes}
\end{table}
\begin{table}[tb]
	\centering
	\caption{Details of MA Benchmarks.}
	\input{maDetails}
\end{table}
\begin{table}[tb]
	\centering
	\caption{Experimental results for multi-objective MDPs.}
	\input{mdpresults}
\end{table}
\begin{table}[tb]
	\centering
	\caption{Experimental results for single-objective MAs.}
	\input{singleobjresults}
\end{table}
\end{document}""")
    
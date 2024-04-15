import os
from enum import Enum
import subprocess
import pandas as pd
import re

class Solver(Enum):
    def __str__(self):
        if self == Solver.Z3:
            return "Z3"
        elif self == Solver.CVC4:
            return "CVC4"
        elif self == Solver.CVC5:
            return "CVC5"
    Z3 = 1
    CVC4 = 2
    CVC5 = 3

class TimeStats:
    def __init__(self, user_time: float = 0.0, system_time: float = 0.0, cpu_percent: float = 0.0, wall_clock_time: str = "", max_resident_set_size: int = 0, exit_status: int = 0, voluntary_context_switches: int = 0, involuntary_context_switches: int = 0, swaps: int = 0):
        self.user_time = user_time
        self.system_time = system_time
        self.cpu_percent = cpu_percent
        self.wall_clock_time = wall_clock_time
        self.max_resident_set_size = max_resident_set_size
        self.exit_status = exit_status
        self.voluntary_context_switches = voluntary_context_switches
        self.involuntary_context_switches = involuntary_context_switches
        self.swaps = swaps

    def __str__(self):
        return f"User time: {self.user_time}\nSystem time: {self.system_time}\nCPU percent: {self.cpu_percent}\nWall clock time: {self.wall_clock_time}\nMax resident set size: {self.max_resident_set_size}\nExit status: {self.exit_status}\nVoluntary context switches: {self.voluntary_context_switches}\nInvoluntary context switches: {self.involuntary_context_switches}\nSwaps: {self.swaps}"
    

def parse_time_stats_from_output(lines) -> TimeStats:
    """
    Parse the time statistics from the output of the time command.
    """
    start = False
    for l in lines:
        l = l.strip()
        if l.startswith("Command being timed:"):
            start = True
        if start:
            if l.startswith("User time (seconds):"):
                user_time = float(l.split(":")[1].strip())
            if l.startswith("System time (seconds):"):
                system_time = float(l.split(":")[1].strip())
            if l.startswith("Percent of CPU this job got:"):
                cpu_percent = float(l.split(":")[1].strip().replace("%", "")) / 100
            if l.startswith("Elapsed (wall clock) time (h:mm:ss or m:ss):"):
                # regex to recognise the format to know whether it is m:ss or h:mm:ss
                s = l.split(": ")[1].strip()
                m = re.match(r"(\d+):(\d+):(\d+(?:\.\d+)?)", s)
                if m:
                    wall_clock_time = float(m.group(3)) + float(m.group(2))*60 + float(m.group(1))*60*60
                else:
                    m = re.match(r"(\d+):(\d+(?:\.\d+)?)", s)
                    if m:
                        wall_clock_time = float(m.group(2)) + float(m.group(1))*60
                    else:
                        wall_clock_time = -1
            if l.startswith("Maximum resident set size (kbytes):"):
                max_resident_set_size = int(l.split(":")[1].strip())
            if l.startswith("Exit status:"):
                exit_status = int(l.split(":")[1].strip())
            if l.startswith("Voluntary context switches:"):
                voluntary_context_switches = int(l.split(":")[1].strip())
            if l.startswith("Involuntary context switches:"):
                involuntary_context_switches = int(l.split(":")[1].strip())
            if l.startswith("Swaps"):
                swaps = int(l.split(":")[1].strip())
    return TimeStats(user_time, system_time, cpu_percent, wall_clock_time, max_resident_set_size, exit_status, voluntary_context_switches, involuntary_context_switches, swaps)



def get_z3_command(path_to_smt2_file: str, timeout: int = 10) -> str:
    with open(path_to_smt2_file, "r") as f:
        first_line = f.readline().strip()
        print(f"FIRST LINE: {first_line}")
        if first_line.startswith("; Options:"):
            options = first_line.split(":")[1].strip()
    options = options if options else ""
    options = options.replace("-in", "") # remove the -in option as it makes z3 read from stdin, which we don't want
    return f"z3 -smt2 {path_to_smt2_file} -T:{timeout} {options}"


def get_cvc4_command(path_to_smt2_file: str, timeout: int = 10) -> str:
    with open(path_to_smt2_file, "r") as f:
        first_line = f.readline().strip()
        if first_line.startswith("; Options:"):
            options = first_line.split(":")[1].strip()
    options = options if options else ""
    
    return f"cvc4 {path_to_smt2_file} --tlimit={timeout} {options}"

def get_cvc5_command(path_to_smt2_file: str, timeout: int = 10) -> str:
    with open(path_to_smt2_file, "r") as f:
        first_line = f.readline().strip()
        print(f"First line: {first_line}")
        if first_line.startswith("; Options:"):
            options = first_line.split(":")[1].strip()
            print(f"OPTIONS: {options}")
    options = options if options else ""
    return f"cvc5 {path_to_smt2_file} --tlimit={timeout} {options}"

def run_benchmark_smt_solver(solver: Solver, path_to_smt2_file: str, timeout: int = 10, max_attemps: int = 10):
    """
    Run the given solver on the given SMT2 file in a time command. Return the output and the time information.
    if the number of involuntary context switches is not 0, the benchmark is run again, with a maximum
    of 50 attempts. Same for CPU percent not 1.0
    """
    if solver == Solver.Z3:
        command = get_z3_command(path_to_smt2_file, timeout)
    elif solver == Solver.CVC4:
        command = get_cvc4_command(path_to_smt2_file, timeout)
    elif solver == Solver.CVC5:
        command = get_cvc5_command(path_to_smt2_file, timeout)
    else:
        raise ValueError("Invalid solver")
    print(f"Command: {command}")
    command = f"time --verbose {command}"
    
    invol_context_switches = 1
    cpu_percent = 0.0
    attempts = 0
    results = []
    while not (invol_context_switches == 0 and cpu_percent >= 1.0) and attempts < max_attemps: 
        output = subprocess.getoutput(command).split("\n")
        time_stats = parse_time_stats_from_output(output)
        invol_context_switches = time_stats.involuntary_context_switches
        cpu_percent = time_stats.cpu_percent
        results.append((output, time_stats, invol_context_switches, cpu_percent))
        attempts += 1

    # take the attempt with the lowest number of involuntary context switches and max cpu percent
    results.sort(key=lambda x: (x[2], -x[3]))
    # only_invol_cpu = list(map(lambda x: (x[2], x[3]), results))
    # print(f"Number of attempts: {attempts}")
    # print(f"Number of involuntary context switches and CPU percent for each attempt: {only_invol_cpu}")
    output, time_stats, invol_context_switches, cpu_percent = results[0]
    return (output, time_stats, attempts)

# go through the folder and run the solver on each file
output_csv = "benchmark_results.csv"
columns=["Solver", "Query ID", "Stainless solving time (sec)", "Elapsed User Space Time (sec)", "Elapsed Kernel Time (sec)", "CPU Percent", "Elapsed Wall Clock Time (sec)", "Maxium Resident Set Size (kbytes)", "Exit Status", "Voluntary Context Switches", "Involuntary Context Switches", "Swaps", "Attempts DEV"]
with open(output_csv, "w") as f:
  f.write(",".join(columns) + "\n")
dir = "smt-queries-longmap"
results = {}
count = 0

# Open the VC summary csv file and parse it with pandas
df = pd.read_csv("VCs_summary_nocache.csv")

for file in os.listdir(dir):
    if file.endswith(".smt2"):
        path_to_file = os.path.join(dir, file)
        print(f"Running benchmark on {path_to_file}")
        solver = Solver.Z3 if "z3" in file else Solver.CVC4 if "cvc4" in file else Solver.CVC5
        query_id = file.split("-")[-1].replace(".smt2", "")
        output, time_stats, attempts = run_benchmark_smt_solver(solver=solver, path_to_smt2_file=path_to_file, timeout=60, max_attemps=15)
        print(f"Solver: {solver}")
        print(f"Query ID: {query_id}")
        print("\n")
        stainless_solving_time_sec = float(df[df['SMT Query ID'] == int(query_id)]['Solving Time (sec)'].values[0])
        print(f"Stainless solving time: {stainless_solving_time_sec}")
        results[(solver, query_id)] = time_stats
        d = [solver, query_id, stainless_solving_time_sec, time_stats.user_time, time_stats.system_time, time_stats.cpu_percent, time_stats.wall_clock_time, time_stats.max_resident_set_size, time_stats.exit_status, time_stats.voluntary_context_switches, time_stats.involuntary_context_switches, time_stats.swaps, attempts]

        print("\n")
        print("OUTPUT:")
        for l in output:
            print(f"\t{l}")
        with open(output_csv, "a") as f:
          f.write(",".join(map(str, d)) + "\n")
        count += 1


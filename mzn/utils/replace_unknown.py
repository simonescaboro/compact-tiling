import csv
import os
import subprocess

with open("results/res_mzn/results_mzn_max_10.txt","r") as fp_data:
    lines = fp_data.readlines()
    i = 0
    n = 10
    j = 1
    result = list()
    for line in lines:
        line = line.replace("\n","")
        if line == "=====UNKNOWN=====":
            res = subprocess.check_output(f"minizinc -p 4 -a --time-limit 300000 mzn/models/tiling.mzn mzn/models/default_settings.dzn mzn/test/test_max_10/input/test_{n}_{j}.dzn  | tail -3 | head -n 1", shell=True)
            res = str(res)
            res = res.replace("b","").replace("\\n","").replace("'","")
            if res.find("=====UNKNOWN=====") != -1:
                line = "=U=,"
            else:
                line = "{},n".format(res)
        else:
            line = line+",y"
        result.append(line+"\n")
        j += 1
        if j == 11:
            j = 1
            n += 2
    with open("results/res_mzn/results_mzn_max_10_.csv","w+") as fp_data_w:
        fp_data_w.writelines(result)
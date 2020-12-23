from random import randint
import csv
header = ["n","o","i","l","t"]
with open("results/input/original_data_max_10.csv","w+") as fp_write:
    writer = csv.DictWriter(fp_write,header)
    writer.writeheader()
    for n in range(10,30,2):
        already_seens = []
        for k in range(10):
            while True:
                o = randint(1,int(n/5))
                i = randint(1,int(n/5))
                l = randint(1,int(n/5))
                t = randint(1,int(n/5))
                if [n,o,i,l,t] not in already_seens and (o+i+l+t) <= 10:
                    break
            already_seens.append([n,o,i,l,t])
            
            with open(f"mzn/test/test_max_10/input/test_{n}_{k+1}.dzn","w+") as ex_file:
                ex_file.write(f"grid_size = {n};\n")
                ex_file.write(f"num_O = {o};\n")
                ex_file.write(f"num_I = {i};\n")
                ex_file.write(f"num_L = {l};\n")
                ex_file.write(f"num_T = {t};")
            
            with open(f"asp/test/test_max_10/input/test_{n}_{k+1}.lp","w+") as ex_file:
                ex_file.write(f"#const n = {n}.\n")
                ex_file.write(f"#const num_O = {o}.\n")
                ex_file.write(f"#const num_I = {i}.\n")
                ex_file.write(f"#const num_L = {l}.\n")
                ex_file.write(f"#const num_T = {t}.\n")
            
            writer.writerow({
                'n': n,
                'o': o,
                'i': i,
                'l': l,
                't': t
            })
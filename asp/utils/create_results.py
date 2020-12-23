import csv
header = ["val","opt"]

with open("results/res_asp/results_asp_max_10.csv","w+") as fp_write:
    writer = csv.DictWriter(fp_write,header)
    for n in range(10,30,2):
        for k in range(1,11):
            with open(f"asp/test/test_max_10/output/test_output_{n}_{k}.txt","r") as fp:
                text = fp.read()
                found = text.find("Optimum    : yes") != -1
                index = text.rfind("Optimization : 0 ")
                l = len("Optimization : 0 ")
                a = text[index+l:index+l+2]
                #print(a,n,k)
                writer.writerow({
                    'val': int(a),
                    'opt': "y" if found else "n"
                })
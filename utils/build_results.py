import csv
header = ["n","o","i","l","t","asp","asp_otp","mzn","mzn_opt"]
with open("results/finals/results_max_10.csv","w+") as ex_file:
    writer = csv.DictWriter(ex_file,header)
    writer.writeheader()
    with open("results/input/original_data_max_10.csv","r") as fp_data:
        with open(f"results/res_mzn/results_mzn_max_10.csv","r") as fp_mzn:
            with open(f"results/res_asp/results_asp_max_10.csv","r") as fp_asp:
                lines_mzn = csv.reader(fp_mzn, delimiter=",")
                lines_asp = csv.reader(fp_asp, delimiter=",")
                lines_dat = csv.DictReader(fp_data,delimiter=",")
                for l_mzn, l_asp, l_data in zip(lines_mzn, lines_asp, lines_dat):
                    writer.writerow({
                        'n': l_data['n'],
                        'o': l_data['o'],
                        'i': l_data['i'],
                        'l': l_data['l'],
                        't': l_data['t'],
                        'asp': l_asp[0],
                        'asp_otp': l_asp[1],
                        'mzn': l_mzn[0],
                        'mzn_opt': l_mzn[1]
                    })

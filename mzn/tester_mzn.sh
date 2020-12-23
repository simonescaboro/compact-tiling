j=0
mkdir mzn/test
mkdir mzn/test/test_max_10
mkdir mzn/test/test_max_10/input
for ((n=10;n<30;n=n+2)); do
    for((i=1;i<=10;i++)); do
        j=$((j+1))
        echo -ne "Testing MiniZinc (it will take some hours)..[$j%]\r"
        minizinc -p 4 --time-limit 300000 mzn/models/tiling.mzn mzn/models/default_settings.dzn mzn/test/test_max_10/input/test_$n\_$i.dzn  | tail -3 | head -n 1 >> results/res_mzn/results_mzn_max_10.txt
    done
done
echo "Finding unknowns..\n"
python3 mzn/utils/replace_unknown.py
rm results/res_mzn/results_mzn_max_10.txt
mv results/res_mzn/results_mzn_max_10_.csv results/res_mzn/results_mzn_max_10.csv
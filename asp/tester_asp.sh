j=0
mkdir asp/test
mkdir asp/test/test_max_10
mkdir asp/test/test_max_10/input
mkdir asp/test/test_max_10/output
for ((n=10;n<30;n=n+2)); do
    for((i=1;i<=10;i++)); do
        j=$((j+1))
        echo -ne "Testing ASP (it will take some hours)..[$j%]\r"
        touch asp/test/test_max_10/output/test_output_$n\_$i.txt
        clingo -t 4 --time-limit=300  asp/test/test_max_10/input/test_$n\_$i.lp  asp/models/tiling.lp >> asp/test/test_max_10/output/test_output_$n\_$i.txt
    done
done
python3 asp/utils/create_results.py
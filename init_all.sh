mkdir results
mkdir results/finals
mkdir results/res_asp
mkdir results/res_mzn
mkdir results/input
python3 utils/generate_tests.py
echo "Test istances created.."
./asp/tester_asp.sh
./mzn/tester_mzn.sh
echo "Building final results.."
python3 utils/build_results.py
echo "End."
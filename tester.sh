echo "Esempi ASP"
echo ""
echo "tile_on(1,1,3,2) tile_on(1,1,4,2) tile_on(1,1,3,3) tile_on(1,1,4,3) tile_on(1,2,1,2) tile_on(1,2,2,2) tile_on(1,2,1,3) tile_on(1,2,2,3) tile_on(2,1,1,1) tile_on(2,1,2,1) tile_on(2,1,3,1) tile_on(2,2,2,5) tile_on(2,2,3,5) tile_on(2,2,4,5) tile_on(3,1,4,1) tile_on(3,1,5,1) tile_on(3,1,5,2) tile_on(3,2,1,4) tile_on(3,2,2,4) tile_on(3,2,1,5) tile_on(4,1,5,3) tile_on(4,1,3,4) tile_on(4,1,4,4) tile_on(4,1,5,4) tile_on(4,1,5,5)" | python3 asp/readable_asp.py
echo ""
echo "tile_on(1,1,1,1) tile_on(1,1,2,1) tile_on(1,1,1,2) tile_on(1,1,2,2) tile_on(2,1,3,4) tile_on(2,1,4,4) tile_on(2,1,5,4) tile_on(2,2,4,1) tile_on(2,2,5,1) tile_on(2,2,6,1) tile_on(3,1,2,3) tile_on(3,1,1,4) tile_on(3,1,2,4) tile_on(4,1,3,1) tile_on(4,1,3,2) tile_on(4,1,4,2) tile_on(4,1,5,2) tile_on(4,1,3,3) tile_on(4,2,6,2) tile_on(4,2,4,3) tile_on(4,2,5,3) tile_on(4,2,6,3) tile_on(4,2,6,4)" | python3 asp/readable_asp.py
echo ""
echo "Esempi Minizinc"
echo ""
echo "16;10;[1, 1, 1, 1];[1, 2, 3, 4];[1, 1, 3, 2];[10, 7, 10, 9];[1, 2, 5, 9]" | python3 mzn/readable_mzn.py
echo ""
echo "25;10;[2, 1, 1, 2];[1, 1, 2, 3, 4, 4];[4, 1, 2, 4, 2, 1];[10, 10, 6, 8, 10, 8];[1, 1, 2, 4, 10, 8]" | python3 mzn/readable_mzn.py
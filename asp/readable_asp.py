#s= "tile_on(1,1,5,4) tile_on(1,1,6,4) tile_on(1,1,5,5) tile_on(1,1,6,5) tile_on(2,1,4,1) tile_on(2,1,5,1) tile_on(2,1,6,1) tile_on(2,2,2,5) tile_on(2,2,3,5) tile_on(2,2,4,5) tile_on(3,1,3,1) tile_on(3,1,2,2) tile_on(3,1,3,2) tile_on(3,2,6,2) tile_on(3,2,5,3) tile_on(3,2,6,3) tile_on(3,3,1,1) tile_on(3,3,2,1) tile_on(3,3,1,2) tile_on(4,1,4,2) tile_on(4,1,2,3) tile_on(4,1,3,3) tile_on(4,1,4,3) tile_on(4,1,4,4) tile_on(4,2,1,3) tile_on(4,2,1,4) tile_on(4,2,2,4) tile_on(4,2,3,4) tile_on(4,2,1,5) max_row(6) max_col(5)"

s = input()

atoms = s.split(" ")
n = 10
new_atoms = list()
result=[[(0,0) for _ in range(0,n)] for _ in range(0,n)]

for s in atoms:
    if s.find("tile_on") != -1:
        tmp = s.replace("tile_on","").replace("(","").replace(")","")
        res = tuple(map(int, tmp.split(',')))
        new_atoms.append(res)

for (piece,i,x,y) in new_atoms:
    result[x-1][n+1-y-1] = (piece,i)
    
for l in result:
    for (p,i) in l:
        if p != 0:
            print("\033[{}m{}/{}\033[0m".format(str(90+p+i),p,i),end = ' ')
        else:
            print("0/0", end=" ")
    print("")

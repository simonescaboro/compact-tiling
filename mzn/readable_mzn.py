
import sys

s = input()

#s = "25;10;[2, 1, 1, 2];[1, 1, 2, 3, 4, 4];[1, 4, 2, 4, 2, 1];[7, 7, 10, 10, 8, 10];[1, 1, 2, 4, 11, 8]"
s = s.split(";")

def from_string_to_list(s):
    s = s.replace("[","").replace("]","").replace(" ", "")
    s = s.split(",")
    return [int(i) for i in s]

coordinate_dict = {
    1: {1:[(0,0),(1,0),(0,1),(1,1)]},
    2: {
        2: [(0,0),(1,0),(2,0)],
        3: [(0,0),(0,1),(0,2)]
    },
    3: {
        4: [(1,0),(0,1),(1,1)],
        5: [(0,0),(0,1),(1,0)],
        6: [(0,0),(0,1),(1,1)],
        7: [(1,0),(0,1),(1,1)]
    },
    4: {
        8:  [(0,0),(0,1),(0,2),(1,1),(2,1)],
        9:  [(0,1),(1,1),(2,2),(2,1),(2,0)],
        10: [(1,0),(1,1),(1,2),(2,2),(0,2)],
        11: [(0,0),(1,0),(2,0),(1,1),(1,2)]
    }
}

tile_counter = {
    1: 0,
    2: 0,
    3: 0,
    4: 0
}

n = int(s[1])
board = [["0/0" for _ in range(n)] for _ in range(n)]

tiles = from_string_to_list(s[3])
x_coord = from_string_to_list(s[4])
y_coord = from_string_to_list(s[5])
r_coord = from_string_to_list(s[6])

for p,x,y,r in zip(tiles, x_coord, y_coord, r_coord):
    tile_counter[p] += 1
    for (i,j) in coordinate_dict[p][r]:
        board[x+i-1][(y-j-1)] = "\033[{}m{}/{}\033[0m".format(str(90+p+tile_counter[p]),p,tile_counter[p]) 


for i in range(n):
    for j in range(n):
        print(board[i][j], end=" ")
    print("")

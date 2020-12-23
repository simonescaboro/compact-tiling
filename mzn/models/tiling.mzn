include "globals.mzn";

int: n;

int: num_O;
int: num_I;
int: num_L;
int: num_T;

int: total_tiles = num_O + num_I + num_T + num_L;
int: total_subtiles;

set of int: TILES_USED = 1..total_tiles;
set of int: SUBTILES = 1..total_subtiles;

enum TILES_ID = {O,I,L,T};

array[TILES_ID] of int : tiles_num = [num_O,num_I,num_L,num_T];

array[SUBTILES, 1..4] of int: points;
array[int] of set of SUBTILES: rotation_tiles;

array[TILES_ID] of set of int: tiles_generic;

array[TILES_USED] of set of int : tiles = [tiles_generic[p] | p in TILES_ID, j in 1..tiles_num[p]];

array[TILES_USED] of var 0..n : x;
array[TILES_USED] of var 0..n : y;
var 3..n: box_width;
var 3..n: box_height;

array[SUBTILES, 1..2] of int: rsize =
    array2d(SUBTILES,1..2,
        [points[i,j] | i in SUBTILES, j in 3..4]);

array[SUBTILES, 1..2] of int: roff =
    array2d(SUBTILES,1..2,
        [points[i,j] | i in SUBTILES, j in 1..2]);

array[TILES_USED,1..2] of var int: coord;
array[TILES_USED] of var int : rotation;

constraint forall(i in TILES_USED)( coord[i,1] = x[i] /\ coord[i,2] = y[i]);

% ogni tile i ha una sua rotazione, tra quelle possibili per quel tipo di tile
constraint forall(i in TILES_USED)(rotation[i] in tiles[i]);

% vincolo per assicurarsi che almeno un tile occupi la cella [0,0] 
% e di conseguenza la cella [1,n] (ruotando i tile)
constraint exists(i in TILES_USED)(x[i]==0 /\ y[i]==0);

% vincolo per imporre una specifica rotazione al tile che occupa la cella [0,0]
constraint forall(i in TILES_USED)(
    (x[i] == 0 /\ y[i] == 0)
              ->
    (tiles[i] == tiles_generic[O] 
               \/
     tiles[i] == tiles_generic[I]
               \/
    (tiles[i] == tiles_generic[L] /\ (rotation[i] in {4,6,7}))
               \/
    (tiles[i] == tiles_generic[T] /\ (rotation[i] in {9,10})))
);

% vincolo globale per il posizionamento dei tile
constraint geost_bb(2,
                    rsize,
                    roff,
                    rotation_tiles,
                    coord,
                    rotation,
                    [0,0],
                    [box_width,box_height]);

solve :: seq_search([
    int_search([box_width], smallest, indomain_min), 
    int_search([box_height], smallest, indomain_min)
   ]) minimize box_width*box_height;

output[
    show(box_width*box_height)
];

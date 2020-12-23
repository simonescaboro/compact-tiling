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

array[TILES_USED,1..2] of var int: board;
array[TILES_USED] of var int : translated_rotation;
array[TILES_USED] of var 1..4 : tile_type;
array[SUBTILES] of var SUBTILES: tile_translation;

% vincolo per identificare il tipo del tile i-esimo
constraint forall(i in TILES_USED)( 
    if tiles[i] == {8,9,10,11} then tile_type[i] = 4 else true endif
    /\
    if tiles[i] == {4,5,6,7} then tile_type[i] = 3 else true endif
    /\
    if tiles[i] == {1} then tile_type[i] = 1 else true endif
    /\
    if tiles[i] == {2,3} then tile_type[i] = 2 else true endif
); 

% rotazione delle coordinate di ogni tile
constraint forall(i in TILES_USED)( board[i,1] = x[i]+1 /\ board[i,2] = n-y[i]);

constraint forall(i in TILES_USED)( coord[i,1] = x[i] /\ coord[i,2] = y[i]);

% specifica della rotazione lungo l'asse obliqua per ogni rotazione possibile
constraint tile_translation[1] = 1 /\ 
           tile_translation[2] = 3 /\ tile_translation[3] = 2 /\
           tile_translation[4] = 5 /\ tile_translation[5] = 4 /\ tile_translation[6] = 6 /\ tile_translation[7] = 5 /\
           tile_translation[8] = 10 /\ tile_translation[9] = 11 /\ tile_translation[10] = 8 /\ tile_translation[11] = 9;


% specifica per ogni tile la sua nuova rotazione lungo l'asse obliqua
constraint forall(i in TILES_USED)( translated_rotation[i] = tile_translation[rotation[i]]);


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

% output con le coordinate di ogni surrounding box che contiene i tile
% l'intero output può essere passato in pipe al file readable_mzn.sh
output[
    show(box_width*box_height) ++ ";" ++ show(n)
    ++ ";" ++ show([num_O,num_I,num_L,num_T]) ++ ";" ++
    show([tile_type[i] | i in TILES_USED]) ++ ";" ++
    show([board[i,1] | i in TILES_USED]) ++ ";" ++ show([board[i,2] | i in TILES_USED]) ++ ";" ++ show(translated_rotation) ++ "\n" 
];

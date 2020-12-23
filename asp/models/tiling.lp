tile_size(1,4).
tile_size(2,3).
tile_size(3,3).
tile_size(4,5).

tile(1,1..num_O). % 1 = O
tile(2,1..num_I). % 2 = I
tile(3,1..num_L). % 3 = L
tile(4,1..num_T). % 4 = T

coord(1..n).

% O

tile_on(1,N,X,Y)     :- key_point(1,N,X,Y), coord(X),   coord(Y).
tile_on(1,N,X+1,Y+1) :- key_point(1,N,X,Y), coord(X+1), coord(Y+1).
tile_on(1,N,X+1,Y)   :- key_point(1,N,X,Y), coord(X+1), coord(Y).
tile_on(1,N,X,Y+1)   :- key_point(1,N,X,Y), coord(X),   coord(Y+1).

% I

tile_on(2,N,X,Y)   :- key_point(2,N,X,Y), coord(X),   coord(Y).
tile_on(2,N,X+1,Y) :- key_point(2,N,X,Y), coord(X+1), coord(Y), rot(2,N,1).
tile_on(2,N,X+2,Y) :- key_point(2,N,X,Y), coord(X+2), coord(Y), rot(2,N,1).
tile_on(2,N,X,Y+1) :- key_point(2,N,X,Y), coord(X), coord(Y+1), rot(2,N,2).
tile_on(2,N,X,Y+2) :- key_point(2,N,X,Y), coord(X), coord(Y+2), rot(2,N,2).

% L

tile_on(3,N,X,Y)     :- key_point(3,N,X,Y), coord(X), coord(Y), not rot(3,N,4).

tile_on(3,N,X+1,Y)   :- key_point(3,N,X,Y), coord(X+1), coord(Y),   rot(3,N,1).
tile_on(3,N,X+1,Y+1) :- key_point(3,N,X,Y), coord(X+1), coord(Y+1), rot(3,N,1).

tile_on(3,N,X+1,Y+1) :- key_point(3,N,X,Y), coord(X+1), coord(Y+1), rot(3,N,2).
tile_on(3,N,X,Y+1)   :- key_point(3,N,X,Y), coord(X),   coord(Y+1), rot(3,N,2).

tile_on(3,N,X+1,Y+1) :- key_point(3,N,X,Y), coord(X+1), coord(Y+1), rot(3,N,4).
tile_on(3,N,X,Y+1)   :- key_point(3,N,X,Y), coord(X),   coord(Y+1), rot(3,N,4).
tile_on(3,N,X+1,Y)   :- key_point(3,N,X,Y), coord(X+1), coord(Y),   rot(3,N,4).

tile_on(3,N,X+1,Y)   :- key_point(3,N,X,Y), coord(X+1), coord(Y),   rot(3,N,3).
tile_on(3,N,X,Y+1)   :- key_point(3,N,X,Y), coord(X),   coord(Y+1), rot(3,N,3).

% T

tile_on(4,N,X,Y)     :- key_point(4,N,X,Y), coord(X),   coord(Y),   rot(4,N,1).
tile_on(4,N,X,Y+1)   :- key_point(4,N,X,Y), coord(X),   coord(Y+1), rot(4,N,1).
tile_on(4,N,X,Y+2)   :- key_point(4,N,X,Y), coord(X),   coord(Y+2), rot(4,N,1).
tile_on(4,N,X+1,Y+1) :- key_point(4,N,X,Y), coord(X+1), coord(Y+1), rot(4,N,1).
tile_on(4,N,X+2,Y+1) :- key_point(4,N,X,Y), coord(X+2), coord(Y+1), rot(4,N,1).

tile_on(4,N,X,Y)     :- key_point(4,N,X,Y), coord(X),   coord(Y),   rot(4,N,2).
tile_on(4,N,X+1,Y)   :- key_point(4,N,X,Y), coord(X+1),   coord(Y), rot(4,N,2).
tile_on(4,N,X+2,Y)   :- key_point(4,N,X,Y), coord(X+2),   coord(Y), rot(4,N,2).
tile_on(4,N,X+1,Y+1) :- key_point(4,N,X,Y), coord(X+1), coord(Y+1), rot(4,N,2).
tile_on(4,N,X+1,Y+2) :- key_point(4,N,X,Y), coord(X+1), coord(Y+2), rot(4,N,2).

tile_on(4,N,X,Y+1)   :- key_point(4,N,X,Y), coord(X),   coord(Y+1), rot(4,N,3).
tile_on(4,N,X+1,Y+1) :- key_point(4,N,X,Y), coord(X+1), coord(Y+1), rot(4,N,3).
tile_on(4,N,X+2,Y)   :- key_point(4,N,X,Y), coord(X+2), coord(Y),   rot(4,N,3).
tile_on(4,N,X+2,Y+1) :- key_point(4,N,X,Y), coord(X+2), coord(Y+1), rot(4,N,3).
tile_on(4,N,X+2,Y+2) :- key_point(4,N,X,Y), coord(X+2), coord(Y+2), rot(4,N,3).

tile_on(4,N,X,Y+2)   :- key_point(4,N,X,Y), coord(X),   coord(Y+2), rot(4,N,4).
tile_on(4,N,X+1,Y)   :- key_point(4,N,X,Y), coord(X+1), coord(Y),   rot(4,N,4).
tile_on(4,N,X+1,Y+1) :- key_point(4,N,X,Y), coord(X+1), coord(Y+1), rot(4,N,4).
tile_on(4,N,X+1,Y+2) :- key_point(4,N,X,Y), coord(X+1), coord(Y+2), rot(4,N,4).
tile_on(4,N,X+2,Y+2) :- key_point(4,N,X,Y), coord(X+2), coord(Y+2), rot(4,N,4).

% ogni tile ha la sua rotazione
rot(2,N,1);rot(2,N,2) :- tile(2,N).
rot(3,N,1);rot(3,N,2);rot(3,N,3);rot(3,N,4) :- tile(3,N).
rot(4,N,1);rot(4,N,2);rot(4,N,3);rot(4,N,4) :- tile(4,N).

% regola per assicurarsi che il numero totale di celle occute sia corretto
{tile_on(P,N,X,Y) : coord(X), coord(Y) } == L :- tile(P,N), tile_size(P,L).

% regola per traslare i tile
placed(X,n+1-Y) :- tile_on(P,N,X,Y), tile(P,N), coord(n+1-Y).

% regola per evitare che il tile N-esimo di tipo P abbia 
% piu' di una locazioni iniziali
{key_point(P,N,X,Y) : coord(X), coord(Y) } == 1 :- tile(P,N).

% vincoli per impedire che i tile sforino la dimensione della board
:- key_point(1,N,X,Y), X==n, Y==n.
:- key_point(2,N,X,Y), rot(2,N,1), X >= n-1.
:- key_point(2,N,X,Y), rot(2,N,2), Y >= n-1.
:- key_point(3,N,X,Y), rot(3,N,_), X == n, Y == n.
:- key_point(4,N,X,Y), rot(4,N,_), X >= n-1, Y >= n-1.

% l'N-esimo tile di tipo P ha una sola rotazione
:- rot(P,N,R1), rot(P,N,R2), R1!=R2.

% la cella della board puo' essere occupata al piu' da un tile
:- tile_on(P1,N1,X,Y), tile_on(P2,N2,X,Y), P1!=P2.
:- tile_on(P,N1,X,Y), tile_on(P,N2,X,Y), N1!=N2.

% ricerca della massima cella occupata dai tile (per altezza e lunghezza)
max_row(S) :- S = #max { X : tile_on(P,N,X,Y), tile(P,N), coord(X), coord(Y)}, coord(S).
max_col(V) :- V = #max { Y : tile_on(P,N,X,Y), tile(P,N), coord(X), coord(Y)}, coord(V).

:~ max_col(W), max_row(H),
   RES=(W*H). [RES@1]
:~ not placed(1,n). [1@2]

#show tile_on/4.

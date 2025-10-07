// for each piece num, check if the input for that cavity's distance sensor is TRUE
IF piece_num = 1 THEN
    in_cavity := NOT(piece1_dist);
ELSIF piece_num = 2 THEN
    in_cavity := NOT(piece2_dist);
ELSIF piece_num = 3 THEN
    in_cavity := NOT(piece3_dist);
ELSIF piece_num = 4 THEN
    in_cavity := NOT(piece4_dist);
ELSIF piece_num = 5 THEN
    in_cavity := NOT(piece5_dist);
ELSIF piece_num = 6 THEN
    in_cavity := NOT(piece6_dist);
ELSIF piece_num = 7 THEN
    in_cavity := NOT(piece7_dist);
ELSIF piece_num = 8 THEN
    in_cavity := NOT(piece8_dist);
ELSIF piece_num = 9 THEN
    in_cavity := NOT(piece9_dist);
ELSIF piece_num = 10 THEN
    in_cavity := NOT(piece10_dist);
ELSIF piece_num = 11 THEN
    in_cavity := NOT(piece11_dist);
END_IF;
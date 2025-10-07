IF UsingSimulator = TRUE THEN
    all_pieces_in := TRUE;
ELSE
    NumPiecesInCavities1(num_pieces_in => num_pieces_in_cav);
    all_pieces_in := num_pieces_in_cav = 11;
END_IF;
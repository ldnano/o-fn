// game vars
GameTimer := 60.0;
FinishedPieces := FALSE;
NewPiece := FALSE;
GameOver := FALSE;
num_pieces_finished := 0;
GameAborted := FALSE;
EndGameEarly := FALSE;

// piece vars
piece_in_initially := FALSE;
piece_timer_enabled := FALSE;
has_touched_cavity := FALSE;
piece_completed := FALSE;
start_of_game := TRUE;
CurrentTargetPlayer := 1;
attempts_on_piece := 0;
piece_complete_timer_enabled := FALSE;
piece_complete_timer := 0;
has_played_hawk := FALSE;

// outputs
SetAllLights1(in_red := FALSE, in_blue := FALSE, in_green := FALSE, in_white := FALSE);
haptics_tongs := FALSE;

// piece completed list
list_of_pieces[1] := 1;
list_of_pieces[2] := 1;
list_of_pieces[3] := 1;
list_of_pieces[4] := 1;
list_of_pieces[5] := 1;
list_of_pieces[6] := 1;
list_of_pieces[7] := 1;
list_of_pieces[8] := 1;
list_of_pieces[9] := 1;
list_of_pieces[10] := 1;
list_of_pieces[11] := 1;

// player score list
player_scores[1] := 0;
player_scores[2] := 0;
player_scores[3] := 0;
player_scores[4] := 0;

// player names
P1Name := '';
P2Name := '';
P3Name := '';
P4Name := '';

// get new random current piece num
RandomNumber1(max_num := deck_size, current_rand => CurrentPieceNum);
//CurrentPieceNum := 1;

simulator_piece_in_cav := TRUE;
simulator_touched_sides := FALSE;
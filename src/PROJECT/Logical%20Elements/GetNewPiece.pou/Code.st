attempts_on_piece := attempts_on_piece + 1;

// reset sim vars
simulator_piece_in_cav := TRUE;
simulator_touched_sides := FALSE;

// increment num pieces finished and update list if piece completed successfully
IF has_touched_cavity = FALSE AND player_exhausted_timer = FALSE THEN
    num_pieces_finished := num_pieces_finished + 1;
    list_of_pieces[CurrentPieceNum] := 0;
    player_scores[CurrentTargetPlayer] := player_scores[CurrentTargetPlayer] + PieceScores[CurrentPieceNum];
    // check if just finished last piece
    IF deck_size = num_pieces_finished THEN
        // finished all pieces
        FinishedPieces := TRUE;
        GameOver := FALSE;
        // player winner sound
        WinnerSound := TRUE;
    END_IF;
END_IF;

CalcWinningPlayer1();

// only continue game if didn't just finish last piece
IF num_pieces_finished < deck_size THEN
    // get a new piece if successfully got last piece or all players have tried current piece
    IF (has_touched_cavity = FALSE AND player_exhausted_timer = FALSE) OR attempts_on_piece = NumPlayers THEN
        // get new random piece out of those left
        RandomNumber3(max_num := deck_size - num_pieces_finished, current_rand => temp);
        temprand := temp;
        piece_increment := 0;
        FOR a := 1 TO deck_size BY 1 DO
            IF list_of_pieces[a] = 1 THEN
                piece_increment := piece_increment + 1;
            END_IF;
            IF piece_increment = temp AND list_of_pieces[a] = 1 THEN
                CurrentPieceNum := a;
            END_IF;
        END_FOR;
        attempts_on_piece := 0;
    END_IF;
    
    // move onto next player
    IF NumPlayers > 1 THEN
        CurrentTargetPlayer := MOD(CurrentTargetPlayer, NumPlayers) + 1;
        IF CurrentTargetPlayer = 1 THEN
            Player1Sound := TRUE;
        ELSIF CurrentTargetPlayer = 2 THEN
            Player2Sound := TRUE;
        ELSIF CurrentTargetPlayer = 3 THEN
            Player3Sound := TRUE;
        ELSE
            Player4Sound := TRUE;
        END_IF;
    END_IF;
END_IF;

IF player_exhausted_timer = TRUE THEN
    TurnsMissed := TurnsMissed + 1;
ELSE
    TurnsMissed := 0;
END_IF;

IF TurnsMissed = NumPlayers THEN
    // game aborted; go back to home page
    FinishedPieces := FALSE;
    GameOver := FALSE;
    GameAborted := TRUE;
END_IF;

// reset player timer
GameTimer := 60.0;
has_played_hawk := FALSE;
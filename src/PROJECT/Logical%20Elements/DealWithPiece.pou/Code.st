IF piece_in_initially = FALSE THEN
    // check if next up piece is in cavity, ready to be removed
    CheckPieceInCavity1(piece_num := CurrentPieceNum, in_cavity => current_piece_in_cavity);
    IF UsingSimulator = TRUE OR current_piece_in_cavity = TRUE THEN
        piece_in_initially := TRUE;
        SetAllLights1(in_red := FALSE, in_blue := FALSE, in_green := FALSE, in_white := FALSE);
        piece_timer_enabled := FALSE;
        has_touched_cavity := FALSE;
        piece_completed := FALSE;
        start_of_game := FALSE;
        piece_complete_timer_enabled := FALSE;
        piece_complete_timer := 0;
        haptics_tongs := FALSE;
    END_IF;
ELSE
    IF piece_timer_enabled = TRUE THEN
        // cyclic runs every 100 ms; 30 inc = 3 sec
        piece_timer := piece_timer + 1;
        IF has_touched_cavity = TRUE AND piece_timer < 10 THEN
            haptics_tongs := TRUE;
        ELSE
            haptics_tongs := FALSE;
        END_IF;
        IF piece_timer > 30 THEN
            // load new piece
            GetNewPiece1();
            // reset vars, then make sure next piece is in cavity
            SetAllLights2(in_red := FALSE, in_blue := FALSE, in_green := FALSE, in_white := FALSE);
            piece_timer_enabled := FALSE;
            piece_timer := 0;
            piece_completed := FALSE;
            has_touched_cavity := FALSE;
            piece_complete_timer_enabled := FALSE;
            piece_complete_timer := 0;
            // will make sure next piece is in cavity
            piece_in_initially := FALSE;
        END_IF;
    END_IF;
    
    IF piece_in_initially = TRUE THEN
        IF has_touched_cavity = FALSE THEN
            SetLights1(in_piece_num := CurrentPieceNum, in_red := FALSE, in_green := FALSE, in_blue := FALSE, in_white := FALSE);
            CheckTouchingCavity1(piece_num := CurrentPieceNum, touching_cavity => touching_cavity);
            IF UsingSimulator = TRUE THEN
                touching_cavity := simulator_touched_sides;
            END_IF;
            
            IF piece_completed = TRUE THEN
                SetLights1(in_piece_num := CurrentPieceNum, in_red := FALSE, in_green := TRUE, in_blue := FALSE, in_white := FALSE);
            ELSIF touching_cavity = TRUE THEN
                has_touched_cavity := TRUE;
                piece_timer := 0;
                piece_timer_enabled := TRUE;
                // play fail sound
                FailSound := TRUE;
            ELSE    
                CheckPieceInCavity1(piece_num := CurrentPieceNum, in_cavity => current_piece_in_cavity);
                IF UsingSimulator = TRUE THEN
                    current_piece_in_cavity := simulator_piece_in_cav;
                END_IF;
            
                IF current_piece_in_cavity = FALSE THEN
                    SetLights1(in_piece_num := CurrentPieceNum, in_red := FALSE, in_green := FALSE, in_blue := FALSE, in_white := TRUE);
                    IF piece_complete_timer_enabled = TRUE THEN
                        piece_complete_timer := piece_complete_timer + 1;
                        // cyclic task runs every 100 ms; 50 incremenets about equal to 5 seconds;
                        IF piece_complete_timer > 50 THEN
                            piece_completed := TRUE;
                            piece_timer := 0;
                            piece_timer_enabled := TRUE;
                            piece_complete_timer_enabled := FALSE;
                            piece_complete_timer := 0;
                            // play success sound
                            SuccessSound := TRUE;
                        END_IF;
                    ELSE
                        piece_complete_timer_enabled := TRUE;
                        piece_complete_timer := 0;
                    END_IF;
                ELSE
                    SetLights1(in_piece_num := CurrentPieceNum, in_red := FALSE, in_green := FALSE, in_blue := FALSE, in_white := TRUE);
                END_IF;
                
                // decrement player's timer
                GameTimer := GameTimer - 0.1;
                // play hawk sound when user has < 10 sec
                IF has_played_hawk = FALSE AND GameTimer < 10.1 THEN
                    HawkSound := TRUE;
                    has_played_hawk := TRUE;
                END_IF;
                // check if user has exhausted their timer
                IF GameTimer < 0.1 THEN
                    player_exhausted_timer := TRUE;
                    GetNewPiece1();
                ELSE
                    player_exhausted_timer := FALSE;
                END_IF;
            END_IF;
        ELSE
            SetLights1(in_piece_num := 100, in_red := TRUE, in_green := FALSE, in_blue := FALSE, in_white := FALSE);
            SetLights1(in_piece_num := CurrentPieceNum, in_red := FALSE, in_green := FALSE, in_blue := FALSE, in_white := FALSE);
        END_IF;
    END_IF;
END_IF;

//IF UsingSimulator = TRUE THEN
//    IF simulate_success = TRUE THEN
//        piece_completed := TRUE;
//        piece_timer := 0;
//        piece_timer_enabled := TRUE;
//        simulate_success := FALSE;
//    END_IF;

//    IF simulate_failure = TRUE THEN
//        has_touched_cavity := TRUE;
//        piece_timer := 0;
//        piece_timer_enabled := TRUE;
//        simulate_failure := FALSE;
//    END_IF;
//END_IF;


    
IF CurrentPage = 3 THEN
    // GamePage
    IF GameMode = 0 THEN
        // solo mode
        SoloPlayer1();
    ELSIF GameMode = 1 OR GameMode = 2 THEN
        // multiplayer or demo mode
        MultiPlayer1();
    END_IF;
ELSIF CurrentPage = 0 THEN
    // StartPage
    IF has_reset_vars_on_start = FALSE THEN
        ResetBetweenGames1();
        IntroSound := TRUE;
        has_reset_vars_on_start := TRUE;
    END_IF;
    // light up edge of board
    SetLights1(in_piece_num := 100, in_red := FALSE, in_green := FALSE, in_blue := TRUE, in_white := FALSE);
ELSIF CurrentPage = 1 THEN
    has_reset_vars_on_start := FALSE;
    // set some vars for demo mode
    IF GameMode = 2 THEN
        deck_size := 4;
        CurrentPieceNum := 1;
    ELSE
        deck_size := 11;
    END_IF;
    
    // NumPlayers
    AtLeast3Players := FALSE;
    AtLeast4Players := FALSE;
    IF NumPlayers >= 3 THEN
        AtLeast3Players := TRUE;
        IF NumPlayers = 4 THEN
            AtLeast4Players := TRUE;
        END_IF;
    END_IF;
    
    FormatName1(input_name := P1Name, new_name => P1Name);
    FormatName1(input_name := P2Name, new_name => P2Name);
    FormatName1(input_name := P3Name, new_name => P3Name);
    FormatName1(input_name := P4Name, new_name => P4Name);
ELSIF CurrentPage = 2 THEN
    has_reset_vars_on_start := FALSE;
    // Rules page
    IF GameMode = 0 THEN
        // singe player
        GameTimer := 30.0;
    ELSIF GameMode = 1 THEN
        // multi player
        GameTimer := 60.0;
    END_IF;
ELSIF CurrentPage = 6 THEN
    // turn edge of board lights white
    SetLights1(in_piece_num := 100, in_red := FALSE, in_green := FALSE, in_blue := FALSE, in_white := TRUE);
    // PreGameReqs page; to make sure all pieces are in cavities at start of game
    CheckAllPiecesInCavity1(all_pieces_in => all_pieces_in);
    NumPiecesInCavities1(num_pieces_in => num_pieces_in_cavs);
    num_pieces_not_in_cav := (11 - num_pieces_in_cavs);
    SetHMIPieceVars1();
    LightRedEmptyCavities1();
END_IF;

IF CurrentPage = 3 THEN
    GameStarted := TRUE;
ELSE
    GameStarted := FALSE;
END_IF;

temp1 := list_of_pieces[1];
temp2 := list_of_pieces[2];
temp3 := list_of_pieces[3];
IF CurrentTargetPlayer = 1 THEN
    CurrentTargetPlayerName := P1Name;
ELSIF CurrentTargetPlayer = 2 THEN
    CurrentTargetPlayerName := P2Name;
ELSIF CurrentTargetPlayer = 3 THEN
    CurrentTargetPlayerName := P3Name;
ELSIF CurrentTargetPlayer = 4 THEN
    CurrentTargetPlayerName := P4Name;
END_IF;

DealWithPiece1();

IF EndGameEarly = TRUE THEN
    // game aborted; go back to home page
    FinishedPieces := FALSE;
    GameOver := FALSE;
    GameAborted := TRUE;
    EndGameEarly := FALSE;
END_IF;
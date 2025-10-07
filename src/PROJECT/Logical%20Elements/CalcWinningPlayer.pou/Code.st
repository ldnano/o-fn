max_num := 0;
FOR index := 1 TO 4 BY 1 DO
    IF player_scores[index] >= max_num THEN
        max_num := player_scores[index];
    END_IF;
END_FOR;

winners[1] := 0;
winners[2] := 0;
winners[3] := 0;
winners[4] := 0;

IF player_scores[1] = max_num THEN
    winners[1] := 1;
END_IF;

IF player_scores[2] = max_num AND NumPlayers > 1 THEN
    winners[2] := 1;
END_IF;

IF player_scores[3] = max_num AND NumPlayers > 2 THEN
    winners[3] := 1;
END_IF;

IF player_scores[4] = max_num AND NumPlayers > 3 THEN
    winners[4] := 1;
END_IF;
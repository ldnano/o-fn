// get the remainder of time since start in usecs and an input bound
IF UsingSimulator = TRUE OR GameMode = 2 THEN
    current_rand := MOD(CurrentPieceNum, max_num) + 1;
ELSE
    // uncomment both lines when not using simulator
    current_rand := MOD(TO_INT(MOD(GET_MICROSECONDS(TRUE), 1000)), max_num);
    current_rand := current_rand + 1;
END_IF;
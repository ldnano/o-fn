// check sound vars to set sound outputs

// reset sound outputs to false
intro_sound_out := FALSE;
fail_sound_out := FALSE;
success_sound_out := FALSE;
p1_sound_out := FALSE;
p2_sound_out := FALSE;
p3_sound_out := FALSE;
p4_sound_out := FALSE;
hawk_sound_out := FALSE;
winner_sound_out := FALSE;

// if waiting to play another sound
IF sound_timer_enabled = TRUE THEN
    sound_timer := sound_timer - 1;
    IF sound_timer < 1 THEN
        IF sound_timer_type = 0 THEN
            // won, play the names of the winning players
            IF winners[1] = 1 THEN
                p1_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 1;
            ELSIF winners[2] = 1 THEN
                p2_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 2;
            ELSIF winners[3] = 1 THEN
                p3_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 3;
            ELSIF winners[4] = 1 THEN
                p4_sound_out := TRUE;
                sound_timer_enabled := FALSE;
                sound_timer := 0;
            END_IF;
        ELSIF sound_timer_type > 0 AND sound_timer_type < 4 THEN
            IF winners[2] = 1 AND sound_timer_type < 2 THEN
                p2_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 2;
            ELSIF winners[3] = 1 AND sound_timer_type < 3 THEN
                p3_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 3;
            ELSIF winners[4] = 1 AND sound_timer_type < 4 THEN 
                p4_sound_out := TRUE;
                sound_timer_enabled := TRUE;
                sound_timer := 30;
                sound_timer_type := 4;
            ELSE
                sound_timer_enabled := FALSE;
                sound_timer := 0;
            END_IF;
        ELSE
            sound_timer_enabled := FALSE;
            sound_timer := 0;
        END_IF;
    END_IF;
END_IF;

// check vars and set outputs
IF IntroSound = TRUE THEN
    intro_sound_out := TRUE;
    IntroSound := FALSE;
END_IF;
IF FailSound = TRUE THEN
    fail_sound_out := TRUE;
    FailSound := FALSE;
END_IF;
IF SuccessSound = TRUE THEN
    success_sound_out := TRUE;
    SuccessSound := FALSE;
END_IF;
IF HawkSound = TRUE THEN
    hawk_sound_out := TRUE;
    HawkSound := FALSE;
END_IF;
IF WinnerSound = TRUE THEN
    winner_sound_out := TRUE;
    WinnerSound := FALSE;
    sound_timer := 70;
    sound_timer_enabled := TRUE;
    sound_timer_type := 0;
END_IF;
IF Player1Sound = TRUE THEN
    p1_sound_out := TRUE;
    Player1Sound := FALSE;
END_IF;
IF Player2Sound = TRUE THEN
    p2_sound_out := TRUE;
    Player2Sound := FALSE;
END_IF;
IF Player3Sound = TRUE THEN
    p3_sound_out := TRUE;
    Player3Sound := FALSE;
END_IF;
IF Player4Sound = TRUE THEN
    p4_sound_out := TRUE;
    Player4Sound := FALSE;
END_IF;
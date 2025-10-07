// constants
deck_size := 9;

// game setup options
CurrentPage := -1;
GameMode := 0;
NumPlayers := 1;

// set to true if testing through the simulator; otherwise, must be false
UsingSimulator := FALSE;

// reset vars for new game
ResetBetweenGames1();

has_reset_vars_on_start := FALSE;

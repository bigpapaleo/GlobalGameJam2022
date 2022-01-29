enum GAME_STATE {
	MAIN_MENU,
	PLAYING,
	CREDITS,
	WIN,
	DEAD
}
global.GAME_STATE = GAME_STATE.MAIN_MENU;

global.got_remote = false;

main_menu_pointer = 0;
ignore_button = false;
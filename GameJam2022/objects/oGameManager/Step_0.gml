if(global.GAME_STATE == GAME_STATE.MAIN_MENU) {
	if(keyboard_check_pressed(vk_up) && main_menu_pointer > 0) {
		main_menu_pointer--;
	} else if(keyboard_check_pressed(vk_down) && main_menu_pointer < 2) {
		main_menu_pointer++;
	} else if(keyboard_check_pressed(vk_space)) {
		if(main_menu_pointer == 0) {
			global.GAME_STATE = GAME_STATE.PLAYING;
		} else if(main_menu_pointer == 1) {
			global.GAME_STATE = GAME_STATE.CREDITS;
			ignore_button = true;
		} else {
			game_end();
		}
	}
}

if(global.GAME_STATE == GAME_STATE.WIN) {
	if(keyboard_check_pressed(vk_anykey)) {
		global.GAME_STATE = GAME_STATE.CREDITS;
		ignore_button = true;
	}
}

if(global.GAME_STATE == GAME_STATE.CREDITS) {
	if(keyboard_check_pressed(vk_anykey) && !ignore_button) {
		game_restart();
	}
}

if(keyboard_check_pressed(vk_escape) && global.GAME_STATE != GAME_STATE.WIN) {
	game_restart();
}

ignore_button = false;
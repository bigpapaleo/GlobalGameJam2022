if(global.GAME_STATE == GAME_STATE.MAIN_MENU) {
	draw_sprite(sTitleScreen, 0, 0, 0);
	
	draw_set_font(fntVcrSmall);
	draw_set_halign(fa_center);
	if(main_menu_pointer == 0) {
		draw_text_color_outline(480, 370, ">> NEW GAME <<", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	} else {
		draw_text_color_outline(480, 370, "NEW GAME", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	}
	if(main_menu_pointer == 1) {
		draw_text_color_outline(480, 420, ">> CREDITS <<", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	} else {
		draw_text_color_outline(480, 420, "CREDITS", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	}
	if(main_menu_pointer == 2) {
		draw_text_color_outline(480, 470, ">> QUIT <<", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	} else {
		draw_text_color_outline(480, 470, "QUIT", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	}
} else if(global.GAME_STATE == GAME_STATE.DEAD) {
	draw_set_font(fntMain);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color_outline(480, 270, "YOU HAVE DIED!", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 320, "Press Escape to reincarnate.", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
} else if(global.GAME_STATE == GAME_STATE.WIN) {
	draw_set_font(fntMain);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color_outline(480, 270, "You have found a place to", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 300, "rest your bones...", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 350, "Press any key", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
} else if(global.GAME_STATE == GAME_STATE.CREDITS) {
	draw_set_font(fntMain);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color_outline(480, 150, "TIME TOGGLE", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);;
	draw_text_color_outline(480, 200, "A game by", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 250, "Amanda Jackson, C. Skell,", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 300, "Daniel Jackson, Elliott Ridgway, and", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
	draw_text_color_outline(480, 350, "Life Myrie", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);;
	draw_text_color_outline(480, 400, "Global Game Jam 2022", c_white, c_white, 1.0, c_black, c_black, 1.0, 4, 8, 1.0, 1.0, 0.0);
}

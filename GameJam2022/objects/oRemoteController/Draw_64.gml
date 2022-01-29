if(global.got_remote) {
	draw_set_color(c_black);
	draw_rectangle(0,0,960,100,false);
	draw_rectangle(0,490,960,540,false);
	
	draw_set_font(fntMain);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	// draw_text(5,25, "Time:" + string(clock));
	// draw_text(5,50, "Speed:" + string(clock_speed));
	
	if(global.GAME_STATE == GAME_STATE.PLAYING) {
		var clock_pointer_x = (clock / dead_time) * 450;
		
		draw_sprite(sHudBaby, 0, 100, 30);
		draw_sprite(sHudMiddleMan, 0, 250, 30);
		draw_sprite(sHudOldMan, 0, 400, 30);
		draw_sprite(sHudSkeleton, 0, 550, 30);
		draw_sprite(sHudPointer, 0, 100 + clock_pointer_x, 60);
		
		if(clock < man_time) {
			draw_sprite(sHudHighlight, 0, 100, 30);
		} else if(clock < old_man_time) {
			draw_sprite(sHudHighlight, 0, 250, 30);
		} else if(clock < dead_time) {
			draw_sprite(sHudHighlight, 0, 400, 30);
		}
		
		draw_set_color(c_yellow);
		draw_rectangle(100,60,550,65,false);
		
		draw_rectangle(100,60,105,80,false);
		draw_rectangle(250,60,255,80,false);
		draw_rectangle(400,60,405,80,false);
		draw_rectangle(550,60,555,80,false);
		
		draw_set_font(fntVcrLarge);
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
	
		draw_set_color(c_white);
		if(clock == 0) {
			draw_text(950, 50, "|| PAUSE");
		} else if(keyboard_check(ord("A"))) {
			draw_text(950, 50, "<< REW");
		} else if(keyboard_check(ord("D"))) {
			draw_text(950, 50, ">> FF");
		} else if(time_forwards) {
			draw_text(950, 50, "> PLAY");
		} else {
			draw_text(950, 50, "< PLAY");
		}
	
		draw_set_font(fntVcrSmall);
		draw_sprite(sRemoteLowerHud, 0, 480, 540);
		draw_set_halign(fa_right);
		draw_text(400, 515, "A");
		draw_set_halign(fa_left);
		draw_text(560, 515, "D");
	}
}
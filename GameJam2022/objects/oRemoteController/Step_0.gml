if(global.got_remote && global.GAME_STATE == GAME_STATE.PLAYING) {
	if(clock_cooldown == 0 && !new_remote_press_needed) {
		if(keyboard_check(ord("A")) && clock_speed > clock_speed_min) {
			time_forwards = false;
			clock_speed -= clock_speed_acceleration;
		} else if(keyboard_check(ord("D")) && clock_speed < clock_speed_max) {
			time_forwards = true;
			clock_speed += clock_speed_acceleration;
		} else {
			if(clock_speed > 1 && time_forwards) {
				clock_speed -= clock_speed_acceleration;
			} else if(clock_speed < -1 && !time_forwards) {
				clock_speed += clock_speed_acceleration;
			}
		}
	} else {
		if(clock_speed > 1) {
			clock_speed -= clock_speed_acceleration;
		} else if(clock_speed < -1) {
			clock_speed += clock_speed_acceleration;
		}
	}

	clock += clock_speed;
	if(clock < 0) {
		clock = 0;
		clock_speed = 0;
	}

	///////////////////

	var human_type = instance_find(oHuman, 0);
	if(human_type != noone) {
		if(human_type.object_index == oBaby && clock > man_time) {
			instance_create_layer(human_type.x,human_type.y,"Instances",oMiddleMan);
			instance_destroy(oBaby);
			clock_cooldown = 5;
		} else if(human_type.object_index == oMiddleMan) {
			if(clock > old_man_time) {
				instance_create_layer(human_type.x,human_type.y,"Instances",oOldMan);
				instance_destroy(oMiddleMan);
				clock_cooldown = 5;
			} else if(clock < man_time) {
				instance_create_layer(human_type.x,human_type.y,"Instances",oBaby);
				instance_destroy(oMiddleMan);
				clock_cooldown = 5;
			}
		} else if(human_type.object_index == oOldMan) {
			if(clock > dead_time) {
				instance_destroy(oOldMan);
				instance_create_layer(human_type.x,human_type.y,"Instances",oSkeleton);
				clock_cooldown = 5;
				global.GAME_STATE = GAME_STATE.DEAD;
			} else if(clock < old_man_time) {
				instance_create_layer(human_type.x,human_type.y,"Instances",oMiddleMan);
				instance_destroy(oOldMan);
				clock_cooldown = 5;
			}
		}
	}
	
	if(clock_cooldown > 0) {
		clock_cooldown --;
		if(clock_cooldown == 0) {
			new_remote_press_needed = true;
		}
	}
	
	if(new_remote_press_needed) {
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D"))) {
			new_remote_press_needed = false;
		}
	}
} else {
	clock_speed = 1;
}
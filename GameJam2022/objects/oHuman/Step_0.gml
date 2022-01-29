if(global.GAME_STATE == GAME_STATE.PLAYING) {
	var x_move = 0;
	if(keyboard_check(vk_right)) {
		x_move += h_speed;
	} else if(keyboard_check(vk_left)) {
		x_move -= h_speed;
	}

	// Horizontal collision
	var collided_side = instance_place(x+x_move,y,oCollisionSquare);
	if(collided_side != noone && collided_side.object_index != oPassThroughSquare) {
		//Flush.
		while(!instance_place(x+sign(x_move),y,oCollisionSquare)) {
			x+=sign(x_move);
		}
		x_move = 0;
	}
	if(x_move != 0) {
		sprite_index = walk_cycle;
	} else {
		sprite_index = stand_anim;
	}
	if(x_move < 0) {
		image_xscale = -1.0;
	} else {
		image_xscale = 1.0;
	}

	x += x_move;

	if(keyboard_check_pressed(vk_space)) {
		jump_speed = jump_strength;
		jumping = true;
	}

	// Jump collision
	var jump_this_frame = 0;
	if(jumping) {
		var stop_player = true;
		var collided_up = instance_place(x,y-jump_strength,oCollisionSquare);
		stop_player = collided_up != noone;
		stop_player = stop_player && collided_up.object_index != oPassThroughSquare;
		if(!stop_player) {
			y -= jump_strength;
			jump_this_frame = 0 - jump_strength;
		} else {
			//Flush.
			while(!place_meeting(x,y-1,oCollisionSquare)) {
				y--;
			}
			falling = false;
			jumping = false;
			gravity_rate = 0;
		}
	}

	
	if(!falling) {
		var collided = instance_place(x,y+1,oCollisionSquare);
		falling = collided == noone || collided.object_index != oPassThroughSquare;
	} else {
		gravity_rate += gravity_rate_accel;
		
		// Vertical collision
		var stop_player = false;	
		var collision_y_list = ds_list_create();
		var collision_y_num = instance_place_list(x, y+gravity_rate, oCollisionSquare, collision_y_list, true);
		
		for(var i = 0; i < collision_y_num; i++) {
			var collided_y = collision_y_list[| i];
			if(collided_y.object_index == oPassThroughSquare) {
				var y_move = jump_this_frame + gravity_rate;
				stop_player = bbox_bottom < collided_y.bbox_top && y_move >= 0;
			} else {
				stop_player = true;
			}
		}
		ds_list_destroy(collision_y_list);
			
		if(!stop_player) {
			y += gravity_rate;
		} else {
			//Flush.
			while(!place_meeting(x,y+1,oCollisionSquare)) {
				y++;
			}
			falling = false;
			jumping = false;
			gravity_rate = 0;
		}
	}
	
	if(bbox_top > room_height) {
		global.GAME_STATE = GAME_STATE.DEAD;
	}
	
	// Squished
	var collided_squish = instance_place(x,y,oSquishZone);
	if(collided_squish != noone && object_index != oBaby) {
		instance_create_layer(x,y,"Instances",oSkeleton);
		instance_destroy(self.id);
		global.GAME_STATE = GAME_STATE.DEAD;
	}
}
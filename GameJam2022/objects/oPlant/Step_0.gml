var remote_controller = instance_find(oRemoteController, 0);
if(remote_controller != noone) {
	if(remote_controller.clock < start_time) {
		image_speed = 0;
		image_index = 1;
	} else {
		image_speed = remote_controller.clock_speed / speed_divisor;
	}
}

if(state == PLANT_STATE.GROW_0) {
	if(image_index >= 35) {
		state = PLANT_STATE.GROW_1;
	}
} else if(state == PLANT_STATE.GROW_1) {
	if(image_index < 35) {
		state = PLANT_STATE.GROW_0;
	} else if(image_index >= 56) {
		state = PLANT_STATE.GROW_2;
	}
} else if(state == PLANT_STATE.GROW_2) {
	if(image_index < 56) {
		state = PLANT_STATE.GROW_1;
	} else if(image_index >= 84) {
		state = PLANT_STATE.GROW_3;
	}
} else if(state == PLANT_STATE.GROW_3) {
	if(image_index < 84) {
		state = PLANT_STATE.GROW_2;
	} else if(image_index >= 200) {
		state = PLANT_STATE.DIE_2;
	}
} else if(state == PLANT_STATE.DIE_2) {
	if(image_index < 200) {
		state = PLANT_STATE.GROW_3;
	} else if(image_index >= 306) {
		state = PLANT_STATE.DIE_1;
	}
} else if(state == PLANT_STATE.DIE_1) {
	if(image_index < 306) {
		state = PLANT_STATE.DIE_2;
	} else if(image_index >= 417) {
		state = PLANT_STATE.DIE_0;
	}
} else if(state == PLANT_STATE.DIE_0) {
	if(image_index < 417) {
		state = PLANT_STATE.DIE_1;
	}
}

if(state >= PLANT_STATE.GROW_1 && state < PLANT_STATE.DIE_2) {
	if(leaf1 == noone) {
		leaf1 = instance_create_layer(x-200,y-175,"Instances", oPassThroughSquare);
	}
} else {
	if(leaf1 != noone) {
		instance_destroy(leaf1);
		leaf1 = noone;
	}
}

if(state >= PLANT_STATE.GROW_2 && state < PLANT_STATE.DIE_1) {
	if(leaf2 == noone) {
		leaf2 = instance_create_layer(x,y-300,"Instances", oPassThroughSquare);
	}
} else {
	if(leaf2 != noone) {
		instance_destroy(leaf2);
		leaf2 = noone;
	}
}

if(state >= PLANT_STATE.GROW_3 && state < PLANT_STATE.DIE_0) {
	if(leaf3 == noone) {
		leaf3 = instance_create_layer(x-200,y-425,"Instances", oPassThroughSquare);
	}
} else {
	if(leaf3 != noone) {
		instance_destroy(leaf3);
		leaf3 = noone;
	}
}
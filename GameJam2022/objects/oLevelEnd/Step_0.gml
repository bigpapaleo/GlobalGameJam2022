var human = instance_place(x,y,oHuman);
if(human != noone && human.object_index == oOldMan) {
	global.GAME_STATE = GAME_STATE.WIN;
	instance_destroy(human);
}
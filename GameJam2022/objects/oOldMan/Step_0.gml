event_inherited();

if(keyboard_check(vk_shift) && attack_time == 0) {
	attack_time = 30;
}

if(attack_time > 0) {
	attack_time--;
}

if(attack_time > 0) {
	sprite_index = sOldManAttack;
}
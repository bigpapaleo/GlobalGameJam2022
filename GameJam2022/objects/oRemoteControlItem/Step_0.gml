sin_wave = (sin_wave+5)%360;

y += sin(degtorad(sin_wave));

if(place_meeting(x,y,oHuman)) {
	global.got_remote = true;
	instance_destroy(self.id);
}
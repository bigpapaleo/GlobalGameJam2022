var human = instance_find(oHuman, 0);
var cam = view_get_camera(view_camera[0]);

if(global.got_remote) {
	camera_set_view_size(cam, 960*1.5, 540*1.5);
	letterbox_size = 50;
}

screen_width  = camera_get_view_width(view_camera[0]);
screen_height = camera_get_view_height(view_camera[0]);

if(human != noone) {
	var cam_x = human.x - (screen_width / 2);
	var cam_y = human.y - (screen_height / 2);
	if(cam_x < 0) cam_x = 0;
	if(cam_y < 0-letterbox_size) cam_y = 0-letterbox_size;
	if(cam_x > room_width-screen_width) cam_x = room_width-screen_width;
	if(cam_y > room_height-screen_height+letterbox_size) cam_y = room_height-screen_height+letterbox_size;
	
	camera_set_view_pos(cam, cam_x, cam_y);
}
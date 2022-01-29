///draw_text_colour_outline(
///		0 = x,
///		1 = y,
///		2 = string,
///		3 = textColor1,
///		4 = textColor2,
///		5 = textAlpha,
///		6 = outlineColor1,
///		7 = outlineColor2,
///		8 = outlineAlpha,
///		9 = outlineThickness,
///		10 = outlineQuality,
///		11 = xscale, 
///		12 = yscale,
///		13 = angle);
function draw_text_color_outline(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13) {
	//By Blokatt - @blokatt, blokatt.net
	var i;
	for (i = 0; i < 360; i += 360 / argument10) {
	    draw_text_transformed_color(
			argument0 + lengthdir_x(argument9, i),
			argument1 + lengthdir_y(argument9, i),
			string(argument2), argument11, argument12, argument13,
			argument6, argument6, argument7, argument7, argument8
		);
	}
	draw_text_transformed_color(
		argument0, argument1, string(argument2),
		argument11, argument12, argument13,
		argument3, argument3, argument4,
		argument4, argument5
	);


}

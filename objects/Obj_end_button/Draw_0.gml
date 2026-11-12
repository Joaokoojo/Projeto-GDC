draw_self();

var _meio_x = room_width / 2;
var _meio_y = room_height / 2;

var _texto = "Gamedev club";
var _tx = _meio_x;
var _ty = _meio_y - 64;

draw_set_halign(fa_center);
draw_set_font(fn_pixel);

draw_set_colour(c_gray);
draw_text(_tx - 1, _ty, _texto);
draw_text(_tx + 1, _ty, _texto);
draw_text(_tx, _ty - 1, _texto);
draw_text(_tx, _ty + 1, _texto);

draw_set_colour(c_white);
draw_text(_tx, _ty, _texto);

draw_set_halign(-1);
draw_set_font(-1);
draw_set_colour(c_white);
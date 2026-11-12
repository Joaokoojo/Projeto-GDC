var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

draw_set_halign(fa_center);
draw_set_font(fn_pixel);

var _dicas = [
    ["A / D ou Setas: Andar", 130, 100],
    ["Espaço: Pular", 320, 80],
    ["E: Jogar Machado", 510, 100],
	["Procure os diamantes!", 320, 110]
];

for (var i = 0; i < array_length(_dicas); i++) {
    var _texto = _dicas[i][0];

    var _tx = (_dicas[i][1] - _cam_x) * _gui_w / _cam_w;
    var _ty = (_dicas[i][2] - _cam_y) * _gui_h / _cam_h;

    draw_set_colour(c_gray);
    draw_text(_tx - 1, _ty, _texto);
    draw_text(_tx + 1, _ty, _texto);
    draw_text(_tx, _ty - 1, _texto);
    draw_text(_tx, _ty + 1, _texto);

    draw_set_colour(c_white);
    draw_text(_tx, _ty, _texto);
}

draw_set_halign(-1);
draw_set_font(-1);
draw_set_colour(c_white);
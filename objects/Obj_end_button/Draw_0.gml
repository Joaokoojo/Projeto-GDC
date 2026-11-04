draw_self()

var _meio_x = room_width/2
var _meio_y = room_height/2

draw_set_halign(fa_center)
draw_set_font(fn_pixel)
draw_set_colour(c_black)

draw_text(_meio_x, _meio_y - 64, "Gamedev club")

draw_set_halign(-1)
draw_set_font(-1)
draw_set_colour(-1)

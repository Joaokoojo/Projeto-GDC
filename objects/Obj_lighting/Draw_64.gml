var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var camera = view_camera[0];

var camera_x = camera_get_view_x(camera);
var camera_y = camera_get_view_y(camera);

var camera_width = camera_get_view_width(camera);
var camera_height = camera_get_view_height(camera);

if (!surface_exists(light_surface)) {
    light_surface = surface_create(gui_width, gui_height);
}

surface_set_target(light_surface);

draw_clear_alpha(c_black, 1);

gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

draw_set_alpha(1);
draw_set_color(c_white);

// Arrumei aqui pra varios objetos poderem emitir luz
// só colocar na lista
var lista_brilha = [Obj_torch, Obj_axe];

for (var i = 0; i < array_length(lista_brilha); i++) {
    with (lista_brilha[i]) {
        var light_x = (x - camera_x) * gui_width / camera_width;
        var light_y = (y - camera_y) * gui_height / camera_height;

        var scaled_radius = light_radius * gui_width / camera_width;

        draw_circle(light_x, light_y, scaled_radius, false);
    }
}

gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(light_surface, 0, 0);

//INDICADOR NIVEL
draw_set_colour(c_white);
if (room == rm_level1)
    draw_text(20, 20, "Level 1")
else if (room == rm_level2)
    draw_text(20, 20, "Level 2")
if (room == rm_level3)
    draw_text(20, 20, "Level 3")
else if (room == rm_level4)
    draw_text(20, 20, "Level 4")
else if (room == rm_level5)
    draw_text(20, 20, "Level 5!")

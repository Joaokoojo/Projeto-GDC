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

// Remove darkness around every torch
gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

draw_set_alpha(1);
draw_set_color(c_white);

// Esse with roda esse codigo para cada instancia de torcha, e as variaveis aqui dentro são da instancia torcha
with (Obj_torch) {
    var light_x = (x - camera_x) * gui_width / camera_width;
    var light_y = (y - camera_y) * gui_height / camera_height;

    var scaled_radius = light_radius * gui_width / camera_width;

    draw_circle(light_x, light_y, scaled_radius, false);
}

gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(light_surface, 0, 0);
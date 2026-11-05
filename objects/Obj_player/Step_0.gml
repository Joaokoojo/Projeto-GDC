var _left         = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _right        = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _jump_pressed = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up);

var _move_dir = _right - _left;
xspeed = _move_dir * move_speed;

if (_move_dir != 0) {
    image_xscale = _move_dir;
}

var _is_grounded = place_meeting(x, y + 1, Obj_solid);

if (_is_grounded) {
    coyote_timer = coyote_timer_max;
    if (yspeed > 0) yspeed = 0; 
} else {
    coyote_timer--;
    yspeed += grav;           
}

if (_jump_pressed) {
    jump_buffer = jump_buffer_max;
} else if (jump_buffer > 0) {
    jump_buffer--;
}

if (jump_buffer > 0 && coyote_timer > 0) {
    yspeed = jump;
    jump_buffer = 0; 
    coyote_timer = 0;
}

if (_is_grounded) {
    if (xspeed != 0) {
        sprite_index = Spr_player_run;
    } else {
        sprite_index = Spr_player_idle;
    }
} else {
    sprite_index = Spr_player_jump;
}

move_and_collide(xspeed, yspeed, [Obj_solid]);

if (torch_timer > 0) {
    torch_timer--;
}

if (keyboard_check_pressed(ord("E")) && torch_timer <= 0) {
    var _torch = instance_create_layer(x, y - 8, "Instances", Obj_torch);

    _torch.direction_x = image_xscale;
    _torch.direction_y = -7;           
    _torch.is_thrown = true;
	
    torch_timer = torch_cooldown;
}
var _left = keyboard_check(ord("A")) || keyboard_check(vk_left)

var _right = keyboard_check(ord("D")) || keyboard_check(vk_right)

var _jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up)

xspeed = (_right - _left) * move_speed

yspeed += grav

if (place_meeting(x, y + 1, Obj_solid)){
	yspeed = 0
	
	if (_jump){
		yspeed = jump;
	}
	
	if (xspeed != 0){
		sprite_index = Spr_player_run
	}else {
		sprite_index = Spr_player_idle
	}
} else {
	sprite_index = Spr_player_jump
}

if (xspeed != 0){
	image_xscale = (_right - _left)
}

move_and_collide(xspeed, yspeed, [Obj_solid])

if (torch_timer > 0) {
    torch_timer--;
}

// Arremessar torcha
if (keyboard_check_pressed(ord("E")) && torch_timer <= 0) {
    var _torch = instance_create_layer(x, y, "Instances", Obj_torch);

    _torch.direction_x = image_xscale;
    _torch.direction_y = 0;

    _torch.is_thrown = true;
	
	torch_timer = torch_cooldown;
}
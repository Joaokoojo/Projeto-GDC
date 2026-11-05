xspeed = 0;
yspeed = 0;

move_speed = 2;
jump = -4;   
grav = 0.2; 


mask_index = Spr_player_idle;

jump_buffer = 0;
jump_buffer_max = 7;

coyote_timer = 0;
coyote_timer_max = 6; 

torch_cooldown = 2 * game_get_speed(gamespeed_fps);
torch_timer = 0;
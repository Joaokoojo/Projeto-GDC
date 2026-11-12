if (is_thrown) {
    direction_y += grav;
    
    x += direction_x * throw_speed;
    y += direction_y;
    
    if (direction_x != 0) {
        image_angle -= spin_speed * sign(direction_x);
    }
    
    if (place_meeting(x, y, Obj_solid)) {
        is_thrown = false;
    }
}
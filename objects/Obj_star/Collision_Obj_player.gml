global.potuacao += 1
instance_destroy()

if (global.potuacao == 2){
	if(room == rm_level1)
	room_goto(rm_level2)
	else if(room == rm_level2)
	room_goto(rm_level3)
	else if(room == rm_level3)
	room_goto(rm_level4)
	else if(room == rm_level4)
	room_goto(rm_level5)
	else if(room == rm_level5)
	room_goto(rm_win)
}


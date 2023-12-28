/// @description Insert description here
// You can write your code in this editor

sprite_index = spr_player

if !obj_control.lost {

	if(keyboard_check(vk_left) and !place_meeting(x-move_speed, y, obj_block)){
		sprite_index = character_walk_strip6
		image_xscale = -1;
		x += -move_speed;
	}
	if(keyboard_check(vk_right) and !place_meeting(x+move_speed, y, obj_block)){
		sprite_index = character_walk_strip6
		image_xscale = 1;
		x += move_speed;
	}
	if(keyboard_check(vk_up)){
		if(place_meeting(x, y+1, obj_block)){
			vspeed = jump_height;
		}
	}

}

if(place_meeting(x, y+1, obj_block)){
	gravity = 0;
} else {
	gravity = 0.25;
}

//var inst = instance_place(x, y, obj_block)
//while (place_meeting(x, y + 1, obj_block) && inst.) {
//    y -= 1;
//}
/*
while (place_meeting(x, y + 2, obj_block)) {
    var inst = instance_place(x, y + 2, obj_block)
    if inst.block_id != 0
        y -= 1
    else
        break
}*/

if !obj_control.lost {
	if(keyboard_check(vk_space) and copter_power != 0){
		sprite_index = character_fly_strip8
		flying = true;
		y -= flying_speed;
		gravity = 0;
		copter_power -= 6;
	} else {
		flying = false;
	}
}

if(vspeed > 15)
{
	vspeed = 15;
}

if(y > 4000 && !obj_control.lost){
	hp -= 30

	if (hp <= 0)
	{
		audio_play_sound(Player_death, 1, false)
		other.alarm[0] = 60
		obj_control.lost = true
	}
}



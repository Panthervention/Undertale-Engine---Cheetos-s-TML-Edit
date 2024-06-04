///@arg spr_index
///@arg x
///@arg y
///@arg angle
///@arg xscale
///@arg yscale
///@arg x_target
///@arg y_target
///@arg angle_target
///@arg pause
///@arg blast_time
///@arg duration
///@arg [type]
///@arg [blur]
///@arg [c_sound]
///@arg [r_sound]
function Bullet_Blaster(SPRITE_INDEX, X, Y, ANGLE, XSCALE, YSCALE, IDEALX, IDEALY, IDEALROT, PAUSE, BLAST, DURATION, TYPE = 0, BLUR = false, C = 1, R = 1) 
{	
	var DEPTH = DEPTH_BATTLE.BULLET_HIGH;
	
	var _gb = instance_create_depth(0, 0, DEPTH, obj_battle_bullet_gb);
	var _blaster = _gb.blaster;
	with (_blaster)
	{
		sprite_index = SPRITE_INDEX;
		x = X;
		y = Y;
		image_angle = ANGLE;
		image_xscale = XSCALE;
		image_yscale = YSCALE;
	}
	with (_gb)
	{
		target_x = IDEALX;
		target_y = IDEALY;
		target_angle = IDEALROT;
		
		time_pause = PAUSE;
		time_blast = BLAST;
		time_move = DURATION;
		
		type = TYPE;
		
		charge_sound = C;
		release_sound = R;
		blurring = BLUR;
	}
	return _gb;
}
///@arg spr_index
///@arg len_x
///@arg len_y
///@arg len_start
///@arg len_end
///@arg rot
///@arg dir
///@arg xscale
///@arg yscale
///@arg pause
///@arg blast_time
///@arg duration
///@arg [type]
///@arg [blur]
///@arg [c_sound]
///@arg [r_sound]
function Bullet_BlasterCircle(spr_index, len_x, len_y, len_start, len_end, rot, dir, xscale, yscale, pause, blast, duration, type = 0, blur = false, c = 1, r = 1)
{
	var length_start = len_start,
		length_end = len_end,
		x_start = (len_x + lengthdir_x(length_start, dir)),
		y_start = (len_y + lengthdir_y(length_start, dir)),
		x_target = (len_x + lengthdir_x(length_end, dir)),
		y_target = (len_y + lengthdir_y(length_end, dir)),
		angle_start = ((point_direction(x_start, y_start, x_target, y_target)) - 270 * rot),
		angle_target = (point_direction(x_start, y_start, x_target, y_target)),
		gb = Bullet_Blaster(spr_index, x_start, y_start, angle_start, xscale, yscale, x_target, y_target, angle_target, pause, blast, duration, type, blur, c, r);
	return gb;
}

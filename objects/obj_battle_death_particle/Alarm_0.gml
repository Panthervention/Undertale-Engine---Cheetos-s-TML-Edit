if (sprite_exists(sprite))
{
    _ps = part_system_create();
    _p = part_type_create();
    part_system_depth(_ps, DEPTH_BATTLE.ENEMY);
    part_type_alpha2(_p, 1, 0);
    part_type_color1(_p, c_white);
    part_type_shape(_p, pt_shape_pixel);
    part_type_life(_p, 20, 60);
    part_type_scale(_p, 2, 2);
    part_type_direction(_p, 70, 110, 0, 0);
    part_type_speed(_p, 0.1, 0.5, 0.2, 0);
    
    _inst = instance_create_depth(x, y, 0, obj_battle_death_particle_collision);
    _inst.sprite_index = sprite;
    _inst.image_xscale = scale_x;
    _inst.image_yscale = scale_y;
    _line = y - sprite_get_yoffset(sprite) * scale_y;
    if (_line < 0)
        _line = 0;
}
else
    instance_destroy();

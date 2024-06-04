if (sprite_exists(sprite))
{
    if (_line == 0)
        draw_sprite_ext(sprite, 0, x, y, scale_x, scale_y, 0, c_white, 1);
    else
    {
        if (!surface_exists(_surface))
            _surface = surface_create(640, 480);
        surface_set_target(_surface);
        {
            draw_clear_alpha(0, 0);
            draw_sprite_ext(sprite, 0, x, y, scale_x, scale_y, 0, c_white, 1);
        }
        surface_reset_target();
        draw_surface_part(_surface, 0, _line - 2, 640, 480 - (_line - 2), 0, _line - 2);
    }
}

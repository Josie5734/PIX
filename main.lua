--PIX main file



function _init()

    player_init()

    drawing_init() 

    ui_init()

    palt(0,false) --set black to not transparent
    palt(4,true) --set brown to transparent - unlikely to ever be used
    cls(7) --clear screen

end



function _update()

    player_update()

end



function _draw()

    cls(7) --clear screen, set white background

    ui_draw()

    player_draw()
 
    drawing_draw()

end
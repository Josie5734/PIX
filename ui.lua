--file for all ui code

function ui_init()

end

function ui_draw()

    color(0)

    --draw the borders of the game area
    line(0,10,128,10) --top border
    line(0,116,128,116) --bottom border
    line(10,10,10,116) --left border
    line(116,10,116,116) --right border

    --logo
    spr(1,1,1,3,1)

end
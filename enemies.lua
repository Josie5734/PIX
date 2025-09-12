--code for the pix and other enemy entities

--pix

function pix_init()

    pix = {
        x = 63, y = 63, --set x,y coords, starts in middle of screen
        s = 5, color = 14, --size, color
        targetx = 63, targety = 63 --target position to be moving to
    }

end

function pix_update()

    if flr(pix.x) != pix.targetx and flr(pix.y) != pix.targety then --if not at target
        if pix.x < pix.targetx then pix.x += rnd(2) else pix.x -= rnd(0.5) end --move towards x by random amount
        if pix.y < pix.targety then pix.y += rnd(2) else pix.y -= rnd(0.5) end --move towards y by random amount
        printh(pix.x .. " " .. pix.y .. " " .. pix.targetx .. " ".. pix.targety)
    else --if at target
        pix.targetx = flr(rnd(100)) + 10 --generate new target 
        pix.targety = flr(rnd(100)) + 10
        printh("new target")
    end

end

function pix_draw()

    rect(pix.x,pix.y,pix.x+pix.s,pix.y+pix.s,pix.color)

end
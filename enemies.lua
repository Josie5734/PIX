--code for the pix and other enemy entities

--pix

function pix_init()

    pix = {
        x = 63, y = 63, --set x,y coords, starts in middle of screen
        s = 5, color = 14, --size, color
        targetx = 63, targety = 63, --target position to be moving to
        speed = rnd(1.2), --the current speed (changes everytime the target changes)
    }

end

function pix_update()

    --pix random movement ai    --sometimes bugs out may need refining
    if flr(pix.x) != pix.targetx and flr(pix.y) != pix.targety then --if not at target
        if pix.x < pix.targetx then pix.x += pix.speed else pix.x -= pix.speed end --move towards x by random amount
        if pix.y < pix.targety then pix.y += pix.speed else pix.y -= pix.speed end --move towards y by random amount
    else --if at target
        pix.targetx = flr(rnd(100)) + 10 --generate new target 
        pix.targety = flr(rnd(100)) + 10
        pix.speed = rnd(1.2) --generate new speed
    end

end

function pix_draw()

    rect(pix.x,pix.y,pix.x+pix.s,pix.y+pix.s,pix.color)

end
--file for all player related things

--setup 
function player_init()
    player = {
        x = 63, y = 116, --player position
        r = 3, color = 14, --radius and color of player circle 
        move = 0.5, slowmove = 0.1, --the values to use when moving - standard and slow
        drawing = false, --state for if player is drawing a line or not
        direction = "", --direction of last move
    }
end 

function player_update()

    --movement
    if player.drawing == false then --state is not drawing

        --left
        if btn(0) and not btn(1) and not btn(2) and not btn(3) then 
            if collision("left",0) and player.x > 10 then --if there is a black pixel and not at the edge of game area
                player.x -= player.move --move 
            end
        end 

        --right
        if btn(1) and not btn(0) and not btn(2) and not btn(3) then 
            if collision("right",0) and player.x < 116 then --if there is a black pixel and not at the edge of game area
                player.x += player.move --move 
            end
        end
        
        --up
        if btn(2) and not btn(0) and not btn(1) and not btn(3) then
            if collision("up",0) and player.y > 10 then --if there is a black pixel and not at the edge of game area
                player.y -= player.move --move 
            end
        end

        --down
        if btn(3) and not btn(0) and not btn(1) and not btn(2) then 
            if collision("down",0) and player.y < 116 then --if there is a black pixel and not at the edge of game area
                player.y += player.move --move 
            end
        end

    elseif player.drawing == true then --state is drawing

        --left
        if btn(0) and not btn(1) and not btn(2) and not btn(3) then 
            
        end

        --right
        if btn(1) and not btn(0) and not btn(2) and not btn(3) then 
            
        end
        
        --up
        if btn(2) and not btn(0) and not btn(1) and not btn(3) then
            
        end

        --down
        if btn(3) and not btn(0) and not btn(1) and not btn(2) then 
            
        end

    end
    
end

function player_draw()

    circ(player.x,player.y,player.r,player.color) --draw player character
    pset(player.x,player.y,player.color)
    color(0) --reset pen color to black

end


--check collision for player
function collision(direction,color) --object, direction

    local collide = false --is collision true?

    if direction == "left" then
        if pget(player.x-1,player.y) == color then collide = true end --if pixel is black, collide
    elseif direction == "right" then 
        if pget(player.x+1,player.y) == color then collide = true end --if pixel is black, collide
    elseif direction == "up" then
        if pget(player.x,player.y-1) == color then collide = true end --if pixel is black, collide
    elseif direction == "down" then 
        if pget(player.x,player.y-1) == color then collide = true end --if pixel is black, collide
    end

    return collide --return true/false

end
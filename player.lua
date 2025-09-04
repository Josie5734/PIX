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
            if collision("left") and player.x > 10 then --if there is a black pixel and not at the edge of game area
                player.x -= player.move --move 
            end
            if btnp(4) then player.drawing = true createline() player.direction =  "left" end --if press Z when moving, trigger draw state with a new line and set direction
        end

        --right
        if btn(1) and not btn(0) and not btn(2) and not btn(3) then 
            if collision("right") and player.x < 116 then --if there is a black pixel and not at the edge of game area
                player.x += player.move --move 
            end
            if btnp(4) then player.drawing = true createline() player.direction =  "right" end --if press Z when moving, trigger draw state with a new line and set direction
        end
        
        --up
        if btn(2) and not btn(0) and not btn(1) and not btn(3) then
            if collision("up") and player.y > 10 then --if there is a black pixel and not at the edge of game area
                player.y -= player.move --move 
            end
            if btnp(4) then player.drawing = true createline() player.direction =  "up" end --if press Z when moving, trigger draw state with a new line and set direction
        end

        --down
        if btn(3) and not btn(0) and not btn(1) and not btn(2) then 
            if collision("down") and player.y < 116 then --if there is a black pixel and not at the edge of game area
                player.y += player.move --move 
            end
            if btnp(4) then player.drawing = true createline() player.direction = "down" end --if press Z when moving, trigger draw state with a new line and set direction
        end

    elseif player.drawing == true then --state is drawing

        --when drawing can move in any direction
        --cant go back on yourself
        --crashing into yourself is ok - just stops 1 pixel away from the line instead of crashing
        --spiralling just triggers same stopping thing so you cant move
        --create lines on direction
        --when colliding with an existing line, end drawing, fill rectangle 


        --current:
            --move and draw a line until you meet the edge, go back into non drawing state
            --does nothing if trying to go back onself or collide into the current line

            --just separated out the lines into finished and active, currently stops doing anything when it is 1 pixel from the border lines

        --left
        if btn(0) and not btn(1) and not btn(2) and not btn(3) then 
            if player.direction != "right" and pget(player.x-2,player.y) != 6 then --if not trying to go back on self and not colliding with current line
                if player.direction != "left" then --if now moving in a different direction
                    createline() --make a new line
                end
                if player.x > 10 then --if not at the edge of game area
                    player.x -= player.move --move 
                    player.direction = "left"
                end
                if collision("left",0) then --if colliding in next move
                    player.drawing = false
                    finishdrawing()
                end
            end
        end

        --right
        if btn(1) and not btn(0) and not btn(2) and not btn(3) then 
            if player.direction != "left" and pget(player.x+2,player.y) != 6 then --if not trying to go back on self and not colliding with current line
                if player.direction != "right" then --if now moving in a different direction
                    createline() --make a new line
                end
                if player.x < 116 then --if not at the edge of game area
                    player.x += player.move --move 
                    player.direction = "right"
                end
                if collision("right",0) then --if colliding in next move
                    player.drawing = false
                    finishdrawing()
                end
            end
        end
        
        --up
        if btn(2) and not btn(0) and not btn(1) and not btn(3) then
            if player.direction != "down" and pget(player.x,player.y-2) != 6 then --if not trying to go back on self and not colliding with current line
                if player.direction != "up" then --if now moving in a different direction
                    createline() --make a new line
                end
                if player.y > 10 then --if not at the edge of game area
                    player.y -= player.move --move 
                    player.direction = "up"
                end
                if collision("up",0) then --if colliding in next move
                    player.drawing = false
                    finishdrawing()
                end
            end
        end

        --down
        if btn(3) and not btn(0) and not btn(1) and not btn(2) then 
            if player.direction != "up" and pget(player.x,player.y+2) != 6 then --if not trying to go back on self and not colliding with current line
                if player.direction != "down" then --if now moving in a different direction
                    createline() --make a new line
                end
                if player.y < 116 then --if not at the edge of game area
                    player.y += player.move --move 
                    player.direction = "down"
                end
                if collision("down",0) then --if colliding in next move
                    player.drawing = false
                    finishdrawing()
                end
            end
        end

        --update current line 
        drawing_update() --update the current line

    end



    
    --[[
    --movement
    if btn(0) and not btn(1) and not btn(2) and not btn(3) then --left
        if player.x <= 116 and player.x > 10 then --within game area
            
            player.x -= player.move --move
            player.direction = "left" --set direction
        end
            
    end

    if btn(1) and not btn(0) and not btn(2) and not btn(3) then --right
        if player.x < 116 and player.x >= 10 then --within game area
            
            player.x += player.move
            player.direction = "right"
        end
    end

    if btn(2) and not btn(0) and not btn(1) and not btn(3) then --up
        if player.y <= 116 and player.y > 10 then
            
            player.y -= player.move
            player.direction = "up"
        end
    end

    if btn(3) and not btn(0) and not btn(1) and not btn(2) then --down
        if player.y < 116 and player.y >= 10 then
            
            player.y += player.move
            player.direction = "down"
        end
    end


    
    ]]

    

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
        if pget(player.x,player.y+1) == color then collide = true end --if pixel is black, collide
    end

    return collide --return true/false

end
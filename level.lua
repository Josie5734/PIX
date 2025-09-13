--code for the levels 

function level_init()

    levelsize = 106
    
    --create a big grid for the game area (107x107), uses color value to say what is in that pixel
    levelgrid = {}
    for i = 1, levelsize do --for 107 rows
        levelgrid[i] = {} --make a column table

        for j = 1, levelsize do --fill the column table with value 7 (white)
            levelgrid[i][j] = 7
        end
    end

    --fill in the outer edges (gameborder)
    for i = 1, levelsize do 
        levelgrid[1][i] = 0 --set top row to black
        levelgrid[levelsize][i] = 0 --set bottom row black
        levelgrid[i][1] = 0 --set left side black
        levelgrid[i][levelsize] = 0 --set right side black
    end

end

--creates a buffer version of the levelgrid used for drawing a new line
function level_buffer()

    --create a big grid for the game area (107x107), uses color value to say what is in that pixel
    levelgridbuffer = {}
    for i = 1, levelsize do --for 107 rows
        levelgridbuffer[i] = {} --make a column table

        for j = 1, levelsize do --fill the column table with value 7 (white)
            levelgridbuffer[i][j] = 7
        end
    end

    --fill in the outer edges (gameborder)
    for i = 1, levelsize do 
        levelgridbuffer[1][i] = 0 --set top row to black
        levelgridbuffer[levelsize][i] = 0 --set bottom row black
        levelgridbuffer[i][1] = 0 --set left side black
        levelgridbuffer[i][levelsize] = 0 --set right side black
    end

end
--code for the lines and filled in sections

--lists for drawing objects
function drawing_init()
    lines = {} --all lines in game
    activelines = {} --the line currently being drawn when in drawing mode
    rectangles = {} --list of objects for all the filled in rectangles to draw
end

--update all drawing related things
function drawing_update()

    if #activelines > 0 then
        --update active lines
        local i = #activelines --get number of lines
        activelines[i].finishx = player.x --update endpoint of last line in table
        activelines[i].finishy = player.y 
    end

end

--draw drawing related things
function drawing_draw()

    for l in all(lines) do --for all the finished lines
        line(l.startx,l.starty,l.finishx,l.finishy,6) --draw a line
    end
    for l in all(activelines) do --for all the currently active lines
        line(l.startx,l.starty,l.finishx,l.finishy,6) --draw a line
    end

    for r in all(rectangles) do --draw all the filled in rectangles
        --not sure how to fill these
    end

end


--create a new line object
function createline()

    local line = {
        startx = player.x, starty = player.y, --starting coords of line
        finishx = player.x, finishx = player.y --end coords of line
    }
    add(activelines,line) --add new line object to the lines table

end

--put all the active lines into the standard lines list
function finishdrawing()

    for l in all(activelines) do --add each item in activelines to lines
        add(lines,l)
    end

    activelines = {} --reset activelines to an empty list

end

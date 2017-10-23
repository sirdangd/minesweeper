function checkSides (x,y : int) : int 
    if x < 1 or x > 9 or y < 1 or y > 9 then
	result 0
    end if
    if map(x, y) = mine then
	result 1
    else
	result 0
    end if

end checkSides

function neighborNum (x,y : int) : int
    var neighborCtr : int := 0
    
    if map(x,y) = mine then
	result mine
    end if
    
    neighborCtr += checkSides(x+1,y)
    neighborCtr += checkSides(x-1,y)
    neighborCtr += checkSides(x,y+1)
    neighborCtr += checkSides(x,y-1)
    neighborCtr += checkSides(x+1,y+1)
    neighborCtr += checkSides(x+1,y-1)
    neighborCtr += checkSides(x-1,y+1)
    neighborCtr += checkSides(x-1,y-1)
    
    result neighborCtr

end neighborNum

procedure setupNeighborEmpty()

    for x : 1 .. gameSizeX
	for y : 1 .. gameSizeY
	    if map(x,y) not= mine then
		neighborsMap(x,y) := neighborNum(x,y)
		if neighborsMap(x,y) = 0 then
		    map(x,y) := Empty
		else
		    map(x,y) := Neighbor
		end if
	    end if
	end for
    end for
    
end setupNeighborEmpty

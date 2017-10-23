procedure minesPosition ()

    var placeX, placeY : int
    for i : 1 .. numOfMines
	loop 
	    randint(placeX, 1, gameSizeX)
	    randint(placeY, 1, gameSizeY)
	    if map(placeX, placeY) not= mine then
		map(placeX, placeY) := mine                 
		exit
	    end if
	end loop
    end for

end minesPosition

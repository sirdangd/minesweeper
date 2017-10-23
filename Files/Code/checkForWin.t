function playerWon() : boolean
    for x : 1 .. 9
	for y : 1 .. 9
	    if map(x,y) = mine then
		if squareState(x,y) not= squareFlagged then
		    result false
		end if
	    else
		if squareState(x,y) not= squareRevealed and map(x,y) not= mine then
		    result false
		end if
	    end if
	end for
    end for
    result true
end playerWon

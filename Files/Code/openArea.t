function reveal (x, y : int) : boolean
    if x < 1 or x > 9 or y < 1 or y > 9 then
	result false
    end if
    if squareState (x, y) = squareRevealed then
	result false
    end if
    if map(x,y) = mine then
	result false
    end if
    if map (x, y) = Neighbor then
	squareState (x, y) := squareRevealed
	result false
    end if
    squareState (x, y) := squareRevealed
    result true
end reveal

procedure openArea (x, y : int)
    var continueUp : boolean := true
    var continueDown : boolean := true
    if map (x, y) = Neighbor then
	squareState (x, y) := squareRevealed
    else
	for upCheck : y .. 9
	    
	    if reveal (x, upCheck) = false and upCheck not= y then
		continueUp := false
	    end if

	    for decreasing leftCheck : x - 1 .. 1
		if reveal (leftCheck, upCheck) = false then
		    exit
		else
		    openArea(leftCheck, upCheck)    
		end if
	    end for
	    for rightCheck : x + 1 .. 9
		if reveal (rightCheck, upCheck) = false then
		    exit
		else
		    openArea(rightCheck, upCheck)
		end if
	    end for
	    exit when continueUp = false
	end for
	for decreasing downCheck : y - 1 .. 1
	    if reveal (x, downCheck) = false and downCheck not= y then
		continueDown := false
	    end if

	    for decreasing leftCheck : x - 1 .. 1
		if reveal (leftCheck, downCheck) = false then
		    exit
		else
		    openArea(leftCheck, downCheck)
		end if
	    end for
	    for rightCheck : x + 1 .. 9
		if reveal (rightCheck, downCheck) = false then
		    exit
		else
		    openArea(rightCheck, downCheck)
		end if
	    end for
	    exit when continueDown = false
	end for
    end if


end openArea


setscreen ("position:top;center, graphics:180;230, title:Minesweeper")


procedure drawingGameBoard()

    setupNeighborEmpty()
    
    var drawX, drawY : int
    
    

    for x : 1 .. gameSizeX
	for y : 1 .. gameSizeY
	    drawX := round ((x - 1) * scaleX)
	    drawY := round ((y - 1) * scaleY)

	    case squareState (x, y) of
		label squareNone :
		    Pic.Draw (facingDownPic, drawX, drawY, picCopy)

		label squareRevealed :
		    if map (x, y) = mine then
			Pic.Draw (bombPic, drawX, drawY, picCopy)
		    else
			Pic.Draw(neighborPic(neighborsMap(x,y)), drawX, drawY, picCopy)
		    end if

		label squareFlagged :
		    Pic.Draw (flagPic, drawX, drawY, picCopy)
	    end case
	end for
    end for

    for x : 0 .. gameSizeX
	Draw.Line (round (x * scaleX), 0, round (x * scaleX), 180, black)
    end for
    for y : 0 .. gameSizeY + 1
	Draw.Line (round (y * scaleY), 0, round (y * scaleY), 180, black)
    end for
    
    
    
    View.Update ()
end drawingGameBoard


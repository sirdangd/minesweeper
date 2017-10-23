procedure RestartGame ()
    
    for xAxis : 1 .. 9
	for yAxis : 1 .. 9
	    map (xAxis, yAxis) := Empty
	    squareState (xAxis, yAxis) := squareNone
	end for
    end for

    minesPosition ()

    drawingGameBoard ()
end RestartGame

procedure gameCounter()
    %add button
    %ask user to name text file
    %in procedure, add the square state and map array into text file    
    %close game
    saveGameButton := GUI.CreateButton (1, 185, 0, "Save & Exit", SaveAndExitPressed)
    locate(1, 1)
    %takes the value of Time.Sec and subtracts it to what Time.Sec was when you assigned it in startTimeSec 
    elapsedTime := Time.Sec - startTimeSec
    put "Mines: ", mineCtr, " Time: ", elapsedTime
    View.Update()
    
end gameCounter

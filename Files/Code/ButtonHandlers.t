% Button File - code to handle button events
% Intro Window Procedures

procedure QuitIntroWindowButtonPressed
    isIntroWindowOpen := false
    GUI.Quit
    GUI.ResetQuit

end QuitIntroWindowButtonPressed

procedure quitInstructions
    instructionWindowOpen := false
    GUI.Quit
    GUI.ResetQuit
end quitInstructions

procedure SaveAndExitPressed
    saveAndExitOpen := false
    cls
    put "name your load: " ..
    get loadName
    saveFilename := "Files/Text/"+loadName + ".txt"
    open : loadGameStream, saveFilename, put
    if loadGameStream > 0 then
	for y : 1 .. 9
	    for x : 1 .. 9
		put : loadGameStream, squareState (x, y)
	    end for
	end for
	for y : 1 .. 9
	    for x : 1 .. 9
		put : loadGameStream, map (x, y)
	    end for
	end for
	put : loadGameStream, mineCtr
    else
	put "unable to save game"
    end if
    close : loadGameStream
    cls
    put "good bye :)"
    GUI.Quit
    
end SaveAndExitPressed


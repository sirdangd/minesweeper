%Display Intstruction



proc displayInstructionWindow
    
    instructionWindowOpen := true
    var instructionWinID : int
    instructionWinID := Window.Open ("position:top;center,graphics:635;400,title:Instruction Window")
    
    
    
    var stream : int
    open : stream, "files/text/instructions.txt", get

    if stream > 0 then

	var Lines : string
	loop
	    exit when eof (stream)
	    get : stream, Lines : *
	    put Lines

	end loop
	close : stream
    else
	put "Unable to open file."

    end if
    put "\n"
    loop
	put "press 'y' when ready: "..
	getch(exitInstructions)
	exit when exitInstructions = "y" or exitInstructions = "Y"
    end loop
    
    
    Window.Close(instructionWinID)
    
end displayInstructionWindow



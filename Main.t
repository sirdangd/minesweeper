%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Daniel Dikaleh
%Program Name: Minesweeper
%Date: May 23, 2017
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Reveal all what is under all the squares and flag all the mines to win
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% files/code folder
include "files/code/includes.t"

%setInitialGameValues

% A.      display title screen
setscreen ("position:top;center,graphics:600;400,title:Introduction Window")
displayIntroWindow
cls
setscreen ("position:top;center,graphics:180;230,title:Minesweeper")
% B.      Ask user if they want instructions displayed on the screen
put "Do you wish to see    instructions?(y/n) " ..
getch (YesToInstructions)

if YesToInstructions = "y" or YesToInstructions = "Y" then
    displayInstructionWindow  % The Instruction screen will display and pause the porgram
end if
startTimeSec := Time.Sec

%ask if they wish to load prev game
cls
put "Load previous game? (y/n): " ..
getch (goToLoadGame)
%they type name of text file
if goToLoadGame = "y" or goToLoadGame = "Y" then
    cls
    put "enter name of save: " ..
    get loadGameName
    loadGamePath := "Files/Text/" + loadGameName + ".txt"
    open : openLoadStream, loadGamePath, get
    if openLoadStream > 0 then
	loop
	    for y : 1 .. 9
		for x : 1 .. 9
		    get : openLoadStream, skip
		    exit when eof (openLoadStream)
		    get : openLoadStream, num
		    squareState (x, y) := strint (num)
		end for
	    end for
	    for y : 1 .. 9
		for x : 1 .. 9
		    get : openLoadStream, skip
		    exit when eof (openLoadStream)
		    get : openLoadStream, num
		    map (x, y) := strint (num)
		end for
	    end for
	    get : openLoadStream, skip
	    get : openLoadStream, num
	    mineCtr := strint (num)
	    exit
	end loop
    else
	put "unable to find load"
	cls
	for xAxis : 1 .. 9
	    for yAxis : 1 .. 9
		map (xAxis, yAxis) := Empty
		squareState (xAxis, yAxis) := squareNone
	    end for
	end for
	minesPosition ()
	drawingGameBoard ()
    end if
    close : openLoadStream
    drawingGameBoard ()
else
    %game will load that save

    %C.     Opening Game itself
    %1.  Draw actual grid

    for xAxis : 1 .. 9
	for yAxis : 1 .. 9
	    map (xAxis, yAxis) := Empty
	    squareState (xAxis, yAxis) := squareNone
	end for
    end for
    %randomizes positions of mine
    minesPosition ()
    %puts the pictures according to what they are
    drawingGameBoard ()

end if
%timer starts once all questions are asked
startTimeSec := Time.Sec
%setting up variables for mouse
var mouseX : int := 0
var mouseY : int := 0
var mouseButton : int := 0
var mouseMapX : int
var mouseMapY : int
var winner : boolean := playerWon ()
Mouse.ButtonChoose ("multibutton")
drawfillbox (1, 180, maxx, maxy, colourbg)

loop

    %sets up timer and mine counter
    gameCounter ()

    %2. figure out which square user is clicking with mouse
    Mouse.Where (mouseX, mouseY, mouseButton)
    mouseMapX := ceil (mouseX / scaleX)
    mouseMapY := ceil (mouseY / scaleY)

    %if mouse is out of bounds it doesn't count as a click
    if mouseMapX < 1 or mouseMapX > gameSizeX or mouseMapY < 1 or mouseMapY > gameSizeY then
	mouseButton := 0
    end if
    %reveal whats under square when clicked
    if mouseButton = 1 and squareState (mouseMapX, mouseMapY) = squareNone then

	%3. check if user wins or losses
	%if the location user clicks is a mine it is a loss
	if map (mouseMapX, mouseMapY) = mine then
	    for xAxis : 1 .. 9
		for yAxis : 1 .. 9
		    squareState (xAxis, yAxis) := squareRevealed
		end for
	    end for
	    drawingGameBoard ()
	    delay (3000)
	    cls
	    put "you loose :("
	    put "Play Again? (y/n) " ..
	    getch (key)
	    if key = "N" or key = "n" then
		cls
		put "Good luck next time"
		exit
	    end if
	    if key = "Y" or key = "y" then
		startTimeSec := Time.Sec
		mineCtr := 10
		key := ""
		drawfillbox (1, 180, maxx, maxy, colourbg)
		RestartGame ()
	    end if
	else
	    %if the state is anything else, it opens the procedure which deals with opening areas
	    openArea (mouseMapX, mouseMapY)
	end if
	drawingGameBoard ()
    end if
    if mouseButton = 10 then
	%if the state of the square is flagged, the middle mouse click takes the flag away
	if squareState (mouseMapX, mouseMapY) = squareFlagged then
	    squareState (mouseMapX, mouseMapY) := squareNone
	    if mineCtr < 10 then
		mineCtr += 1
	    end if
	end if
	drawingGameBoard ()
    end if
    if mouseButton = 100 then
	%if the square state is nothing, then right click flags the square, also brings the mine counter down one
	if squareState (mouseMapX, mouseMapY) = squareNone then
	    squareState (mouseMapX, mouseMapY) := squareFlagged
	    mineCtr -= 1
	end if
	drawingGameBoard ()
    end if

    %all squares have to be revealed except bombs to win
    if playerWon () = true then
	delay (1000)
	cls
	put "you win!!!"
	put "Play Again? (y/n) " ..
	getch (key)
	if key = "N" or key = "n" then
	    cls
	    put "Good bye :)"
	    exit
	end if
	if key = "Y" or key = "y" then
	    startTimeSec := Time.Sec
	    mineCtr := 10
	    key := ""
	    drawfillbox (1, 180, maxx, maxy, colourbg)
	    RestartGame ()
	end if
    end if
    %the game ends when the save and exit button is pressed
    exit when GUI.ProcessEvent and saveAndExitOpen = false


    %repeat until user losses or click all squares except ones without bomb or until save and exit is pressed

end loop

GUI.Dispose (saveGameButton)



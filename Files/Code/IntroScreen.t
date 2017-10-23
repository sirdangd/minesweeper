%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Demos how to implement a button and a process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% displays a intro banner


% main procedure to handle the intro window
procedure displayIntroWindow
    instructionWindowOpen := true
    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var x := maxrow div 2
    var y := maxcol div 2
    var introBasePic : int := Pic.FileNew ("Images/logo.jpg")
    var introPic : int := Pic.Scale (introBasePic, 411, 80)
    var font : int := Font.New("sans serif:18:bold")
    Pic.Draw(introPic, 95, 200, picUnderMerge)
    
    % create a button
    % Window will continue until quit button is pressed
    loop 
	% locate(16,25)
	% put "press 'y' to play: "..
	Font.Draw("press 'y' to play: ", 200,97, font, red)
	locate(19,50)
	put " "..
	getch(readyToPlay)
	if readyToPlay = "y" then
	    exit
	end if
	
    end loop
    




end displayIntroWindow



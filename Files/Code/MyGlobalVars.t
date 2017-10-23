%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Daniel Dikaleh
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Final Program Name Here and a brief description of the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   MyGlobalVars.t
%   All global variables are coded in this file.
%   These will have FILE scope.
%   These must be document thoroughly - Descriptive name,
%   where used and for what purpose

% Main program variables
var readyToPlay : string(1)

var YesToInstructions : string (1)

%Introduction Window
var isIntroWindowOpen : boolean % Flag for Introduction Window state open or closed
var isFontWindowOpen : boolean 

proc setInitialGameValues

    isIntroWindowOpen := false
    isFontWindowOpen := false
  

end setInitialGameValues

    var exitInstructions : string(1)

    var instructionWindowOpen : boolean
    
    var saveGameButton : int
    
    var saveAndExitOpen : boolean := true

    var key : string (1) := ""

    var mine : int := 10
    var Empty : int := 0
    var Neighbor : int := 5
    var numOfMines : int := 10
    
    var neighborCtr : int := 0
    
    var winID : int

    var map : array 1 .. 9, 1 .. 9 of int
    var squareState : array 1 .. 9, 1 .. 9 of int
    var neighborsMap : array 1 .. 9, 1 .. 9 of int

    const squareNone : int := 0
    const squareRevealed : int := 1
    const squareFlagged : int := 2

    var flagBasePic : int := Pic.FileNew ("Images/flagged.jpg")
    var facingDownBasePic : int := Pic.FileNew ("Images/facingDown.jpg")
    
    var bombBasePic : int := Pic.FileNew ("Images/bomb.jpg")
    var neighborBasePic : array 0 .. 8 of int

    for i : 0 .. 8
	neighborBasePic (i) := Pic.FileNew ("Images/"+intstr (i) + ".jpg")
    end for
    
    var mineCtr : int := 10

    var gameSizeX : int := 9
    var gameSizeY : int := 9

    var scaleX : int := 180 div gameSizeX
    var scaleY : int := 180 div gameSizeY

    var flagPic : int := Pic.Scale (flagBasePic, scaleX, scaleY)
    var facingDownPic : int := Pic.Scale (facingDownBasePic, scaleX, scaleY)
    var bombPic : int := Pic.Scale (bombBasePic, scaleX, scaleY)
    var neighborPic : array 0 .. 8 of int
    
    for i : 0 .. 8
	neighborPic (i) := Pic.Scale (neighborBasePic (i), scaleX, scaleY)
    end for 
    
    var goToLoadGame : string(1)
    
    var loadCtr : int := 0
    
    var loadGameName : string
    
    var loadGamePath : string
    
    var num : string
    
    var openLoadStream : int
    
    var startTimeSec : int := 0
    
    var timeCount : int := 0
    
    var elapsedTime : int
    
    var prevElapsedTimeSec : int 
    
    var loadName : string
    
    var saveFilename : string
    
    var loadGameStream : int

     
    
    

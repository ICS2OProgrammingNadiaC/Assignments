-- Program: Animating Images
-- Name: Nadia Coleman
-- Class: ICS20
-- This program displays three shapes that move across the screen in different directions.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3
-- add background with heigt and width 
local backGroundImage = display.newImageRect("Images/hockeyArena.png", 2048, 1550)

-- add characters with height and width
local hockeyPlayer1 = display.newImageRect("Images/hockeyPlayer1.png", 250, 300)
local hockeyPlayer2 = display.newImageRect("Images/hockeyPlayer2.png", 250, 300)
local hockeyPlayer3 = display.newImageRect("Images/hockeyPlayer3.png", 250, 300)

-- set the inital x and y postions of each player
hockeyPlayer1.x = 70
hockeyPlayer1.y = display.contentHeight/2

hockeyPlayer2.x = display.contentWidth/2
hockeyPlayer2.y = 70

hockeyPlayer3.x = display.contentWidth/1
hockeyPlayer3.y = 150
hockeyPlayer3.xScale = -1

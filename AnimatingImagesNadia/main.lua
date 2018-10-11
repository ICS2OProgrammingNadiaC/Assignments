-- Name: Nadia Coleman
-- Class: ICS20
-- Date: 7/10/2018
-- This program displays three shapes that move across the screen in different directions.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- add background with height and width 
local backGroundImage = display.newImageRect("Images/hockeyArena.png", 2048, 1550)

-- print "Stanley Cup Final"
print ("Stanley Cup Final!")

-- create a local variable
local textObject

-- set x, y locations of the text
textObject = display.newText("Stanley Cup Final!", 500, 500, nil, 50)

-- set the colour of the text
textObject:setTextColor(180/255, 100/255, 90/255)
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










-- set the player to start transparent
hockeyPlayer1.alpha = 0

-- MoveHockeyPlayer1 will be called over and over again
Runtime:addEventListener("enterFrame", MoveHockeyPlayer1)




-- Function: HockeyPlayer1Listener 
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function HockeyPlayer2Listener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedHockeyPlayer3 == false)
		   (alreadyTouchedHockeyPlayer2 == false) then 
			alreadyTouchedHockeyPlayer1 == true)
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedHockeyPlayer1 == true) ) then
	   hockeyPlayer2.x = touch.x
	   hockeyPlayer2.y = touch.y
	end

	if (touch.phase == "ended") then
	   alreadyTouchedHockeyPlayer2 = false
	   alreadyTouchedHockeyPlayer3 = false
	   alreadyTouchedHockeyPlayer1 = false
	end
end



-- SOUND

-- Hockey arena sound
local hockeyGame = audio.loadSound( "Sounds/hockeyGame.mp3")



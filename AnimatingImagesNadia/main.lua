
-- Program: Animating Images
-- Name: Nadia Coleman
-- Class: ICS20
-- This program displays three shapes that move across the screen in different directions.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- add background with height and width 
local backGroundImage = display.newImageRect("Images/hockeyArena.png", 2048, 1550)


-- create a local variable
local textObject

-- set x, y locations of the text
textObject = display.newText( "Stanley Cup Final!", 500, 500, nil, 50 )

-- set the colour of the text
textObject:setTextColor(180/255, 100/255, 90/255)

-- add background with heigt and width 
local backGroundImage = display.newImageRect("Images/hockeyArena.png", 2048, 1550)

-- add characters with height and width
local hockeyPlayer1 = display.newImageRect("Images/hockeyPlayer1.png", 250, 300)
local hockeyPlayer2 = display.newImageRect("Images/hockeyPlayer2.png", 250, 300)
local hockeyPlayer3 = display.newImageRect("Images/hockeyPlayer3.png", 250, 300)
local hockeyPuck = display.newImageRect("Images/hockeyPuck.png", 150, 200)

-- set the inital x and y postions of each player
hockeyPlayer1.x = 70
hockeyPlayer1.y = display.contentHeight/2

hockeyPlayer2.x = display.contentWidth/2
hockeyPlayer2.y = 70

hockeyPlayer3.x = 1024
hockeyPlayer3.y = 756
hockeyPlayer3.xScale = -1

hockeyPuck.x = 500
hockeyPuck.y = 500



-- set the player to start transparent
hockeyPlayer1.alpha = 0

-- set scroll speed
scrollSpeed = 3


-- Function: MovehockeyPlayer1
-- Input: this function accepts an event listener
-- Output:  none
-- Description: this function adds the scroll speed to the x- value of the ship
local function MoveHockeyPlayer1(event)
	-- add the scroll speed to the x-value of the ship
	hockeyPlayer1.x = hockeyPlayer1.x + scrollSpeed
	-- change the transparency so that it becomes gradually visable
	hockeyPlayer1.alpha = hockeyPlayer1.alpha + 0.01
end

-- MovehockeyPlayer1 will be called over and over again
Runtime:addEventListener("enterFrame", MoveHockeyPlayer1)




-- Function: MovehockeyPlayer2
-- Input: this function accepts an event listener
-- Output:  none
-- Description: this function adds the scroll speed to the x- value of the ship
local function MoveHockeyPlayer2(event)
	-- add the scroll speed to the x-value of the ship
	hockeyPlayer2.y = hockeyPlayer2.y + scrollSpeed
	-- change the transparency so that it becomes gradually visable
	hockeyPlayer2.alpha = hockeyPlayer2.alpha + 0.01
end

-- MovehockeyPlayer2 will be called over and over again
Runtime:addEventListener("enterFrame", MoveHockeyPlayer2)



-- Function: MovehockeyPlayer3
-- Input: this function accepts an event listener
-- Output:  none
-- Description: this function adds the scroll speed to the x- value of the ship
local function MoveHockeyPlayer3(event)
	-- add the scroll speed to the x-value of the ship
	hockeyPlayer3.x = hockeyPlayer3.x - scrollSpeed
	hockeyPlayer3.y = hockeyPlayer3.y - scrollSpeed
	-- change the transparency so that it becomes gradually visable
	hockeyPlayer3.alpha = hockeyPlayer3.alpha + 0.01
end

-- MovehockeyPlayer1 will be called over and over again
Runtime:addEventListener("enterFrame", MoveHockeyPlayer3)

local function ScaleHockeyPuck(event)

	-- Scale the image by 120% (x) and 50% (y)
	hockeyPuck:scale( 1.01, 1.01 )
end
-- Call hockeyPuck over and over again
Runtime:addEventListener("enterFrame", ScaleHockeyPuck)
-- Title: Display Shapes
-- Name: Nadia Coleman
-- Course: ICS2O
-- This program displays shapes and their names under them on the Ipad 
-----------------------------------------------------------------------------------------

-- create my local variables for a triangle
local triangleText
local textSize = 200
local myTriangle
local verticesTriangle= { 0,-300, 0,-95, 99,-35 }
 
-- set the background colour of the screen
display.setDefault("background", 50/255, 20/255, 30/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the triangle
myTriangle = display.newPolygon(100, 200, verticesTriangle)

-- set the width of the border
myTriangle.strokeWidth = 20

-- set the colour of the triangle
myTriangle:setFillColor(0.2, 0.5, 0.9)

-- set the border colour
myTriangle:setStrokeColor(0, 0, 1)

-- write "this is a triangle" under the triangle
triangleText = display.newText("This is a triangle", 0, 0)

--anchor the text/set its (X, Y) position
triangleText.anchorX = 0
triangleText.anchorY = 0
triangleText.x = 30
triangleText.y = 375


-- create the height and width of the shape
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

-- create the local variables for the hexagon
local verticesHexagon = { 27,-35, 105,-35, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }
-- create the polygon and set its vertices
local hexagon = display.newPolygon(halfW, halfH, verticesHexagon)

-- write "this is a hexagon" under the hexagon
hexagonText = display.newText("This is a hexagon", 0, 0)

--anchor the text/set its (X, Y) position
hexagonText.anchorX = 0
hexagonText.anchorY = 0
hexagonText.x = 500
hexagonText.y = 500


-- create rounded rectangle
local myRoundedRect = display.newRoundedRect( 550, 100, 350, 100, 12 )
myRoundedRect.strokeWidth = 3
myRoundedRect:setFillColor( 0.52, 0.9, 0.76 )
myRoundedRect:setStrokeColor( 1, 0, 1 )

-- write "this is a rounded rectangle" under the rounded rectangle
roundedRectText = display.newText("This is a rounded rectangle", 0, 0)

--anchor the text/set its (X, Y) position
roundedRectText.anchorX = 0
roundedRectText.anchorY = 0
roundedRectText.x = 470
roundedRectText.y = 170

-- create variables for a circle
local myCircle = display.newCircle( 300, 500, 30 )
-- set the colour of the circle's fill colour
myCircle:setFillColor( 0.9, 0.9, 0.8 )
-- set the size of the border width
myCircle.strokeWidth = 5
-- set the border colour
myCircle:setStrokeColor( 0, 1, 0 )
-- write "this is a circle" under the circle
circleText = display.newText("This is a circle", 0, 0)

--anchor the text/set its (X, Y) position
circleText.anchorX = 0
circleText.anchorY = 0
circleText.x = 260
circleText.y = 550


-- create my local variables for a pentagon
local pentagonText
local textSize = 90
local myPentagon
local verticesPentagon= { 25,-30, 90,-95, 99,-35, 80, 0, 90,30 }
 
-- draw the pentagon
myPentagon = display.newPolygon(260, 200, verticesPentagon)

-- set the width of the border
myPentagon.strokeWidth = 10

-- set the colour of the pentagon
myPentagon:setFillColor(0.9, 0.3, 0.9)

-- set the border colour
myPentagon:setStrokeColor(0, 1, 1)

-- write "this is a pentagon" under the pentagon
pentagonText = display.newText("This is a pentagon", 0, 0)

--anchor the text/set its (X, Y) position
pentagonText.anchorX = 0
pentagonText.anchorY = 0
pentagonText.x = 200
pentagonText.y = 275

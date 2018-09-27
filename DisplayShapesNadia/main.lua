-- Title: Display Shapes
-- Name: Nadia Coleman
-- Course: ICS2O
-- This program displays shapes and their names under them on the Ipad 
-----------------------------------------------------------------------------------------

local halfW = display.contentWidth * 1
local halfH = display.contentHeight * 1
 
local vertices = { 50,-300, 6,-95, 99,-35}
 
local Shape1 = display.newPolygon( halfW, halfH, vertices )
Shape1.fill = { type="image", filename="mountains.png" }
Shape1.strokeWidth = 10
Shape1:setStrokeColor( 1, 0, 0 )

Shape1.x = 100
Shape1.y = 150
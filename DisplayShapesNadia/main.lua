-- Title: Display Shapes
-- Name: Nadia Coleman
-- Course: ICS2O
-- This program displays shapes and their names under them on the Ipad 
-----------------------------------------------------------------------------------------
 
local vertices = { 50,-300, 6,-95, 99,-35}
 
local triangle = display.newTriangle( 100, 150, vertices )
triangle.fillColor = (0, 1, 0)
triangle.strokeWidth = 10
triangle:setStrokeColor = (1, 0, 0)
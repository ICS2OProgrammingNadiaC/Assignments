-- Title: Display Shapes
-- Name: Nadia Coleman
-- Course: ICS2O
-- This program displays shapes and their names under them on the Ipad 
-----------------------------------------------------------------------------------------

-- Create local variable for vertices. 
local vertices = { 50,-300, 6,-95, 99,-35}
 
-- Create new shape, a triangle.
local triangle = display.newPolygon( 100, 150, vertices )

-- Set fill colour of triangle
triangle:setFillColor(0.15, 0.25, 0.50)

-- Set stroke width of triangle's border
triangle.strokeWidth = 10

-- Set stroke colour
triangle:setStrokeColor(1, 0, 0)
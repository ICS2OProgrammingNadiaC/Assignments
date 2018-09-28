-- Title: Display Shapes
-- Name: Nadia Coleman
-- Course: ICS2O
-- This program displays shapes and their names under them on the Ipad 
-----------------------------------------------------------------------------------------

-- Create a new background colour.
display.setDefault("background", 12/255, 100/255, 30/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Create a new variable.
local verticesTri = { 50,-300, 6,-95, 99,-35}
 
-- Create new shape, a triangle.
local triangle = display.newPolygon( 100, 150, verticesTri )

-- Set fill colour of triangle
triangle:setFillColor(0.15, 0.25, 0.50)

-- Set stroke width of triangle's border
triangle.strokeWidth = 10

-- Set stroke colour
triangle:setStrokeColor(1, 0, 0)

--display the text
triangleText = display.newText("This is a triangle", 100, 200, nil, 30)

--anchor the text and set it's variables
triangleText.anchorX = 0
triangleText.anchorY = 0
triangleText.x = 50
triangleText.y = 300

-- Change the text size
local triangleTextSize = 50
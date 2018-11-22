-- Name: Company logo animation
-- Course: ICS20
-- By: Nadia Coleman
-- this program animates the company logo
----------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------------------------
-- display app logo
local companyLogo = display.newImageRect("Images/CompanyLogoNadiaC@2x.png", 150, 150)
-- set the company logo X
companyLogo.x = 500
-- set the company logo Y
companyLogo.y = 500

-- create text object
local textObject
-- set company logo to be transparent
companyLogo.alpha = 0


----------------------------------------------------------------------------------------------------------------------

-- global variables
scrollSpeed = 3

----------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------

-- Function: ScaleCompanyLogo
-- Input: this function also accepts an event listener
local function ScaleCompanyLogo(event)

	-- scale the image by 101% (X) and 101% (Y)
	companyLogo:scale( 1.01, 1.01 )
	-- change the transparency of the ship every time it moves so that it fades in
	companyLogo.alpha = companyLogo.alpha + 0.01
end

-- Function: ScaleTextObject
-- Input: this function also accepts an event listener
local function ScaleTextObject(event)

	-- scale the image by 102.5% (X) and 102% (Y)
	textObject:scale( 1.025, 1.02 )
	-- change the transparency of the text every time it moves so that it fades in
	textObject.alpha = textObject.alpha + 0.01
end

----------------------------------------------------------------------------------------------------------------------

-- make the logo spin and rotate
transition.to(companyLogo, {rotation=360, time=3000, onComplete=spinImage})
transition.to(companyLogo, {x=500, y=500, time=3000})
0
-- make the text grow
transition.to(textObject, {x=500, y=500, time=3000})

-- set the background colour
display.setDefault ("background", 132/255, 119/255, 254/255)

-- call the companyLogo again and again
Runtime:addEventListener("enterFrame", ScaleCompanyLogo)

-- call the textObject again and again
Runtime:addEventListener("enterFrame", ScaleTextObject)

----------------------------------------------------------------------------------------------------------------------
-- Text
----------------------------------------------------------------------------------------------------------------------

-- displays text on the screen at posistion x = 500 and y = 500 with 
-- a default font style and font size of 50
textObject = display.newText( "Pyramid Software", 500, 300, nil, 100)

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)
-- set the text to be transparent
textObject.alpha = 0

----------------------------------------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------------------------------------

-- Background sound
local backgroundSound = audio.loadSound( "Sounds/background.mp3" )
local backgroundSoundChannel
backgroundSoundChannel = audio.play(backgroundSound)
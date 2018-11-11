-- Name: Company logo animation
-- Course: ICS20
-- By: Nadia Coleman
-- this program animates the company logo
---------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- TEXT
--------------------------------------------------------------------------------------------
-- create text object
local textObject

-- displays text on the screen at posistion x = 500 and y = 500 with 
-- a default font style and font size of 50
textObject = display.newText( "Pyramid Software", 500, 300, nil, 100)

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)

--------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- gloabal variables
scrollSpeed = 3

-- set the background colour
display.setDefault ("background", 132/255, 119/255, 254/255)

-- display app logo
local companyLogo = display.newImageRect("Images/CompanyLogoNadiaC@2x.png", 150, 150)
-- set the company logo X
companyLogo.x = 500
-- set the company logo Y
companyLogo.y = 500

-- set the company logo to be transparent
companyLogo.alpha = 0



-- make the logo spin and rotate
transition.to(companyLogo, {rotation=360, time=3000, onComplete=spinImage})
transition.to(companyLogo, {x=500, y=500, time=3000, onComplete=rotateImage})

-- Function: MoveCompanyLogo
-- Input: this function accepts an event listener
local function MoveCompanyLogo(event)
	-- change the transparency of the image
	companyLogo.alpha = companyLogo.alpha + 0.01
end

-- Function: ScaleCompanyLogo
-- Input: this function also accepts an event listener
local function ScaleCompanyLogo(event)

	-- scale the image by 101% (X) and 101% (Y)
	companyLogo:scale( 1.01, 1.01 )
end

-- call the companyLogo again and again
Runtime:addEventListener("enterFrame", ScaleCompanyLogo)
-- MoveCompanyLogo will be called again and again
Runtime:addEventListener("enterFrame", MoveCompanyLogo)

-- cancel animation

--------------------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------------------

-- Background sound
local backgroundSound = audio.loadSound( "Sounds/background.mp3" )
local backgroundSoundChannel
backgroundSoundChannel = audio.play(backgroundSound)
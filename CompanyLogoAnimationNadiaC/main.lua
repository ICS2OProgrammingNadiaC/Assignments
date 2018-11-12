-- Name: Company logo animation
-- Course: ICS20
-- By: Nadia Coleman
-- this program animates the company logo
----------------------------------------------------------------------------------------------------------------------

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


-- Function: ScaleCompanyLogo
-- Input: this function also accepts an event listener
local function ScaleCompanyLogo(event)

	-- scale the image by 101% (X) and 101% (Y)
	companyLogo:scale( 1.01, 1.01 )
end


-- make the logo spin and rotate
transition.to(companyLogo, {rotation=360, time=3000, onComplete=spinImage})
transition.to(companyLogo, {x=500, y=500, time=3000})

-- call the companyLogo again and again
Runtime:addEventListener("enterFrame", ScaleCompanyLogo)

--------------------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------------------

-- Background sound
local backgroundSound = audio.loadSound( "Sounds/background.mp3" )
local backgroundSoundChannel
backgroundSoundChannel = audio.play(backgroundSound)
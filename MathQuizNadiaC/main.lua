-- Title: Math Quiz
-- Name: Nadia Coleman
-- Course: ICS20
-- This program displays a math question and asks the user to answer in a numeric textField
-- terminal.

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------------

-- creat local variables
local questionObject

local correctObject
local incorrectObject
local gameOver

local numericField

local randomNumber1
local randomNumber2
local correctAnswer
local userAnswer

-- number of points and text object that displays it
local numberPoints = 0
local pointsObject

-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText

local countDownTimer

local lives = 3
local heart1
local heart2
local heart3
local numericField
-------------------------------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------------------------------

-- Correct Sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- You win sound
local youWinSound = audio.loadSound( "Sounds/youWinSound.mp3" )
local youWinSoundChannel

-- You win sound
local youLoseSound = audio.loadSound( "Sounds/youLoseSound.mp3" )
local youLoseSoundChannel

-- Incorrect Sound
local incorrectSound = audio.loadSound( "Sounds/incorrectSound.mp3" )
local incorrectSoundChannel

-------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------


-- ask questions on a constant repeat/ create endless questions in a local functions
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	-- set random operators
	randomOperator = math.random(1, 5)

	if (randomOperator == 1) then
		-- set the random numbers to be between 1, 10
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)

		-- calculate the answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		-- set the random numbers to be between 1, 20
		randomNumber1 = math.random(1, 20)
		randomNumber2 = math.random(1, 20)

		-- calculate the answer
		correctAnswer = randomNumber1 + randomNumber2
	
		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

 	elseif (randomOperator == 3) then
		-- set the random numbers to be between 1, 20
		randomNumber1 = math.random(1, 20)
		randomNumber2 = math.random(1, 20)
		if ( randomNumber1 > randomNumber2 ) then
			-- reset the question so that the answer is not a negative
			correctAnswer = randomNumber1 - randomNumber2
			-- create question in text object
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

		else
			-- if randomNumber1 is less than randomNumber2
			correctAnswer = randomNumber2 - randomNumber1
 			-- create question in text object
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		end

	elseif (randomOperator == 4) then
		-- set the random numbers between 1 and 10
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)
		-- put the correct answer in to the temp. 
		temp = randomNumber1 * randomNumber2
		-- change into division
		correctAnswer = temp / randomNumber2 
		-- create the question in a text object
		questionObject.text = temp .. " / " .. randomNumber2

	elseif (randomOperator == 5) then
		randomNumber1 = math.random(1, 5)
		randomNumber2 = math.random(1, 5)
		-- create the exponent
		exponent = math.pow(randomNumber2, randomNumber1)
		-- calculate the exponent
		correctAnswer = exponent
		-- create the question in a text object
		questionObject.text = randomNumber2 .. " ^ " .. randomNumber1 .. " = "


	end	
end

local function HideIncorrect()
	-- hide the incorrect if the answer is correct
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideCorrect()
	-- hide the correct if the answer is incorrect
	correctObject.isVisible = false
	AskQuestion()
end



local function DecreaseHearts()
	-- remove a heart every time the timer runs out
	if (lives == 3) then
		-- if hearts = 3 then, display all 3 hearts
		heart3.isVisible = true
		heart2.isVisible = true
		heart1.isVisible = true
	elseif (lives == 2) then
		-- remove a heart if lives is 2
		heart3.isVisible = false
		heart2.isVisible = true
		heart1.isVisible = true		
	elseif (lives == 1) then
		-- remove another heart if lives is 1
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = true
	elseif (lives == 0) then
		-- remove all 3 hearts if lives = 0
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = false
		youLoseSoundChannel = audio.play(youLoseSound)
		-- make the numeric field invisible
		numericField.isVisible = false
		-- display the gameOver
		gameOver.isVisible = true
		timer.cancel(countDownTimer)
	end
end

local function UpdateTime()
	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = " Time = " .. secondsLeft

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left and remove a life
		secondsLeft = totalSeconds
		lives = lives - 1
		-- if there are no lives left, play a lose sound and display a lose image.
		incorrectSoundChannel = audio.play(incorrectSound)
		-- update the hearts
		DecreaseHearts()

		if ( lives == 0) then
			-- display the gameOver image if lives = 0 and the seconds left = 0
			gameOver.isVisible = true
			youLoseSoundChannel = audio.play(youLoseSound)
			timer.cancel(countDownTimer)
		else
			-- call the function to ask a new question
			AskQuestion()
		end
	end
end



-- create a function that asks the user a question constantly
local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then
		-- clear text field 
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user's input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answers are the same:
		if (userAnswer == correctAnswer) then
			-- display the correct object
			correctObject.isVisible = true
			-- play the correct sound
			correctSoundChannel = audio.play(correctSound)
			-- set timer to display after 2 seconds
			timer.performWithDelay( 2000, HideCorrect )	
			-- add a point if the answer is correct
			numberPoints = numberPoints + 1
			-- display the amount of points
			pointsObject.text = ( "Points = " .. numberPoints)
			-- set the time to seconds left
			secondsLeft = totalSeconds

			if (numberPoints == 5) then
				-- display the win image
				youWin.isVisible = true
				-- display the congrats text
				congratsObject.isVisible = true
				-- make the numeric field invisible
				numericField.isVisible = false
				-- remove all 3 hearts
				heart3.isVisible = false
				heart2.isVisible = false
				heart1.isVisible = false
				youWinSoundChannel = audio.play(youWinSound)

			end

		else 
			-- if the answer is incorrect
			--play an incorrect sound
			-- display incorrect text
			incorrectObject.isVisible = true			
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay( 2000, HideIncorrect )
			
			-- remove a life if the users answer is incorrect
			lives = lives - 1
			DecreaseHearts()
			-- set the time to seconds left
			secondsLeft = totalSeconds
			-- tell the user the correct answer
			incorrectObject.text = "Incorrect, the answer was " .. correctAnswer	
		end
		-- clear text field
		event.target.text = ""
	end
end

local function StartTimer()
	-- create an infinate timer
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
-----------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------
-- create heart one and select it's x/y
heart1 = display.newImageRect("Images/heart.png", 100, 100)
-- set the length and width
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

-- create heart two and set it's x/y
heart2 = display.newImageRect("Images/heart.png", 100, 100)
-- set the length and width
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

-- create heart three and set it's x/y
heart3 = display.newImageRect("Images/heart.png", 100, 100)
-- set the length and width
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- displays a question and sets it's colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(130/255, 200/255, 3/255)


-- create the correct text object
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
-- select the colour
correctObject:setTextColor(130/255, 30/255, 243/255)
-- set it to be invisible
correctObject.isVisible = false


-- create the incorrect text object
incorrectObject = display.newText( "Incorrect, the answer is ", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
-- select the colour
incorrectObject:setTextColor(190/255, 20/255, 200/255)
-- set it to be invisible
incorrectObject.isVisible = false


-- create numeric field
numericField = native.newTextField( display.contentWidth/1.3, display.contentHeight/2, 150, 80 )
numericField.inputType = "default"
-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )


-- display the pointsObject
pointsObject = display.newText( "" , 120, 100, nil, 50 )
-- select the pointsObject colour
pointsObject:setTextColor(123/255, 200/255, 100/255)
-- display the number of points
pointsObject.text = ( "Points =" .. numberPoints)


-- clock object that holds time left
clockText = display.newText ( "", display.contentWidth/2, display.contentHeight *2.5/3, nil, 75 )
-- select the colour
clockText:setTextColor( 149/255, 89/255, 100/255 )


-- create gameOver image
gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
-- set the height and width
gameOver.x = display.contentWidth * 1/2
gameOver.y = display.contentHeight * 1/2
-- make gameOver invisible
gameOver.isVisible = false


-- create youWin Image and make it invisible
youWin = display.newImageRect("Images/youWin.png", display.contentWidth, display.contentHeight)
-- set the youWin's height and width
youWin.x = display.contentWidth * 1/2
youWin.y = display.contentHeight * 1/2
-- make the youWin invisible
youWin.isVisible = false


-- create the congrars text object
congratsObject = display.newText( "Congrats!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
-- select the text colour
congratsObject:setTextColor(190/255, 20/255, 200/255)
-- set it to be invisible 
congratsObject.isVisible = false

-----------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
-- call the function to start the timer
StartTimer()
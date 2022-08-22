require "globals"

local Button = require "../ui/Button"

local playButton = nil
local quitButton = nil

function love.load()
    -- play button
    playButton = Button:new("play", windowW / 2, 100, 200, 60)
    playButton:setCornerRadius(15)
    playButton:setLabel("PLAY", font45)
    playButton:setLabelYCorrection(4)
    playButton:setDefaultColor(buttonDefaultColor, labelDefaultColor)
    playButton:setHoverColor(buttonHoverColor, labelHoverColor)

    -- quit button
    quitButton = Button:new("play", windowW / 2, 200, 200, 60)
    quitButton:setCornerRadius(15)
    quitButton:setLabel("QUIT", font45)
    quitButton:setLabelYCorrection(4)
    quitButton:setDefaultColor(buttonDefaultColor, labelDefaultColor)
    quitButton:setHoverColor(buttonHoverColor, labelHoverColor)
end

function love.draw()
    playButton:draw()
    quitButton:draw()
end

function love.update(dt)
    playButton:update(dt)
    quitButton:update(dt)
end
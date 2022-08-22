local Button = require "ui/Button"

local Menu = {}

function Menu.new(self)
    -- play button
    local playButton = Button:new("play", windowW / 2, 100, 200, 60)
    playButton:setCornerRadius(15)
    playButton:setLabel("PLAY", font45)
    playButton:setLabelYCorrection(4)
    playButton:setDefaultColor(buttonDefaultColor, labelDefaultColor)
    playButton:setHoverColor(buttonHoverColor, labelHoverColor)

    -- quit button
    local quitButton = Button:new("quit", windowW / 2, 200, 200, 60)
    quitButton:setCornerRadius(15)
    quitButton:setLabel("QUIT", font45)
    quitButton:setLabelYCorrection(4)
    quitButton:setDefaultColor(buttonDefaultColor, labelDefaultColor)
    quitButton:setHoverColor(buttonHoverColor, labelHoverColor)

    local obj = {
        id = "menu",
        buttons = {
            play = playButton,
            quit = quitButton
        }
    }
    setmetatable(obj, { __index = Menu })
    return obj
end

function Menu.draw(self)
    for k, button in pairs(self.buttons) do
        button:draw()
    end
end

function Menu.update(self, dt)
    for k, button in pairs(self.buttons) do
        button:update(dt)
    end
end

return Menu
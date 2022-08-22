-- global vars
_LG = love.graphics
_LM = love.mouse
_LT = love.touch
_LI = love.image
_LF = love.filesystem

windowW = _LG.getWidth()
windowH = _LG.getHeight()

-- start fonts
defaultFont = _LG.getFont()
font18 = _LG.newFont("assets/fonts/EvilEmpire-4BBVK.ttf", 18)
font45 = _LG.newFont("assets/fonts/EvilEmpire-4BBVK.ttf", 45)
-- end fonts

-- start colors
defaultColor = {1, 1, 1, 1}

buttonDefaultColor = {0, .7, .6, .4}
buttonHoverColor = {.9, 1, .1, 1}

labelDefaultColor = {.7, .8, .2, .4}
labelHoverColor = {.8, .4, .1, 1}
-- end colors

-- start progress bar colors
progressBorderColor = {1, 1, .8, 1}
progressFillColor = {.6, .9, .1, 1}
-- end progress bar colors

-- start background colors
defaultBGColor = {0, 0, 0, 0}
loadingScreenBGColor = {.2, .1, .3, .7}
menuScreenBGColor = {.7, .1, .3, .9}
-- end background colors

-- start collision functions
function checkPointToRectangle(pointX, pointY, recX, recY, recWidth, recHeight)
    return pointX >= recX and pointX <= recX + recWidth and pointY >= recY and pointY <= recY + recHeight
end

function checkRectangleToRectangle(rec1X, rec1Y, rec1Width, rec1Height, rec2X, rec2Y, rec2Width, rec2Height)
    return rec1X < rec2X + rec2Width and
            rec2X < rec1X + rec1Width and
            rec1Y < rec2Y + rec2Height and
            rec2Y < rec1Y + rec1Height
end
-- end collision functions
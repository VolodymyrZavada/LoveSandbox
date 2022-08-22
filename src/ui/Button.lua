local Button = {}

function Button.new(self, id, x, y, width, height)
    local obj = {
        id = id or "default",
        x = x or 0,
        y = y or 0,
        buttonX = 0,
        buttonY = 0,
        width = width or 100,
        height = height or 100,

        -- setter properties
        label = nil,
        labelYCorrection = 0,
        font = nil,
        cornerRadius = 0,
        isHovering = false,
        colors = {
            button = {
                default = {},
                hover = {},
            },
            label = {
                default = {},
                hover = {},
            }
        }
    }
    setmetatable(obj, { __index = Button })
    return obj
end

function Button.draw(self)
    -- half of button width per X
    local btnW = self.width
    local btnWHalf = btnW / 2

    -- half of button height per Y
    local btnH = self.height
    local btnHHalf = btnH / 2

    -- button position X and Y
    self.buttonX = self.x - btnWHalf
    self.buttonY = self.y - btnHHalf

    -- set rectangle/button color
    _LG.setColor(unpack(self.colors.button.default))
    if self.isHovering then
        _LG.setColor(unpack(self.colors.button.hover))
    end

    -- draw button rectangle
    _LG.rectangle('fill', self.buttonX, self.buttonY, self.width, self.height, self.cornerRadius, self.cornerRadius)

    -- draw text on top of button
    if self.label then
        _LG.setFont(self.font)
        _LG.setColor(unpack(self.colors.label.default))
        if self.isHovering then
            _LG.setColor(unpack(self.colors.label.hover))
        end

        local labelWidth = self.font:getWidth(self.label)
        local labelHeight = self.font:getHeight(self.label)
        local labelX = self.buttonX + self.width / 2 - labelWidth / 2
        local labelY = self.buttonY + self.height / 2 - labelHeight / 2 + self.labelYCorrection
        _LG.print(self.label, labelX, labelY)
    end

    -- set default color (white)
    -- @defaultColor - from globals
    _LG.setColor(unpack(defaultColor))
end

function Button.setLabel(self, labelText, font)
    self.label = labelText
    self.font = font
end

function Button.setCornerRadius(self, radius)
    self.cornerRadius = radius
end

function Button.setFont(self, font)
    self.font = font
end

function Button.setLabelYCorrection(self, labelYCorrection)
    self.labelYCorrection = labelYCorrection
end

function Button.setDefaultColor(self, buttonColor, labelColor)
    self.colors.button.default = buttonColor
    self.colors.label.default = labelColor
end

function Button.setHoverColor(self, buttonHoverColor, labelHoverColor)
    self.colors.button.hover = buttonHoverColor
    self.colors.label.hover = labelHoverColor
end

function Button.update(self, dt)
    local mouseX = _LM.getX()
    local mouseY = _LM.getY()

    -- check mouse is overlapping rectangle
    if checkPointToRectangle(mouseX, mouseY, self.buttonX, self.buttonY, self.width, self.height) then
        self.isHovering = true
    else
        self.isHovering = false
    end
end

return Button
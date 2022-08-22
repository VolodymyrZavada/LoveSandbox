local ProgressBar = {}

function ProgressBar.new(self, x, y, width, height)
    local obj = {
        id = "progress",
        x = x or 0,
        y = y or 0,
        barX = 0,
        barY = 0,
        width = width or 100,
        height = height or 100,

        -- setter properties
        timer = 1,
        cornerRadius = 0,
        fillParts = {},
        isLoading = false
    }
    setmetatable(obj, { __index = ProgressBar })
    return obj
end

function ProgressBar.draw(self)
    -- half of button width per X
    local barW = self.width
    local barWHalf = barW / 2

    -- half of button height per Y
    local barH = self.height
    local barHHalf = barH / 2

    -- button position X and Y
    self.barX = self.x - barWHalf
    self.barY = self.y - barHHalf

    --_LG.setColor(unpack(progressBorderColor))
    --_LG.rectangle('line', self.barX, self.barY, self.width, self.height, self.cornerRadius, self.cornerRadius)

    _LG.setColor(unpack(progressFillColor))

    -- TODO: refactor required
    local progressFillWidth = self.width / self.timer
    if progressFillWidth > self.width - 5 then
        progressFillWidth = self.width - 5
    end
    _LG.rectangle('fill', self.barX + 2, self.barY + 3, progressFillWidth, self.height-5, self.cornerRadius - 5, self.cornerRadius - 5)

    _LG.setColor(unpack(defaultColor))
end

function ProgressBar.update(self, dt)

end

function ProgressBar.setCornerRadius(self, cornerRadius)
    self.cornerRadius = cornerRadius
end

function ProgressBar.setTimer(self, timer)
    self.timer = timer
end

return ProgressBar
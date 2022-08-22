local ProgressBar = require "../ui/ProgressBar"

local Loading = {}
local progressBar

function Loading.new(self)
    local bar = ProgressBar:new(windowW / 2, windowH - 150, windowW - 200, 30)
    bar:setCornerRadius(10)

    local obj = {
        id = "loading",
        timer = 10,
        isLoading = true,

        -- inject ui module
        progressBar = bar
    }
    setmetatable(obj, { __index = Loading })
    return obj
end

function Loading.draw(self)
    _LG.setBackgroundColor(unpack(loadingScreenBGColor))
    self.progressBar:draw()
end

function Loading.update(self, dt)
    self.progressBar:update(dt)
    if self.timer < 0 then
        self.isLoading = false
    else
        self.isLoading = true
        self.timer = self.timer - dt
        self.progressBar:setTimer(self.timer)
    end
end
return Loading
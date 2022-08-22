local Loading = {}

function Loading.new(self)
    local obj = {
        id = "loading",
        timer = 3,
        isLoading = true
    }
    setmetatable(obj, { __index = Loading })
    return obj
end

function Loading.draw(self)
    _LG.setBackgroundColor(unpack(loadingScreenBGColor))

    _LG.setColor(unpack(defaultColor))
    _LG.print("timer: " .. self.timer)

    _LG.setBackgroundColor(unpack(defaultBGColor))
end

function Loading.update(self, dt)
    if self.timer < 0 then
        self.isLoading = false
    else
        self.isLoading = true
        self.timer = self.timer - dt
    end
end
return Loading
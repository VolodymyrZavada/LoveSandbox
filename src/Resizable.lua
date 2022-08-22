local Resizable = {}

function Resizable.new(self, width, height, flags)
    local obj = {
        x = 0,
        y = 0,
        width = width,
        height = height,
        flags = flags,
        scale = 0
    }
    setmetatable(obj, { __index = Resizable })
    return obj
end

function Resizable.draw(self)
    _LG.translate(self.x, self.y)
    _LG.scale(self.scale)
end

function Resizable.resize(self, width, height)
    self.scale = math.floor(math.min(
            width / self.flags.minwidth,
            height / self.flags.minheight
    ))
    self.width = math.floor(width / self.scale)
    self.height = math.floor(height / self.scale)
    self.x = math.floor(width * 0.5 - self.flags.minwidth * self.scale * 0.5)
    self.y = math.floor(height * 0.5 - self.flags.minheight * self.scale * 0.5)

    windowW = self.width
    windowH = self.height
end

return Resizable
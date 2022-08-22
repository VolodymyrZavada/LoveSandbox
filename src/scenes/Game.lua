local Game = {}

function Game.new(self)
    local obj = {
        id = "game",

    }
    setmetatable(obj, { __index = Game })
    return obj
end

function Game.draw(self)
    _LG.setBackgroundColor(unpack(gameScreenBGColor))
    _LG.print("Game screen")
end

function Game.update(self, dt)

end

return Game
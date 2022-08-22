local SceneManager = {}

function SceneManager.new(self)
    local obj = {
        currentScene = nil,
        previousScene = nil
    }
    setmetatable(obj, { __index = SceneManager })
    return obj
end 

function SceneManager.draw(self)
    self.currentScene:draw()
end 

function SceneManager.update(self, dt)
    self.currentScene:update(dt)
end

function SceneManager.load(self, path)
    assert(type(path) == "string", "SceneManager[path]: parameter must be a string.")
    assert(_LF.getInfo(path .. ".lua") ~= nil, "SceneManager[path]: file not found.")

    if not package.loaded[path] then
        -- load scene
        local loadedModule = require(path)
        -- initialize scene
        self.currentScene = loadedModule:new()
    end
end

function SceneManager.unload(self, path)
    assert(type(path) == "string", "SceneManager[path]: parameter must be a string.")
    assert(_LF.getInfo(path .. ".lua") ~= nil, "SceneManager[path]: file not found.")

    if package.loaded[path] then
        package.loaded[path] = nil

        self.previousScene = self.currentScene
        self.currentScene = nil
    end
end

return SceneManager
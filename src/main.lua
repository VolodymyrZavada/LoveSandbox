require "globals"

local SceneManager = require "SceneManager"

local loadingScenePath = "scenes/Loading"
local menuScenePath = "scenes/Menu"

local scManager

function love.load()
    scManager = SceneManager:new()
    scManager:load(loadingScenePath)
end

function love.draw()
    scManager:draw()
end

function love.update(dt)
    scManager:update(dt)

    if scManager.currentScene.id == "loading" and not scManager.currentScene.isLoading then
        -- unlink prev scene
        scManager:unload(loadingScenePath)

        -- link and load new scene
        scManager:load(menuScenePath)
    end
end
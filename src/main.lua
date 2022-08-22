require "globals"

local SceneManager = require "SceneManager"

local loadingScenePath = "scenes/Loading"
local menuScenePath = "scenes/Menu"
local gameScenePath = "scenes/Game"

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

-- for test scene
function love.keypressed(key)
    if key == 'p' then
        if scManager.currentScene.id == "game" then
            scManager:unload(gameScenePath)
            scManager:load(menuScenePath)
        end
    end
end

function love.handlers.buttonClicked(btnId)
    if btnId == "play" then
        scManager:unload(menuScenePath)
        scManager:load(gameScenePath)
    end

    if btnId == "quit" then
        _LE.push("quit")
    end
end
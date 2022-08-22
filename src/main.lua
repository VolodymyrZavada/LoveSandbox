require "globals"

local SceneManager = require "SceneManager"
local Resizable = require "Resizable"

local loadingScenePath = "scenes/Loading"
local menuScenePath = "scenes/Menu"
local gameScenePath = "scenes/Game"

local scManager
local resizable

function love.load()
    _LG.setDefaultFilter( "nearest", "nearest", 0 )

    local width, height, flags = _LW.getMode()
    resizable = Resizable:new(width, height, flags)

    scManager = SceneManager:new()
    scManager:load(loadingScenePath)
end

function love.draw()
    resizable:draw()

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

function love.handlers.buttonClicked(btnId)
    if btnId == "play" then
        scManager:unload(menuScenePath)
        scManager:load(gameScenePath)
    end

    if btnId == "quit" then
        _LE.push("quit")
    end
end

function love.keypressed(key)
    if key == 'p' then
        if scManager.currentScene.id == "game" then
            scManager:unload(gameScenePath)
            scManager:load(menuScenePath)
        end
    end
end

-- check window resize
function love.resize(width, height)
    resizable:resize(width, height)
end
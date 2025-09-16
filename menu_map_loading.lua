local sti = require("libs/sti")
local game = require("engine/game")

local map_loading = {}

function map_loading.activate()
    menuMusic:stop()
    map_loading.loaded = false
    map_loading.error = nil

    local success, mapOrError = pcall(sti, config.config.map_start)
    if success and mapOrError then
        map_loading.map = mapOrError
        map_loading.loaded = true
    else
        map_loading.error = mapOrError or "Idk what happened :sob:"
    end
end

function map_loading.update(dt)
    if map_loading.loaded then
        game.setMap(map_loading.map)
        Mantle.currentState = game
        if game.activate then game.activate() end
    end
end

function map_loading.draw()
    love.graphics.setFont(love.graphics.newFont("assets/fonts/main.ttf", 24))
    if map_loading.error then
        love.graphics.setColor(1,0,0)
        love.graphics.print("Failed to Load map: "..tostring(map_loading.error), 10, 10)
    else
        love.graphics.setColor(1,1,0)
        love.graphics.print("Loading...")
    end
end

return map_loading
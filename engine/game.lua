local game = {}
local player
function game.activate()
    print("this bih loaded")
end

function game.setMap(map)
    game.map = map
end

function game.draw()
    if game.map then
        game.map:draw(0,0)
    end
end

function game.update(dt)
    if game.map then
        game.map:update(dt)
    end
end

return game
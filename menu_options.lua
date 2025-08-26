local menu = {}

function menu.activate()
    --this
end
local selected = 1
local opts = {"Frame Rate", "CRT Effect", "Return To Main"}

function menu.draw()
    --setup for title
    local font = love.graphics.getFont()
    local width = love.graphics.getWidth()
    --Menu Opts
    
    for k,v in ipairs(opts) do
        local textw = font:getWidth(v)
        local x = (width - textw)/2
        local starty = 20
        local space = 80
        local y = starty + (k-1)*space
        if k == selected then
            love.graphics.setColor(1,1,0)
        else
            love.graphics.setColor(1,1,1)
        end
        love.graphics.print(v, x, y)
        love.graphics.setColor(1,1,1)
    end
end

function menu.keypressed(key)
    --counter
    if key == "up" then
        ui_tick:stop()
        ui_tick:play()
        selected = selected -1
        if selected < 1 then
            selected = 1
        end
        print("Selected (Cur count is "..selected..")")
    elseif key == "down" then
        ui_tick:stop()
        ui_tick:play()
        selected = selected +1
        if selected > #opts then
            selected = #opts
        end
        print("Selected (Cur count is "..selected..")")
    --other keypress args
    elseif key == "z" then
        if selected == 3 then
            local menu = require("menu_main")
            Mantle.currentState = menu
            if menu.activate then menu.activate() end
        end
        ui_conf:play()
    end
end

return menu
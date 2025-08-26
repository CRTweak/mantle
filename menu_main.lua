local menu = {}

function menu.activate()
    --this
end
local selected = 1
local opts = {"Start", "Load", "Options", "Quit"}

function menu.draw()
    --setup for title
    local text = "MANTLE"
    local font = love.graphics.newFont("assets/fonts/main.ttf", 144)
    local textw = font:getWidth(text)
    local x = (SCREEN_WIDTH - textw)/2
    love.graphics.setFont(font)
    love.graphics.print(text, x, 60)
    --end setup
    
    --Menu Opts
    for k,v in ipairs(opts) do
        love.graphics.setFont(love.graphics.newFont("assets/fonts/main.ttf", 48))
    
        if k == selected then
            love.graphics.setColor(1,1,0)
        else
            love.graphics.setColor(1,1,1)
        end
        love.graphics.print(v, 100, 360 + (k-1)*48)
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
            local options = require("menu_options")
            Mantle.currentState = options
            if options.activate then options.activate() end
        elseif selected == 4 then
            love.event.quit()
        end
        ui_conf:play()
    end
end

return menu
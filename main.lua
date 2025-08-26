Mantle = {}
Mantle.currentState = require("menu_main")

function love.load()
    love.window.setTitle("MANTLE v0.0.2")
    SCREEN_WIDTH, SCREEN_HEIGHT = love.graphics.getWidth(), love.graphics.getHeight()
    if Mantle.currentState.activate then Mantle.currentState.activate() end

    ui_tick = love.audio.newSource("assets/sounds/ui_tick.wav", "static")
    ui_conf = love.audio.newSource("assets/sounds/ui_conf.wav", "static")
    local menuMusic = love.audio.newSource("assets/music/menu.mp3", "stream")
    menuMusic:play()
    menuMusic:setVolume(0.5)
end

local selected = 1
local opts = {"Start", "Load", "Options", "Quit"}

function love.draw()
    if Mantle.currentState and Mantle.currentState.draw then
        Mantle.currentState.draw()
    end
    ----setup for title
    --local text = "MANTLE"
    --local font = love.graphics.newFont("assets/fonts/main.ttf", 144)
    --local textw = font:getWidth(text)
    --local x = (SCREEN_WIDTH - textw)/2
    --love.graphics.setFont(font)
    --love.graphics.print(text, x, 60)
    ----end setup
    --
    ----Menu Opts
    --for k,v in ipairs(opts) do
    --    love.graphics.setFont(love.graphics.newFont("assets/fonts/main.ttf", 48))
    --
    --    if k == selected then
    --        love.graphics.setColor(1,1,0)
    --    else
    --        love.graphics.setColor(1,1,1)
    --    end
    --    love.graphics.print(v, 100, 360 + (k-1)*48)
    --    love.graphics.setColor(1,1,1)
    --end
end

function love.keypressed(key)
    if Mantle.currentState and Mantle.currentState.keypressed then
        Mantle.currentState.keypressed(key)
    end
    --if key == "up" then
    --    ui_tick:stop()
    --    ui_tick:play()
    --    selected = selected -1
    --    if selected < 1 then
    --        selected = 1
    --    end
    --    print("Selected (Cur count is "..selected..")")
    --elseif key == "down" then
    --    ui_tick:stop()
    --    ui_tick:play()
    --    selected = selected +1
    --    if selected > #opts then
    --        selected = #opts
    --    end
    --    print("Selected (Cur count is "..selected..")")
    --end
end
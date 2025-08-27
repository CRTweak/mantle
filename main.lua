Mantle = {}
Mantle.crtShader = love.graphics.newShader("assets/shaders/crt.glsl")
Mantle.currentState = require("menu_main")

function love.load()
    SCREEN_WIDTH, SCREEN_HEIGHT = love.graphics.getWidth(), love.graphics.getHeight()

    Mantle.crtEffectValue = Mantle.crtEffectValue or 0 --default

    if Mantle.currentState.activate then Mantle.currentState.activate() end

    ui_tick = love.audio.newSource("assets/sounds/ui_tick.wav", "static")
    ui_conf = love.audio.newSource("assets/sounds/ui_conf.wav", "static")
    menuMusic = love.audio.newSource("assets/music/menu.mp3", "stream")
    menuMusic:play()
    menuMusic:setLooping(true)
    menuMusic:setVolume(0.5)
    if not Mantle.screenCanvas then
        Mantle.screenCanvas = love.graphics.newCanvas()
    end
end

function love.draw()
    -- Draw everything to the canvas first
    love.graphics.setCanvas(Mantle.screenCanvas)
    love.graphics.clear(0.5,0.5,0.5)

    if Mantle.currentState and Mantle.currentState.draw then
        Mantle.currentState.draw()
    end

    love.graphics.setCanvas() -- back to screen

    -- Now apply the shader and draw the canvas to the screen
    if Mantle.crtShader then
        Mantle.crtShader:send("intensity", Mantle.crtEffectValue)
        love.graphics.setShader(Mantle.crtShader)
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Mantle.screenCanvas, 0, 0)

    love.graphics.setShader()
end

function love.keypressed(key)
    if Mantle.currentState and Mantle.currentState.keypressed then
        Mantle.currentState.keypressed(key)
    end
end

function love.update(dt)
    if Mantle.currentState and Mantle.currentState.update then
        Mantle.currentState.update(dt)
    end
end
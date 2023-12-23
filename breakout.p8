pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- Initial values
entities = {
    ball = { x = 1, y = 40, dx = 2, dy = 2, r = 2, c = 1 },
    paddle = { x = 52, y = 115, h = 3, w = 24, c = 7 }
}

function _update()
    -- Change color every update
    entities.ball.c = (entities.ball.c % 15) + 1
    
    -- Movement of the paddle
    if btn(0) then entities.paddle.x = max(0, entities.paddle.x - 3) end
    if btn(1) then entities.paddle.x = min(127 - entities.paddle.w, entities.paddle.x + 3) end

    -- Update ball position and check for collision
    updateEntities(entities.ball)
    checkCollision(entities.ball, entities.paddle)
end

function updateEntities(entity)
    entity.x, entity.dx = updatePosition(entity.x, entity.dx)
    entity.y, entity.dy = updatePosition(entity.y, entity.dy)
end

function updatePosition(pos, speed)
    pos = pos + speed

    if pos > 123 or pos < 3 then
        speed = -speed
        sfx(0)
    end

    return pos, speed
end

--[[
    Check if the ball is colliding with the paddle.
    If it is, change the ball's direction and speed.
    The speed is changed based on where the ball hits the paddle.
    The closer to the center, the less the speed is changed.
    The closer to the edges, the more the speed is changed.
    The speed is changed by a maximum of 1/8 of the paddle's width. ]]
function checkCollision(ball, paddle)
   
end

function clamp(value, minimum, maximum)
    return min(maximum, max(minimum, value))
end

function _draw()
    cls()
    rectfill(0, 0, 127, 127, 1)
    circfill(entities.ball.x, entities.ball.y, entities.ball.r, entities.ball.c)
    rectfill(entities.paddle.x, entities.paddle.y, entities.paddle.x + entities.paddle.w, entities.paddle.y + entities.paddle.h, entities.paddle.c)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000c3500c3500c3500c3400c3300c3200c3200c3100b2000b2000b2000a2000a200212001e1000500004000020000000000000000000000000000000000000000000000000000000000000000000000000
0001000013350133501335013340133201331013300153001530000300000002a3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

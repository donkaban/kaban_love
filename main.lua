require ("src/test") 

local x = 100
local y = 100
local dx = 5
local dy = 3
local c  = 0
local dc = 1;

local image = love.graphics.newImage("common/image.png")
local particle = love.graphics.newParticleSystem( image, 300 )

local SCR_W, SCR_H = love.graphics.getDimensions()
local IMG_W, IMG_H = image:getDimensions()


function love.load()
	particle_tune(particle)
end

function love.update(dt)

	x = x + dx
	y = y + dy 
	c = c + dc

	if(x < 0 or x > SCR_W-IMG_W) then dx = -dx end
	if(y < 0 or y > SCR_H-IMG_H) then dy = -dy end	
	if(c < 0 or c > 255) then dc = -dc end
	particle:update(dt)
end

function love.draw()
  	love.graphics.setColor(255,c,0,255)
    love.graphics.draw(image, x, y)
    love.graphics.draw(particle, SCR_W/2, SCR_H/2)
end


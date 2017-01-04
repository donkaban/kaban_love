local config = require 'config' 
local tween  = require 'tween'

-- scene

scene = 
{
	background,
	card
}

---------------------------------------------------------------------------------------------

fragment = {}
function fragment:load(path, tag , speed)
	local obj = {}
	obj.path  = path
	obj.tag   = tag   or 'L'
	obj.speed = speed or 1.0
	obj.exist = love.filesystem.isFile(path)


	
	if(obj.exist) then 
		obj.image = love.graphics.newImage(obj.path) 
		obj.w, obj.h = obj.image:getDimensions()
		
		if(obj.tag == 'L') then
			obj.dir = {x = 500, y = 0}
			obj.x   = -obj.w
			obj.y   = 0
		
		elseif(obj.tag == 'R') then
		
		elseif(obj.tag == 'T') then
		
		elseif(obj.tag == 'B') then

		else
			error ('bad tag - '.. obj.tag)
		end		
			

		print('   + add fragment '.. obj.path .. '['.. obj.tag ..'] speed: ' .. obj.speed)	
	end


 	setmetatable(obj,self)
   	self.__index   = self
	return obj

end

function fragment:resize()


end


function fragment:update(dt)
	if(not self.exist) then return end
	self.x = self.x + self.speed * dt * self.dir.x
	self.y = self.y + self.speed * dt * self.dir.y

-- todo:!

end

function fragment:draw() if(self.exist) then love.graphics.draw(self.image, self.x, self.y) end end	


------------------------------------

card = {}

function card:load(path)
	local obj = {}
	obj.path = path
	print('add card '.. obj.path)	
		
	obj.l = fragment:load(obj.path .. '/image_l.png', 'L') 
	obj.r = fragment:load(obj.path .. '/image_r.png', 'R') 
	obj.t = fragment:load(obj.path .. '/image_t.png', 'T') 
	obj.b = fragment:load(obj.path .. '/image_b.png', 'B') 
	if(love.filesystem.isFile(path..'thumb.png'))   then obj.thumb = love.graphics.newImage(check(obj.path .. '/thumb.png')) end

 	setmetatable(obj,self)
   	self.__index   = self
	return obj

end


function card:update(dt)
	self.l:update(dt)
	self.t:update(dt)
	self.r:update(dt)
	self.b:update(dt)
end

function card:draw()
	self.l:draw()
	self.t:draw()
	self.r:draw()
	self.b:draw()
end



















------------------------------------------------------------------------------------


function love.load()
	
	love.window.setMode(1080/2, 1920/2, {} )  -- desktop test mode, remove it
	love.window.setTitle(config.appname)

	SCR_W, SCR_H = love.graphics.getDimensions()	

	scene.background = love.graphics.newVideo(config.background)
	scene.card = card:load('cards/corwin')

end

function love.update(dt)
	if(not scene.background:isPlaying()) then 
		scene.background:rewind() 
		scene.background:play() 
	end
	scene.card:update(dt)

	
end


function love.draw()
	love.graphics.draw(scene.background, 0, 0)
	scene.card:draw()



end


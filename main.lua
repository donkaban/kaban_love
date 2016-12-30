local config = require ('config') 



-- scene

scene = 
{
	background,

}



local function check(path) if(not love.filesystem.isFile(path)) then  error(path + ' file not exist') end end


card = {}

function card:load(path)
	local obj = {}
	obj.image = love.graphics.newImage(check(path + '/image.png'))
	obj.thumb = love.graphics.newImage(check(path + '/thumb.png'))



 	setmetatable(obj,self)
   	self.__index   = self
	return obj

end




function love.load()
	
	love.window.setMode(1080/2, 1920/2, {} )  -- desktop test mode, remove it
	love.window.setTitle(config.appname)

	SCR_W, SCR_H = love.graphics.getDimensions()	

	scene.background = love.graphics.newVideo(config.background)

end

function love.update(dt)
	if(not scene.background:isPlaying()) then 
		scene.background:rewind() 
		scene.background:play() 
	end
	
end


function love.draw()
	 love.graphics.draw(scene.background, 0, 0)


end


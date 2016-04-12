local Player = {}

function Player:setPlayer()
	self.x, self.y, self.w, self.h = love.graphics.getWidth() / 2, love.graphics.getHeight() - 100, 16, 32
	self.vx = 0
	self.spd, self.maxSpd = 250, 375
	self.bullets = {}
end

function Player:movePlayer(dt)
	local lk = love.keyboard
	if lk.isDown("left") or lk.isDown("a") then 
   		if self.x * dt > 0  then -- move left
   	 		self.x = self.x - self.spd * dt
   		else -- hit left wall
    	self.vx = 0
   	end  
 	elseif lk.isDown("right") or lk.isDown("d") then 
   		if self.x + self.w * dt < love.graphics.getWidth() - self.w then -- move right
     		self.x = self.x + self.spd * dt
   		else -- hit right wall
     		self.x = love.graphics.getWidth() - self.w
   		end     
 	end
end

function Player:collideWithScreen()
	if self.x <= 0 then
		self.vx = 0
		self.x = 0
	elseif self.x >= love.graphics.getWidth() - self.w then
		self.vx = 0
		self.x = love.graphics.getWidth() - self.w
	end
end

function Player:updatePlayer(dt)
	self:movePlayer(dt)
	self:collideWithScreen()
end

function Player:drawPlayer(colors, drawType)
	-- takes R, G, B parameters
	love.graphics.setColor(unpack(colors))
	love.graphics.rectangle(drawType, self.x, self.y, self.w, self.h)
end

return Player
local Player = {}

function Player:setPlayer()
	self.x, self.y, self.w, self.h = love.graphics.getWidth() / 2, love.graphics.getHeight() - 100, 32, 32
	self.vx = 0
	self.spd, self.maxSpd = 250, 375
	self.bullets = {}
end

function Player:movePlayer(dt)
	local lk = love.keyboard

	if lk.isDown('d') then
		if self.vx > 0 then
			self.vx = self.vx + self.spd * dt
		else
			self.vx = self.vx + self.spd*2 * dt
		end
	elseif lk.isDown('a') then
		if self.vx < 0 then
			self.vx = self.vx - self.spd * dt
		else
			self.vx = self.vx - self.spd*2 * dt
		end
	else
		self.vx = self.vx / 1.05
	end

	if self.vx > self.maxSpd then
		self.vx = self.maxSpd
	elseif self.vx < -self.maxSpd then
		self.vx = -self.maxSpd
	end

	self.x = self.x + self.vx * dt
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
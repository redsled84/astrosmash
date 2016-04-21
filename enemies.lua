local Enemies = { }
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

function Enemies:spawnEnemy(x, y, spdX, spdY, w, h, size)
	number = love.math.random(1, 4)
	if number == 1 then
		size = 16 
	end
	if number == 2 then
		size = 32
	end
	if number == 3 then
	 	size = 48
	end
	if number == 4 then
		size = 64
	end
	self.img = love.graphics.newImage("assets/asteroid"..size..".png")
	self.w = self.img:getWidth()
	self.h = self.img:getHeight()
	table.insert(self, {x = x, y = y, spdX = spdX, spdY = spdY, w = self.w, h = self.h, img = self.img, hasCollided = false})
end

function Enemies:destroyEnemyOnCollide(o)
	for i=#self, 1, -1 do
		local enemy = self[i]
		if enemy.hasCollided then
			table.remove(self, i)
		end
	end
end

function Enemies:checkOnCollide(o)
	for i=#self, 1, -1 do
		local enemy = self[i]
		if enemy.x < o.x + o.w and
			enemy.x + enemy.w > o.x and
			enemy.y < o.y + o.h and
			enemy.y + enemy.h > o.y then
			enemy.hasCollided = true
			if enemy.w >= 64 then -- split large enemies in two
				if enemy.spdX > 0 then
					self:spawnEnemy(enemy.x + 16, enemy.y, enemy.spdX, enemy.spdY, enemy.w / 2, enemy.h / 2)
					self:spawnEnemy(enemy.x - 16, enemy.y, -enemy.spdX, enemy.spdY, enemy.w / 2, enemy.h / 2)
				end
				if enemy.spdX < 0 then
					self:spawnEnemy(enemy.x - 16, enemy.y, enemy.spdX, enemy.spdY, enemy.w / 2, enemy.h / 2)
					self:spawnEnemy(enemy.x + 16, enemy.y, -enemy.spdX, enemy.spdY, enemy.w / 2, enemy.h / 2)
				end
			end
			self:destroyEnemyOnCollide(o)
			score = score + 10
			print(enemy.w) -- print to the console

			return true
		end
	end
end

function Enemies:destroyEnemyWhenOutOfBounds()
	for i=#self, 1, -1 do
		local enemy = self[i]
		if enemy.y+enemy.h > windowHeight-68 then
			table.remove(self, i)
			lives = lives - 1
		end
		if enemy.x + enemy.w < 0 then
			table.remove(self, i)
		end
		if enemy.x > windowWidth then
			table.remove(self, i)
		end
	end
end

function Enemies:moveEnemies(dt)
	for i=1, #self do
		local enemy = self[i]
		enemy.x = enemy.x + enemy.spdX * dt
		enemy.y = enemy.y + enemy.spdY * dt
	end
end

function Enemies:updateEnemies(dt)
	for i=1, #self do
		local enemy = self[i]
		w = enemy.w
		h = enemy.h 
	end
    if #Enemies < 2 then	
		x = love.math.random(0, windowWidth)
		spdX = love.math.random(-50, 50)
		spdY = love.math.random(60, 100)
		self:spawnEnemy(x, 0, spdX, spdY, w, h)
	end
	self:moveEnemies(dt)
	self:destroyEnemyOnCollide()
	self:destroyEnemyWhenOutOfBounds()
end

function Enemies:drawEnemies(colors, drawType)
	for i=1, #self do
		local enemy = self[i]
		--love.graphics.setColor(unpack(colors))
		--love.graphics.rectangle(drawType, enemy.x, enemy.y, enemy.w, enemy.h)
		love.graphics.setColor(255,255,255)
		love.graphics.draw(self[i].img, enemy.x, enemy.y)
	end
end

return Enemies

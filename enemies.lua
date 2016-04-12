local Enemies = { w = 16, h = 32 }
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

function Enemies:spawnEnemy(x, y, spdX, spdY, w, h)
	table.insert(self, {x = x, y = y, spdX = spdX, spdY = spdY, w = w, h = h, hasCollided = false})
end

function Enemies:destroyEnemyOnCollide()
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
		end
	end
end

function Enemies:destroyEnemyWhenOutOfBounds()
	for i=#self, 1, -1 do
		local enemy = self[i]
		if enemy.y+enemy.h > windowHeight-68 then
			table.remove(self, i)
		end
		if enemy.x - enemy.w < 0 then
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
	x = love.math.random(0, windowWidth)
	spdX = love.math.random(-50, 50)
	spdY = love.math.random(60, 100)
	w = love.math.random(16, 32)
	h = love.math.random(8, 32)
    if #Enemies < 2 then	
		self:spawnEnemy(x, 0, spdX, spdY, w, h)
	end
	self:moveEnemies(dt)
	self:destroyEnemyOnCollide()
	self:destroyEnemyWhenOutOfBounds()
end

function Enemies:drawEnemies(colors, drawType)
	for i=1, #self do
		local enemy = self[i]
		love.graphics.setColor(unpack(colors))
		love.graphics.rectangle(drawType, enemy.x, enemy.y, enemy.w, enemy.h)
	end
end

function Enemies:shootEnemy(key, x, y)
	if key == 'space' then
		self:spawnEnemy(x, y, 500, 200)
	end
end

return Enemies


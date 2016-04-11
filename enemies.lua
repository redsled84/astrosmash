local Enemies = { w = 16, h = 32 }
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

function Enemies:spawnEnemy(x, y, spd, w, h)
	table.insert(self, {x = x, y = y, spd = spd, w = w, h = h, hasCollided = false})
end

function Enemies:destroyEnemyOnCollide()
	for i=#self, 1, -1 do
		local enemy = self[i]
		if enemy.hasCollided then
			table.remove(self, i)
			print('ya')
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
	end
end

function Enemies:moveEnemies(dt)
	for i=1, #self do
		local enemy = self[i]
		enemy.y = enemy.y + enemy.spd * dt
	end
end

function Enemies:updateEnemies(dt)
	x = love.math.random(0, windowWidth)
	spd = love.math.random(50, 200)
	w = love.math.random(8, 32)
	h = love.math.random(8, 32)
    if #Enemies <= 10 then	
		self:spawnEnemy(x, 0, spd, w, h)
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
		self:spawnEnemy(x, y, 500)
	end
end

return Enemies


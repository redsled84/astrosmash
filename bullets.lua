local Bullets = { w = 4, h = 32 }

function Bullets:spawnBullet(x, y, spd)
	table.insert(self, {x = x, y = y, spd = spd, w = self.w, h = self.h, hasCollided = false})
end

function Bullets:loopBullets(f)
	for i=1, #self do
		local bullet = self[i]
		f(bullet)
	end
end

function Bullets:destroyBulletOnCollide()
	for i=#self, 1, -1 do
		if self.hasCollided then
			table.remove(self, i)
		end
	end
end

function Bullets:destroyBulletWhenOutOfBounds()
	for i=#self, 1, -1 do
		local bullet = self[i]
		if bullet.y+bullet.h > love.graphics.getHeight() then
			table.remove(self, i)
		end
	end
end

function Bullets:moveBullets(dt)
	for i=1, #self do
		local bullet = self[i]
		bullet.y = bullet.y - bullet.spd * dt
	end
end

function Bullets:updateBullets(dt)
	self:moveBullets(dt)
	self:destroyBulletOnCollide()
	self:destroyBulletWhenOutOfBounds()
end

function Bullets:drawBullets(colors, drawType)
	for i=1, #self do
		local bullet = self[i]
		love.graphics.setColor(unpack(colors))
		love.graphics.rectangle(drawType, bullet.x, bullet.y, bullet.w, bullet.h)
	end
end

function Bullets:shootBullet(key, x, y)
	if key == 'space' then
		self:spawnBullet(x, y, 500)
	end
end

return Bullets
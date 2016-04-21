local Bullets = { w = 4, h = 16, bullets = {}}
shootSound = love.audio.newSource("assets/shoot.wav", "static") 

function Bullets:spawnBullet(x, y, spd)
	table.insert(self.bullets, {x = x, y = y, spd = spd, w = self.w, h = self.h, hasCollided = false})
end

function Bullets:loopBullets(f)
	for i=1, #self.bullets do
		local bullet = self.bullets[i]
		f(bullet)
	end
end

function Bullets:destroyBulletOnCollide(bool)
	for i=#self.bullets, 1, -1 do
		if bool then
			table.remove(self.bullets, i)
		end
	end
end

function Bullets:destroyBulletWhenOutOfBounds()
	for i=#self.bullets, 1, -1 do
		local bullet = self.bullets[i]
		if bullet.y+bullet.h > love.graphics.getHeight() then
			table.remove(self.bullets, i)
		end
	end
end

function Bullets:moveBullets(dt)
	for i=1, #self.bullets do
		local bullet = self.bullets[i]
		bullet.y = bullet.y - bullet.spd * dt
	end
end

function Bullets:updateBullets(dt)
	self:moveBullets(dt)
	self:destroyBulletWhenOutOfBounds()
end

function Bullets:drawBullets(colors, drawType)
	for i=1, #self.bullets do
		local bullet = self.bullets[i]
		love.graphics.setColor(unpack(colors))
		love.graphics.rectangle(drawType, bullet.x, bullet.y, bullet.w, bullet.h)
	end
end

function Bullets:shootBullet(key, x, y)
	if key == 'space' then
		self:spawnBullet(x + 30, y - self.h, 500) -- this should be 1/2 of the player - 1/2 of the bullet size...  need to fix
		shootSound:play()
	end
end

return Bullets
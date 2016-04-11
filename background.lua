local Background = {}

function Background:createBackground()
<<<<<<< HEAD
	local windowWidth = love.graphics.getWidth()
	local windowWidth = love.graphics.getHeight()
	
	for i=1,10 do
		local x = love.math.random(10, windowWidth)
		local y = love.math.random(10, windowWidth)
		table.insert(self, { x = x, y = y })
=======
	for i=1,10 do
 	 	self.x = love.math.random(10, width)
		self.y = love.math.random(10, height)
		table.insert(self, { x = self.x, y = self.y })
>>>>>>> ee4503e1752df9e4789e59471218c1dc5ff0eb17
	end
end

function Background:drawBackground()
	for i,v in ipairs(Background) do
<<<<<<< HEAD
		love.graphics.setColor(0,255,0)
=======
>>>>>>> ee4503e1752df9e4789e59471218c1dc5ff0eb17
		love.graphics.rectangle("fill", v.x, v.y, 3, 3)
	end
end

return Background
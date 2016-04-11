local Background = {}

function Background:createBackground()
	for i=1,50 do
 	 	self.x = love.math.random(10, width)
		self.y = love.math.random(10, height)
		table.insert(self, { x = self.x, y = self.y })
	end
end

function Background:drawBackground()
	for i,v in ipairs(Background) do
		love.graphics.rectangle("fill", v.x, v.y, 3, 3)
	end
end

return Background
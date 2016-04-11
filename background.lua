local Background = {}

function Background:createBackground()
	self.x = love.math.random(10, width)
	self.y = love.math.random(10, height)
	for i=1,10 do
		table.insert(self, { self.x, self.y })
	end
end

function Background:drawBackground()
	for i,v in ipairs(Background) do
		love.graphics.rectangle(fill, x, y, 3, 3)
	end
end

return Background
local Background = {}

function Background:createBackground()
	local windowWidth = love.graphics.getWidth()
	local windowWidth = love.graphics.getHeight()
	
	for i=1,10 do
		local x = love.math.random(10, windowWidth)
		local y = love.math.random(10, windowWidth)
		table.insert(self, { x = x, y = y })
	end
end

function Background:drawBackground()
	for i,v in ipairs(Background) do
		love.graphics.setColor(0,255,0)
		love.graphics.rectangle("fill", v.x, v.y, 3, 3)
	end
end

return Background
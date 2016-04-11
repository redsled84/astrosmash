local Background = {}
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

function Background:createBackground()
	for i=1,10 do
		local x = love.math.random(10, windowWidth)
		local y = love.math.random(10, windowHeight)
		table.insert(self, { x = x, y = y })
	end
end

function Background:drawBackground()
	for i,v in ipairs(Background) do
		love.graphics.setColor(0,255,0)
		love.graphics.rectangle("fill", v.x, v.y, 3, 3)
	end

	love.graphics.setColor(255,255,255)
	love.graphics.line(0, windowHeight-68, windowWidth, windowHeight-68)
end

return Background
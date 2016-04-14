local Background = {}
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

function Background:createBackground()
	for i=1,50 do
		local x = love.math.random(10, windowWidth)
		local y = love.math.random(10, windowHeight)
		table.insert(self, { x = x, y = y })
	end
end

function Background:drawBackground(colors, drawType)
	love.graphics.setColor(unpack(colors))
	for i,v in ipairs(Background) do
		love.graphics.rectangle("fill", v.x, v.y, 3, 3)
	end
	love.graphics.rectangle(drawType, 0, windowHeight-68, windowWidth, 5)
end

function Background:drawScore(colors, drawType)
	love.graphics.setColor(unpack(colors))
	love.graphics.print("Score: " .. score, windowWidth - 60, windowHeight - 60)
end

return Background
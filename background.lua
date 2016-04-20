local Background = {}
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

love.graphics.setFont(love.graphics.newFont(24))

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
	love.graphics.rectangle(drawType, 0, windowHeight - 68, windowWidth, 5)
end

function Background:drawScore(colors, drawType)
	love.graphics.setColor(unpack(colors))
	love.graphics.printf("Score: " .. score, -20, windowHeight - 48, windowWidth, "right")
end

function Background:drawLives(colors, drawType)
	love.graphics.setColor(unpack(colors))
	love.graphics.printf("Lives: " .. lives, 20, windowHeight - 48, 0, "left")
	love.graphics.print("Lives: " .. lives, 20, windowHeight - 48, 0)
end

return Background
local SplashBackground = {}

function SplashBackground:drawSplashBackground(colors, drawType)
	love.graphics.setColor(unpack(colors))
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()
	love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
end

return SplashBackground
local Player = require 'player'
local Bullets = require 'bullets'

function love.load()
	Player:setPlayer()
end

function love.update(dt)
	Player:updatePlayer(dt)
	Bullets:updateBullets(dt)
end

function love.draw()
	Player:drawPlayer({255,255,255}, 'fill')
	Bullets:drawBullets({255,255,255}, 'fill')
end

function love.keypressed(key)
	if key == 'escape' then
		-- final version will have a prompt asking if the player wants to quit
		love.event.quit()
	end

	Bullets:shootBullet(key, Player.x, Player.y)
end
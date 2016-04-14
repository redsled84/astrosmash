score = 0
local Background = require 'background'
local Player = require 'player'
local Bullets = require 'bullets'
local Enemies = require 'enemies'

function love.load()
	Background:createBackground()
	Player:setPlayer()
	local str = "Astrosmash copy currently under development by redsled84, slainchicken and LapisButterfly :)"
	print(str)
end

function love.update(dt)
	Player:updatePlayer(dt)
	Bullets:updateBullets(dt)
	Enemies:updateEnemies(dt)
	Bullets:loopBullets(function(bullet)
		Enemies:checkOnCollide(bullet)
	end)
end

function love.draw()
	Background:drawBackground({0, 255, 0}, 'fill')
	Player:drawPlayer({0, 0, 255}, 'fill')
	Bullets:drawBullets({0,0,255}, 'fill')
	Enemies:drawEnemies({255,0,0}, 'fill')
	Background:drawScore({0, 255, 0}, 'fill')
end

function love.keypressed(key)
	if key == 'escape' then
		-- final version will have a prompt asking if the player wants to quit
		love.event.quit()
	end

	Bullets:shootBullet(key, Player.x, Player.y)
end
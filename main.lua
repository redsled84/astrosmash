width = love.graphics.getWidth()
height = love.graphics.getHeight()

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
end

function love.draw()
	Background:drawBackground()
	Player:drawPlayer({255,255,255}, 'fill')
	Bullets:drawBullets({255,255,255}, 'fill')
	Enemies:drawEnemies({255,255,255}, 'fill')
end

function love.keypressed(key)
	if key == 'escape' then
		-- final version will have a prompt asking if the player wants to quit
		love.event.quit()
	end

	Bullets:shootBullet(key, Player.x, Player.y)
end
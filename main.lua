local Player = require 'player'
local Bullets = require 'bullets'
local Enemies = require 'enemies'

function love.load()
	Player:setPlayer()

	local str = "Astrosmash copy currently under development by redsled84 and slainchicken and LapisButterfly :)"
	print(str)
end

function love.update(dt)
	Player:updatePlayer(dt)
	Bullets:updateBullets(dt)
	for i=1,100 do
		x = love.math.random(0, width)
		table.insert(Enemies, Enemies:createEnemy(x, 10, 10, 10))
	end	
	Enemies:moveEnemy()
end

function love.draw()
	Player:drawPlayer({255,255,255}, 'fill')
	Bullets:drawBullets({255,255,255}, 'fill')
	for i,v in ipairs(Enemies) do
		Enemies:drawEnemy(5,5,5,5)
	end
end

function love.keypressed(key)
	if key == 'escape' then
		-- final version will have a prompt asking if the player wants to quit
		love.event.quit()
	end

	Bullets:shootBullet(key, Player.x, Player.y)
	drawEnemy()
end
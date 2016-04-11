local Player = require 'player'
local Bullets = require 'bullets'
require ("enemies") 
listOfEnemies = {}

function love.load()
	Player:setPlayer()

	local str = "Astrosmash copy currently under development by redsled84 and slainchicken and LapisButterfly :)"
	print(str)
end

function love.update(dt)
	Player:updatePlayer(dt)
	Bullets:updateBullets(dt)
	for i=1,100 do
		table.insert(listOfEnemies, createEnemy())
	end	
	moveEnemy()
end

function love.draw()
	Player:drawPlayer({255,255,255}, 'fill')
	Bullets:drawBullets({255,255,255}, 'fill')
	for i,v in ipairs(listOfEnemies) do
		drawEnemy(5,5,5,5)
	end
end

function love.keypressed(key)
	if key == 'escape' then
		-- final version will have a prompt asking if the player wants to quit
		love.event.quit()
	end

	Bullets:shootBullet(key, Player.x, Player.y)
end

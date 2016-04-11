require ("enemies") 

function love.load()
	local str = "Astrosmash copy currently under development by redsled84 and slainchicken and LapisButterfly :)"
	print(str)
end

function love.update(dt)
	for i=1,100 do
		x = love.math.random(0, width)
		table.insert(listOfEnemies, createEnemy(x, 10, 10, 10))
	end	
	moveEnemy()
end

function love.draw()
	drawEnemy()
end
require ("enemies") 
listOfEnemies = {}

function love.load()
	local str = "Astrosmash copy currently under development by redsled84 and slainchicken and LapisButterfly :)"
	print(str)
end

function love.update(dt)
	for i=1,100 do
		table.insert(listOfEnemies, createEnemy())
	end	
	moveEnemy()
end

function love.draw()
	for i,v in ipairs(listOfEnemies) do
		drawEnemy(5,5,5,5)
	end
end
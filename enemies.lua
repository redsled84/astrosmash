local Enemies = {}

--listOfEnemies = {}

function Enemies:createEnemy(x, y, width, height)
	enemy = {}
	enemy.x  = x
	enemy.y = y
	enemy.width =  10
	enemy.height = 10
	return enemy
end

function Enemies:drawEnemy(x, y, width, height)
	for i,v in ipairs(Enemies) do
		love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
	end
end

function Enemies:moveEnemy()

end

return Enemies
require("grid")

xLocs = {}
oLocs = {}

function love.load()
	gameBoard = love.graphics.newImage("resources/board.png")
	xImage = love.graphics.newImage("resources/x.png")
	oImage = love.graphics.newImage("resources/o.png")
end

function love.draw()
	love.graphics.draw(gameBoard, 0, 0)

	for k,v in pairs(xLocs) do
		love.graphics.draw(xImage, v.x, v.y)
	end

	for k,v in pairs(oLocs) do
		love.graphics.draw(oImage, v.x, v.y)
	end
end

function love.update(dt)
	
end

function love.keypressed(key)
	if key == "escape" then
		love.event.push("quit")
	end
end

function love.mousereleased(x, y, button)
	local gridX
	local gridY
	gridX, gridY = grid.findNearestCell(x, y)
 
	if button == "l" then
		table.insert(xLocs, {x = gridX, y = gridY})
	elseif button == "r" then
		table.insert(oLocs, {x = gridX, y = gridY})
	end
end

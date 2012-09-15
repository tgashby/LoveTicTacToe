require("grid")

xLocs = {}
oLocs = {}
invalidMoveTimer = 0
xTurn = true
whoseTurn = xImage

function love.load()
	gameBoard = love.graphics.newImage("resources/board.png")
	xImage = love.graphics.newImage("resources/x.png")
	oImage = love.graphics.newImage("resources/o.png")
end

function love.draw()
	love.graphics.draw(gameBoard, 0, 0)

	if xTurn then
		whoseTurn = xImage
	else
		whoseTurn = oImage
	end

	love.graphics.draw(whoseTurn, 20, 70)	

	if invalidMoveTimer > 0 then
		print("Invalid move")
		love.graphics.setColor(255,0,0)
		love.graphics.print("Invalid Move", 30, 500)
	end

	for k,v in pairs(xLocs) do
		love.graphics.draw(xImage, v.x, v.y)
	end

	for k,v in pairs(oLocs) do
		love.graphics.draw(oImage, v.x, v.y)
	end
end

function love.update(dt)
	if invalidMoveTimer > 0 then
		invalidMoveTimer = invalidMoveTimer - dt
	end
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

	if gridX == nil then
		invalidMoveTimer = 2
	else
		print("Pushing: " .. gridX .. ", " .. gridY)

		if xTurn then
			table.insert(xLocs, {x = gridX, y = gridY})
		else
			table.insert(oLocs, {x = gridX, y = gridY})
		end

		xTurn = not xTurn
	end
end

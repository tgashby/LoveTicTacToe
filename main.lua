require("grid")

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

	for k,v in pairs(grid.cells) do
		if v.image ~= nil then
			love.graphics.draw(v.image, v.x, v.y)
		end
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
	local validMove = grid.registerMove(x, y, xTurn)

	if validMove then
		-- Go to next player's turn
		xTurn = not xTurn
	else
		invalidMoveTimer = 2
	end
end

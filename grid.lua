grid = {
	leftX = 510, middleX = 728, rightX = 1058,
	topY = 0, middleY = 225, bottomY = 560
}

grid.cells = {
	{image = nil, x = grid.leftX, y = grid.topY}, 
	{image = nil, x = grid.middleX, y = grid.topY}, 
	{image = nil, x = grid.rightX, y = grid.topY},

	{image = nil, x = grid.leftX, y = grid.middleY}, 
	{image = nil, x = grid.middleX, y = grid.middleY}, 
	{image = nil, x = grid.rightX, y = grid.middleY},

	{image = nil, x = grid.leftX, y = grid.bottomY}, 
	{image = nil, x = grid.middleX, y = grid.bottomY}, 
	{image = nil, x = grid.rightX, y = grid.bottomY},
}

function grid.registerMove(x, y, xTurn)
	local cellX, cellY = findNearestCell(x, y)

	if cellX == nil then
		return false
	end

	local cellPos = findCellPos(cellX, cellY)
	local cell = grid.cells[cellPos]

	print(cellPos)

	if cell.image == nil then
		if xTurn then
			cell.image = xImage
		else
			cell.image = oImage
		end
	else
		-- invalid move
		return false
	end

	return true
end

function findCellPos(x, y)
	local cellPos

	if x == grid.leftX then
		if y == grid.topY then
			cellPos = 1
		elseif y == grid.middleY then
			cellPos = 4
		else
			cellPos = 7
		end
	elseif x == grid.middleX then
		if y == grid.topY then
			cellPos = 2
		elseif y == grid.middleY then
			cellPos = 5
		else
			cellPos = 8
		end
	else
		if y == grid.topY then
			cellPos = 3
		elseif y == grid.middleY then
			cellPos = 6
		else
			cellPos = 9
		end
	end

	return cellPos
end

function findNearestCell(x, y)
	local nearX = nearestX(x)
	local nearY = nearestY(y)

	if nearX == nil then
		return nil
	end
	
	return nearX, nearY
end

function nearestX(x)
	local toRet

	if x < grid.leftX then
		return nil
	end

	if x < grid.middleX then
		toRet = grid.leftX
	elseif x < grid.rightX then
		toRet = grid.middleX
	else
		toRet = grid.rightX
	end

	return toRet
end

function nearestY(y)
	local toRet

	if y < grid.middleY then
		toRet = grid.topY
	elseif y < grid.bottomY then
		toRet = grid.middleY
	else
		toRet = grid.bottomY
	end

	return toRet
end
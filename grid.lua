grid = {
	leftX = 510, middleX = 728, rightX = 1058,
	topY = 0, middleY = 225, bottomY = 560
}

function grid.findNearestCell(x, y)
	local nearX = grid.nearestX(x)
	local nearY = grid.nearestY(y)

	if nearX == nil then
		return nil
	end
	
	return nearX, nearY
end

function grid.nearestX(x)
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

function grid.nearestY(y)
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
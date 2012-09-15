local grid = {
	leftX = 510, middleX = 728, rightX = 1058,
	topY = 0, middleY = 225, bottomY = 560
}

function grid.findNearestCell(x, y)
	nearX = grid.nearestX(x)
	nearY = grid.nearestY(y)
	
	return nearX - 103, nearY - 103
end

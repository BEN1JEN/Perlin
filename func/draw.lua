local draw = {}

function draw.drawTerrain()
	local width, height = misc.getWindowSize()
	local polygon = {}
	for x = 0, width do
		polygon[#polygon+1] = x
		polygon[#polygon+1] = height - world.getTerrainHeightAt(x)
	end
	polygon[#polygon+1] = width
	polygon[#polygon+1] = height
	polygon[#polygon+1] = 0
	polygon[#polygon+1] = height

	love.graphics.polygon("fill", polygon)
end

return draw

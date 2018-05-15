local draw = {}
local camX, camY = 0, 0

function draw.drawTerrain()
	local width, height = misc.getWindowSize()
	local polygon = {}
	for x = 0, width, 32 do
		polygon[#polygon+1] = x
		polygon[#polygon+1] = height - world.getTerrainHeightAt(x+camX) + camY
	end
	polygon[#polygon+1] = width
	polygon[#polygon+1] = height
	polygon[#polygon+1] = 0
	polygon[#polygon+1] = height

	triangles = love.math.triangulate(polygon)
	math.randomseed(10)
	for i, triangle in ipairs(triangles) do
		love.graphics.setColor(0, math.random(0, 100)/100, 0)
		love.graphics.polygon("fill", triangle)
	end
end

return draw

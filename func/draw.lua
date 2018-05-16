local draw = {}
local camX, camY = 0, 0

function draw.drawTerrain()
	local width, height = misc.getWindowSize()
	local polygon = {}
	for x = 0, width, 4 do
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
		love.graphics.setColor(0.1, 5, 0.3)
		love.graphics.polygon("fill", triangle)
	end
end

function draw.drawPlayer()
	local x, y = player.getPlayerPos()
	local width, height = misc.getWindowSize()
	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("fill", x-25, height-y-50, 50, 50)
end

function draw.drawFPS()
	local FPS = misc.getFPS()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print("FPS: " .. FPS, 0, 0, 0, 1, 1)
end

return draw

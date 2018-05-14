function love.load()
	-- requirements
	misc = require "func.misc"
	world = require "func.world"
	player = require "func.player"
	draw = require "func.draw"
end

function love.update(delta)

end

function love.draw()
	draw.drawTerrain()
end

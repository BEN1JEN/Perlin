function love.load()
	-- requirements
	misc = require "func.misc"
	world = require "func.world"
	player = require "func.player"
	draw = require "func.draw"
	input = require "func.input"

	-- init
	dofile("func/init.lua")
end

function love.update(delta)
	player.movePlayer(delta)
	misc.setFPS(delta)
end

function love.draw()
	draw.drawTerrain()
	draw.drawPlayer()
	draw.drawFPS()
end

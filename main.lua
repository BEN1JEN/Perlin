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
	print(player.getPlayerPos())
end

function love.draw()
	draw.drawTerrain()
end

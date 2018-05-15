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
end

function love.draw()
	draw.drawTerrain()
	local x, y = player.getPlayerPos()
	love.graphics.rectangle("fill", x, y, 200, 200)
end

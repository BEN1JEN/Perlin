input = {}
function input.getPlayerInput()
	local sneek, run, jump, left, right = false, false, false, false, false
	if love.keyboard.isDown("up") or love.keyboard.isDown("w") or love.keyboard.isDown("space") then
		jump = true
	end
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		left = true
	end
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		right = true
	end
	if love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl") then
		run = true
	end
	if love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift") then
		sneek = true
	end
	return sneek, run, jump, left, right
end

return input

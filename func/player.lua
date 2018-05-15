local player = {}
local players = {}
local currentPlayer = ""

function player.movePlayer(delta)

	local sneek, run, jump, left, right = input.getPlayerInput()
	local playerX, playerY, playerVX, playerVY = player.getPlayerPos(), player.getPlayerVelocity()

	local speed = 60
	local maxSpeed = 40

	if sneek then
		speed = 60
		maxSpeed = 10
	elseif run then
		speed = 60
		maxSpeed = 10
	end

	if left and not right then
		playerVX = playerVY + speed * delta
	elseif right and not left then
		playerVX = playerVY + speed * delta
	else
		playerVX = playerVX * deceliration / delta
	end

	if playerVX > maxSpeed then
		playerVX = maxSpeed
	end
	if playerVX < maxSpeed*-1 then
		playerVX = maxSpeed*-1
	end

	playerX = playerX + playerVX

	player.setVelocity(playerVX, playerVY)
	player.playerGoTo(playerX, playerY)

end

function player.getCurrentPlayer()
	return currentPlayer
end

function player.setCurrentPlayer(name)
	if players[name] then
		currentPlayers = name
	else
		misc.warning("attempt to switch surrent player to \'" .. name .. "\' whitch does not exist")
	end
end

function player.newPlayer(name)
	local player = {
		id = #players + 1,
		name = misc.generateName(2),
		x = 0,
		y = 0,
		vx = 0,
		vy = 0
	}
	if name then
		players[name] = player
		players[name]["name"] = name
	else
		players[player.id] = player
	end
end

function player.playerGoTo(x, y)
	if players[currentPlayer] then
		players[currentPlayer]["x"], players[currentPlayer]["y"] = x, y
	else
		misc.warning("attempt to move non-existent player \'" .. currentPlayer .. "\'")
	end
end

function player.setVelocity(x, y)
	if players[currentPlayer] then
		players[currentPlayer]["vx"], players[currentPlayer]["vy"] = x, y
	else
		misc.warning("attempt to set the velocity of non-existent player \'" .. currentPlayer .. "\'")
	end
end

function player.getPlayerPos()
	if player[currentPlayer] then
		local x, y = player[currentPlayer]["x"], player[currentPlayer]["y"]
	else
		misc.warning("attempt to get position of non-existent player \'" .. currentPlayer .. "\', returning x:0 y:0")
		local x, y = 0, 0
	end
	return x, y
end

function player.getPlayerVelocity()
	if player[currentPlayer] then
		local x, y = player[currentPlayer]["vx"], player[currentPlayer]["vy"]
	else
		misc.warning("attempt to get velocity of non-existent player \'" .. currentPlayer .. "\', returning vx:0 vy:0")
		local x, y = 0, 0
	end
	return x, y
end

return player

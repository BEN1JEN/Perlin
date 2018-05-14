local player = {}
local players = {}
local currentPlayer = ""

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
		name = misc.nameGen(2),
		x = 0,
		y = 0,
	}
	if name then
		players[name] = player
		players[name]["name"] = name
	else
		players[player.id] = player
	end
end

function player.playerGoTo(id, x, y)
	if players[id] then
		players[id]["x"], players[id]["y"] = x, y
	else
		misc.warning("attempt to move non-existent player \'" .. id .. "\'")
	end
end

function player.getPlayerPos(id)
	if player[id] then
		local x, y = player[id]["x"], player[id]["y"]
	else
		misc.warning("attempt to get position of non-existent player \'" .. id .. "\', returning x:0 y:0")
		local x, y = 0, 0
	end
	return x, y
end

return player

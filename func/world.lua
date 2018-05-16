local world = {}
local objects = {}
local terrain = {}
local seed = 0

function world.setSeed(newSeed)
	seed = newSeed
	terrain = {}
end

function world.addObject(x, y, object)
	local id = #objects + 1
	objects[#objects] = {
		x=x,
		y=y,
		object=object,
		placer=player.getCurrentPlayer(),
		placeTime=os.time(),
		objectID = id
	}
end

function world.removeObject(id)
	objects[id] = nil
end

function world.modifyObject(id, attribute, value)
	if objects[id] then
		if objects[id][attribute] then
			objects[id][attribute] = value
		else
			misc.warning("attempt to modify the non-existent attribute \'" .. attribute .. "\' of object " .. id)
		end
	else
		misc.warning("attempt to modify an attribute of non-existent object " .. id)
	end
end

function world.addAttributeToObject(id, attribute, value)
	if objects[id] then
		if value then
			objects[id][attribute] = value
		else
			objects[id][attribute] = 0
		end
	else
		misc.warning("attempt to add attribute to non-existent object " .. id)
	end
end

function world.getTerrainHeightAt(x)
	local returnValue
	if terrain[x] then
		returnValue = terrain[x]
	else
		terrain[x] = world.generateX(x)
		returnValue = terrain[x]
	end
	return returnValue
end

function world.generateX(x)
	return
	  love.math.noise(x/1000, seed+3)*500
	+ love.math.noise(x/500, seed+2)*200
	+ love.math.noise(x/100,  seed+1)*25
	+ love.math.noise(x/30,   seed+0)*10
end

return world

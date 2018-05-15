misc = {}

function misc.error(reason, description, where)
	print ("\n\n")
	print ("--------------------------------------------------------------")
	print ("Perlin Internal Error:")
	print ("	Reason: " .. reason)
	print ("	While doing: " .. where)
	print ("	Desciription: ")
	for k, line in pairs(description) do
		io.write("		" .. k .. ": ")
		print (line)
	end
	print ("Lua error will now begin:")
	print ("--------------------------------------------------------------")

	error (reason .. "@" .. where)
end

function misc.warning(text)
	print("Warning: " .. text)
end

function misc.generateName(wordCount)
	local words = {}
	f = io.open("assets/texts/wordList.txt")
	while line do
		words[#words+1] = f:read("*line")
	end

	local name = "bob"
	--for i = 1, wordCount do
	--	name = name .. words[math.random(1, #words)]
	--end

	return name
end

function misc.getWindowSize()
	return love.window.getMode()
end

return misc

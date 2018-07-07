local KEY = "sampletext"

addEventHandler("onResourceStart", resourceRoot, function()
	local file = File.open("test.png")
	local raw = file:read(file.size)
	file:close()

	local encoded = encodeString(
		"tea",
		raw,
		{ key = KEY }
	)

	local decoded = decodeString(
		"tea",
		encoded,
		{ key = KEY }
	)

	-- you can see size mismatch at test.png and decoded.png
	local file = File.new("decoded.png")
	file:write(decoded)
	file:close()

	outputDebugString("Ready!")
end)
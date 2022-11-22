#!/usr/bin/lua

local playerctl = {}

local function find_availables()
	-- List all available players and return them.
	local available_clients = {}
	local handle = io.popen("playerctl --list-all") -- Store the result of the command in `handle`

	if handle ~= nil then
		local id = 1
		local result = handle:read("*a")
		handle:close()
		for token in string.gmatch(result, "[^%s]+") do -- Go through all words in the string
			available_clients[id] = string.gsub(token, "\n", "")
			id = id + 1
		end
	end

	return available_clients
end

local function is_playing(client)
	local res = false
	local handle = io.popen("playerctl --player=" .. client .. " status")
	if handle ~= nil then
		local status = handle:read("*a")
		status = string.gsub(status, "\n", "") -- Remove pending '\n'
		res = status == "Playing"
		handle:close()
	end
	return res
end

local function get_previous_client()
	-- Return the previous client if the previous time it was active
	-- was less than 10 seconds ago.
	local file = assert(io.open("./data/client-status", "r"), "Error when reading the client-status file!")
	io.input(file)
	local previous_client = io.read("*l")
	previous_client = string.gsub(previous_client, "\n", "")
	local last_active = io.read("*n")
	io.close(file)

	local current_time = os.date("%s")
	if current_time - last_active < 10 then
		return previous_client
	end
	return nil
end

local function update_client(client)
	-- Update the current client name and active time.
	local file = assert(io.open("./data/client-status", "w"), "Error when reading the client-status file!")
	io.output(file)
	io.write(client .. "\n")
	io.write(os.date("%s"))
	io.close(file)
end

function playerctl.playing_client()
	local availables = find_availables()
	-- local playing_client = nil
	-- for _, client in pairs(availables) do
	-- 	if is_playing(client) then
	-- 		playing_client = client
	-- 	end
	-- end
	-- if playing_client == nil then
	-- 	-- The client can be nil due to limits with in the Spotify API rates.
	-- 	-- To avoid having a blinking image, it reloads the last client if it is not too old.
	-- 	playing_client = get_previous_client()
	-- else
	-- 	update_client(playing_client)
	-- end
	-- if playing_client == nil then
	-- 	io.stderr.write(io.stderr, "nil\n")
	-- else
	-- 	io.stderr.write(io.stderr, playing_client .. "\n")
	-- end
	-- return playing_client
	return availables[1]
end

if not pcall(debug.getlocal, 4, 1) then
	-- This block is read only if the file is not imported but executed.
	if #arg > 0 then
		if arg[1] == "client" then
			print(playerctl.playing_client())
		elseif arg[1] == "artwork" then
			local client = playerctl.playing_client()
			if client ~= nil then
				-- print("Fetching art for client", client)
				os.execute("./scripts/fetch-art.sh " .. client)
			end
		end
	end
end

return playerctl

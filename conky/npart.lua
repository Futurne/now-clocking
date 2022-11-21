local function add_conky(text)
	conky.text = conky.text .. text
end

local function fetch_image(application_name)
	local text = ""
		.. "${exec ./scripts/fetch-art "
		.. application_name
		.. " }"
		.. "${image ./data/"
		.. application_name
		.. ".png -p 0,0 -s 125x125 -n}"
	add_conky(text)
end

local function add_player(application_name)
	local text = "" .. '${if_match "Playing" == "${exec playerctl -p ' .. application_name .. ' status}"}'
	add_conky(text)
	fetch_image(application_name)
	add_conky("${endif}")
end

conky.config = {
	-- Run settings
	total_run_times = 0,
	update_interval = 1,

	-- Positioning
	alignment = "bottom_left",
	gap_x = 50,
	gap_y = 125,
	minimum_width = 125,
	maximum_width = 125,
	minimum_height = 125,
	xinerama_head = 1,

	-- Draw settings
	double_buffer = true,
	draw_shades = false,
	draw_blended = false,

	-- Compositor settings
	own_window = true,
	own_window_argb_visual = true,
	own_window_argb_value = 0,
	own_window_transparent = true,
	own_window_hints = "undecorated,below,sticky,skip_taskbar,skip_pager",
	own_window_type = "dock",
}

conky.text = ""
local players = { "spotify", "spotifyd", "Lollypop", "cmus", "vlc" }
for _, application_name in ipairs(players) do
	add_player(application_name)
end

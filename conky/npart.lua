conky.config = {
	-- Run settings
	total_run_times = 0,
	update_interval = 1,
	text_buffer_size = 512,
	max_text_width = 0,
	imlib_cache_size = 0,

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

conky.text = [[
${if_match "Playing" == "${exec cat ./data/status}"}
${image ./data/artwork.png -p 0,0 -s 125x125 -n}
${endif}
]]

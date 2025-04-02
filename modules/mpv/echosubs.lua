-- Change the two lines below
local minimum_pause_time = 0.5 -- Set a minimum subtitle duration to trigger a pause
local pause_time_modifier = 0.4
local minimum_sub_length = 0.7 -- Prevent pausing for very short lines
local minimum_word_count = 3 -- Prevent pausing for very short subtitles (word-based)
local ignore_formatted_subs = true -- Ignore subtitles with special formatting
local pause_offset = -0.1

local active = false
local pause_at_start = true
local skip_next = false

function count_words(text)
	local count = 0
	for word in string.gmatch(text, "[%w']+") do
		count = count + 1
	end
	return count
end

function is_formatted_subtitle()
	local sub_style = mp.get_property("sub-style")
	if sub_style and (sub_style:find("italic") or sub_style:find("bold") or sub_style:find("sign")) then
		return true
	end
	return false
end

function pause()
	local sub_start = mp.get_property_number("sub-start")
	local sub_end = mp.get_property_number("sub-end")
	local sub_text = mp.get_property("sub-text")

	if not sub_start or not sub_end or not sub_text then
		return
	end

	if ignore_formatted_subs and is_formatted_subtitle() then
		return
	end

	local sub_duration = sub_end - sub_start
	local sub_time = sub_duration * pause_time_modifier
	local word_count = count_words(sub_text)

	-- Only pause if the subtitle duration and word count exceed thresholds
	if
		sub_duration >= minimum_pause_time
		and sub_duration >= minimum_sub_length
		and word_count >= minimum_word_count
	then
		if skip_next then
			skip_next = false
		else
			mp.set_property_bool("pause", true)
			mp.set_property_bool("sub-visibility", true)
			mp.osd_message(" ", 0.001)
			timer = mp.add_timeout(sub_time, function()
				mp.set_property_bool("pause", false)
				mp.set_property_bool("sub-visibility", false)
				mp.remove_key_binding("override-pause")
			end)
			mp.add_forced_key_binding("SPACE", "override-pause", function()
				timer:kill()
				mp.remove_key_binding("override-pause")
			end)
		end
	end
end

function handle_sub_text_change(_, sub_text)
	if sub_text ~= nil and sub_text ~= "" then
		if pause_at_start then
			pause()
		end
	end
end

function replay_sub()
	-- prevent pause if pausing at start is enabled
	if pause_at_start then
		skip_next = true
	end

	local sub_start = mp.get_property_number("sub-start")
	if sub_start ~= nil then
		mp.set_property("time-pos", sub_start + mp.get_property_number("sub-delay") + pause_offset)
		mp.set_property("pause", "no")
	end
end

function display_state()
	local msg
	if active then
		msg = "Echo Subs (enabled)"
	else
		msg = "Echo Subs (disabled)"
	end
	mp.osd_message(msg)
end

function toggle()
	if active then
		if not pause_at_start then
			skip_next = false
			mp.unobserve_property(handle_sub_text_change)
			active = false
		end
	else
		mp.observe_property("sub-text", "string", handle_sub_text_change)
		active = true
	end
	display_state()
end

mp.add_key_binding("N", "sub-pause-toggle-start", function()
	pause_at_start = not pause_at_start
	toggle()
end)

mp.add_key_binding("Alt+r", "sub-pause-skip-next", function()
	skip_next = true
end)

mp.add_key_binding("Ctrl+r", "sub-pause-replay", function()
	replay_sub()
end)

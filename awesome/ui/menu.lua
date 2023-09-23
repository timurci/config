local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"
local menubar = require "menubar"
local hotkeys_popup = require("awful.hotkeys_popup")

local vars = require "variables.user-variables"
local terminal = vars.terminal
local editor = vars.editor
local editor_cmd = terminal .. " -e " .. editor

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
	theme = {width = 150, height = 30, font = "Hack Mono 12",
		border_color = "#5f6878", border_width = 1,
		submenu_icon = gears.surface.load_from_shape(
			50, 50,
			gears.shape.transform(gears.shape.powerline)
			: scale(0.5,0.5) : translate(35, 30),
			"#aa9999"
			)
		},
	items = { { " awesome", myawesomemenu, beautiful.awesome_icon },
                  { " terminal", terminal }
                }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("awful.autofocus")
local gears = require "gears"
local beautiful = require "beautiful"

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Error handling
require "conf.errors"

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "zenburn/theme.lua")

-- Table of layouts to cover with awful.layout.inc, order matters.
require "conf.layouts"

require "ui"

require "binds.mouse"
require "binds.keys"

require "conf.rules"
require "conf.signals"

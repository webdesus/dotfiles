local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")

local widget_path = os.getenv("HOME") .. "/.config/awesome/widgets/volume-widget"
local path_to_icons = widget_path .. "/icons/"

local request_command = 'amixer -D pulse sget Master'

volume_widget = wibox.widget {
    {
        id = "icon",
        image = path_to_icons .. "audio-volume-muted-symbolic.svg",
        resize = false,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.container.margin(_, _, _, 3),
    set_image = function(self, path)
        self.icon.image = path
    end
}

local update_graphic = function(widget, stdout, _, _, _)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    volume = tonumber(string.format("% 3d", volume))
    local volume_icon_name
    if mute == "off" then volume_icon_name="audio-volume-muted-symbolic_red"
    elseif (volume >= 0 and volume < 25) then volume_icon_name="audio-volume-muted-symbolic"
    elseif (volume < 50) then volume_icon_name="audio-volume-low-symbolic"
    elseif (volume < 75) then volume_icon_name="audio-volume-medium-symbolic"
    elseif (volume <= 100) then volume_icon_name="audio-volume-high-symbolic"
    end
    widget.image = path_to_icons .. volume_icon_name .. ".svg"
end


watch(request_command, 1, update_graphic, volume_widget)

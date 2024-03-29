-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Widgets library
require("vicious")
-- Dynamic Tagging
require("eminent")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")
beautiful.init("/home/krnekhelesh/.config/awesome/themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

 -- {{{ Tags
 -- Define a tag table which will hold all screen tags.
 tags = {
   names  = { "[1]Temp", "[2]Web", "[3]Email", "[4]Work", "[5]Support", "[6]Entertainment", "[7]Im" },
   layout = { layouts[2], layouts[2], layouts[10], layouts[2], layouts[2],
              layouts[12], layouts[2] }
 }
 for s = 1, screen.count() do
     -- Each screen has its own tag table.
     tags[s] = awful.tag(tags.names, s, tags.layout)
 end
 -- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu

accmenu = {
	{ "Calculator",	"gcalctool", 				beautiful.calculator_icon	},
	{ "Gedit",	"gedit", 				beautiful.gedit_icon		},
	{ "Nautilus",	"nautilus --browser --no-desktop", 	beautiful.nautilus_icon },	
	{ "Spotify",	"spotify", 				beautiful.spotify_icon	},
	{ "Rhythmbox",	"rhythmbox", 				beautiful.rhythmbox_icon	},
	{ "Totem",	"totem", 				beautiful.totem_icon	}	
}

internetmenu = {
	{ "Firefox",		"firefox",			beautiful.firefox_icon	},
	{ "Thunderbird",	"thunderbird",			beautiful.thunderbird_icon },
	{ "Empathy",		"empathy",			beautiful.empathy_icon	},
	{ "Skype",		"skype", 			beautiful.skype_icon	},
	{ "Dropbox",		"dropbox start -i",		beautiful.dropbox_icon	},
	{ "Ubuntu One",		"ubuntuone-control-panel-qt",	beautiful.ubuntuone_icon },
	{ "transmission", 	"transmission-gtk",		beautiful.transmission_icon }
}

officemenu = {
	{ "Base",		"libreoffice --base",		beautiful.base_icon	},
	{ "Calc",		"libreoffice --calc",		beautiful.cal_icon	},
	{ "Impress",		"libreoffice --impress",	beautiful.impress_icon	},
	{ "Writer",		"libreoffice --writer",		beautiful.writer_icon	}
}

programmenu = {
	{ "Matlab",	"matlab -desktop",		beautiful.matlab_icon	},
	{ "Texmaker", 	"texmaker",			beautiful.texmaker_icon	},
	{ "Geany",	"geany",			beautiful.geany_icon	}
}

settingsmenu = {
	{ "Dconf",		"dconf-editor",			beautiful.dconf_icon		},
	{ "Lxappearance",	"lxappearance",			beautiful.lxappearance_icon	},
	{ "System Monitor",	"gnome-system-monitor",		beautiful.monitor_icon		},
	{ "Update Manager", 	"update-manager",		beautiful.update_icon		},
	{ "System Settings",    "gnome-control-center",		beautiful.gcc_icon		},
}

myawesomemenu = {
   { "Manual", terminal .. " -e man awesome" },
   { "Edit config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Quit", awesome.quit }
}

mymainmenu = awful.menu({ items = {
	{ "Accessories", accmenu, beautiful.accessories_icon 	},	
	{ "Internet", internetmenu, beautiful.internet_icon	},
	{ "Office", officemenu, beautiful.office_icon		},
	{ "Programming", programmenu, beautiful.programming_icon	},
	{ "Settings", settingsmenu, beautiful.setting_icon	}, 
	{ "File browser", "nautilus --browser --no-desktop", beautiful.filebrowser_icon},
        { "Open terminal", terminal, beautiful.terminal_icon },
	{ "Awesome", myawesomemenu, beautiful.awesome_icon 	},
	{ "Monitor", '/home/krnekhelesh/.config/awesome/choose_screen.sh', beautiful.screen_icon},
	{ "Log out", '/home/krnekhelesh/.config/awesome/shutdown_dialog.sh', beautiful.logout_icon}},
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- battery widget
mybatteryimg = widget({ type = "imagebox" })
mybatteryimg.image = image("/home/krnekhelesh/.config/awesome/themes/default/status/battery.png")

batterywidget = widget({ type = "textbox" })
vicious.register(batterywidget, vicious.widgets.bat,    "  $1$2",  5, "BAT0"  )

-- gmail widget and tooltip
mygmail = widget({ type = "textbox" })
gmail_t = awful.tooltip({ objects = { mygmail },})

mygmailimg = widget({ type = "imagebox" })
mygmailimg.image = image("/home/krnekhelesh/.config/awesome/themes/default/status/gmail.png")

vicious.register(mygmail, vicious.widgets.gmail,
                function (widget, args)
                    gmail_t:set_text(args["{subject}"])
                    gmail_t:add_to_object(mygmailimg)
                    return args["{count}"]
                 end, 120) 
                 --the '120' here means check every 2 minutes.

-- Weather widget
myweatherimg = widget({ type = "imagebox" })
myweatherimg.image = image("/home/krnekhelesh/.config/awesome/themes/default/status/weather.png")

weatherwidget = widget({ type = "textbox" })
weather_t = awful.tooltip({ objects = { weatherwidget },})

vicious.register(weatherwidget, vicious.widgets.weather,
                function (widget, args)
                    weather_t:set_text("City: " .. args["{city}"] .."\nWind: " .. args["{windkmh}"] .. "km/h " .. args["{wind}"] .. "\nSky: " .. args["{sky}"] .. "\nHumidity: " .. args["{humid}"] .. "%")
                    return args["{tempc}"] .. "C"
                end, 1800, "EHRD")
                --'1800': check every 30 minutes.
                --'CYUL': the Montreal ICAO code.

volume_label = widget({ type = "textbox" })
volume_label.text = "♫"

-- Volume widget
myvolumeimg = widget({ type = "imagebox" })
myvolumeimg.image = image("/home/krnekhelesh/.config/awesome/themes/default/status/sound.png")

volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"
volumecfg.widget = widget({ type = "textbox", name = "volumecfg.widget", align = "right" })

volumecfg_t = awful.tooltip({ objects = { volumecfg.widget },})
volumecfg_t:set_text("System Volume")

-- command must start with a space!
volumecfg.mixercommand = function (command)
       local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
       local status = fd:read("*all")
       fd:close()

       local volume = string.match(status, "(%d?%d?%d)%%")
       volume = string.format("% 3d", volume)
       status = string.match(status, "%[(o[^%]]*)%]")
       if string.find(status, "on", 1, true) then
               volume = volume .. "%"
       else
               volume = volume .. "M"
       end
       volumecfg.widget.text = volume
end
volumecfg.update = function ()
       volumecfg.mixercommand(" sget " .. volumecfg.channel)
end
volumecfg.up = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%+")
       volumecfg.mixercommand(" sset " .. "Headphone" .. " 1%+")
end
volumecfg.down = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%-")
	volumecfg.mixercommand(" sset " .. "Headphone" .. " 1%-")
end
volumecfg.toggle = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
end
volumecfg.widget:buttons({
       button({ }, 4, function () volumecfg.up() end),
       button({ }, 5, function () volumecfg.down() end),
       button({ }, 1, function () volumecfg.toggle() end)
})
volumecfg.update()

-- Separator
separator = widget({ type = "textbox" })
separator.text  = " :: "

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
bottombar = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "bottom", screen = s, height = barheight })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        --mylayoutbox[s],
        mytextclock,
	separator,
	volumecfg.widget,
	myvolumeimg,
	separator,
	weatherwidget,
	myweatherimg,
	separator,
	mygmail,
	mygmailimg,
	separator,
	batterywidget,
	mybatteryimg,
	separator,
        s == 1 and mysystray or nil,
        --mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }

    -- Create the wibox
    bottombar[s] = awful.wibox({ position = "top", screen = s, height = barheight })
    -- Add widgets to the wibox - order matters
    bottombar[s].widgets = {
        mylayoutbox[s],
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }

end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift"   }, "s", function () awful.util.spawn("gnome-screensaver-command -l") end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ }, "XF86AudioRaiseVolume", function () volumecfg.up() end),
        awful.key({ }, "XF86AudioLowerVolume", function () volumecfg.down() end),
        awful.key({ }, "XF86AudioMute", function () volumecfg.toggle() end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
		     size_hints_honor = false } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "Spotify" },
      properties = { floating = false } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "Thunderbird", instance = "Mail", name = "Thunderbird Preferences" },
      properties = { floating = true } },
    { rule = { class = "Thunderbird", instance = "Mail", name = "About Mozilla Thunderbird" },
      properties = { floating = true } },
    { rule = { class = "Firefox", instance = "Download", name = "Downloads" },
      properties = { floating = true} },
    { rule = { class = "Firefox", instance = "Browser", name = "Firefox Preferences" },
      properties = { floating = true} },
    { rule = { class = "Firefox", instance = "Places", name = "Library" },
      properties = { floating = true} },
    { rule = { class = "Firefox", instance = "Browser", name = "About Mozilla Firefox" },
      properties = { floating = true} }, 
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

awful.util.spawn_with_shell("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
run_once("nm-applet")
--awful.util.spawn_with_shell("/usr/bin/xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1")
sleep=1
awful.util.spawn_with_shell("/usr/bin/nitrogen --restore")
awful.util.spawn_with_shell("/usr/bin/wmname LG3D")

---------------------------
-- Default awesome theme --
---------------------------
theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#000000"
theme.bg_minimize   = "#000000"

theme.fg_normal     = "#eeeeee"
theme.fg_focus      = "#1793d1"
theme.fg_urgent     = "#0099FF"
theme.fg_minimize   = "#888888"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#000000"
theme.border_marked = "#1793d1"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
--theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = "30"
theme.menu_width  = "200"
theme.menu_bg_normal = "#000000"
theme.menu_fg_focus = "#000000"
theme.menu_bg_focus = "#1793d1"
theme.menu_border_width = "5"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
--theme.wallpaper_cmd = { "awsetbg /usr/share/awesome/themes/default/background.png" }
--theme.wallpaper_cmd = { "awsetbg -f /home/krnekhelesh/Pictures/Desktops/1600x900/beach.png" }
theme.wallpaper_cmd = { "nitrogen --restore &" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/krnekhelesh/.config/awesome/themes/default/layouts/fairh.png"
theme.layout_fairv = "/home/krnekhelesh/.config/awesome/themes/default/layouts/fairv.png"
theme.layout_floating  = "/home/krnekhelesh/.config/awesome/themes/default/layouts/floating.png"
theme.layout_magnifier = "/home/krnekhelesh/.config/awesome/themes/default/layouts/magnifier.png"
theme.layout_max = "/home/krnekhelesh/.config/awesome/themes/default/layouts/max.png"
theme.layout_fullscreen = "/home/krnekhelesh/.config/awesome/themes/default/layouts/fullscreen.png"
theme.layout_tilebottom = "/home/krnekhelesh/.config/awesome/themes/default/layouts/tilebottom.png"
theme.layout_tileleft   = "/home/krnekhelesh/.config/awesome/themes/default/layouts/tileleft.png"
theme.layout_tile = "/home/krnekhelesh/.config/awesome/themes/default/layouts/tile.png"
theme.layout_tiletop = "/home/krnekhelesh/.config/awesome/themes/default/layouts/tiletop.png"
theme.layout_spiral  = "/home/krnekhelesh/.config/awesome/themes/default/layouts/spiral.png"
theme.layout_dwindle = "/home/krnekhelesh/.config/awesome/themes/default/layouts/dwindle.png"

theme.awesome_icon = "/home/krnekhelesh/.config/awesome/themes/default/awesome16.png"

-- Menu Category Icons
theme.accessories_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/accessories.png"
theme.internet_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/internet.png"
theme.office_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/office.png"
theme.programming_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/programming.png"
theme.setting_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/setting.png"
theme.filebrowser_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/filebrowser.png"
theme.terminal_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/terminal.png"
theme.logout_icon = "/home/krnekhelesh/.config/awesome/themes/default/categories/restart.png"

-- Awesome Category Icons
theme.manual = "/home/krnekhelesh/.config/awesome/themes/default/awesomecategory/manual.png"
theme.config = "/home/krnekhelesh/.config/awesome/themes/default/awesomecategory/config.png"
theme.restart = "/home/krnekhelesh/.config/awesome/themes/default/awesomecategory/restart.png"
theme.quit = "/home/krnekhelesh/.config/awesome/themes/default/awesomecategory/quit.png"

-- Accessories Category Icons
theme.calculator_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/calculator.png"
theme.gedit_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/editor.png"
theme.nautilus_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/filebrowser.png"
theme.spotify_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/spotify.png"
theme.rhythmbox_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/rhythmbox.png"
theme.totem_icon = "/home/krnekhelesh/.config/awesome/themes/default/accessories/totem.png"

-- Internet Category Icons
theme.firefox_icon = "/usr/share/app-install/icons/firefox.png"
theme.thunderbird_icon = "/usr/share/app-install/icons/thunderbird.png"
theme.empathy_icon = "/usr/share/app-install/icons/empathy.png"
theme.skype_icon = "/usr/share/icons/skype.png"
theme.dropbox_icon = "/usr/share/app-install/icons/dropbox.png"
theme.ubuntuone_icon = "/usr/share/app-install/icons/ubuntuone-installer.png"
theme.transmission_icon = "/usr/share/app-install/icons/transmission.png"

-- Office Category Icons
theme.writer_icon = "/home/krnekhelesh/.config/awesome/themes/default/office/writer.png"
theme.cal_icon = "/home/krnekhelesh/.config/awesome/themes/default/office/calc.png"
theme.base_icon = "/home/krnekhelesh/.config/awesome/themes/default/office/base.png"
theme.impress_icon = "/home/krnekhelesh/.config/awesome/themes/default/office/impress.png"

-- Programming Category Icons
theme.matlab_icon = "/home/krnekhelesh/.config/awesome/themes/default/programming/matlab.png"
theme.geany_icon = "/home/krnekhelesh/.config/awesome/themes/default/programming/geany.png"
theme.texmaker_icon = "/home/krnekhelesh/.config/awesome/themes/default/programming/texmaker.png"

-- Setting Category Icons
theme.lxappearance_icon = "/home/krnekhelesh/.config/awesome/themes/default/setting/appearance.png"
theme.dconf_icon = "/home/krnekhelesh/.config/awesome/themes/default/setting/dconf.png"
theme.monitor_icon = "/home/krnekhelesh/.config/awesome/themes/default/setting/monitor.png"
theme.update_icon = "/home/krnekhelesh/.config/awesome/themes/default/setting/update.png"
theme.gcc_icon = "/home/krnekhelesh/.config/awesome/themes/default/setting/gcc.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80

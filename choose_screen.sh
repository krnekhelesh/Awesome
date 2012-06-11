#!/bin/sh

ACTION=`zenity --width=500 --height=250 --list --radiolist --text="Which screens would you like to have?" --title="Multi-monitor Setup" --column "Choice" --column "Action" TRUE Laptop FALSE External FALSE Both`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Laptop)
    xrandr --auto
    xrandr --output HDMI1 --off
    xrandr --output LVDS1 --mode 1280x800
    ;;
  External)
    xrandr --auto
    xrandr --output LVDS1 --off
    xrandr --output HDMI1 --mode 1920x1080
    ;;
  Both)
    xrandr --auto
    xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1	
    ;;
  esac
fi

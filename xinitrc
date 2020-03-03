xkbcomp .keymap.xkb $DISPLAY
kill -1 `pgrep syndaemon`
syndaemon -i 0.4 -K -d -R
setxkbmap -option caps:escape -option ctrl:swap_lalt_lctl  -layout us -variant colemak 
xscreensaver
clipit
sudo modprobe -r psmouse
sudo modprobe psmouse


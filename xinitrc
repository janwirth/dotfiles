xkbcomp .keymap.xkb $DISPLAY
setxkbmap -option caps:escape -option ctrl:swap_lalt_lctl  -layout us -variant colemak 
xscreensaver
clipit
sudo modprobe -r psmouse
sudo modprobe psmouse

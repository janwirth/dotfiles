xkbcomp .keymap.xkb $DISPLAY
setxkbmap -option caps:escape -option ctrl:swap_lalt_lctl  -layout us -variant colemak 
sudo pkill syndaemon
syndaemon -i 0.5 -k -R

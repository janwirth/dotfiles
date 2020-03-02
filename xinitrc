xkbcomp .keymap.xkb $DISPLAY
syndaemon -i 1 -k -d
setxkbmap -option caps:escape -option ctrl:swap_lalt_lctl  -layout us -variant colemak 
xscreensaver
clipit

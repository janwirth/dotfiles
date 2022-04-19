
#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

CURRENTUSEREMAIL=$(git config user.email)

# My mail addresses
EMPLOYED="jan.wirth@mercedes-benz.io"
ENTERPRISE="contact@jan-wirth.de"
FREELANCE="jan_wirth@lesz.cool"

if [ "$CURRENTUSEREMAIL" == "$ENTERPRISE" ]; then
    git config --global user.email "$FREELANCE"
elif [ "$CURRENTUSEREMAIL" == "$FREELANCE" ]; then
    git config --global user.email "$EMPLOYED"
else
    git config --global user.email "$ENTERPRISE"
fi

echo "switched to $(git config user.email)"

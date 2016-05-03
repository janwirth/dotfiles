installNodeModules:
	sudo chown -R ${USER} /usr/local
	git config --global url."https://".insteadOf git://
	npm i roots -g
	npm i coffee-script -g
	git config --global --unset url."https://".insteadOf git://


installHyperdock:
	rm -rf ~/getmacapps_temp
	mkdir ~/getmacapps_temp
	cd ~/getmacapps_temp

	# Installing Hyperdock
	if [ ! -d "/Applications/HyperDock.app" ]; then \
		curl -L -O "https://bahoom.com/hyperdock/HyperDock.dmg"; \
		hdiutil mount -nobrowse Hyperdock.dmg; \
		cp -R "/Volumes/HyperDock/HyperDock.prefpane" ~/Library/PreferencePanes/HyperDock.prefpane; \
		hdiutil unmount "/Volumes/HyperDock"; \
		rm HyperDock.dmg; \
	fi

installOsxSoftware:
	# todo
	# Hyperdock
	# Atom

	rm -rf ~/getmacapps_temp
	mkdir ~/getmacapps_temp
	cd ~/getmacapps_temp


	# Installing Chrome
	if [ ! -d "/Applications/Google Chrome.app" ]; then \
		curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"; \
		hdiutil mount -nobrowse googlechrome.dmg; \
		cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications; \
		hdiutil unmount "/Volumes/Google Chrome"; \
		rm googlechrome.dmg; \
	fi


	# Installing Keka
	if [ ! -d "/Applications/Keka.app" ]; then \
		curl -L -o Keka.dmg "http://download.kekaosx.com/"; \
		hdiutil mount -nobrowse Keka.dmg; \
		cp -R "/Volumes/Keka/Keka.app" /Applications; \
		hdiutil unmount "/Volumes/Keka"; \
		rm Keka.dmg; \
	fi


	cd ..
	rm -rf ~/getmacapps_temp

	# Installing brew and apps
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install --HEAD https://raw.githubusercontent.com/mawww/kakoune/master/contrib/kakoune.rb
	brew install tmux
	brew install the_platinum_searcher
	brew install fasd
	brew install zsh
	brew install node

	# Installing additional resources
	if [ ! -d "~/Library/Fonts/InputMono-Light.ttf" ]; then \
		cp InputMono/InputMono-Light.ttf ~/Library/Fonts/InputMono-Light.ttf; \
	fi

	# Installing colemak
	if [ ! -d "~/Library/Keyboard Layouts/Colemak.keylayout" ]; then \
		cp Colemak.keylayout ~/Library/Keyboard\ Layouts/Colemak.keylayout; \
	fi


installSoftware:
	# Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	# install tpm. inside tmux press prefix + I to install plugins
	if [ -d "~/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi

	# Install OSX software
	make installOsxSoftware
	
	# Install Node modules
	make installNodeModules

	# Install oh-my-zsh
	if [ -d "~/.oh-my-zsh" ]; then \
  	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > installZsh.sh; \
  	sh installZsh.sh; \
  	rm installZsh.sh; \
	fi

	# configure git
	git config --global user.name "Jan Wirth"
	git config --global user.email "jottenwe@gmail.com"

	# bootstrap configuration
	sudo ./install


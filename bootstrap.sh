BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

# alias vim configs
rm ~/.*vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.nvimrc

#link viminfo
sudo rm ~/.viminfo
sudo rm ~/.nviminfo
ln -s ~/.viminfo ~/.nviminfo

# link directories
rm -rf ~/.nvim
ln -s ~/.vim ~/.nvim

# install neobundle
rm -rf $INSTALL_DIR
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR

# add zshrc
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc 

# link .tmux.conf
rm ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf 

# Download z.sh
rm -r ~/shellplugins
mkdir ~/shellplugins
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/shellplugins/z.sh

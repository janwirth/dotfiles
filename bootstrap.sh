BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

// alias vim configs
rm ~/.*vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/.vimrc ~/.nvimrc

//link viminfo
rm ~/.nviminfo
ln -s ~/.viminfo ~/.nviminfo

// link directories
rm -r ~/.nvim
ln -s ~/.vim ~/.nvim

// install neobundle
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR

// source bashprofile
echo 'source ~/dofiles/.zshrc/' >> ~/.zshrc

// link .tmux.conf
ln -s ~/.tmux.conf ~/dotfiles/.tmux.conf 

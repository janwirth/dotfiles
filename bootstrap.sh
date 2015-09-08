BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

touch ~/.vimrc
ln -s ~/.vimrc ~/.nvimrc
rm ~/.viminfo
ln -s ~/.viminfo ~/.nviminfo
ln -s ~/.vim ~/.nvim
echo 'source ~/dotfiles/.vimrc' >> ~/.vimrc
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR


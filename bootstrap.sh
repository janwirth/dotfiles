BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

touch ~/.vimrc
ln -s ~/.vimrc ~/.nvimrc
rm 
ln -s ~/.vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim
echo 'source dotfiles/.nvimrc' >> ~/.vimrc
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR


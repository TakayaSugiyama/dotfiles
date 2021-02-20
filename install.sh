# vim plugをインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# oh-my-zshをインストール
if [ ! -d "$HOME/.oh-my-zsh" ];then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# シンボリックリンクを貼る
ln -s  ~/dotfiles/.vimrc  ~/.vimrc
ln -s  ~/dotfiles/.zshrc  ~/.zshrc


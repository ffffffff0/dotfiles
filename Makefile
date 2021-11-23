init:
	ln -fs `pwd`/vim ~/.vim
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fd `pwd`/tmux.conf ~/.tmux.conf
sync:
	git pull
	git push

# Full system upgrade script.

fup() {
	echo -n "Continue with a full update? (Y/n) ";
	read REPLY;
	if [[ $REPLY =~ ^[Yy] ]]
	then;
		# APT updates
		# Thanks to https://askubuntu.com/a/1118739
		sudo apt -y update;
		sudo apt -y upgrade;
		sudo apt -y full-upgrade;
		sudo apt -y autoremove;
		sudo apt -y autoclean;
		sudo apt -y clean;
		# Vim plugins
		vim +PluginInstall +qall;
		vim +PlugInstall +qall;
		# Latest Node
		nvm install node;
	fi;
}

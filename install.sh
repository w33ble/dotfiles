#!/bin/bash

#configure vim bundles
VIM_BUNDLES=(
	'https://github.com/vim-scripts/phpfolding.vim.git'
	'https://github.com/msanders/snipmate.vim.git'
	'https://github.com/scrooloose/syntastic.git'
	'https://github.com/kchmck/vim-coffee-script.git'
	'https://github.com/altercation/vim-colors-solarized.git'
	'https://github.com/digitaltoad/vim-jade.git'
	'https://github.com/wavded/vim-stylus.git'
	'https://github.com/tpope/vim-surround.git'
	)

#check for git
GIT=$(which git)
if [ ! $? == 0 ]; then
	echo "You must install git and add it to you PATH"
	exit 1
fi
ROOT=`pwd`

###
# bash_magic
###
#clone repo
$GIT clone https://github.com/Knewton/bash_magic.git bash/bash_magic

#install select bash magic scripts
cd "bash/bash_magic"
mkdir "${HOME}/.bash_aliases.d" "${HOME}/.bash_completion.d" "${HOME}/.bash_functions.d"
cd "bash_aliases.d"
ln -s color.sh refresh.sh "${HOME}/.bash_aliases.d"
cd "../bash_completion.d"
ln -s etc.sh "${HOME}/.bash_completion.d"
cd "../bash_functions.d"
ln -s completion.sh extract.sh lsbytes.sh lsnew.sh vim.sh "${HOME}/.bash_functions.d"
cd "${ROOT}"
#install custom bash scripts
ln -s "bash/bash_aliases.d/*.sh" "${HOME}/.bash_aliases.d"
ln -s "bash/bash_completion.d/*.sh" "${HOME}/.bash_completion.d"
ln -s "bash/bash_functions.d/*.sh" "${HOME}/.bash_functions.d"
#set up the bashrc file
cat "bash/bash_magic/bashrc" >> ${HOME}/.bashrc

###
# vim
###
#clone bundle repos
cd "vim/bundle"
for b in ${VIM_BUNDLES[@]}; do
	$GIT clone "${b}"
done
cd "${ROOT}"

#install


echo "not finished, check back later"

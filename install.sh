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
mkdir "${HOME}/bin" "${HOME}/.bash_aliases.d" "${HOME}/.bash_completion.d" "${HOME}/.bash_functions.d"
cd "bash_aliases.d"
cp color.sh refresh.sh "${HOME}/.bash_aliases.d"
cd "../bash_completion.d"
cp etc.sh "${HOME}/.bash_completion.d"
cd "../bash_functions.d"
cp completion.sh extract.sh lsbytes.sh lsnew.sh vim.sh "${HOME}/.bash_functions.d"
cd "${ROOT}"
#install custom bash scripts
cp "bash/bash_aliases.d/"*.sh "${HOME}/.bash_aliases.d"
#cp "bash/bash_completion.d/"*.sh "${HOME}/.bash_completion.d"
#cp "bash/bash_functions.d/"*.sh "${HOME}/.bash_functions.d"
#set up the bash_profile file
cp bash/bash_profile "${HOME}"/.bash_profile
cat "bash/bash_magic/bashrc" >> "${HOME}"/.bash_profile
if [ ! -f "${HOME}"/.bashrc ]; then
	ln -s "${HOME}"/.bash_profile "${HOME}"/.bashrc
if

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
cp -R vim "${HOME}"/.vim
ln -s "${HOME}"/.vim/vimrc "${HOME}"/.vimrc

echo Install complete, run the following: source \"${HOME}\"/.bashrc

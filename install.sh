#!/bin/bash

# configure vim bundles
VIM_BUNDLES=(
	'git://github.com/msanders/snipmate.vim.git'
	'git://github.com/scrooloose/syntastic.git'
	'git://github.com/altercation/vim-colors-solarized.git'
	'git://github.com/tpope/vim-surround.git'
	)

# check for git
GIT=$(which git)
if [ ! $? == 0 ]; then
	echo "You must install git and add it to you PATH"
	exit 1
fi
ROOT=`pwd`

# pre-run cleanup
rm -rf bash/bash_magic vim/bundle/* "${HOME}"/.vimrc

###
# bash
###
# clone bash_magic repo
if [ ! -d bash/bash_magic ]; then
	$GIT clone git://github.com/w33ble/bash_magic.git bash/bash_magic
fi

# install select bash magic scripts
mkdir -p "${HOME}/bin" "${HOME}/.bash_aliases.d" "${HOME}/.bash_completion.d" "${HOME}/.bash_functions.d"

cd "${ROOT}/bash/bash_magic/bash_aliases.d";
for i in color refresh git less brew dev sublime top; do cp "${i}.sh" "${HOME}/.bash_aliases.d"; done
cd "${ROOT}/bash/bash_magic/bash_completion.d";
for i in etc; do cp "${i}.sh" "${HOME}/.bash_completion.d"; done
cd "${ROOT}/bash/bash_magic/bash_functions.d";
for i in completion extract lsbytes lsnew vim; do cp "${i}.sh" "${HOME}/.bash_functions.d"; done

# install custom bash scripts
# cp "${ROOT}/bash/bash_aliases.d/"*.sh "${HOME}/.bash_aliases.d"
# cp "${ROOT}/bash/bash_completion.d/"*.sh "${HOME}/.bash_completion.d"
# cp "${ROOT}/bash/bash_functions.d/"*.sh "${HOME}/.bash_functions.d"

# set up the bash_profile file
cp "${ROOT}/bash/bash_profile" "${HOME}"/.bash_profile

# add bash_magic logic to bash profile
cat "${ROOT}/bash/bash_magic/bashrc" >> "${HOME}"/.bash_profile
if [ ! -f "${HOME}"/.bashrc ]; then
	ln -s "${HOME}"/.bash_profile "${HOME}"/.bashrc
fi

###
# dotfiles
###

cd "${ROOT}/dotfiles"
for i in *; do
	cp "${i}" "${HOME}/.${i}"
done
cd "${ROOT}"

###
# git
###

# collect git user info, create config file
echo -n "Enter your git name: "
read NAME
echo -n "Enter you git email: "
read EMAIL
echo -e "[user]\n\tname = ${NAME}\n\temail = ${EMAIL}" > "${HOME}"/.gitconfig

# add custom config and helpers
cat "${ROOT}"/git/gitconfig >> "${HOME}"/.gitconfig
cp "${ROOT}"/git/githelpers "${HOME}"/.githelpers

###
# vim
###

# clone bundle repos
echo "${ROOT}/vim/bundle"
cd "${ROOT}/vim/bundle"
pwd

for b in ${VIM_BUNDLES[@]}; do
	$GIT clone "${b}"
done
cd "${ROOT}"

# install
cp -R vim "${HOME}"/.vim
ln -s "${HOME}"/.vim/vimrc "${HOME}"/.vimrc

echo Install complete, run the following: source \"${HOME}\"/.bashrc

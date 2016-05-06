cd "${BASH_SOURCE%/*}"
SOURCE_DIR=$(pwd)
INSTALL_DIR=${1:-$HOME}

echo "Installing dotfiles from $SOURCE_DIR to $INSTALL_DIR"

echo "* Backing up existing dotfiles"
for dotfile in bashrc bash_profile vimrc; do
	if [[ -e "${INSTALL_DIR}/.${dotfile}" || -L "${INSTALL_DIR}/.${dotfile}" ]]; then
		echo "  - mv ${INSTALL_DIR}/.${dotfile} ${INSTALL_DIR}/.${dotfile}.old"
		mv ${INSTALL_DIR}/.${dotfile} ${INSTALL_DIR}/.${dotfile}.old
		if [[ $? != 0 ]]; then
			echo "Error, aborting"
			exit 1
		fi
	fi
done
echo "  (Remove later backups using 'rm ${INSTALL_DIR}/{.bashrc.old,.bash_profile.old,.vimrc.old}')"

echo "* Installing new dotfiles"
for dotfile in bashrc bash_profile vimrc; do
	echo "  - ${INSTALL_DIR}/.${dotfile} -> ${SOURCE_DIR}/${dotfile}"
	ln -s ${SOURCE_DIR}/${dotfile} ${INSTALL_DIR}/.${dotfile}
	if [[ $? != 0 ]]; then
		echo "Error, aborting"
		exit 1
	fi
done

echo Done


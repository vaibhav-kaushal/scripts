#!/usr/bin/env zsh

SCRIPTS_ALREADY_INSTALLED="no"

# Check that the scipt has not been run before
if [[ -v QWERTY_UIOP && $QWERTY_UIOP == "ASDFGHJKL" ]]; then
	# Scripts have been installed already

	SCRIPTS_ALREADY_INSTALLED="yes"
	
	echo "Scripts already installed. Run 'resh' to re-read from the scripts."
	read "choice?Do you want to re-install/update the scripts? [y/n]"

	if [[ $choice = 'Y' || $choice = 'y' ]]; then
		# Do nothing. The rest of the script will take care of installation.
	else
		# User wants to abort
		exit 1
	fi
fi

# Make the directory
echo "Making directory for storing scripts ($HOME/bin/zsh_scripts)"
mkdir -p $HOME/bin/zsh_scripts

# copy files in the zsh/scripts to the newly created directory
echo "Copying scripts to scripts home..."
cp -rv zsh/scripts/* $HOME/bin/zsh_scripts

# Copy the bootup script which adds all the functions
echo "Copying the bootup scripts..."
cp -v zsh/bootup_zsh.sh $HOME/bin/

if [[ $SCRIPTS_ALREADY_INSTALLED == "no" ]]; then
	# Add $HOME/zsh_scripts/bootup_zsh.sh to startup file
	echo "Adding the bootup scripts to .zshrc"
	echo "source $HOME/bin/bootup_zsh.sh" >> $HOME/.zshrc 
fi

# Since this will work only on the next startup, for now, let's initialize the functions right now
echo "Enabling functions right now. Please close this shell and start a new one"
source $HOME/bin/bootup_zsh.sh

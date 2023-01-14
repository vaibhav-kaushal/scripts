###########################################################
#                    EXPORTS FILE
# You can define your exports here. Please note that if you
# are using the sessions feature, any path set here will 
# be set in your session irrespective of what your session
# init file sets (thus overriding the value in your init
# file). Please check if the variable is already defined
# before setting it unless you want to set it in all your
# sessions. 
#
# To check and set an environment variable named "AUTHOR",
# Follow this method:
#
# if [[ ! -v AUTHOR ]]; then
# 	# If not defined, set it
# 	export AUTHOR="vaibhav-kaushal"
# fi
###########################################################

# Set the default cli editor
if command -v vim > /dev/null; then
	export EDITOR="vim"
elif command -v nano > /dev/null; then
	export EDITOR="nano"
elif command -v pico > /dev/null; then
	export EDITOR="pico"
elif command -v emacs > /dev/null; then
	export EDITOR="emacs"
elif command -v more > /dev/null; then
	# 'more' is not an editor but can be used to view files
	# !!! FAILSAFE !!!
	export EDITOR="more"
elif command -v less > /dev/null; then
	# 'less' is not an editor but can be used to view files
	# !!! FAILSAFE !!!
	export EDITOR="less"
elif command -v cat > /dev/null; then
	# 'cat' is not an editor but can be used to view files
	# !!! FAILSAFE !!!
	export EDITOR="cat"
else
	# It would be extreme to have no viewer (not even cat) installed
	# But if nothing is available, we set it to blank
	export EDITOR=""
fi

# Allow "edit filename" to be used for command line editing
alias edit=$EDITOR

# For GoLang installation
if [[ ! -v GOPATH ]]; then
	# If not defined, set it...
	export GOPATH=$HOME/go
	# ...and add it to path
	export PATH=$PATH:$GOPATH/bin
fi

# For Sessions functionality (custom function)
export ZSH_SESSION_PATH=$HOME/bin/zsh_sessions

## MODIFICATIONS TO PATH
# user bins
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
# golang
export PATH=$PATH:/usr/local/go/bin


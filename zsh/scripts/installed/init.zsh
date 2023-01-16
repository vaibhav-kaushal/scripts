#!/usr/bin/env zsh

function __load_functions() {
	local type_func_location=$(type ${funcstack[1]})
	local currDir=$(pwd)
	local lineCount=0

	echo $type_func_location | grep "shell function from" > /dev/null
	if [[ $? -eq 0 ]]; then
		# extract the actual path! :-) 
		local func_location=$(string reverse $(string reverse $type_func_location | cut -d' ' -f1 ))

		for filename in ${func_location:a:h}/functions/*(N); do
			if [ -d "$filename" ]; then
					for f in $filename/*.zsh(N); do
						source $f
					done
				cd $currDir
			fi
		done
	fi
}

function __load_scripts() {
	local type_func_location=$(type ${funcstack[1]})
	local currDir=$(pwd)
	local lineCount=0

	echo $type_func_location | grep "shell function from" > /dev/null
	if [[ $? -eq 0 ]]; then
		# extract the actual path! :-) 
		local func_location=$(string reverse $(string reverse $type_func_location | cut -d' ' -f1 ))

		for filepath in ${func_location:a:h}/scripts/*(N); do
            filename=${filepath:a:t}
            firstChar=${filename:0:-$((${#filename}-1))}
			if [[ -f "$filepath" && "$firstChar" != "_" ]]; then	
				source $filepath
			fi
		done
	fi
    cd $currDir
}

# Things to run before anything and everything
if [[ -f ${0:a:h}/scripts/_bootup.zsh ]]; then
    source ${0:a:h}/scripts/_bootup.zsh
fi

# Create the aliases
if [[ -f ${0:a:h}/scripts/_aliases.zsh ]]; then
    source ${0:a:h}/scripts/_aliases.zsh
fi

# Export the needed variables
if [[ -f ${0:a:h}/scripts/_exports.zsh ]]; then
    source ${0:a:h}/scripts/_exports.zsh
fi

# Initialize functions
__load_functions

# Setup ZSH hooks
if [[ -f ${0:a:h}/scripts/_hooks.zsh ]]; then
    source ${0:a:h}/scripts/_hooks.zsh
fi

# Clean artifacts of the ZexT bootup process
if [[ -f ${0:a:h}/scripts/_cleanup.zsh ]]; then
    source ${0:a:h}/scripts/_cleanup.zsh
fi

# certain things that require to be run post initialization
if [[ -f ${0:a:h}/scripts/_post_init.zsh ]]; then
    source ${0:a:h}/scripts/_post_init.zsh
fi

__load_scripts

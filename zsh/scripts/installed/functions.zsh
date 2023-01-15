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

__load_functions

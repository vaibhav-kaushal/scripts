#!/usr/bin/env zsh

function __load_functions() {
	local type_func_location=$(type ${funcstack[1]})
	local currDir=$(pwd)
	local lineCount=0

	echo $type_func_location | grep "shell function from" > /dev/null
	if [[ $? -eq 0 ]]; then
		# extract the actual path! :-) 
		local func_location=$(string reverse $(string reverse $type_func_location | cut -d' ' -f1 ))

		for filename in ${func_location:a:h}/functions/*; do
			if [ -d "$filename" ]; then
				cd $filename
				echo "$(ls -al)" > $ZEXT_INSTALL_DIR/tmp/ls-alh.txt
				lineCount=$(linesInFile $ZEXT_INSTALL_DIR/tmp/ls-alh.txt)

				if [[ $? -ne 0 ]]; then
					echo "Something wrong with $ZEXT_INSTALL_DIR/tmp/ls-alh.txt $filename."
					continue
				fi

				lineCount=$((lineCount-3))

				if [[ $lineCount == "0" ]]; then
					# echo "NO FILES IN $filename"
					continue
				else
					for f in $filename/*.zsh; do
						source $f
					done
				fi
				cd $currDir
			fi
		done
	fi
}

__load_functions

#!/usr/bin/env zsh

function chpwd () {
	# echo "PWD ${PWD}"
	true
}

# function preexec() {
# 	# true
# 	# local ptsname

# 	ptsname="ZSHTIMER_$(echo $(tty) | md5sum | cut -d' ' -f 1)"
# 	echo $ptsname
# 	# ${(P)ptsname}="aa"
# 	eval $ptsname="aa"
# 	echo "ptsname: ${(P)ptsname}"

# }

# function precmd() {
# 	# true
# 	ptsname="ZSHTIMER_$(echo $(tty) | md5sum | cut -d' ' -f 1)"
# 	echo $ptsname
# 	echo "ptsname: ${(P)ptsname}"
# }
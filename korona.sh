#!/bin/bash

PROG=$(basename $0)
DESC="lock/unlock widgets in plasma 5.18+"

# Setup lockdown.
LOCKDOWN=

# Setup user experience
ux=

# Setup colors.
colg="\e[32m"
colr="\e[31m"
ncol="\e[0m"

# Setup lock/unlock command function.
function lock_corona(){
	qdbus org.kde.plasmashell /PlasmaShell evaluateScript "lockCorona(${LOCKDOWN})"
}

# Perform command-line options (or error).
if [ $# -eq 1 ] && [ "${1}" == "on" ]; then
	LOCKDOWN='true'
	ux="${colg}ENABLED${ncol}"
elif [ $# -eq 1 ] && [ "${1}" == "off" ]; then
	LOCKDOWN='false'
	ux="${colr}DISABLED${ncol}"
else
	echo "${PROG} - ${DESC}"
	echo
	echo "USAGE:"
	echo "   $PROG [on] [off]"
	echo
	exit 1
fi

# Perform function (or error).
if lock_corona; then
	echo -e "Plasma lockdown: ${ux}"
else
	echo "Something went wrong..."
fi

exit $?

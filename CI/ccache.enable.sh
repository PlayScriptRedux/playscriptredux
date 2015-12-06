[[ "${BASH_SOURCE[0]}" != "${0}" ]] && SOURCED=1 || SOURCED=0
if [ $SOURCED -eq 1 ]
then
	# use ccache
	export PATH=/usr/local/opt/ccache/libexec:${PATH}	
else
	echo This script needs to be called via "source"
fi


[[ "${BASH_SOURCE[0]}" != "${0}" ]] && SOURCED=1 || SOURCED=0
if [ $SOURCED -eq 1 ]
then
	export PATH=${HOME}/mono/llvm32/bin:$PATH
else
	echo This script needs to be called via "source"
fi


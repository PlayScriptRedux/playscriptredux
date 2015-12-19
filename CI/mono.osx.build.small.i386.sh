#!/bin/bash
pushd mono
git submodule update --init --recursive

if [ -z ${MonoInstallPath+x} ]
then 
  MonoInstallPath=$HOME/mono/mono32
else 
  echo ${MonoInstallPath}
fi

echo "Building mono framework to `${MonoInstallPath}` folder"

# Fix for 2.2.4 vs 2.4.6 glibtool
rm libgc/aclocal.m4

# If rebuilding and you fail, you can not do a make clean as it trys to rebuild 
# the basic.exe bootstrap compiler which causes it just to fail again..., 
# so manually delete the jay generated .cs files to prevent other build failures
find . -name "*.jay" |  while read f; do dn="$(dirname "$f")"; fn="$(basename "$f" ".jay")"; echo $dn/$fn.cs | xargs -I genfile rm genfile ; done

./autogen.sh \
	 --with-tls=posix \
	 --enable-nls=no \
  	 --with-mcs-docs=no \
	 --with-profile2=no \
	 --with-profile4=no \
	 --with-profile4_5=yes \
	 --with-moonlight=no \
  	 --host=i386-apple-darwin15.0.0 \
	 --with-glib=embedded \
	 --prefix=${MonoInstallPath} 
#	 --enable-loadedllvm=yes 
make clean

if [ ! -f ${PWD}/mcs/class/lib/monolite/basic.exe ]; then
    make get-monolite-latest
fi

# Fix for 2.2.4 vs 2.4.6 glibtool
rm libgc/aclocal.m4

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/basic.exe

popd 
#exit $?

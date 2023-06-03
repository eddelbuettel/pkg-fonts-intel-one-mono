
## Minimal and hackish packaging for Intel-One-Mono
##
## This Makefile downloads from GitHub, extracts the TTF and OTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016 - 2023  Dirk Eddelbuettel
## and released under GPL (>=2 )

ttfsrc=https://github.com/intel/intel-one-mono/releases/download/V1.2.0/ttf.zip
otfsrc=https://github.com/intel/intel-one-mono/releases/download/V1.2.0/otf.zip
ttfout=$(shell basename ${ttfsrc})
otfout=$(shell basename ${otfsrc})

all:
	test -f ${ttfout} || wget ${ttfsrc}
	unzip ${ttfout}
	test -f ${otfout} || wget ${otfsrc}
	unzip ${otfout}
	rm -rf __MACOSX/ ?tf/.DS_Store

clean:
	rm -f ${ttfout} ${otfout}
	rm -rf ttf/ otf/

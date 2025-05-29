
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

repo_base=https://github.com/intel/intel-one-mono
ttfarchive=ttf.zip
otfarchive=otf.zip
ttfurl=${repo_base}/releases/latest/download/${ttfarchive}
otfurl=${repo_base}/releases/latest/download/${otfarchive}

all:
	test -f ${ttfarchive} || curl -L --remote-name ${ttfurl}
	unzip ${ttfarchive}
	test -f ${otfarchive} || curl -L --remote-name ${otfurl}
	unzip ${otfarchive}
	rm -rf __MACOSX/ ?tf/.DS_Store

clean:
	rm -f ${ttfarchive} ${otfarchive}
	rm -rf ttf/ otf/

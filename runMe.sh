#!/bin/bash
repo_base=https://github.com/intel/intel-one-mono
release_url=$(curl -Ls -o /dev/null -w %{url_effective} ${repo_base}/releases/latest)
release_tag=$(basename ${release_url})
cat debian/changelog.template | sed -E "s|VERSION|${release_tag#V}|" > debian/changelog

dpkg-buildpackage -rfakeroot -us -uc -tc

rm -f debian/changelog

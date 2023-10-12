#!/usr/bin/env zsh
#
# Create or touch a slide file for each slide mentioned in index.html

if test -e ./index.html;
then
	for slide in $(grep 'slides-md' index.html | cut -d '"' -f 2);
	do
		touch "$slide";
	done
else
	echo "No such file: index.html inside current directory: $(pwd)";
fi

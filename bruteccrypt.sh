#!/bin/bash

#EL1S1uM Was Here

if [ $# != '2' ]; then
	echo USAGE: $0 file.cpt wordlist.txt
else

file=$(echo $1 | sed 's/.cpt//')

for i in $(cat $2); do
	ccrypt -d -K $i $1 &> /dev/null
	if [ -e $file ]; then
		echo SUCCESS - $i
		break
	else
		echo FAILED - $i
	fi
done
fi

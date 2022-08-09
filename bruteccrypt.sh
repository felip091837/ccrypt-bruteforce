#!/bin/bash

if [ $# != '2' ]; then
    echo USAGE: $0 file.cpt wordlist.txt
else
    file=$(echo $1 | sed 's/.cpt//')

    while IFS="" read -r i || [ -n "$i" ]
    do
        ccrypt -c -K "$i" "$1" 2> /dev/null
        if [ $? -eq 0 ]; then
            echo SUCCESS - $i
            break
        else
            echo FAILED - $i
        fi
    done < "$2"
fi

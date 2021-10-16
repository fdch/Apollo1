#!/bin/bash

# build.sh bumps plugin version up and compiles to plugin using camomile 

NAME=Apollo1
PDFILE=$NAME/$NAME.pd
VERSION=$(grep Version $PDFILE)
NUMBER=$(echo $VERSION | cut -f 6 -d ' ')
NUMBER=$(echo "${NUMBER/;/}")
NEWVERSION=$(printf "%s %d;\n" "$(echo $VERSION | cut -f 1-5 -d ' ')" $((NUMBER+1)))

sed -ie "s/$VERSION/$NEWVERSION/" $PDFILE
rm ${PDFILE}e
echo Making Version $NUMBER

sudo camomile $NAME

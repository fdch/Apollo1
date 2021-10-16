#!/bin/bash

BASE=$(pwd)
RELEASES=$BASE/../Releases
BUILDDIR=$BASE/builds

for dir in $BUILDDIR/*
do
	echo $dir
	cd $dir
	ZIPNAME=$RELEASES/$(basename $BASE)-$(basename $dir).zip
	echo $ZIPNAME
	zip -r $ZIPNAME *
	file $ZIPNAME
	#mv $ZIPNAME $BASE/../Releases
	cd $BASE
done

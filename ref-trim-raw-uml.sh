#!/usr/bin/bash
#
#

# CHANGE basedir to where your files are
basedir=`pwd`/test

glob=`find ${basedir} -name *.uml`

for f in $glob
  do
    xmllint --xpath '//*[local-name()="Reference"]/@reference' ${f}
  done

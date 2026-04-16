#!/usr/bin/bash
#
#

# CHANGE basedir to where your files are
basedir=`pwd`/test

glob=`find ${basedir} -name *.uml`

for f in $glob
  do
    xmllint --xpath '//*[local-name()="Reference"]/@reference' ${f} | sed 's/.*reference=//g' | sed 's/\;/\n/g' | sed 's/\"//g' | sed 's/^ *//g' > ${f}.raw
    cat ${f}.raw | sort | uniq >${f}.out
    rm ${f}.raw
  done

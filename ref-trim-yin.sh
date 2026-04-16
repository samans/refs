#!/usr/bin/bash
#
#

# CHANGE basedir to where your files are
basedir=`pwd`/test

# A temporary location for the yin files
yindir=`pwd`/results-`date +%F-%H-%M`
mkdir -p ${yindir}

glob=`find ${basedir} -name *.yang`

for f in $glob
  do
    filename=`basename "${f}"`
    modname=`echo $filename | cut -d'.' -f 1`

    pyang -p ~/gits/yang/standard/ieee/published/802 -p ~/gits/yang/standard/ieee/published/802.1 -p ~/gits/yang/standard/ieee/published/1588 -p ~/gits/yang/standard/itu/published/ITU-T_SG15 -p ~/gits/yang/standard/ietf/RFC -f yin ${f} -o ${yindir}/${modname}.yin

    xmllint --xpath "//*[local-name()='reference']" ${yindir}/${modname}.yin | sed 's/<[^>]*>//g' | sed '/^[ ]*$/d' | sed 's/^[ ]*//g'
  done

# Remove the temporary yin files
rm -rf ${yindir}

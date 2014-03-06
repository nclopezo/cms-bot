#!/bin/bash

#$1 is the file with the workflows


while read WFS; do
  mkdir -p outs
  NUMBER=$(echo $WFS | sed -e 's/_.*//g' )
  echo $NUMBER
  mkdir -p outs/$WFS

  #create script
  cp base-cmssw_wf.sh cmssw_wf$NUMBER.sh
  sed -i "s/NUM_WF/$NUMBER/g" cmssw_wf$NUMBER.sh
  sed -i "s/WORKDIR/$PWD/g" cmssw_wf$NUMBER.sh

  #submit job
  bsub -q cmsrelval -R type="SLC6_64" -o outs/$WFS cmssw_wf$NUMBER.sh
done < $1

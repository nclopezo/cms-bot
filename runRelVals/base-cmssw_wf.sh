#!/bin/bash

set -x

LSB_EXIT_IF_CWD_NOTEXIST=Y

export SCRAM_ARCH=slc6_amd64_gcc481
scram p CMSSW_7_1_X_2014-03-04-0200
cd CMSSW_7_1_X_2014-03-04-0200
eval $(scram r -sh)
mkdir matrixTests
cd matrixTests

#runTheMatrix
runTheMatrix.py -l NUM_WF

#copy the results
OUT_DIR=`find -type d -regex "./[0-9].*"`

rsync -r $OUT_DIR/*.log WORKDIR/outs/$OUT_DIR

rsync $OUT_DIR/cmdLog /afs/cern.ch/user/c/cmsbuild/batch-workflows/outs/$OUT_DIR

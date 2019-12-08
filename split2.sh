#!/bin/bash

tar -xzf R361.tar.gz


export PATH=$(pwd)/R/bin:$PATH
export RHOME=$(pwd)/R
export R_LIBS=$PWD/packages

Rscript split2.R $1

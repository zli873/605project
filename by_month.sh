#!/bin/bash

tar -xzf R361.tar.gz
tar -xvf bmedata.tar
tar -xvf sdsdata.tar

export PATH=$(pwd)/R/bin:$PATH
export RHOME=$(pwd)/R
export R_LIBS=$PWD/packages

Rscript by_month.R $1

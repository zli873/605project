#!/bin/bash

rm -rf bmedata
rm -rf sdsdata
rm -rf log
rm -rf error
rm -rf output

mkdir log
mkdir output
mkdir error
mkdir bmedata
mkdir sdsdata

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1NPjQWloXlAZLAZ0HOmm9Ap3JdJ5BM54J' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1NPjQWloXlAZLAZ0HOmm9Ap3JdJ5BM54J" -O data.zip && rm -rf /tmp/cookies.txt

unzip data.zip

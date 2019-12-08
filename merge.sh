#!/bin/bash
for loc in $(cat location.txt); do
    cat sdsdata/*-loc-$loc.csv > $loc.csv
done

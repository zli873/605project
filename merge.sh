#!/bin/bash
for loc in $(cat location.txt); do
    cat sdsdata/*-loc-$loc.csv > locsds/$loc.csv
done

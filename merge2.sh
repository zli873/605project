#!/bin/bash
for loc in $(cat location.txt); do
    cat bmedata/*-loc-$loc.csv > locbme/$loc.csv
done


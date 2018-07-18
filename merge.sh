#!/usr/bin/env bash

all=(${@})
args=(${all[@]:1})
pre=( "${args[@]/#/..\/Map\/}" )
post=( "${pre[@]/%/-latest.osm.pbf}" )

osmium merge --overwrite "${post[@]}" -o "../Map/$1.osm.pbf"

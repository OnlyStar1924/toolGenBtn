#!/bin/sh

# cd /Users/defold/Projects/ToolGenBtn/code
rm -f ../temp/psd/*
rm -f ../temp/png/*

python JSON2CSV.py

open ../input/button.psd
open newAction.app
wc -l ../temp/inputText.csv | awk '{ temp = $1 - 10; while (temp > 0) { system("sleep 1"); temp-- } }' 

python combinePNG.py



echo "done"
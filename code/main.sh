#!/bin/sh

cd /Users/defold/Projects/ToolGenBtn/code
open speekStart.app

rm -f ../temp/psd/*
rm -f ../temp/png/*

python3 JSON2CSV.py

open ../input/*.psd
open newAction.app
wc -l ../temp/inputText.csv | awk '{ temp = $1 ; while (temp > 0) { system("sleep 1"); temp-- } }' 

python3 combinePNG.py



open speekEnd.app
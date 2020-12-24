#!/bin/sh

cmd=$(git remote show origin | grep "server")
cmd=${cmd#*(}
cmd=${cmd%)*}

if [ "$cmd" == "local out of date" ]
then
    cd /Users/defold/Projects/ToolGenBtn/code
    open speekStart.app
    cd /Users/defold/Projects/ToolGenBtn
    git pull origin server
    
    sleep 15 

    cd /Users/defold/Projects/ToolGenBtn/code
    

    rm -f ../temp/psd/*
    rm -f ../temp/png/*

    python3 JSON2CSV.py

    open ../input/*.psd
    open newAction.app
    wc -l ../temp/inputText.csv | awk '{ temp = $1 ; while (temp > 0) { system("sleep 1"); temp-- } }' 

    python3 combinePNG.py

    git add \.
    sleep 1
    git commit -m "new commit for `date`"
    sleep 1

    git push origin server

    sleep 10

    open speekEnd.app

elif [ "$cmd" == "up to date" ]
then
    echo "nothing to do"
fi





# cd /Users/defold/Projects/ToolGenBtn/code
# open speekStart.app

# rm -f ../temp/psd/*
# rm -f ../temp/png/*

# python3 JSON2CSV.py

# open ../input/*.psd
# open newAction.app
# wc -l ../temp/inputText.csv | awk '{ temp = $1 ; while (temp > 0) { system("sleep 1"); temp-- } }' 

# python3 combinePNG.py

# open speekEnd.app
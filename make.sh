#!/usr/bin/bash

iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv

/c/cmdtool32/awk -F '","|^"|"$' -f convert.awk BG7XTQ.utf8.csv > BG7XTQ.md

git add *.csv *.CSV *.ADI *.md *.awk *.sh *.cmd
#git archive --format=zip --prefix=logbook/ --output=../logbook.zip main

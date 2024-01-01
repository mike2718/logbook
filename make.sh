#!/bin/bash

git push
git push gitlab main

rm -f *.utf8.csv
iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
/c/cmdtool32/awk --csv -f csv2md.awk BG7XTQ.utf8.csv > BG7XTQ.md
rm -f *.utf8.csv

git add *.CSV *.ADI *.md

#git archive --format=tar.xz --prefix=logbook/ --output=../logbook.tar.xz main
#cp -f ../logbook.tar.xz /d/

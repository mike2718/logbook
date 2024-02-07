#!/bin/bash

rm -f *.utf8.csv
iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
/c/cmdtool64/awk --csv -f csv2md.awk BG7XTQ.utf8.csv > BG7XTQ.md
rm -f *.utf8.csv

git add *.CSV *.ADI *.md
git commit -m '更新'
git push

git archive --format=zip --prefix=logbook/ --output=../logbook.zip main
cp -f ../logbook.zip /d/logbook.zip

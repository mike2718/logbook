#!/bin/bash

rm -f BG7XTQ.utf8.csv
iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
/c/cmdtool32/awk --csv -f convert.awk BG7XTQ.utf8.csv > BG7XTQ.md

git archive --format=tar.xz --prefix=logbook/ --output=/d/logbook.tar.xz main
git archive --format=tar.xz --prefix=logbook/ --output=../logbook.tar.xz main

#!/usr/bin/bash

iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
iconv -f WINDOWS-936 -t UTF-8 BG7XTQ.ADI > BG7XTQ.utf8.adi

git archive --format=zip --prefix=logbook/ --output=../logbook.zip main

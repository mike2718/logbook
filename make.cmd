@echo off
cd /d "%~dp0"

C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 BG7XTQ.ADI > BG7XTQ.utf8.adi

git add *.adi *.ADI *.csv *.CSV *.cbr *.md
rem git archive --format=zip --prefix=logbook/ --output=../logbook.zip main

@echo off
cd /d "%~dp0"

del /q BG7XTQ.utf8.csv 2>nul
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.utf8.csv
C:\cmdtool32\awk.exe --csv -f convert.awk BG7XTQ.utf8.csv > BG7XTQ.md

git archive --format=tar.xz --prefix=logbook/ --output=d:/logbook.tar.xz main
git archive --format=tar.xz --prefix=logbook/ --output=../logbook.tar.xz main

pause
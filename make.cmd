@echo off
cd /d "%~dp0"

C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 BG7XTQ.CSV > BG7XTQ.UTF8.CSV
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 BG7XTQ.ADI > BG7XTQ.UTF8.ADI
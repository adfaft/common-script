@echo off 
cd /d "%~dp0"
for %%f in (*.gb) do (
    >nul 2>&1 mkdir "%%~nf"
    move /y "%%~f" "%%~nf\%%~nxf"
)
pause
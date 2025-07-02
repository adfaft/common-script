@echo off
Setlocal EnableExtensions DisableDelayedExpansion

FOR /D %%D in (*) DO (

cd "%%D"

echo:
REM cd
echo Dir: '%%~D'

Setlocal EnableDelayedExpansion

SET FIRSTCHAR=%%D
SET FIRSTCHAR=!FIRSTCHAR:~0,1!

IF NOT "!FIRSTCHAR!"=="_" (

IF exist "checksum.sfv" (
REM echo "will update"
task -g rhash:update %*
) else (
REM echo "will create"
task -g rhash:create %*
)

) else (
echo ignored.
)

Endlocal 

cd ..


)
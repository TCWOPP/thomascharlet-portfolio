@echo off
setlocal

cd /d "%~dp0"

echo === Git status ===
git status

echo.
echo === Adding changes ===
git add -A

for /f %%i in ('git status --porcelain') do set HASCHANGES=1

if not defined HASCHANGES (
  echo.
  echo No changes to commit. Nothing to push.
  exit /b 0
)

set MSG=Update site %date% %time%
if not "%~1"=="" set MSG=%*

echo.
echo === Commit: %MSG% ===
git commit -m "%MSG%"

echo.
echo === Push ===
git push

echo.
echo Done ✅
pause

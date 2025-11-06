@echo off
cd /d "%~dp0"

REM Essaie d'abord avec py (Windows Store)
where py >nul 2>nul
if %errorlevel%==0 (
    echo Lancement du serveur via 'py'...
    py -m http.server 5500
    exit /b
)

REM Sinon essaie avec python
where python >nul 2>nul
if %errorlevel%==0 (
    echo Lancement du serveur via 'python'...
    python -m http.server 5500
    exit /b
)

echo.
echo Erreur : Python n'est pas installé ou pas dans le PATH.
echo Installe-le depuis https://www.python.org/downloads/windows/ et réessaie.
pause

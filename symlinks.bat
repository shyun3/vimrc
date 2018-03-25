@echo off

:: Check for HOME
if "%HOME%" == "" (
  set homeDir=%HOMEDRIVE%%HOMEPATH%\
) else (
  set homeDir=%HOME%\
)

:: Create symlinks
mklink %homeDir%_vimrc %CD%\_vimrc
mklink %homeDir%_gvimrc %CD%\_gvimrc
mklink /d %homeDir%vimfiles %CD%\vimfiles

pause

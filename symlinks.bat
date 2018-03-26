@echo off

:: Check for HOME
if "%HOME%" == "" (
  set homeDir=%HOMEDRIVE%%HOMEPATH%\
) else (
  set homeDir=%HOME%\
)

:: Create symlinks
mklink %homeDir%_vimrc %~dp0%\_vimrc
mklink %homeDir%_gvimrc %~dp0%\_gvimrc
mklink /d %homeDir%vimfiles %~dp0%\vimfiles

pause

@echo off
setlocal

set "ROOT_DIR=."
call :DeleteDirsFunction "_build"
call :DeleteDirsFunction "_test"
call :DeleteDirsFunction "_obj"
call :DeleteDirsFunction "_packages"
call :DeleteDirsFunction "_temp"
call :DeleteDirsFunction "obj"
call :DeleteDirsFunction "bin"
call :DeleteDirsFunction "_archive"
call :DeleteDirsFunction "TestResults"
call :DeleteDirsFunction ".vs"
call :DeleteFilesFunction "*.feature.cs"

goto :eof

:DeleteFilesFunction
set "PATTERN=%~1"
for /r "%ROOT_DIR%" %%F in (%PATTERN%) do (
    if exist "%%F" (
    	echo Deleting: %%F
    	del "%%F"
    )
)
goto :eof

:DeleteDirsFunction
set "DIR_NAME=%~1"
for /d /r "%ROOT_DIR%" %%D in (%DIR_NAME%) do (
    if exist "%%D" (
        rd /s /q "%%D"
        echo Deleted directory: "%%D"
    )
)
goto :eof

:: End of script

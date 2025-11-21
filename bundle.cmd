@ECHO OFF
SETLOCAL
set "APP_ROOT=%~dp0"
if "%APP_ROOT%"=="" set "APP_ROOT=.\"
set "BUNDLE_SCRIPT=%APP_ROOT%bin\bundle"
if not exist "%BUNDLE_SCRIPT%" (
  echo Could not locate "%BUNDLE_SCRIPT%". >&2
  exit /b 1
)
ruby "%BUNDLE_SCRIPT%" %*

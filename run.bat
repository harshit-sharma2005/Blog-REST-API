@echo off
setlocal EnableDelayedExpansion
echo ==========================================
echo   Blog REST API - Starting...
echo ==========================================
echo.

:: ---- JAVA SETUP ----
:: Set JAVA_HOME from the permanent environment variable
for /f "tokens=2*" %%a in ('reg query "HKCU\Environment" /v JAVA_HOME 2^>nul') do set "JAVA_HOME=%%b"

:: Fallback: try to find java.exe directly
if not defined JAVA_HOME (
    for %%i in (java.exe) do (
        set "JAVA_BIN=%%~dp$PATH:i"
    )
    if defined JAVA_BIN (
        for %%j in ("%JAVA_BIN%\..") do set "JAVA_HOME=%%~fj"
    )
)

if not defined JAVA_HOME (
    echo ERROR: Java not found! Please install Java.
    pause
    exit /b 1
)
echo Using JAVA_HOME: %JAVA_HOME%

:: ---- MYSQL SETUP ----
set "MYSQL_BASE=%USERPROFILE%\mysql\mysql-8.4.9-winx64"
set "MYSQL_BIN=%MYSQL_BASE%\bin"
set "STARTED_MYSQL=0"

:: Add MySQL to PATH for this session
set "PATH=%MYSQL_BIN%;%PATH%"

:: Check if MySQL is already running
tasklist /FI "IMAGENAME eq mysqld.exe" 2>nul | find /I "mysqld.exe" >nul
if %ERRORLEVEL% EQU 0 (
    echo [MySQL] Already running.
) else (
    echo [MySQL] Not running. Starting MySQL server...
    start "" /B "%MYSQL_BIN%\mysqld.exe" --basedir="%MYSQL_BASE%" --datadir="%MYSQL_BASE%\data" --port=3306 --console 2>nul
    set "STARTED_MYSQL=1"

    :: Wait for MySQL to be ready (up to 15 seconds)
    echo [MySQL] Waiting for MySQL to be ready...
    for /L %%i in (1,1,15) do (
        "%MYSQL_BIN%\mysql.exe" -u root -p"wwe brock" -e "SELECT 1;" >nul 2>&1
        if !ERRORLEVEL! EQU 0 (
            echo [MySQL] Ready!
            goto :mysql_ready
        )
        timeout /t 1 /nobreak >nul
    )
    echo [MySQL] WARNING: MySQL may not be ready yet, proceeding anyway...
)
:mysql_ready
echo.

:: ---- START APPLICATION ----
echo ==========================================
echo Starting Spring Boot application...
echo Once started, open: http://localhost:8080/api/posts
echo Press Ctrl+C to stop the server.
echo ==========================================
call mvnw.cmd spring-boot:run

:: ---- CLEANUP: Stop MySQL if we started it ----
if "%STARTED_MYSQL%"=="1" (
    echo.
    echo [MySQL] Shutting down MySQL server...
    "%MYSQL_BIN%\mysqladmin.exe" -u root -p"wwe brock" shutdown 2>nul
    echo [MySQL] Stopped.
)
pause

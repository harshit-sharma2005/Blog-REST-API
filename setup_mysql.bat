@echo off
echo ==========================================
echo   MySQL Setup Script (Run as Administrator)
echo ==========================================
echo.

:: Step 1: Install VC++ Redistributable
echo [1/4] Installing Visual C++ Redistributable...
if exist "%TEMP%\vc_redist.x64.exe" (
    "%TEMP%\vc_redist.x64.exe" /install /quiet /norestart
) else (
    echo Downloading VC++ Redistributable...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -OutFile '%TEMP%\vc_redist.x64.exe' -UseBasicParsing"
    "%TEMP%\vc_redist.x64.exe" /install /quiet /norestart
)
echo VC++ Redistributable installed.
echo.

:: Step 2: Initialize MySQL data directory
set MYSQL_BASE=%USERPROFILE%\mysql\mysql-8.4.9-winx64
echo [2/4] Initializing MySQL data directory...
if exist "%MYSQL_BASE%\data" (
    echo Data directory already exists, removing old one...
    rmdir /s /q "%MYSQL_BASE%\data"
)
"%MYSQL_BASE%\bin\mysqld.exe" --initialize-insecure --basedir="%MYSQL_BASE%" --datadir="%MYSQL_BASE%\data" --console
echo MySQL initialized.
echo.

:: Step 3: Start MySQL server
echo [3/4] Starting MySQL server...
start "MySQL Server" "%MYSQL_BASE%\bin\mysqld.exe" --basedir="%MYSQL_BASE%" --datadir="%MYSQL_BASE%\data" --port=3306 --console
echo Waiting for MySQL to start...
timeout /t 5 /nobreak > nul
echo.

:: Step 4: Set root password and create database
echo [4/4] Setting root password and creating blogapi database...
"%MYSQL_BASE%\bin\mysql.exe" -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'wwe brock'; CREATE DATABASE IF NOT EXISTS blogapi; FLUSH PRIVILEGES;"
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==========================================
    echo   SUCCESS! MySQL is ready.
    echo   - Root password: wwe brock
    echo   - Database: blogapi
    echo   - Port: 3306
    echo ==========================================
) else (
    echo.
    echo WARNING: Could not set password/create database.
    echo Try running manually:
    echo   %MYSQL_BASE%\bin\mysql.exe -u root --skip-password
    echo   ALTER USER 'root'@'localhost' IDENTIFIED BY 'wwe brock';
    echo   CREATE DATABASE IF NOT EXISTS blogapi;
)
echo.
pause

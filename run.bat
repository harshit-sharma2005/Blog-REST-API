@echo off
echo ==========================================
echo   Blog REST API - Starting...
echo ==========================================
echo.

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
echo Starting Spring Boot application...
echo Once started, open: http://localhost:8080/api/posts
echo Press Ctrl+C to stop the server.
echo ==========================================
call mvnw.cmd spring-boot:run
pause

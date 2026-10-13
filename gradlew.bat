@echo off
set APP_HOME=%~dp0
set CLASSPATH=%APP_HOME%gradle\wrapper\gradle-wrapper.jar

if not "%JAVA_HOME%"=="" (
    set "JAVACMD=%JAVA_HOME%\bin\java.exe"
) else (
    set JAVACMD=java.exe
)

if not exist "%CLASSPATH%" (
    echo ERROR: Gradle wrapper JAR not found at %CLASSPATH%
    echo Please generate the wrapper using a real Gradle installation or commit the official wrapper jar.
    exit /b 1
)

"%JAVACMD%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

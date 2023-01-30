@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  tolam startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and TOLAM_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\tolam-0.1.jar;%APP_HOME%\lib\asterisms-account-sdk-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\asterisms-account-spi-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\asterisms-auth-sdk-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\asterisms-auth-spi-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\asterisms-security-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\asterisms-core-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\micronaut-cache-core-3.5.0.jar;%APP_HOME%\lib\micronaut-reactor-http-client-2.5.0.jar;%APP_HOME%\lib\micronaut-reactor-2.5.0.jar;%APP_HOME%\lib\micronaut-security-jwt-3.9.2.jar;%APP_HOME%\lib\micronaut-security-session-3.9.2.jar;%APP_HOME%\lib\micronaut-security-3.9.2.jar;%APP_HOME%\lib\micronaut-security-annotations-3.9.2.jar;%APP_HOME%\lib\micronaut-picocli-4.3.0.jar;%APP_HOME%\lib\picocli-4.6.3.jar;%APP_HOME%\lib\micronaut-http-client-3.8.2.jar;%APP_HOME%\lib\asterisms-core-libs-1.1.0-SNAPSHOT.jar;%APP_HOME%\lib\micronaut-http-server-3.8.2.jar;%APP_HOME%\lib\micronaut-session-3.8.2.jar;%APP_HOME%\lib\micronaut-http-netty-3.8.2.jar;%APP_HOME%\lib\micronaut-websocket-3.8.2.jar;%APP_HOME%\lib\micronaut-http-client-core-3.8.2.jar;%APP_HOME%\lib\micronaut-runtime-3.8.2.jar;%APP_HOME%\lib\micronaut-jackson-databind-3.8.2.jar;%APP_HOME%\lib\micronaut-jackson-core-3.8.2.jar;%APP_HOME%\lib\micronaut-json-core-3.8.2.jar;%APP_HOME%\lib\micronaut-context-3.8.2.jar;%APP_HOME%\lib\micronaut-aop-3.8.2.jar;%APP_HOME%\lib\micronaut-router-3.8.2.jar;%APP_HOME%\lib\micronaut-http-3.8.2.jar;%APP_HOME%\lib\micronaut-validation-3.8.2.jar;%APP_HOME%\lib\micronaut-buffer-netty-3.8.2.jar;%APP_HOME%\lib\micronaut-inject-3.8.2.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\logback-classic-1.2.11.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.14.1.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.14.1.jar;%APP_HOME%\lib\jackson-databind-2.14.1.jar;%APP_HOME%\lib\jackson-core-2.14.1.jar;%APP_HOME%\lib\jackson-annotations-2.14.1.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\guava-31.1-jre.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\logback-core-1.2.11.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-http2-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.86.Final.jar;%APP_HOME%\lib\netty-handler-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-4.1.86.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.86.Final.jar;%APP_HOME%\lib\reactor-core-3.5.0.jar;%APP_HOME%\lib\micronaut-core-reactive-3.8.2.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\micronaut-core-3.8.2.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\snakeyaml-1.33.jar;%APP_HOME%\lib\swagger-annotations-2.2.7.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\javax.persistence-api-2.2.jar;%APP_HOME%\lib\ipaddress-5.3.3.jar;%APP_HOME%\lib\gson-2.9.0.jar;%APP_HOME%\lib\srp6a-2.1.0.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-qual-3.12.0.jar;%APP_HOME%\lib\error_prone_annotations-2.11.0.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\nimbus-jose-jwt-9.25.6.jar;%APP_HOME%\lib\netty-resolver-4.1.86.Final.jar;%APP_HOME%\lib\netty-common-4.1.86.Final.jar;%APP_HOME%\lib\jcip-annotations-1.0-1.jar


@rem Execute tolam
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TOLAM_OPTS%  -classpath "%CLASSPATH%" io.tolam.TolamCommand %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable TOLAM_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%TOLAM_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

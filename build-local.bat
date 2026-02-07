@echo off
echo ============================================
echo     短信转发助手 - 本地编译脚本
echo ============================================
echo.

REM 设置 Java 环境
set JAVA_HOME=C:\Program Files\Microsoft\jdk-17.0.18.8-hotspot
set PATH=%JAVA_HOME%\bin;%PATH%

REM 设置 Android SDK 环境
set ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk
set ANDROID_SDK_ROOT=%LOCALAPPDATA%\Android\Sdk

echo [1/3] 检查环境...
java -version
if %ERRORLEVEL% neq 0 (
    echo 错误: 未找到 Java，请确保已安装 JDK 17
    pause
    exit /b 1
)

echo.
echo [2/3] 开始编译 Debug 版本...
call gradlew.bat assembleDebug
if %ERRORLEVEL% neq 0 (
    echo 编译失败！
    pause
    exit /b 1
)

echo.
echo [3/3] 复制 APK 到桌面...
copy /Y "app\build\outputs\apk\debug\app-debug.apk" "%USERPROFILE%\Desktop\短信转发助手-debug.apk"

echo.
echo ============================================
echo     编译完成！
echo     APK 位置: %USERPROFILE%\Desktop\短信转发助手-debug.apk
echo ============================================
pause

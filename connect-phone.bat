@echo off
chcp 65001 >nul
echo ============================================
echo     连接安卓手机 (OPPO Find N5)
echo ============================================
echo.
echo 请查看手机: 设置 → 开发者选项 → 无线调试
echo 页面上显示的「IP 地址和端口」
echo.

set /p PORT=请输入端口号 (例如 33765): 

echo.
echo 正在连接 192.168.1.6:%PORT% ...
C:\Users\tomnice\AppData\Local\Android\Sdk\platform-tools\adb.exe connect 192.168.1.6:%PORT%

echo.
echo 检查连接状态:
C:\Users\tomnice\AppData\Local\Android\Sdk\platform-tools\adb.exe devices

echo.
pause

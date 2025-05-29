@echo off
setlocal EnableDelayedExpansion

:: Thiet lap thu muc lam viec
cd /d "%~dp0"

:: Khoi tao file log
echo [%date% %time%] Bat Dau Script Cai Dat Office 2019 > install_log.txt

:: Kiem tra file XML
echo [%date% %time%] Kiem Tra Standard2019.xml... >> install_log.txt
if not exist "standard2019.xml" (
    echo Loi: Khong Tim Thay Standard2019.xml Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Standard2019.xml. >> install_log.txt
    pause
    exit /b 1
)
echo [%date% %time%] Kiem Tra Plus2019.xml... >> install_log.txt
if not exist "plus2019.xml" (
    echo Loi: Khong Tim Thay Plus2019.xml Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Plus2019.xml. >> install_log.txt
    pause
    exit /b 1
)

:MenuChinh
cls
echo ==============================
echo Menu Cai Dat Office 2019
echo ==============================
echo 1. Phien Ban Standard (Office Standard 2019)
echo 2. Phien Ban Proplus (Office Professional Plus 2019)
echo 3. Thoat
echo ==============================
set /p choice=Nhap Lua Chon (1-3): 

echo [%date% %time%] Nguoi Dung Chon: %choice% >> install_log.txt
if "%choice%"=="1" set xml_file=standard2019.xml& set version=Standard& set office_dir=Standard\Office
if "%choice%"=="2" set xml_file=plus2019.xml& set version=ProPlus& set office_dir=ProPlus\Office
if "%choice%"=="3" (
    echo [%date% %time%] Thoat Script. >> install_log.txt
    exit /b 0
)
if not defined version (
    echo Lua Chon Khong Hop Le. Vui Long Thu Lai.
    echo [%date% %time%] Loi: Lua Chon Khong Hop Le: %choice%. >> install_log.txt
    pause
    goto MenuChinh
)
goto MenuHanhDong

:MenuHanhDong
cls
echo ==============================
echo Menu Phien Ban %version%
echo ==============================
echo 1. Tai Xuong File Cai Dat %version%
echo 2. Cai Dat %version%
echo 3. Go Office Cu
echo 4. Quay Lai Menu Chinh
echo ==============================
set /p action_choice=Nhap Lua Chon (1-4): 

echo [%date% %time%] Nguoi Dung Chon Hanh Dong: %action_choice% Cho %version% >> install_log.txt
if "%action_choice%"=="1" goto KiemTraTaiXuong
if "%action_choice%"=="2" goto MenuNgonNgu
if "%action_choice%"=="3" goto GoOfficeCu
if "%action_choice%"=="4" goto MenuChinh
echo Lua Chon Khong Hop Le. Vui Long Thu Lai.
echo [%date% %time%] Loi: Lua Chon Hanh Dong Khong Hop Le: %action_choice%. >> install_log.txt
pause
goto MenuHanhDong

:KiemTraTaiXuong
cls
echo [%date% %time%] Kiem Tra File Xml Va Thu Muc Office Cho %version%... >> install_log.txt
if "%version%"=="Standard" (
    if exist "standard2019.xml" if exist "Standard\Office" (
        echo File Xml Va Thu Muc Office Da Ton Tai Cho %version%. Quay Lai Menu Chinh.
        echo [%date% %time%] File Xml Va Thu Muc Office Da Ton Tai Cho %version%. Khong Can Tai Xuong. >> install_log.txt
        pause
        goto MenuChinh
    )
) else (
    if exist "plus2019.xml" if exist "ProPlus\Office" (
        echo File Xml Va Thu Muc Office Da Ton Tai Cho %version%. Quay Lai Menu Chinh.
        echo [%date% %time%] File Xml Va Thu Muc Office Da Ton Tai Cho %version%. Khong Can Tai Xuong. >> install_log.txt
        pause
        goto MenuChinh
    )
)
goto TaiXuong

:TaiXuong
cls
echo [%date% %time%] Kiem Tra Setup.exe Trong Thu Muc Goc... >> install_log.txt
if not exist "setup.exe" (
    echo Loi: Khong Tim Thay Setup.exe Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Setup.exe. >> install_log.txt
    pause
    goto MenuHanhDong
)

:: Tao thu muc cho phien ban
echo [%date% %time%] Tao Thu Muc %version% Va Office... >> install_log.txt
if not exist "%version%" (
    mkdir "%version%"
    echo [%date% %time%] Tao Thu Muc %version% Thanh Cong. >> install_log.txt
)
if not exist "%office_dir%" (
    mkdir "%office_dir%"
    echo [%date% %time%] Tao Thu Muc %office_dir% Thanh Cong. >> install_log.txt
)

echo Bat Dau Tai Xuong File Cai Dat %version% Vao %office_dir%...
echo [%date% %time%] Khoi Dong Tai Xuong Voi %xml_file% Vao %office_dir%... >> install_log.txt

:: Mo phong tien trinh tai xuong (60 giay)
set /a total_time=60
set /a interval=6
for /l %%i in (0,%interval%,100) do (
    cls
    echo Dang Tai Xuong File %version% Vao %office_dir%... %%i%%
    echo [%date% %time%] Tien Trinh Tai Xuong: %%i%% >> install_log.txt
    ping -n %interval% 127.0.0.1 >nul
)
start /b "" setup.exe /download %xml_file%
:: Cho tai xuong hoan tat (gan dung)
ping -n %total_time% 127.0.0.1 >nul
taskkill /im setup.exe /f >nul 2>&1
echo [%date% %time%] Len Tai Xuong Da Thuc Thi. >> install_log.txt

:: Kiem tra thu muc Office va sao chep setup.exe
echo [%date% %time%] Kiem Tra Thu Muc %office_dir%... >> install_log.txt
if exist "%office_dir%" (
    echo Dang Sao Chep Setup.exe Vao %office_dir%...
    echo [%date% %time%] Sao Chep Setup.exe Vao %office_dir%... >> install_log.txt
    copy /Y "setup.exe" "%office_dir%\setup.exe"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Sao Chep Setup.exe Vao %office_dir% That Bai.
        echo [%date% %time%] Loi: Sao Chep Setup.exe That Bai. >> install_log.txt
    ) else (
        echo Sao Chep Setup.exe Vao %office_dir% Thanh Cong.
        echo [%date% %time%] Sao Chep Setup.exe Thanh Cong. >> install_log.txt
    )
) else (
    echo Loi: Khong Tim Thay Thu Muc %office_dir% Sau Khi Tai Xuong. Vui Long Kiem Tra Qua Trinh Tai Xuong.
    echo [%date% %time%] Loi: Khong Tim Thay Thu Muc %office_dir%. >> install_log.txt
)
pause
goto MenuHanhDong

:GoOfficeCu
cls
echo [%date% %time%] Kiem Tra Setup.exe Trong Thu Muc Goc... >> install_log.txt
if not exist "setup.exe" (
    echo Loi: Khong Tim Thay Setup.exe Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Setup.exe. >> install_log.txt
    pause
    goto MenuHanhDong
)

:: Tao XML tam thoi de go Office
echo [%date% %time%] Tao XML Tam Thoi De Go Office... >> install_log.txt
(
    echo ^<Configuration^>
    echo   ^<Remove All="TRUE" /^>
    echo   ^<RemoveMSI /^>
    echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo ^</Configuration^>
) > uninstall.xml

if not exist "uninstall.xml" (
    echo Loi: Tao XML Go Cai Dat That Bai.
    echo [%date% %time%] Loi: Tao Uninstall.xml That Bai. >> install_log.txt
    pause
    goto MenuHanhDong
)
echo [%date% %time%] XML Go Cai Dat Tao Thanh Cong. >> install_log.txt

echo Bat Dau Go Va Xoa Office Cu...
echo [%date% %time%] Khoi Dong Go Office Cu... >> install_log.txt

:: Mo phong tien trinh go cai dat (60 giay)
set /a total_time=60
set /a interval=6
for /l %%i in (0,%interval%,100) do (
    cls
    echo Dang Go Va Xoa Office Cu... %%i%%
    echo [%date% %time%] Tien Trinh Go Cai Dat: %%i%% >> install_log.txt
    ping -n %interval% 127.0.0.1 >nul
)
start /b "" setup.exe /configure uninstall.xml
:: Cho go cai dat hoan tat (gan dung)
ping -n %total_time% 127.0.0.1 >nul
taskkill /im setup.exe /f >nul 2>&1
echo [%date% %time%] Len Go Cai Dat Da Thuc Thi. >> install_log.txt

:: Xoa thu muc Office con lai
echo [%date% %time%] Xoa Thu Muc Office Con Lai... >> install_log.txt
for %%D in ("%ProgramFiles%\Microsoft Office" "%ProgramFiles(x86)%\Microsoft Office" "%ProgramData%\Microsoft\Office" "%AppData%\Microsoft\Office" "%LocalAppData%\Microsoft\Office") do (
    if exist "%%D" (
        rd /s /q "%%D" >nul 2>&1
        if not exist "%%D" (
            echo Xoa Thu Muc %%D Thanh Cong.
            echo [%date% %time%] Xoa Thu Muc %%D Thanh Cong. >> install_log.txt
        ) else (
            echo Loi: Xoa Thu Muc %%D That Bai.
            echo [%date% %time%] Loi: Xoa Thu Muc %%D That Bai. >> install_log.txt
        )
    )
)

:: Xoa registry Office
echo [%date% %time%] Xoa Registry Office... >> install_log.txt
for %%R in ("HKLM\SOFTWARE\Microsoft\Office" "HKLM\SOFTWARE\Wow6432Node\Microsoft\Office" "HKCU\SOFTWARE\Microsoft\Office") do (
    reg delete "%%R" /f >nul 2>&1
    if !ERRORLEVEL! equ 0 (
        echo Xoa Registry %%R Thanh Cong.
        echo [%date% %time%] Xoa Registry %%R Thanh Cong. >> install_log.txt
    ) else (
        echo Loi: Xoa Registry %%R That Bai.
        echo [%date% %time%] Loi: Xoa Registry %%R That Bai. >> install_log.txt
    )
)

:: Don dep XML go cai dat
echo [%date% %time%] Don Dep XML Go Cai Dat... >> install_log.txt
del uninstall.xml
if exist "uninstall.xml" (
    echo [%date% %time%] Loi: Xoa Uninstall.xml That Bai. >> install_log.txt
) else (
    echo [%date% %time%] XML Go Cai Dat Da Xoa. >> install_log.txt
)

echo Go Va Xoa Office Cu Hoan Thanh.
echo [%date% %time%] Go Va Xoa Office Cu Hoan Thanh. >> install_log.txt
pause
goto MenuHanhDong

:MenuNgonNgu
cls
echo [%date% %time%] Kiem Tra %office_dir%\setup.exe... >> install_log.txt
if not exist "%office_dir%\setup.exe" (
    echo Loi: Khong Tim Thay %office_dir%\setup.exe. Vui Long Tai Xuong File Truoc.
    echo [%date% %time%] Loi: Khong Tim Thay %office_dir%\setup.exe. >> install_log.txt
    pause
    goto MenuHanhDong
)

:: Kiem tra Office cu
echo [%date% %time%] Kiem Tra Office Cu Truoc Cai Dat... >> install_log.txt
set office_exists=0
for %%D in ("%ProgramFiles%\Microsoft Office" "%ProgramFiles(x86)%\Microsoft Office") do (
    if exist "%%D" set office_exists=1
)
for %%R in ("HKLM\SOFTWARE\Microsoft\Office" "HKLM\SOFTWARE\Wow6432Node\Microsoft\Office" "HKCU\SOFTWARE\Microsoft\Office") do (
    reg query "%%R" >nul 2>&1
    if !ERRORLEVEL! equ 0 set office_exists=1
)

if !office_exists! equ 1 (
    echo Phat Hien Office Cu. Dang Go Va Xoa Hoan Toan...
    echo [%date% %time%] Phat Hien Office Cu. Khoi Dong Go Va Xoa Truoc Cai Dat... >> install_log.txt

    :: Kiem tra setup.exe
    echo [%date% %time%] Kiem Tra Setup.exe Cho Go Office... >> install_log.txt
    if not exist "setup.exe" (
        echo Loi: Khong Tim Thay Setup.exe Trong Thu Muc Hien Tai.
        echo [%date% %time%] Loi: Khong Tim Thay Setup.exe. >> install_log.txt
        pause
        goto MenuHanhDong
    )

    :: Tao

System: * Today's date and time is 05:42 PM +07 on Tuesday, May 20, 2025.
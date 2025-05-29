@echo off
setlocal EnableDelayedExpansion

:: Thiet lap thu muc lam viec
cd /d "%~dp0"
set "log_file=install_log_%date:~-4%%date:~3,2%%date:~0,2%.txt"
echo [%date% %time%] Thiet Lap Thu Muc Lam Viec: %~dp0 >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Khong the ghi file log. Kiem tra quyen ghi vao thu muc hien tai: %~dp0
    echo [%date% %time%] Loi: Khong The Ghi File Log. >> "%log_file%"
    pause
    exit /b 1
)

:: Thiet lap kich thuoc cua so
mode con cols=110 lines=40
if %ERRORLEVEL% neq 0 (
    echo Loi: Khong the thiet lap kich thuoc cua so.
    echo [%date% %time%] Loi: Khong The Thiet Lap Kich Thuoc Cua So. >> "%log_file%"
    pause
    exit /b 1
)

:: Tao file log
echo [%date% %time%] Bat Dau Script Cai Dat Office >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Khong the ghi file log. Kiem tra quyen ghi vao thu muc hien tai: %~dp0
    echo [%date% %time%] Loi: Khong The Ghi File Log. >> "%log_file%"
    pause
    exit /b 1
)

:: Kiem tra quyen quan tri
echo [%date% %time%] Kiem Tra Quyen Quan Tri... >> "%log_file%"
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Ban Chua Chay CMD Voi Quyen Admin.
    echo Vui Long Click Chuot Phai Chon Run As Administrator.
    echo [%date% %time%] Loi: Khong Chay Voi Quyen Admin. >> "%log_file%"
    pause
    exit /b 1
)
echo [%date% %time%] Da Xac Nhan Quyen Admin. >> "%log_file%"

:: Lay thong tin he thong
echo [%date% %time%] Lay Thong Tin He Thong... >> "%log_file%"
powershell -Command "(Get-WmiObject Win32_OperatingSystem).Caption" > "%temp%\os_name.txt" 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    set "OsName=Unknown"
    echo [%date% %time%] Loi: Khong the lay ten he dieu hanh. >> "%log_file%"
) else (
    set /p OsName=<"%temp%\os_name.txt"
)
del "%temp%\os_name.txt" >nul 2>&1

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion > "%temp%\os_version.txt" 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    set "OSVersion=Unknown"
    echo [%date% %time%] Loi: Khong the lay phien ban he dieu hanh. >> "%log_file%"
) else (
    for /f "tokens=3" %%b in ('type "%temp%\os_version.txt"') do set "OSVersion=%%b"
)
del "%temp%\os_version.txt" >nul 2>&1

reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds > "%temp%\office_version.txt" 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    set "OfficeVersion=Not Installed"
) else (
    for /f "tokens=2,*" %%I in ('type "%temp%\office_version.txt"') do set "OfficeVersion=%%J"
)
del "%temp%\office_version.txt" >nul 2>&1

set "CurrentTime=%time:~0,5% %date%"
echo [%date% %time%] Da Lay Thong Tin He Thong: OS=%OsName%, Version=%OSVersion%, Office=%OfficeVersion% >> "%log_file%"

goto MenuChinh

:: Kiem tra ket noi Internet
:CheckInternet
echo [%date% %time%] Kiem Tra Ket Noi Internet... >> "%log_file%"
powershell -Command "if (Test-Connection -ComputerName officecdn.microsoft.com -Count 1 -Quiet -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }" >nul 2>> "%log_file%"
if !ERRORLEVEL! equ 0 (
    set "_int=1"
    echo [%date% %time%] Ket Noi Internet Thanh Cong (officecdn.microsoft.com). >> "%log_file%"
) else (
    set "_int=0"
    echo [%date% %time%] Loi: Khong Co Ket Noi Internet Den Microsoft Servers. >> "%log_file%"
)
goto :eof

:MenuChinh
cls
color 0F
echo [%date% %time%] Hien Thi Menu Chinh... >> "%log_file%"
echo ==========================================================================================================
echo                            BACH TINH PHONG - ANH PHAT COMPUTERTOOL 2025
echo                                 Phien Ban: Tool Ki Niem Sinh Nhat
echo ==========================================================================================================
powershell -Command "Write-Host -ForegroundColor Cyan 'OS: %OsName% %OSVersion%'" 2>> "%log_file%"
powershell -Command "Write-Host -ForegroundColor Cyan 'Office: %OfficeVersion%'" 2>> "%log_file%"
powershell -Command "Write-Host -ForegroundColor Cyan 'Thoi gian: %CurrentTime%'" 2>> "%log_file%"
echo ==========================================================================================================
echo [ 1] Tai Va Cai Dat Office                   ^| [ 7] Sao Luu Ban Quyen Win/Office
echo [ 2] Cai Dat Office Tu File Da Tai           ^| [ 8] Khoi Phuc Ban Quyen Win/Office
echo [ 3] Go Office Da Cai Dat Truoc Do           ^| [ 9] Xoa Key Windows/Office Ban Quyen
echo [ 4] Kich Hoat Windows Hoac Office           ^| [10] Thiet Lap Mac Dinh Word/Excel
echo [ 5] Kiem Tra Trang Thai Kich Hoat           ^| [11] Lay Key Kich Hoat Ban Quyen Microsoft
echo [ 6] Go Key Office Cu                        ^| [12] Thoat
echo ==========================================================================================================
set /p choice=Nhap Lua Chon (1-12): 
echo [%date% %time%] Nguoi Dung Nhap Lua Chon: !choice! >> "%log_file%"

:: Validate input
if "!choice!"=="1" goto MenuTaiCaiOffice
if "!choice!"=="2" goto MenuCaiDatTuFile
if "!choice!"=="3" (
    call install_office1_part2.bat :GoOfficeCu
    goto MenuChinh
)
if "!choice!"=="4" (
    call install_office1_part2.bat :KichHoat
    goto MenuChinh
)
if "!choice!"=="5" (
    call install_office1_part2.bat :KiemTraTrangThai
    goto MenuChinh
)
if "!choice!"=="6" (
    call install_office1_part2.bat :GoKeyOfficeCu
    goto MenuChinh
)
if "!choice!"=="7" (
    call install_office1_part2.bat :SaoLuuBanQuyen
    goto MenuChinh
)
if "!choice!"=="8" (
    call install_office1_part2.bat :KhoiPhucBanQuyen
    goto MenuChinh
)
if "!choice!"=="9" (
    call install_office1_part2.bat :XoaKeyWinOffice
    goto MenuChinh
)
if "!choice!"=="10" (
    call install_office1_part2.bat :ThietLapWordExcel
    goto MenuChinh
)
if "!choice!"=="11" (
    call install_office1_part2.bat :LayKeyBanQuyen
    goto MenuChinh
)
if "!choice!"=="12" (
    echo Ban co chac muon thoat khong? (Y/N)
    set /p exit_choice=Nhap lua chon: 
    if /i "!exit_choice!"=="Y" (
        echo [%date% %time%] Thoat Script. >> "%log_file%"
        exit /b 0
    ) else (
        goto MenuChinh
    )
)
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuChinh

:MenuTaiCaiOffice
cls
echo [%date% %time%] Hien Thi Menu Tai Va Cai Dat Office... >> "%log_file%"
echo ===================================================================
echo                Tai Va Cai Dat Office
echo ===================================================================
echo 1. Tải Office
echo 2. Cài Office
echo 3. Quay Lai Menu Chinh
echo ===================================================================
set /p choice=Nhap Lua Chon (1-3): 
echo [%date% %time%] Nguoi Dung Chon: !choice! >> "%log_file%"
if "!choice!"=="1" goto MenuPhienBanTai
if "!choice!"=="2" goto MenuPhienBanCai
if "!choice!"=="3" goto MenuChinh
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuTaiCaiOffice

:MenuPhienBanTai
cls
echo [%date% %time%] Hien Thi Menu Phien Ban Office de Tai... >> "%log_file%"
echo ===================================================================
echo                Chon Phien Ban Office de Tai
echo ===================================================================
echo ProPlus:
echo 1. Office Professional Plus 2019
echo 2. Office Professional Plus 2021
echo 3. Office Professional Plus 2024
echo Standard:
echo 4. Office Standard 2019
echo 5. Office Standard 2021
echo 6. Office Standard 2024
echo 7. Quay Lai Menu Tai Va Cai Dat Office
echo ===================================================================
set /p choice=Nhap Lua Chon (1-7): 
echo [%date% %time%] Nguoi Dung Chon Phien Ban: !choice! >> "%log_file%"

if "!choice!"=="1" (
    set "xml_file=plus2019.xml"
    set "version=ProPlus2019"
    set "office_dir=ProPlus2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=ProPlus2019Volume"
    set "pid_key=NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto TaoFileXML
)
if "!choice!"=="2" (
    set "xml_file=plus2021.xml"
    set "version=ProPlus2021"
    set "office_dir=ProPlus2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=ProPlus2021Volume"
    set "pid_key=FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto TaoFileXML
)
if "!choice!"=="3" (
    set "xml_file=plus2024.xml"
    set "version=ProPlus2024"
    set "office_dir=ProPlus2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=ProPlus2024Volume"
    set "pid_key=XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto TaoFileXML
)
if "!choice!"=="4" (
    set "xml_file=standard2019.xml"
    set "version=Standard2019"
    set "office_dir=Standard2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=Standard2019Volume"
    set "pid_key=6NWWJ-YQWMR-QKGCB-6TMB3-9D9HK"
    set "exclude_app="
    goto TaoFileXML
)
if "!choice!"=="5" (
    set "xml_file=standard2021.xml"
    set "version=Standard2021"
    set "office_dir=Standard2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=Standard2021Volume"
    set "pid_key=FTNWT-C6WBT-8HMGF-K9PRX-QV9H8"
    set "exclude_app="
    goto TaoFileXML
)
if "!choice!"=="6" (
    set "xml_file=standard2024.xml"
    set "version=Standard2024"
    set "office_dir=Standard2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=Standard2024Volume"
    set "pid_key=V28N4-JG22K-W66P8-VTMGK-H6HGR"
    set "exclude_app="
    goto TaoFileXML
)
if "!choice!"=="7" goto MenuTaiCaiOffice
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Phien Ban Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuPhienBanTai

:MenuPhienBanCai
cls
echo [%date% %time%] Hien Thi Menu Phien Ban Office de Cai Dat... >> "%log_file%"
echo ===================================================================
echo                Chon Phien Ban Office de Cai Dat
echo ===================================================================
echo ProPlus:
echo 1. Office Professional Plus 2019
echo 2. Office Professional Plus 2021
echo 3. Office Professional Plus 2024
echo Standard:
echo 4. Office Standard 2019
echo 5. Office Standard 2021
echo 6. Office Standard 2024
echo 7. Quay Lai Menu Tai Va Cai Dat Office
echo ===================================================================
set /p choice=Nhap Lua Chon (1-7): 
echo [%date% %time%] Nguoi Dung Chon Phien Ban: !choice! >> "%log_file%"

if "!choice!"=="1" (
    set "xml_file=plus2019.xml"
    set "version=ProPlus2019"
    set "office_dir=ProPlus2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=ProPlus2019Volume"
    set "pid_key=NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto KiemTraCaiDat
)
if "!choice!"=="2" (
    set "xml_file=plus2021.xml"
    set "version=ProPlus2021"
    set "office_dir=ProPlus2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=ProPlus2021Volume"
    set "pid_key=FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto KiemTraCaiDat
)
if "!choice!"=="3" (
    set "xml_file=plus2024.xml"
    set "version=ProPlus2024"
    set "office_dir=ProPlus2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=ProPlus2024Volume"
    set "pid_key=XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
    goto KiemTraCaiDat
)
if "!choice!"=="4" (
    set "xml_file=standard2019.xml"
    set "version=Standard2019"
    set "office_dir=Standard2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=Standard2019Volume"
    set "pid_key=6NWWJ-YQWMR-QKGCB-6TMB3-9D9HK"
    set "exclude_app="
    goto KiemTraCaiDat
)
if "!choice!"=="5" (
    set "xml_file=standard2021.xml"
    set "version=Standard2021"
    set "office_dir=Standard2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=Standard2021Volume"
    set "pid_key=FTNWT-C6WBT-8HMGF-K9PRX-QV9H8"
    set "exclude_app="
    goto KiemTraCaiDat
)
if "!choice!"=="6" (
    set "xml_file=standard2024.xml"
    set "version=Standard2024"
    set "office_dir=Standard2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=Standard2024Volume"
    set "pid_key=V28N4-JG22K-W66P8-VTMGK-H6HGR"
    set "exclude_app="
    goto KiemTraCaiDat
)
if "!choice!"=="7" goto MenuTaiCaiOffice
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Phien Ban Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuPhienBanCai

:KiemTraCaiDat
echo [%date% %time%] Kiem Tra Office Cu Truoc Khi Cai Dat... >> "%log_file%"
set office_exists=0
for %%D in ("%ProgramFiles%\Microsoft Office" "%ProgramFiles(x86)%\Microsoft Office" "%ProgramFiles%\Common Files\Microsoft Shared\ClickToRun") do (
    if exist "%%D" set office_exists=1
)
for %%R in ("HKLM\SOFTWARE\Microsoft\Office" "HKLM\SOFTWARE\Wow6432Node\Microsoft\Office" "HKCU\SOFTWARE\Microsoft\Office" "HKLM\SOFTWARE\Microsoft\Office\ClickToRun") do (
    reg query "%%R" >nul 2>&1
    if !ERRORLEVEL! equ 0 set office_exists=1
)
if !office_exists! equ 1 (
    echo Phat Hien Office Cu. Vui long go cai dat truoc khi cai dat.
    echo [%date% %time%] Phat Hien Office Cu. Yeu Cau Go Cai Dat. >> "%log_file%"
    pause
    call install_office1_part2.bat :GoOfficeCu
    goto MenuChinh
)
goto TaoFileXML

:TaoFileXML
cls
echo [%date% %time%] Tao File XML %xml_file% Cho %version%... >> "%log_file%"
(
    echo ^<Configuration^>
    echo   ^<Add OfficeClientEdition="64" Channel="%channel%"^>
    echo     ^<Product ID="%product_id%" PIDKEY="%pid_key%"^>
    echo       ^<Language ID="MatchOS" /^>
    echo       ^<Language ID="MatchPreviousMSI" /^>
    echo       ^<Language ID="en-us" /^>
    echo       ^<Language ID="zh-cn" /^>
    echo       ^<Language ID="ko-kr" /^>
    echo       %exclude_app%
    echo     ^</Product^>
    echo   ^</Add^>
    echo   ^<Property Name="SharedComputerLicensing" Value="0" /^>
    echo   ^<Property Name="FORCEAPPSHUTDOWN" Value="FALSE" /^>
    echo   ^<Property Name="DeviceBasedLicensing" Value="0" /^>
    echo   ^<Property Name="SCLCacheOverride" Value="0" /^>
    echo   ^<Property Name="AUTOACTIVATE" Value="1" /^>
    echo   ^<Updates Enabled="TRUE" /^>
    echo   ^<RemoveMSI /^>
    echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo ^</Configuration^>
) > "%xml_file%" 2>> "%log_file%"
if not exist "%xml_file%" (
    echo Loi: Tao File XML %xml_file% That Bai.
    echo [%date% %time%] Loi: Tao File XML %xml_file% That Bai. >> "%log_file%"
    pause
    goto MenuChinh
)
echo [%date% %time%] Tao File XML %xml_file% Thanh Cong. >> "%log_file%"
goto KiemTraTaiXuong

:KiemTraTaiXuong
cls
echo [%date% %time%] Kiem Tra File Xml Va Thu Muc Office Cho %version%... >> "%log_file%"
if exist "%office_dir%\Office\Data\*.cab" (
    echo File Cai Dat Da Ton Tai Trong %office_dir%. Bo Qua Buoc Tai Xuong.
    echo [%date% %time%] File Cai Dat Da Ton Tai Trong %office_dir%. Bo Qua Buoc Tai Xuong. >> "%log_file%"
    pause
    goto AfterDownloadMenu
)
goto TaiXuong

:TaiXuong
cls
echo [%date% %time%] Kiem Tra Setup.exe Trong Thu Muc Goc... >> "%log_file%"
if not exist "setup.exe" (
    echo [%date% %time%] Khong Tim Thay Setup.exe, Tai Office Deployment Tool... >> "%log_file%"
    set "ODT_URL=https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_18526-20146.exe"
    set "TEMP_DIR=%~dp0ODT_TEMP"
    set "EXE=%TEMP%\odt.exe"
    if not exist "%TEMP_DIR%" (
        mkdir "%TEMP_DIR%" 2>> "%log_file%"
        if %ERRORLEVEL% neq 0 (
            echo Loi: Khong the tao thu muc %TEMP_DIR%. Kiem tra quyen ghi.
            echo [%date% %time%] Loi: Tao Thu Muc ODT_TEMP That Bai. >> "%log_file%"
            pause
            goto MenuChinh
        )
    )
    echo Dang tai xuong Office Deployment Tool...
    curl -L -o "%EXE%" "%ODT_URL%" --retry 5 --retry-delay 10 >> "%log_file%" 2>&1
    if not exist "%EXE%" (
        echo Loi: Khong the tai xuong Office Deployment Tool. Kiem tra ket noi mang hoac thu lai sau.
        echo [%date% %time%] Loi: Tai ODT That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    echo Dang giai nen ODT...
    "%EXE%" /quiet /extract:"%TEMP_DIR%" >> "%log_file%" 2>&1
    if not exist "%TEMP_DIR%\setup.exe" (
        echo Loi: Giai nen ODT khong thanh cong. Kiem tra file %EXE%.
        echo [%date% %time%] Loi: Giai Nen ODT That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    move /Y "%TEMP_DIR%\setup.exe" "%~dp0" >> "%log_file%" 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Loi: Di chuyen setup.exe that bai. Kiem tra quyen ghi.
        echo [%date% %time%] Loi: Di Chuyen Setup.exe That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    rmdir /S /Q "%TEMP_DIR%" >nul 2>&1
    del "%EXE%" >nul 2>&1
)
if not exist "setup.exe" (
    echo Loi: Khong Tim Thay Setup.exe Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Setup.exe. >> "%log_file%"
    pause
    goto MenuChinh
)
echo [%date% %time%] Kiem Tra Quyen Thuc Thi Setup.exe... >> "%log_file%"
setup.exe /help >nul 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    echo Loi: File setup.exe khong hop le hoac khong co quyen thuc thi. Thu tai lai ODT.
    echo [%date% %time%] Loi: Setup.exe Khong Hop Le. >> "%log_file%"
    del setup.exe >nul 2>&1
    pause
    goto TaiXuong
)
if not exist "%version%" (
    mkdir "%version%" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the tao thu muc %version%. Kiem tra quyen ghi.
        echo [%date% %time%] Loi: Tao Thu Muc %version% That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    echo [%date% %time%] Tao Thu Muc %version% Thanh Cong. >> "%log_file%"
)
if not exist "%office_dir%" (
    mkdir "%office_dir%" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the tao thu muc %office_dir%. Kiem tra quyen ghi.
        echo [%date% %time%] Loi: Tao Thu Muc %office_dir% That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    echo [%date% %time%] Tao Thu Muc %office_dir% Thanh Cong. >> "%log_file%"
)
call :CheckInternet
if !_int! equ 0 (
    echo Loi: Khong co ket noi Internet den Microsoft servers. Vui long kiem tra mang va thu lai.
    echo [%date% %time%] Loi: Khong Co Ket Noi Internet Den Microsoft Servers. >> "%log_file%"
    pause
    goto MenuChinh
)
cd /d "%~dp0%office_dir%"
set "retry_count=0"
:DownloadRetry
echo [%date% %time%] Bat Dau Tai Xuong %version% (Lan Thu !retry_count!+1)... >> "%log_file%"
start /b /wait "" "%~dp0setup.exe" /download "%~dp0%xml_file%" > download_log.txt 2>&1
set "download_error=%ERRORLEVEL%"
if !download_error! neq 0 (
    set /a retry_count+=1
    if exist download_log.txt (
        type download_log.txt >> "%log_file%"
        echo [%date% %time%] Loi: Chi tiet loi tai xuong da duoc ghi vao log. >> "%log_file%"
    )
    if !retry_count! lss 3 (
        echo Loi: Tai xuong that bai (Error: !download_error!). Thu lai lan thu !retry_count!+1...
        echo Vui long kiem tra ket noi mang hoac thu lai sau.
        echo [%date% %time%] Loi: Tai Xuong That Bai (Error: !download_error!), Thu Lai Lan !retry_count!+1. >> "%log_file%"
        ping -n 10 127.0.0.1 >nul
        goto DownloadRetry
    ) else (
        echo Loi: Tai xuong that bai sau 3 lan thu (Error: !download_error!). Kiem tra download_log.txt.
        echo Vui long kiem tra ket noi mang, file %xml_file%, hoac lien he ho tro.
        echo [%date% %time%] Loi: Tai Xuong That Bai Sau 3 Lan (Error: !download_error!). >> "%log_file%"
        cd /d "%~dp0"
        pause
        goto MenuChinh
    )
)
if exist "Office\Data\*.cab" (
    echo [%date% %time%] Tai Xuong Hoan Tat. >> "%log_file%"
    cd /d "%~dp0"
    copy /Y "setup.exe" "%office_dir%\setup.exe" >nul 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Sao Chep Setup.exe That Bai.
        echo [%date% %time%] Loi: Sao Chep Setup.exe That Bai. >> "%log_file%"
        pause
        goto MenuChinh
    )
    echo Tai Thanh Cong File Cai Dat %version% Vao %office_dir%!
    echo [%date% %time%] Tai Xuong Thanh Cong. >> "%log_file%"
    pause
    goto AfterDownloadMenu
)
echo Loi: Khong tim thay file tai xuong. Kiem tra download_log.txt.
echo [%date% %time%] Loi: Khong Tim Thay File Tai Xuong. >> "%log_file%"
if exist download_log.txt (
    type download_log.txt >> "%log_file%"
)
cd /d "%~dp0"
pause
goto MenuChinh

:AfterDownloadMenu
cls
echo Tai Thanh Cong File Cai Dat %version% Vao %office_dir%!
echo [%date% %time%] Tai Thanh Cong File Cai Dat %version% Vao %office_dir%. >> "%log_file%"
echo.
echo Ban muon lam gi tiep theo?
echo 1. Luu (Quay Ve Menu Chinh)
echo 2. Cai Dat Ngay
echo ==============================
set /p choice=Nhap Lua Chon (1-2): 
echo [%date% %time%] Nguoi Dung Chon Sau Khi Tai: !choice! >> "%log_file%"
if "!choice!"=="1" goto MenuChinh
if "!choice!"=="2" goto MenuNgonNgu
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Khong Hop Le: !choice!. >> "%log_file%"
pause
goto AfterDownloadMenu

:MenuCaiDatTuFile
cls
echo [%date% %time%] Hien Thi Menu Cai Dat Tu File Da Tai... >> "%log_file%"
echo ==================================================================
echo                 Cai Dat Office Tu File Da Tai
echo ==================================================================
set "available_versions="
set "version_count=0"
for %%v in ("ProPlus2019" "ProPlus2021" "ProPlus2024" "Standard2019" "Standard2021" "Standard2024") do (
    if exist "%%v\Office\Office\Data\*.cab" (
        set /a version_count+=1
        set "available_versions=!available_versions! %%v"
        echo !version_count!. %%v
    )
)
if !version_count! equ 0 (
    echo Khong Tim Thay File Cai Dat Nao Da Tai Truoc Do.
    echo [%date% %time%] Loi: Khong Tim Thay File Cai Dat Da Tai. >> "%log_file%"
    echo Vui long chon Tai Va Cai Dat Office tu Menu Chinh de tai file truoc.
    pause
    goto MenuChinh
)
echo !version_count!+1. Quay Lai Menu Chinh
echo ==================================================================
set /p choice=Nhap Lua Chon (1-!version_count!+1): 
set /a choice_limit=%version_count%+1
if "!choice!"=="!choice_limit!" goto MenuChinh
set /a choice_num=!choice!
if !choice_num! geq 1 if !choice_num! leq %version_count% (
    set "index=1"
    for %%v in (!available_versions!) do (
        if !index! equ !choice_num! (
            set "selected_version=%%v"
            goto ProcessSelectedVersion
        )
        set /a index+=1
    )
)
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuCaiDatTuFile

:ProcessSelectedVersion
echo [%date% %time%] Nguoi Dung Chon Cai Dat Phien Ban: !selected_version! >> "%log_file%"
if "!selected_version!"=="ProPlus2019" (
    set "xml_file=plus2019.xml"
    set "version=ProPlus2019"
    set "office_dir=ProPlus2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=ProPlus2019Volume"
    set "pid_key=NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
)
if "!selected_version!"=="ProPlus2021" (
    set "xml_file=plus2021.xml"
    set "version=ProPlus2021"
    set "office_dir=ProPlus2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=ProPlus2021Volume"
    set "pid_key=FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
)
if "!selected_version!"=="ProPlus2024" (
    set "xml_file=plus2024.xml"
    set "version=ProPlus2024"
    set "office_dir=ProPlus2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=ProPlus2024Volume"
    set "pid_key=XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB"
    set "exclude_app=^<ExcludeApp ID=\"Lync\" /^>"
)
if "!selected_version!"=="Standard2019" (
    set "xml_file=standard2019.xml"
    set "version=Standard2019"
    set "office_dir=Standard2019\Office"
    set "channel=PerpetualVL2019"
    set "product_id=Standard2019Volume"
    set "pid_key=6NWWJ-YQWMR-QKGCB-6TMB3-9D9HK"
    set "exclude_app="
)
if "!selected_version!"=="Standard2021" (
    set "xml_file=standard2021.xml"
    set "version=Standard2021"
    set "office_dir=Standard2021\Office"
    set "channel=PerpetualVL2021"
    set "product_id=Standard2021Volume"
    set "pid_key=FTNWT-C6WBT-8HMGF-K9PRX-QV9H8"
    set "exclude_app="
)
if "!selected_version!"=="Standard2024" (
    set "xml_file=standard2024.xml"
    set "version=Standard2024"
    set "office_dir=Standard2024\Office"
    set "channel=PerpetualVL2024"
    set "product_id=Standard2024Volume"
    set "pid_key=V28N4-JG22K-W66P8-VTMGK-H6HGR"
    set "exclude_app="
)
:: Tao file XML
echo [%date% %time%] Tao File XML %xml_file% Cho %version%... >> "%log_file%"
(
    echo ^<Configuration^>
    echo   ^<Add OfficeClientEdition="64" Channel="%channel%"^>
    echo     ^<Product ID="%product_id%" PIDKEY="%pid_key%"^>
    echo       ^<Language ID="MatchOS" /^>
    echo       ^<Language ID="MatchPreviousMSI" /^>
    echo       ^<Language ID="en-us" /^>
    echo       ^<Language ID="zh-cn" /^>
    echo       ^<Language ID="ko-kr" /^>
    echo       %exclude_app%
    echo     ^</Product^>
    echo   ^</Add^>
    echo   ^<Property Name="SharedComputerLicensing" Value="0" /^>
    echo   ^<Property Name="FORCEAPPSHUTDOWN" Value="FALSE" /^>
    echo   ^<Property Name="DeviceBasedLicensing" Value="0" /^>
    echo   ^<Property Name="SCLCacheOverride" Value="0" /^>
    echo   ^<Property Name="AUTOACTIVATE" Value="1" /^>
    echo   ^<Updates Enabled="TRUE" /^>
    echo   ^<RemoveMSI /^>
    echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo ^</Configuration^>
) > "%xml_file%" 2>> "%log_file%"
if not exist "%xml_file%" (
    echo Loi: Tao File XML %xml_file% That Bai.
    echo [%date% %time%] Loi: Tao File XML %xml_file% That Bai. >> "%log_file%"
    pause
    goto MenuCaiDatTuFile
)
echo [%date% %time%] Tao File XML %xml_file% Thanh Cong. >> "%log_file%"
if not exist "%office_dir%\setup.exe" (
    echo Dang Sao Chep Setup.exe Vao %office_dir%...
    echo [%date% %time%] Sao Chep Setup.exe Vao %office_dir%... >> "%log_file%"
    copy /Y "setup.exe" "%office_dir%\setup.exe" >nul 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Sao Chep Setup.exe Vao %office_dir% That Bai.
        echo [%date% %time%] Loi: Sao Chep Setup.exe That Bai. >> "%log_file%"
        pause
        goto MenuCaiDatTuFile
    ) else (
        echo Sao Chep Setup.exe Vao %office_dir% Thanh Cong.
        echo [%date% %time%] Sao Chep Setup.exe Thanh Cong. >> "%log_file%"
    )
)
goto MenuNgonNgu

:MenuNgonNgu
cls
echo [%date% %time%] Hien Thi Menu Ngon Ngu... >> "%log_file%"
echo ==================================================================
echo                   Chon Ngon Ngu Cai Dat %version%
echo ==================================================================
echo 1. MatchOS (Theo He Dieu Hanh)
echo 2. Tieng Trung (zh-cn)
echo 3. Tieng Anh (en-us)
echo 4. Tieng Han (ko-kr)
echo 5. Nhap Ngon Ngu Khac
echo 6. Quay Lai Menu Chon Phien Ban
echo ==================================================================
set /p choice=Nhap Lua Chon (1-6): 
echo [%date% %time%] Nguoi Dung Chon Ngon Ngu: !choice! >> "%log_file%"
if "!choice!"=="1" (
    set lang=MatchOS
    set lang_display=Theo He Dieu Hanh
    goto CaiDat
)
if "!choice!"=="2" (
    set lang=zh-cn
    set lang_display=Tieng Trung
    goto CaiDat
)
if "!choice!"=="3" (
    set lang=en-us
    set lang_display=Tieng Anh
    goto CaiDat
)
if "!choice!"=="4" (
    set lang=ko-kr
    set lang_display=Tieng Han
    goto CaiDat
)
if "!choice!"=="5" (
    set /p lang=Nhap ma ngon ngu (vi du: ja-jp): 
    set lang_display=Ngon Ngu Tuy Chinh (!lang!)
    goto CaiDat
)
if "!choice!"=="6" goto MenuPhienBanCai
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Ngon Ngu Khong Hop Le: !choice!. >> "%log_file%"
pause
goto MenuNgonNgu

:CaiDat
cls
echo [%date% %time%] Kiem Tra %office_dir%\setup.exe... >> "%log_file%"
if not exist "%office_dir%\setup.exe" (
    echo Loi: Khong Tim Thay %office_dir%\setup.exe. Vui Long Tai Xuong File Truoc.
    echo [%date% %time%] Loi: Khong Tim Thay %office_dir%\setup.exe. >> "%log_file%"
    pause
    goto MenuPhienBanCai
)
call install_office1_part2.bat :CheckOfficeConflict
echo Bat Dau Cai Dat %version% Voi Ngon Ngu %lang_display%...
echo [%date% %time%] Khoi Dong Cai Dat %version% Voi Ngon Ngu %lang_display%... >> "%log_file%"
cls
echo Dang Cai Dat %version% Voi Ngon Ngu %lang_display%... Vui long doi...
cd /d "%~dp0%office_dir%"
start /b /wait "" setup.exe /configure "%~dp0%xml_file%" > install_log_detail.txt 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Cai dat that bai. Kiem tra file install_log_detail.txt de xem chi tiet loi.
    echo [%date% %time%] Loi: Cai Dat That Bai. >> "%log_file%"
    if exist install_log_detail.txt (
        type install_log_detail.txt >> "%log_file%"
    )
    cd /d "%~dp0"
    pause
    goto MenuPhienBanCai
)
cd /d "%~dp0"
taskkill /im setup.exe /f >nul 2>> "%log_file%"
echo [%date% %time%] Len Cai Dat Da Thuc Thi. Kiem Tra Log Tai install_log_detail.txt. >> "%log_file%"
:: Verify installation
reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds > "%temp%\install_check.txt" 2>> "%log_file%"
if %ERRORLEVEL% equ 0 (
    echo Da Cai Dat %version% Voi Ngon Ngu %lang_display% Thanh Cong.
    echo [%date% %time%] Da Cai Dat %version% Thanh Cong. >> "%log_file%"
) else (
    echo Loi: Cai dat khong thanh cong. Kiem tra registry.
    echo [%date% %time%] Loi: Kiem Tra Registry Cai Dat That Bai. >> "%log_file%"
)
del "%temp%\install_check.txt" >nul 2>&1
pause
goto MenuPhienBanCai
@echo off
setlocal EnableDelayedExpansion

:: Thiet lap thu muc lam viec
cd /d "%~dp0"
set "log_file=install_log_%date:~-4%%date:~3,2%%date:~0,2%.txt"

:: Chuyen den nhan duoc goi
goto %1

:CheckInternet
echo [%date% %time%] Kiem Tra Ket Noi Internet... >> "%log_file%"
powershell -Command "if (Test-Connection -ComputerName officecdn.microsoft.com -Count 1 -Quiet -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }" >nul 2>> "%log_file%"
if !ERRORLEVEL! equ 0 (
    set "_int=1"
    echo [%date% %time%] Ket Noi Internet Thanh Cong (officecdn.microsoft.com). >> "%log_file%"
) else (
    set "_int=0"
    echo [%date% %time%] Loi: Khong Co Ket Noi Internet Den Microsoft Servers. >> "%log_file%"
)
goto :eof

:CheckOfficeConflict
set "conflict=0"
reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds > "%temp%\office_conflict.txt" 2>> "%log_file%"
if %ERRORLEVEL% equ 0 (
    for /f "tokens=2,*" %%I in ('type "%temp%\office_conflict.txt"') do (
        if not "%%J"=="%product_id%" (
            set "conflict=1"
            echo Canh bao: Phat hien phien ban Office khac (%J) da cai dat.
            echo Vui long go cai dat Office cu truoc khi tiep tuc.
            echo [%date% %time%] Canh Bao: Phat Hien Phien Ban Office Khac (%J). >> "%log_file%"
            pause
            call :GoOfficeCu
            exit /b 0
        )
    )
)
del "%temp%\office_conflict.txt" >nul 2>&1
exit /b 0

:GoOfficeCu
cls
echo [%date% %time%] Go Office Da Cai Dat Truoc Do... >> "%log_file%"
if not exist "setup.exe" (
    echo Loi: Khong Tim Thay Setup.exe Trong Thu Muc Hien Tai.
    echo [%date% %time%] Loi: Khong Tim Thay Setup.exe. >> "%log_file%"
    pause
    exit /b 0
)
:: Stop Office processes
echo [%date% %time%] Dung Cac Tien Trinh Office... >> "%log_file%"
taskkill /f /im WINWORD.EXE /im EXCEL.EXE /im POWERPNT.EXE /im OUTLOOK.EXE /im OfficeClickToRun.exe >nul 2>> "%log_file%"
:: Stop Office services
echo [%date% %time%] Dung Dich Vu Office... >> "%log_file%"
net stop ClickToRunSvc >nul 2>> "%log_file%"
net stop OfficeSvc >nul 2>> "%log_file%"
:: Create removal XML
(
    echo ^<Configuration^>
    echo   ^<Remove All="TRUE" /^>
    echo   ^<RemoveMSI /^>
    echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo ^</Configuration^>
) > remove_office.xml 2>> "%log_file%"
if not exist "remove_office.xml" (
    echo Loi: Tao File XML remove_office.xml That Bai.
    echo [%date% %time%] Loi: Tao File XML remove_office.xml That Bai. >> "%log_file%"
    pause
    exit /b 0
)
echo Dang Go Office Da Cai Dat Truoc Do... Vui long doi...
echo [%date% %time%] Bat Dau Go Cai Dat Office... >> "%log_file%"
start /b /wait "" setup.exe /configure remove_office.xml > remove_log.txt 2>&1
set "uninstall_error=%ERRORLEVEL%"
if !uninstall_error! neq 0 (
    echo Loi: Go cai dat Office that bai. Kiem tra remove_log.txt.
    echo [%date% %time%] Loi: Go Cai Dat Office That Bai (Error: !uninstall_error!). >> "%log_file%"
    if exist remove_log.txt (
        type remove_log.txt >> "%log_file%"
    )
    del remove_office.xml >nul 2>&1
    pause
    exit /b 0
)
echo [%date% %time%] Go Cai Dat Office Thanh Cong Qua Setup.exe. >> "%log_file%"
:: Comprehensive file cleanup
echo [%date% %time%] Xoa Thu Muc Office Con Lai... >> "%log_file%"
for %%D in (
    "%ProgramFiles%\Microsoft Office"
    "%ProgramFiles(x86)%\Microsoft Office"
    "%ProgramFiles%\Common Files\Microsoft Shared\ClickToRun"
    "%ProgramData%\Microsoft\Office"
    "%AppData%\Microsoft\Office"
    "%LocalAppData%\Microsoft\Office"
) do (
    if exist "%%D" (
        rd /s /q "%%D" >nul 2>> "%log_file%"
        if not exist "%%D" (
            echo Xoa Thu Muc %%D Thanh Cong.
            echo [%date% %time%] Xoa Thu Muc %%D Thanh Cong. >> "%log_file%"
        ) else (
            echo Loi: Xoa Thu Muc %%D That Bai.
            echo [%date% %time%] Loi: Xoa Thu Muc %%D That Bai. >> "%log_file%"
        )
    )
)
:: Comprehensive registry cleanup
echo [%date% %time%] Xoa Registry Office... >> "%log_file%"
for %%R in (
    "HKLM\SOFTWARE\Microsoft\Office"
    "HKLM\SOFTWARE\Wow6432Node\Microsoft\Office"
    "HKCU\SOFTWARE\Microsoft\Office"
    "HKLM\SOFTWARE\Microsoft\Office\ClickToRun"
    "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform"
) do (
    reg delete "%%R" /f >nul 2>> "%log_file%"
    if !ERRORLEVEL! equ 0 (
        echo Xoa Registry %%R Thanh Cong.
        echo [%date% %time%] Xoa Registry %%R Thanh Cong. >> "%log_file%"
    ) else (
        echo Loi: Xoa Registry %%R That Bai.
        echo [%date% %time%] Loi: Xoa Registry %%R That Bai. >> "%log_file%"
    )
)
del remove_office.xml >nul 2>&1
if exist remove_log.txt (
    type remove_log.txt >> "%log_file%"
)
:: Verify removal
set "remnants_found=0"
for %%D in (
    "%ProgramFiles%\Microsoft Office"
    "%ProgramFiles(x86)%\Microsoft Office"
    "%ProgramFiles%\Common Files\Microsoft Shared\ClickToRun"
) do (
    if exist "%%D" set remnants_found=1
)
for %%R in (
    "HKLM\SOFTWARE\Microsoft\Office\ClickToRun"
) do (
    reg query "%%R" >nul 2>&1
    if !ERRORLEVEL! equ 0 set remnants_found=1
)
if !remnants_found! equ 1 (
    echo Canh bao: Van con mot so du lieu Office. Vui long su dung Microsoft Support and Recovery Assistant (SaRA) de go cai dat hoan toan.
    echo [%date% %time%] Canh Bao: Phat Hien Du Lieu Office Con Sot Lai. >> "%log_file%"
) else (
    echo Go Office Da Cai Dat Truoc Do Thanh Cong.
    echo [%date% %time%] Go Cai Dat Office Thanh Cong. >> "%log_file%"
)
pause
exit /b 0

:KichHoat
cls
echo [%date% %time%] Hien Thi Menu Kich Hoat... >> "%log_file%"
echo ==================================================================
echo                   Kich Hoat Windows Hoac Office
echo ==================================================================
echo 1. Kich Hoat Su Dung MAS
echo 2. Cap Nhat MAS
echo 3. Nhap Key Kich Hoat
echo 4. Quay Lai Menu Chinh
echo ==================================================================
set /p choice=Nhap Lua Chon (1-4): 
echo [%date% %time%] Nguoi Dung Chon: !choice! >> "%log_file%"
if "!choice!"=="1" (
    if not exist "%~dp0MAS\MAS_AIO.cmd" (
        echo Loi: Microsoft Activation Scripts (MAS) chua duoc cai dat.
        echo Vui long chon [2] Cap Nhat MAS de tai ve truoc.
        echo [%date% %time%] Loi: MAS Chua Duoc Cai Dat. >> "%log_file%"
        pause
        goto KichHoat
    )
    echo Dang Mo Microsoft Activation Scripts...
    echo [%date% %time%] Mo MAS... >> "%log_file%"
    cd /d "%~dp0MAS"
    call "%~dp0MAS\MAS_AIO.cmd" >> "%log_file%" 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the mo MAS_AIO.cmd. Kiem tra file hoac thu lai.
        echo [%date% %time%] Loi: Mo MAS That Bai. >> "%log_file%"
    ) else (
        echo Vui long chon tuy chon kich hoat trong giao dien MAS.
        echo [%date% %time%] Da Mo MAS Thanh Cong. >> "%log_file%"
    )
    cd /d "%~dp0"
    pause
)
if "!choice!"=="2" (
    echo [%date% %time%] Cap Nhat Microsoft Activation Scripts... >> "%log_file%"
    call :CheckInternet
    if !_int! equ 0 (
        echo Loi: Khong co ket noi Internet. Chuc nang nay yeu cau ket noi mang.
        echo [%date% %time%] Loi: Khong Co Ket Noi Internet. >> "%log_file%"
        pause
        goto KichHoat
    )
    echo Dang Tai Xuong MAS Moi Nhat...
    echo [%date% %time%] Tai Xuong MAS... >> "%log_file%"
    if exist "MAS" rd /s /q "MAS" >nul 2>> "%log_file%"
    curl -L -o "MAS_Latest.zip" "https://massgrave.dev/get" --retry 5 --retry-delay 10 >> "%log_file%" 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Loi: Tai MAS that bai. Vui long kiem tra ket noi mang.
        echo [%date% %time%] Loi: Tai MAS That Bai. >> "%log_file%"
        pause
        goto KichHoat
    )
    echo Dang Giai Nen MAS...
    echo [%date% %time%] Giai Nen MAS... >> "%log_file%"
    powershell -Command "Expand-Archive -Path 'MAS_Latest.zip' -DestinationPath 'MAS' -Force" >nul 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Giai nen MAS that bai.
        echo [%date% %time%] Loi: Giai Nen MAS That Bai. >> "%log_file%"
    ) else (
        echo Cap Nhat MAS Thanh Cong.
        echo [%date% %time%] Cap Nhat MAS Thanh Cong. >> "%log_file%"
    )
    del MAS_Latest.zip >nul 2>&1
    pause
)
if "!choice!"=="3" (
    echo Nhap key kich hoat (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX):
    set /p key=
    if "!key!"=="" (
        echo Loi: Key khong hop le.
        echo [%date% %time%] Loi: Key Khong Hop Le. >> "%log_file%"
        pause
        goto KichHoat
    )
    echo Kich hoat Windows hay Office?
    echo 1. Windows
    echo 2. Office
    echo 3. Quay Lai
    set /p key_choice=Nhap Lua Chon (1-3): 
    if "!key_choice!"=="1" (
        cscript //nologo %windir%\system32\slmgr.vbs /ipk !key! >nul 2>> "%log_file%"
        if %ERRORLEVEL% neq 0 (
            echo Loi: Cai dat key Windows that bai.
            echo [%date% %time%] Loi: Cai Dat Key Windows That Bai. >> "%log_file%"
        ) else (
            cscript //nologo %windir%\system32\slmgr.vbs /ato >nul 2>> "%log_file%"
            if %ERRORLEVEL% neq 0 (
                echo Loi: Kich hoat Windows that bai.
                echo [%date% %time%] Loi: Kich Hoat Windows That Bai. >> "%log_file%"
            ) else (
                echo Kich hoat Windows thanh cong.
                echo [%date% %time%] Kich Hoat Windows Thanh Cong. >> "%log_file%"
            )
        )
    )
    if "!key_choice!"=="2" (
        set "ospp_found=0"
        for %%a in (4,5,6) do (
            if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
                cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
                set "ospp_found=1"
            )
            if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
                cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
                set "ospp_found=1"
            )
        )
        if "!ospp_found!"=="1" (
            cscript //nologo ospp.vbs /inpkey:!key! >nul 2>> "%log_file%"
            if %ERRORLEVEL% neq 0 (
                echo Loi: Cai dat key Office that bai.
                echo [%date% %time%] Loi: Cai Dat Key Office That Bai. >> "%log_file%"
            ) else (
                cscript //nologo ospp.vbs /act >nul 2>> "%log_file%"
                if %ERRORLEVEL% neq 0 (
                    echo Loi: Kich hoat Office that bai.
                    echo [%date% %time%] Loi: Kich Hoat Office That Bai. >> "%log_file%"
                ) else (
                    echo Kich hoat Office thanh cong.
                    echo [%date% %time%] Kich Hoat Office Thanh Cong. >> "%log_file%"
                )
            )
        ) else (
            echo Loi: Office khong duoc cai dat hoac khong tim thay ospp.vbs.
            echo [%date% %time%] Loi: Office Khong Duoc Cai Dat. >> "%log_file%"
        )
        cd /d "%~dp0"
    )
    if "!key_choice!"=="3" goto KichHoat
    echo Lua chon khong hop le. Vui long nhap lai.
    echo [%date% %time%] Loi: Lua Chon Kich Hoat Khong Hop Le: !key_choice!. >> "%log_file%"
    pause
    goto KichHoat
)
if "!choice!"=="4" exit /b 0
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Kich Hoat Khong Hop Le: !choice!. >> "%log_file%"
pause
goto KichHoat

:KiemTraTrangThai
cls
echo [%date% %time%] Kiem Tra Trang Thai Kich Hoat... >> "%log_file%"
echo Trang Thai Kich Hoat Windows:
echo [%date% %time%] Kiem Tra Windows... >> "%log_file%"
cscript //nologo %windir%\system32\slmgr.vbs /dli > "%temp%\win_status.txt" 2>> "%log_file%"
if %ERRORLEVEL% equ 0 (
    for /f "tokens=2*" %%a in ('type "%temp%\win_status.txt" ^| findstr /i "License Status"') do set "win_status=%%b"
    for /f "tokens=2*" %%a in ('type "%temp%\win_status.txt" ^| findstr /i "Description"') do set "win_type=%%b"
    for /f "tokens=2*" %%a in ('type "%temp%\win_status.txt" ^| findstr /i "Partial Product Key"') do set "win_key=%%b"
    if "!win_status!"=="" set "win_status=Chua Kich Hoat"
    if "!win_key!"=="" set "win_key=Khong Co"
    if /i "!win_status!"=="Licensed" set "win_status=Da Kich Hoat"
    echo Trang thai: !win_status!
    echo Loai key: !win_type!
    echo Key: XXXXX-XXXXX-XXXXX-XXXXX-!win_key!
) else (
    echo Trang thai: Chua Kich Hoat
    echo Loai key: Khong Co
    echo Key: Khong Co
    echo [%date% %time%] Loi: Kiem Tra Windows That Bai. >> "%log_file%"
)
del "%temp%\win_status.txt" >nul 2>&1
echo.
echo Trang Thai Kich Hoat Office:
echo [%date% %time%] Kiem Tra Office... >> "%log_file%"
set "ospp_found=0"
set "office_status=Chua Kich Hoat"
set "office_key=Khong Co"
for %%a in (4,5,6) do (
    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
)
if "!ospp_found!"=="1" (
    cscript //nologo ospp.vbs /dstatus > "%temp%\office_status.txt" 2>> "%log_file%"
    if %ERRORLEVEL% equ 0 (
        for /f "tokens=2*" %%a in ('type "%temp%\office_status.txt" ^| findstr /i "LICENSE STATUS"') do set "office_status=%%b"
        for /f "tokens=3*" %%a in ('type "%temp%\office_status.txt" ^| findstr /i "Product Key"') do set "office_key=%%b"
        if "!office_status!"=="" set "office_status=Chua Kich Hoat"
        if "!office_key!"=="" set "office_key=Khong Co"
        if /i "!office_status!"=="LICENSED" set "office_status=Da Kich Hoat"
    ) else (
        echo [%date% %time%] Loi: Kiem Tra Office That Bai. >> "%log_file%"
    )
    del "%temp%\office_status.txt" >nul 2>&1
) else (
    echo [%date% %time%] Loi: Office Khong Duoc Cai Dat. >> "%log_file%"
)
echo Trang thai: !office_status!
echo Key: !office_key!
cd /d "%~dp0"
pause
exit /b 0

:GoKeyOfficeCu
cls
echo [%date% %time%] Go Key Office Cu... >> "%log_file%"
set "ospp_found=0"
set "keys_removed=0"
for %%a in (4,5,6) do (
    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
        echo [%date% %time%] Tim Thay ospp.vbs Tai Office1%%a. >> "%log_file%"
    )
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
        echo [%date% %time%] Tim Thay ospp.vbs Tai Office1%%a (x86). >> "%log_file%"
    )
)
if "!ospp_found!"=="1" (
    cscript //nologo ospp.vbs /dstatus > "%temp%\office_keys.txt" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the lay danh sach key Office.
        echo [%date% %time%] Loi: Lay Danh Sach Key Office That Bai. >> "%log_file%"
        cd /d "%~dp0"
        pause
        exit /b 0
    )
    for /f "tokens=8" %%b in ('type "%temp%\office_keys.txt" ^| findstr /b /c:"Last 5"') do (
        echo Dang xoa key voi 5 ky tu cuoi: %%b...
        echo [%date% %time%] Dang Xoa Key Office: %%b... >> "%log_file%"
        cscript //nologo ospp.vbs /unpkey:%%b >> "%log_file%" 2>&1
        if %ERRORLEVEL% neq 0 (
            echo Loi: Xoa key %%b that bai.
            echo [%date% %time%] Loi: Xoa Key %%b That Bai. >> "%log_file%"
        ) else (
            echo Xoa key %%b thanh cong.
            echo [%date% %time%] Xoa Key %%b Thanh Cong. >> "%log_file%"
            set /a keys_removed+=1
        )
    )
    del "%temp%\office_keys.txt" >nul 2>&1
    if !keys_removed! equ 0 (
        echo Khong tim thay key Office nao de xoa.
        echo [%date% %time%] Khong Tim Thay Key Office De Xoa. >> "%log_file%"
    ) else (
        echo Da xoa !keys_removed! key Office thanh cong.
        echo [%date% %time%] Da Xoa !keys_removed! Key Office Thanh Cong. >> "%log_file%"
    )
) else (
    echo Loi: Office khong duoc cai dat hoac khong tim thay ospp.vbs.
    echo [%date% %time%] Loi: Office Khong Duoc Cai Dat. >> "%log_file%"
)
cd /d "%~dp0"
pause
exit /b 0

:SaoLuuBanQuyen
cls
echo [%date% %time%] Sao Luu Ban Quyen... >> "%log_file%"
if not exist "%~dp0Backup" (
    mkdir "%~dp0Backup" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the tao thu muc Backup. Kiem tra quyen ghi.
        echo [%date% %time%] Loi: Tao Thu Muc Backup That Bai. >> "%log_file%"
        pause
        exit /b 0
    )
    echo [%date% %time%] Tao Thu Muc Backup Thanh Cong. >> "%log_file%"
)
echo Sao Luu Key Windows...
echo [%date% %time%] Sao Luu Key Windows... >> "%log_file%"
echo Windows License Details: > "%~dp0backup_keys.txt" 2>> "%log_file%"
cscript //nologo %windir%\system32\slmgr.vbs /dlv >> "%~dp0backup_keys.txt" 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    echo Loi: Sao luu key Windows that bai.
    echo [%date% %time%] Loi: Sao Luu Key Windows That Bai. >> "%log_file%"
    pause
    exit /b 0
)
echo Sao Luu Key Office...
echo [%date% %time%] Sao Luu Key Office... >> "%log_file%"
echo Office License Details: >> "%~dp0backup_keys.txt" 2>> "%log_file%"
set "ospp_found=0"
for %%a in (4,5,6) do (
    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
)
if "!ospp_found!"=="1" (
    cscript //nologo ospp.vbs /dstatusall >> "%~dp0backup_keys.txt" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Sao luu key Office that bai.
        echo [%date% %time%] Loi: Sao Luu Key Office That Bai. >> "%log_file%"
        cd /d "%~dp0"
        pause
        exit /b 0
    )
) else (
    echo Office: Not Installed >> "%~dp0backup_keys.txt" 2>> "%log_file%"
)
echo Sao Luu License Store...
if not exist "%windir%\System32\spp\store" (
    echo Loi: Khong tim thay thu muc license store Windows.
    echo [%date% %time%] Loi: Khong Tim Thay Thu Muc SPP Store. >> "%log_file%"
    cd /d "%~dp0"
    pause
    exit /b 0
)
xcopy "%windir%\System32\spp\store" "%~dp0Backup\spp_store" /e /h /q /y >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Sao luu license store Windows that bai. Kiem tra quyen ghi.
    echo [%date% %time%] Loi: Sao Luu License Store Windows That Bai. >> "%log_file%"
    cd /d "%~dp0"
    pause
    exit /b 0
)
if exist "%ProgramData%\Microsoft\OfficeSoftwareProtectionPlatform" (
    xcopy "%ProgramData%\Microsoft\OfficeSoftwareProtectionPlatform" "%~dp0Backup\osp_store" /e /h /q /y >> "%log_file%" 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Loi: Sao luu license store Office that bai. Kiem tra quyen ghi.
        echo [%date% %time%] Loi: Sao Luu License Store Office That Bai. >> "%log_file%"
        cd /d "%~dp0"
        pause
        exit /b 0
    )
)
cd /d "%~dp0"
echo Key ban quyen da duoc luu vao backup_keys.txt va license store vao Backup.
echo [%date% %time%] Sao Luu Key Thanh Cong. >> "%log_file%"
pause
exit /b 0

:KhoiPhucBanQuyen
cls
echo [%date% %time%] Khoi Phuc Ban Quyen... >> "%log_file%"
if not exist "%~dp0Backup\spp_store" (
    echo Loi: Khong tim thay thu muc sao luu license store.
    echo [%date% %time%] Loi: Khong Tim Thay Backup License Store. >> "%log_file%"
    pause
    exit /b 0
)
echo Dang dung dich vu...
net stop sppsvc >nul 2>> "%log_file%"
net stop osppsvc >nul 2>> "%log_file%"
echo Dang khoi phuc license store...
xcopy "%~dp0Backup\spp_store" "%windir%\System32\spp\store" /e /h /q /y >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Khoi phuc license store Windows that bai.
    echo [%date% %time%] Loi: Khoi Phuc License Store Windows That Bai. >> "%log_file%"
    pause
    exit /b 0
)
if exist "%~dp0Backup\osp_store" (
    xcopy "%~dp0Backup\osp_store" "%ProgramData%\Microsoft\OfficeSoftwareProtectionPlatform" /e /h /q /y >> "%log_file%" 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khoi phuc license store Office that bai.
        echo [%date% %time%] Loi: Khoi Phuc License Store Office That Bai. >> "%log_file%"
        pause
        exit /b 0
    )
)
echo Khoi dong dich vu...
sc config sppsvc start= auto >nul 2>> "%log_file%"
net start sppsvc >nul 2>> "%log_file%"
sc config osppsvc start= auto >nul 2>> "%log_file%"
net start osppsvc >nul 2>> "%log_file%"
sc config wuauserv start= auto >nul 2>> "%log_file%"
net start wuauserv >nul 2>> "%log_file%"
sc config LicenseManager start= auto >nul 2>> "%log_file%"
net start LicenseManager >nul 2>> "%log_file%"
cscript //nologo %windir%\system32\slmgr.vbs /rilc >nul 2>> "%log_file%"
echo Kiem tra trang thai...
cscript //nologo %windir%\system32\slmgr.vbs /dli
set "ospp_found=0"
for %%a in (4,5,6) do (
    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
)
if "!ospp_found!"=="1" (
    cscript //nologo ospp.vbs /dstatus
)
cd /d "%~dp0"
pause
exit /b 0

:XoaKeyWinOffice
cls
echo [%date% %time%] Hien Thi Menu Xoa Key Windows/Office... >> "%log_file%"
echo ==================================================================
echo                   Xoa Key Ban Quyen Windows/Office
echo ==================================================================
echo 1. Xoa Key Windows
echo 2. Xoa Key Office
echo 3. Quay Lai Menu Chinh
echo ==================================================================
set /p choice=Nhap Lua Chon (1-3): 
echo [%date% %time%] Nguoi Dung Chon: !choice! >> "%log_file%"
if "!choice!"=="1" (
    echo Dang Xoa Key Windows...
    echo [%date% %time%] Xoa Key Windows... >> "%log_file%"
    cscript //nologo %windir%\system32\slmgr.vbs /cpky >nul 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Xoa key Windows that bai.
        echo [%date% %time%] Loi: Xoa Key Windows That Bai. >> "%log_file%"
    ) else (
        echo Xoa Key Windows Thanh Cong.
        echo [%date% %time%] Xoa Key Windows Thanh Cong. >> "%log_file%"
    )
    pause
)
if "!choice!"=="2" (
    echo Dang Xoa Key Office...
    echo [%date% %time%] Xoa Key Office... >> "%log_file%"
    set "ospp_found=0"
    set "keys_removed=0"
    for %%a in (4,5,6) do (
        if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
            cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
            set "ospp_found=1"
            echo [%date% %time%] Tim Thay ospp.vbs Tai Office1%%a. >> "%log_file%"
        )
        if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
            cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
            set "ospp_found=1"
            echo [%date% %time%] Tim Thay ospp.vbs Tai Office1%%a (x86). >> "%log_file%"
        )
    )
    if "!ospp_found!"=="1" (
        cscript //nologo ospp.vbs /dstatus > "%temp%\office_keys.txt" 2>> "%log_file%"
        if %ERRORLEVEL% neq 0 (
            echo Loi: Khong the lay danh sach key Office.
            echo [%date% %time%] Loi: Lay Danh Sach Key Office That Bai. >> "%log_file%"
        ) else (
            for /f "tokens=8" %%b in ('type "%temp%\office_keys.txt" ^| findstr /b /c:"Last 5"') do (
                echo Dang xoa key voi 5 ky tu cuoi: %%b...
                echo [%date% %time%] Dang Xoa Key Office: %%b... >> "%log_file%"
                cscript //nologo ospp.vbs /unpkey:%%b >> "%log_file%" 2>&1
                if %ERRORLEVEL% neq 0 (
                    echo Loi: Xoa key %%b that bai.
                    echo [%date% %time%] Loi: Xoa Key %%b That Bai. >> "%log_file%"
                ) else (
                    echo Xoa key %%b thanh cong.
                    echo [%date% %time%] Xoa Key %%b Thanh Cong. >> "%log_file%"
                    set /a keys_removed+=1
                )
            )
            if !keys_removed! equ 0 (
                echo Khong tim thay key Office nao de xoa.
                echo [%date% %time%] Khong Tim Thay Key Office De Xoa. >> "%log_file%"
            ) else (
                echo Da xoa !keys_removed! key Office thanh cong.
                echo [%date% %time%] Da Xoa !keys_removed! Key Office Thanh Cong. >> "%log_file%"
            )
        )
        del "%temp%\office_keys.txt" >nul 2>&1
    ) else (
        echo Loi: Office khong duoc cai dat hoac khong tim thay ospp.vbs.
        echo [%date% %time%] Loi: Office Khong Duoc Cai Dat. >> "%log_file%"
    )
    cd /d "%~dp0"
    pause
)
if "!choice!"=="3" exit /b 0
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Xoa Key Khong Hop Le: !choice!. >> "%log_file%"
pause
goto XoaKeyWinOffice

:ThietLapWordExcel
cls
echo [%date% %time%] Hien Thi Menu Thiet Lap Word/Excel... >> "%log_file%"
echo ==================================================================
echo                   Thiet Lap Mac Dinh Word/Excel
echo ==================================================================
echo 1. Thiet Lap Word
echo 2. Thiet Lap Excel
echo 3. Quay Lai Menu Chinh
echo ==================================================================
set /p choice=Nhap Lua Chon (1-3): 
echo [%date% %time%] Nguoi Dung Chon: !choice! >> "%log_file%"
if "!choice!"=="1" goto ThietLapWord
if "!choice!"=="2" goto ThietLapExcel
if "!choice!"=="3" exit /b 0
echo Lua chon khong hop le. Vui long nhap lai.
echo [%date% %time%] Loi: Lua Chon Thiet Lap Khong Hop Le: !choice!. >> "%log_file%"
pause
goto ThietLapWordExcel

:ThietLapWord
cls
echo Dang Thiet Lap Mac Dinh Cho Word...
echo [%date% %time%] Khoi Dong Thiet Lap Mac Dinh Cho Word... >> "%log_file%"
set "word_path=%ProgramFiles%\Microsoft Office\root\Office16\WINWORD.EXE"
if not exist "!word_path!" set "word_path=%ProgramFiles(x86)%\Microsoft Office\root\Office16\WINWORD.EXE"
if not exist "!word_path!" (
    echo Loi: Khong Tim Thay Microsoft Word. Vui Long Cai Dat Word Truoc.
    echo [%date% %time%] Loi: Khong Tim Thay Microsoft Word. >> "%log_file%"
    pause
    goto ThietLapWordExcel
)
chcp 65001 >nul
(
    echo On Error Resume Next
    echo Set objWord = CreateObject("Word.Application")
    echo If Err.Number ^<^> 0 Then
    echo     WScript.Echo "Loi: Khong the khoi tao Word. Err: " ^& Err.Description
    echo     WScript.Quit 1
    echo End If
    echo objWord.Visible = False
    echo objWord.DisplayAlerts = False
    echo Set objDoc = objWord.Documents.Add
    echo objDoc.Styles("Normal").Font.Name = "Times New Roman"
    echo objDoc.Styles("Normal").Font.Size = 14
    echo objDoc.Styles("Normal").ParagraphFormat.SpaceBefore = 0
    echo objDoc.Styles("Normal").ParagraphFormat.SpaceAfter = 0
    echo objDoc.Styles("Normal").ParagraphFormat.LineSpacingRule = 2
    echo objDoc.Styles("Normal").ParagraphFormat.LineSpacing = objWord.LinesToPoints(1.15)
    echo objWord.Options.MeasurementUnit = 1
    echo objDoc.PageSetup.PageWidth = 21 * 28.35
    echo objDoc.PageSetup.PageHeight = 29.7 * 28.35
    echo objDoc.PageSetup.LeftMargin = 2.5 * 28.35
    echo objDoc.PageSetup.RightMargin = 1.5 * 28.35
    echo objDoc.PageSetup.TopMargin = 1.5 * 28.35
    echo objDoc.PageSetup.BottomMargin = 1.5 * 28.35
    echo objWord.Options.CheckSpellingAsYouType = False
    echo objDoc.SaveAs "%temp%\template.dotx"
    echo objDoc.Close
    echo objWord.Quit
) > "%temp%\word_setup.vbs"
cscript //nologo "%temp%\word_setup.vbs" >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Thiet lap mac dinh Word that bai. Kiem tra log.
    echo [%date% %time%] Loi: Thiet Lap Word That Bai. >> "%log_file%"
) else (
    echo Thiet lap mac dinh Word thanh cong.
    echo [%date% %time%] Thiet Lap Word Thanh Cong. >> "%log_file%"
)
del "%temp%\word_setup.vbs" >nul 2>&1
pause
goto ThietLapWordExcel

:ThietLapExcel
cls
echo Dang Thiet Lap Mac Dinh Cho Excel...
echo [%date% %time%] Khoi Dong Thiet Lap Mac Dinh Cho Excel... >> "%log_file%"
set "excel_path=%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE"
if not exist "!excel_path!" set "excel_path=%ProgramFiles(x86)%\Microsoft Office\root\Office16\EXCEL.EXE"
if not exist "!excel_path!" (
    echo Loi: Khong Tim Thay Microsoft Excel. Vui Long Cai Dat Excel Truoc.
    echo [%date% %time%] Loi: Khong Tim Thay Microsoft Excel. >> "%log_file%"
    pause
    goto ThietLapWordExcel
)
chcp 65001 >nul
(
    echo On Error Resume Next
    echo Set objExcel = CreateObject("Excel.Application")
    echo If Err.Number ^<^> 0 Then
    echo     WScript.Echo "Loi: Khong the khoi tao Excel. Err: " ^& Err.Description
    echo     WScript.Quit 1
    echo End If
    echo objExcel.Visible = False
    echo objExcel.DisplayAlerts = False
    echo Set objWorkbook = objExcel.Workbooks.Add
    echo objExcel.Cells.Font.Name = "Calibri"
    echo objExcel.Cells.Font.Size = 11
    echo objExcel.ActiveWindow.Zoom = 100
    echo objExcel.ActiveSheet.Cells(1,1).Select
    echo objWorkbook.SaveAs "%temp%\template.xlsx"
    echo objWorkbook.Close
    echo objExcel.Quit
) > "%temp%\excel_setup.vbs"
cscript //nologo "%temp%\excel_setup.vbs" >> "%log_file%" 2>&1
if %ERRORLEVEL% neq 0 (
    echo Loi: Thiet lap mac dinh Excel that bai. Kiem tra log.
    echo [%date% %time%] Loi: Thiet Lap Excel That Bai. >> "%log_file%"
) else (
    echo Thiet lap mac dinh Excel thanh cong.
    echo [%date% %time%] Thiet Lap Excel Thanh Cong. >> "%log_file%"
)
del "%temp%\excel_setup.vbs" >nul 2>&1
pause
goto ThietLapWordExcel

:LayKeyBanQuyen
cls
echo [%date% %time%] Lay Key Kich Hoat Ban Quyen Microsoft... >> "%log_file%"
echo Lay Key Ban Quyen Windows...
echo [%date% %time%] Lay Key Windows... >> "%log_file%"
echo Windows Product Key: > "%~dp0microsoft_keys.txt" 2>> "%log_file%"
powershell -Command "(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey" >> "%~dp0microsoft_keys.txt" 2>> "%log_file%"
if %ERRORLEVEL% neq 0 (
    echo Loi: Khong the lay key Windows.
    echo [%date% %time%] Loi: Lay Key Windows That Bai. >> "%log_file%"
) else (
    echo Key Windows da duoc luu vao microsoft_keys.txt.
    echo [%date% %time%] Lay Key Windows Thanh Cong. >> "%log_file%"
)
echo.
echo Lay Key Ban Quyen Office...
echo [%date% %time%] Lay Key Office... >> "%log_file%"
echo Office Product Key: >> "%~dp0microsoft_keys.txt" 2>> "%log_file%"
set "ospp_found=0"
for %%a in (4,5,6) do (
    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        set "ospp_found=1"
    )
)
if "!ospp_found!"=="1" (
    cscript //nologo ospp.vbs /dstatus > "%temp%\office_keys.txt" 2>> "%log_file%"
    if %ERRORLEVEL% neq 0 (
        echo Loi: Khong the lay key Office.
        echo [%date% %time%] Loi: Lay Key Office That Bai. >> "%log_file%"
    ) else (
        for /f "tokens=3*" %%a in ('type "%temp%\office_keys.txt" ^| findstr /i "Product Key"') do (
            echo %%a >> "%~dp0microsoft_keys.txt"
        )
        echo Key Office da duoc luu vao microsoft_keys.txt.
        echo [%date% %time%] Lay Key Office Thanh Cong. >> "%log_file%"
    )
    del "%temp%\office_keys.txt" >nul 2>&1
) else (
    echo Loi: Office khong duoc cai dat hoac khong tim thay ospp.vbs.
    echo [%date% %time%] Loi: Office Khong Duoc Cai Dat. >> "%log_file%"
)
cd /d "%~dp0"
echo.
echo Key ban quyen da duoc luu vao microsoft_keys.txt.
pause
exit /b 0
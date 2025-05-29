::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDlVTwyWNWWyFr0T5u/H2eODp0IOaO4wf4CW27qGbfAb61Gpep1ghCoIy5hCBRhXHg==
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRnVphFQ
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDlVTwyWNWWyFr0T5u/Hy++UqVkSRN4eTqPk8Z2gCNMmyHnFQ7oS/VN0sPg5Lid6SiLrWiAbhS4Q5jbQecKEtm8=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@Echo off 
title "Anh Phat"
color E1
::Get APIkey From https://khoatoantin.com/pidms
set "apikey=nVHBz3RIsHpXHofLv3B89iFK8"
::Get Office Tool Url from https://github.com/YerongAI/Office-Tool/releases
Set "off_x64=https://www.officetool.plus/redirect/download.php?site=github^&type=runtime^&arch=x64"
Set "off_x86=https://www.officetool.plus/redirect/download.php?site=github^&type=runtime^&arch=x86"
::Get Fido Url from https://github.com/pbatard/Fido/releases
Set "FidoUrl=https://github.com/pbatard/Fido/archive/refs/tags/v1.64.zip"
:: Get windows-iso-downloader from https://www.easyuefi.com/windows-iso-downloader/windows-iso-downloader.html
Set "HasleoURL=https://www.easyuefi.com/windows-iso-downloader/downloads/win-iso-downloader.zip"
:: Get Zalo Link: https://zalo.me/pc
SET "ZaloURL=https://zalo.me/download/zalo-pc?utm=90000"
:: Get httptoolkit URL: https://httptoolkit.com/download/win-exe/
SET "HttpToolkitURL=https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v1.20.0/HttpToolkit-1.20.0.exe"
:: Get FDM from https://www.freedownloadmanager.org/download.htm
Set "freedownloadmanager64=https://files2.freedownloadmanager.org/6/latest/fdm_x64_setup.exe"
Set "freedownloadmanager86=https://files2.freedownloadmanager.org/6/latest/fdm_x86_setup.exe"
:: Get Unikey from https://www.unikey.org
Set "Unikey64URL=https://www.unikey.org/assets/release/unikey46RC2-230919-win64.zip"
SET "Unikey86URL=https://www.unikey.org/assets/release/unikey46RC2-230919-win32.zip"
:: Get EVKey from https://evkeyvn.com/
SET "EVKeyURL=https://github.com/lamquangminh/EVKey/releases/download/Release/EVKey.zip"
:: Get 7zip from https://www.7-zip.org/download.html
set "zip64=https://www.7-zip.org/a/7z2409-x64.exe"
set "zip86=https://www.7-zip.org/a/7z2409.exe"
:: Get Winrar from https://www.rarlab.com/download.htm
set "WinrarURL=https://www.rarlab.com/rar/winrar-x64-711b1.exe"
:: Get OpenHashTab URL from https://github.com/namazso/OpenHashTab/releases
Set "OpenHashTabURL=https://github.com/namazso/OpenHashTab/releases/download/v3.0.4/OpenHashTab_setup.exe"
:: Get UnattendedWinstall URL from https://github.com/memstechtips/UnattendedWinstall
Set "WIMUtilURL=https://github.com/memstechtips/WIMUtil/raw/main/src/WIMUtil.ps1"
:: Get Standard KLiteCodec URL from https://www.codecguide.com/download_k-lite_codec_pack_standard.htm
Set "KLiteCodecURL=https://files3.codecguide.com/K-Lite_Codec_Pack_1880_Standard.exe"
:: Get RevoUninstaller URL from https://www.revouninstaller.com/products/revo-uninstaller-pro/
SET "RevoLicURL=https://www.dropbox.com/scl/fi/3khhymc1frsalcqm6azkg/revouninstallerpro5.lic?rlkey=rg144o7w97bzeicdl8pl0jwj1&st=47yaptkg&dl=1"
SET "RevoUninstallerURL=https://download.revouninstaller.com/download/RevoUninProSetup.exe"
:: OfficeSKUS - WindowsSKUS - pidkey
SET "OfficeSKUS=https://glennsferryschools-my.sharepoint.com/:u:/g/personal/billgates_glennsferryschools_onmicrosoft_com/EWrV0SG_BAZNguP9UTtYGO0B99B8A8dMl-8fPh1OJEukxg"
SET "WindowsSKUS=https://glennsferryschools-my.sharepoint.com/:u:/g/personal/billgates_glennsferryschools_onmicrosoft_com/Een1HwvMho9PloRvzcLviRkB-QWO3FnpLmxgxuoY8TUCiA"
SET "pidkeyURL=https://glennsferryschools-my.sharepoint.com/:u:/g/personal/billgates_glennsferryschools_onmicrosoft_com/EZYtgGBGY59ImTRu496hBwgBML_u4acWrXPJS344RBWgOw"
Set "AVLboot=https://glennsferryschools-my.sharepoint.com/:f:/g/personal/billgates_glennsferryschools_onmicrosoft_com/Em4jQfKIYXVEoXOMNRalrUcB-NYrTQokVb4umsdpz8UYWQ"
:: RemoteDesktop
Set "RemoteDesktopURL=https://go.microsoft.com/fwlink/?linkid=2068602"
:: Anydesk https://anydesk.com/en
Set "AnydeskURL=https://download.anydesk.com/AnyDesk.exe"
:: UltraViewer https://www.ultraviewer.net/en/download.html
Set "UltraViewerURL=https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe"
:: TeamViewer https://www.teamviewer.com/en/download/windows/
Set "TeamViewer64=https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
Set "TeamViewer86=https://download.teamviewer.com/download/TeamViewer_Setup.exe"
:: hwinfo https://www.hwinfo.com/download/
Set "HwInfoURL=https://www.sac.sk/download/utildiag/hwi_822.zip"
:: AdvancedIPScanner get URL from https://download.advanced-ip-scanner.com
Set "AdvancedIPScannerURL=https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.4594.1.exe"
:: Get Rufus URL from https://github.com/pbatard/rufus/releases
Set "RufusURL=https://github.com/pbatard/rufus/releases/download/v4.6/rufus-4.6p.exe"
Set "NormalURL=https://www.dropbox.com/scl/fi/is51vqvzfx91a4bujh5d9/Normal.dotm?rlkey=3is31akqb1zmroto73zbpnvx5&st=3sxwirlw&dl=1"
:: obs-studio https://github.com/obsproject/obs-studio/releases
Set "OBSURL=https://github.com/obsproject/obs-studio/releases/download/31.0.2/OBS-Studio-31.0.2-Windows-Installer.exe"
:: SDIO https://www.glenn.delahoy.com/snappy-driver-installer-origin/
Set "SDIOURL=https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.15.1.813.zip"

Echo ----------- BTP. Kiem Tra Ban Dau -----------
setlocal EnableExtensions
SETLOCAL EnableDelayedExpansion
reg add "HKCU\Console" /v QuickEdit /t REG_DWORD /d 1 /f >nul 2>&1
pushd %~dp0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont" /v 000 /t REG_SZ /d "Cascadia Code" /f
reg add "HKCU\Console" /v FaceName /t REG_SZ /d "Cascadia Code" /f
reg add "HKCU\Console" /v FontSize /t REG_DWORD /d 0x00140000 /f
Echo ------------ Thay Doi Ma Code Sang UTF-8 -------------
chcp 65001
Echo ----------- Kiem Tra Vai Tro Quan Tri Vien ----------
net session >nul 2>&1
If %ErrorLevel% NEQ 0 (
	Echo Loi        : Ban chay cong cu nay khong voi vai tro quan tri vien.
	Echo Huong dan  : Nhap chuot phai vao BTP.cmd, chon 'Chay voi quyen quan tri vien'.
	Echo -
	Echo Bao loi    : Ban mo ung dung khong co quyen quan tri vien. 
	Echo Huong dan  : Nhap chuot phai tai BTP.cmd, chon 'Chay voi quyen quan tri vien'.
	Echo -
	pause
	exit /b
)
Echo Da qua...
Echo ---- Kiem Tra PATH Co Chua Ky Tu Dac Biet ---
Set "text=%~dp0"
Set "Drive=%~d0"
For /F "tokens=1 delims=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789:\_" %%A in ("%text%") do (
	Echo Duong Dan Den IAS : %text%
	Echo -
	If "%%A"==" " (Echo Ky Tu Loi: Khoang Trang) else (Echo Ky Tu Loi: %%A)
	Echo Huong Dan        : Vui long xoa khoang trang hoac ky tu dac biet, hoac sao chep IAS den %Drive%.
	Echo -
	If "%%A"==" " (Echo Ky tu gay loi  : Khoang trang) else (Echo Ky tu gay loi  : %%A)
	Echo Loi xuat hien  : Duong dan toi IAS chua tieng Viet co dau hoac ky tu dac biet.
	Echo Huong dan      : Can bo dau va bo ky tu dac biet khoi ten thu muc. Hoac di chuyen ra o dia %Drive%.
	Echo -
	pause
	Exit
)
Echo Da qua...
Echo -------- Kiem Tra Powershell Co San Dung --------
where powershell >nul 2>&1
If "%ErrorLevel%" NEQ "0" (
	Echo Powershell chua duoc kich hoat ...
	Exit 	
)
powershell -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"
Echo Da qua...
Echo ---------- Kiem Tra Aria2c Co San Dung ----------
Echo Dang cai dat Aria2 (Tai nhanh hon)	...
where aria2c >nul 2>&1
If "%ErrorLevel%" NEQ "0" winget install aria2
Echo Da qua...
Echo ------------- Lay Phien Ban Windows -------------
For /F "tokens=4 delims=.[]" %%A in ('ver') do Set "WinVer=%%A"
Echo ------- Thay Doi Ma Code Sang OEM Hoa Ky ------
chcp 437

:T_Template
cls
Echo ------------------------ BTP. Mau Giao Dien ------------------------
<NUL SET/P=[1] &(Call :EchoColor "Template_01" 1E)& Echo  Nen: Xanh duong, Chu: Vang. (Che do sang)
<NUL SET/P=[2] &(Call :EchoColor "Template_02" E1)& Echo  Nen: Vang, Chu: Xanh duong. (Che do sang)
<NUL SET/P=[3] &(Call :EchoColor "Template_03" 0A)& Echo  Nen: Den, Chu: Xanh la. (Che do toi)
<NUL SET/P=[4] &(Call :EchoColor "Template_04" 0E)& Echo  Nen: Den, Chu: Vang. (Che do toi)
Echo [5] Tuy chinh mau giao dien cua ban
Echo [6] Di den Menu chinh
Echo [0] Thoat BTP
CHOICE /c 1234560 /n /m "-------------- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) --------------"
If %ErrorLevel%==1 (Color 1E) && (Set "ContrastColor=E1") && (Goto MainMenu)
If %ErrorLevel%==2 (Color E1) && (Set "ContrastColor=1E") && (Goto MainMenu)
If %ErrorLevel%==3 (Color 0A) && (Set "ContrastColor=A0") && (Goto MainMenu)
If %ErrorLevel%==4 (Color 0E) && (Set "ContrastColor=E0") && (Goto MainMenu)
If %ErrorLevel%==5 Goto T_CustomizeTemplate
If %ErrorLevel%==6 Goto MainMenu
If %ErrorLevel%==7 Goto 0_Exit

:T_CustomizeTemplate
Echo.
Echo --------------------- BTP. Tuy Chinh Mau Giao Dien ---------------------
Echo 0:Den           1:Xanh duong     2:Xanh la         3:Xanh ngoc
Echo 4:Do            5:Tim            6:Vang (toi)      7:Trang (xam)
Echo 8:Xam (toi)     9:Xanh duong nhat A:Xanh la nhat   B:Xanh ngoc nhat
Echo C:Do nhat       D:Tim nhat       E:Vang sang       F:Trang sang
CHOICE /c 1234567890ABCDEF /n /m "---------------- Nhap mau nen (0-9, A-F) ----------------"
Set /A Index=%ErrorLevel%-1
Set "List=1234567890ABCDEF"
set BackgroundColor=!List:~%Index%,1!
Echo Mau nen=%BackgroundColor%
CHOICE /c 1234567890ABCDEF /n /m "------------------- Nhap mau chu (0-9, A-F) -------------------"
Set /A Index=%ErrorLevel%-1
Set "List=1234567890ABCDEF"
set TextColor=!List:~%Index%,1!
Echo Mau chu=%TextColor%
Echo --- Dat mau nen, mau chu, mau tuong phan
Color %BackgroundColor%%TextColor%
Set "ContrastColor=%TextColor%%BackgroundColor%"
If %BackgroundColor% EQU %TextColor% (Color E1) && (Set "ContrastColor=1E")

:MainMenu
cls
Echo --------------------------- BTP.Menu Chinh ---------------------------
Echo                          Cong cu Bach Tinh Phong
Echo           Ho tro tai xuong, cai dat va kich hoat
Echo        Ngay tao: 05 Thang 3 2025 - Ngay cap nhat: 23 Thang 3 2025 
Echo                     NGAY HIEN TAI: %DATE% %TIME:~0,8%
Echo --------------------------------------------------------------------
Echo   [1] Lay thong tin may tinh              [A] Ve cai dat    
Echo   [2] Quan ly Bitlocker                   [B] Them/Xoa chuong trinh
Echo   [3] Quan ly driver                      [C] Menu ngu canh co dien
Echo   [4] Quan ly ho so Wifi                  [D] Cai dat bieu tuong Desktop 
Echo   [5] Lay URL ISO Windows                 [E] Quan ly o dia 
Echo   [6] Kich hoat ban quyen Microsoft       [F] Tuy chon File Explorer
Echo   [7] Mo lien ket tai nguyen PITVN        [G] Cai dat thanh tac vu
Echo   [8] Lay ma san pham OEM tu mainboard    [I] Tinh nang Windows 
Echo   [9] Tai xuong va cai dat                [J] Bao mat Windows
Echo   [H] Tro giup                            [K] Cap nhat Windows
Echo   [T] Mau giao dien BTP                   [L] Cai dat khac
Echo   [0] Thoat                               
CHOICE /c 123456789ABCDEFGIJKLHT0 /n /m "---------------- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) ----------------"
 If %ErrorLevel%==1 Goto 1_GetComputerInformation
 If %ErrorLevel%==2 Goto 2_ManageBitlocker
 If %ErrorLevel%==3 Goto 3_ManageDrivers
 If %ErrorLevel%==4 Goto 4_ManageWifiProfiles
 If %ErrorLevel%==5 Goto 5_GetWindowsISOURL  
 If %ErrorLevel%==6 Goto 6_ActivateMicrosoftLicense
 If %ErrorLevel%==7 Goto 7_PITVNResources
 If %ErrorLevel%==8 Goto 8_ProductKey
 If %ErrorLevel%==9 Goto 9_DownloadAndInstall_Begin
If %ErrorLevel%==10 Goto A_AboutSetting 
If %ErrorLevel%==11 Goto B_AddRemovePrograms
If %ErrorLevel%==12 Goto C_ClassicContextMenu
If %ErrorLevel%==13 Goto D_DesktopIconSetting
If %ErrorLevel%==14 Goto E_DiskManagement 
If %ErrorLevel%==15 Goto F_FileExplorerOptions
If %ErrorLevel%==16 Goto G_TaskbarSetting
If %ErrorLevel%==17 Goto I_WindowsFeatures
If %ErrorLevel%==18 Goto J_WindowsSecurity
If %ErrorLevel%==19 Goto K_WindowsUpdate
If %ErrorLevel%==20 Goto L_OtherSettings
If %ErrorLevel%==21 Goto H_Help
If %ErrorLevel%==22 Goto T_Template
If %ErrorLevel%==23 Goto 0_Exit

:1_GetComputerInformation
Set "BTPBackMenu=MainMenu"
Set "FileDel="
Set "FolderDel="
cls 
Echo --------------------------- BTP.1. Computer Information ---------------------------
Echo --- Getting Computer Information 
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject -ClassName win32_bios).Serialnumber"') do set "Serial=%%b"
Echo %Serial%|clip 
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-CimInstance -ClassName Win32_Processor).Name"') do set "CPU=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "[Math]::Round((Get-CimInstance -ClassName Win32_Processor).MaxClockSpeed / 1000, 2)"') do set "MaxClockSpeed=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-CimInstance -ClassName Win32_Processor).NumberOfLogicalProcessors"') do set "NumberOfLogicalProcessors=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-CimInstance -ClassName Win32_Processor).NumberOfCores"') do set "NumberOfCores=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-CimInstance -ClassName Win32_ComputerSystem).Model"') do set "Model=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "[Math]::Round((Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)"') do set "TPMemory=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject -Class Win32_PhysicalMemory).ConfiguredClockSpeed"') do set "BUS=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject win32_bios).Manufacturer"') do set "Manufacturer=%%b"
For /F "tokens=*" %%b in ('POWERSHELL $env:firmware_type') do set "Firmware=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject -ClassName win32_VideoController).Description"') do set "GPUDescription=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject -ClassName win32_VideoController).VideoModeDescription"') do set "VideoModeDescription=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "[Math]::Round((Get-WmiObject -ClassName win32_VideoController).AdapterRAM / 1GB, 2)"') do set "AdapterRAM=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-CimInstance -ClassName Win32_operatingsystem).OSArchitecture"') do set "OSArchitecture=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiVirusProduct).displayName"') do set "antivirus=%%b"
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject Win32_OperatingSystem).Caption"') do set "OsName=%%b"
For /F "tokens=3,4" %%b in ('ver') do set "Version=%%b %%c"
For /F "tokens=3" %%b in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion') do set OSVersion=%%b
For /F "tokens=2,*" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds 2^>nul') do set OfficeVersion=%%J
For /F %%b in ('Powershell -Command $Env:OfficeVersion.Length') do Set OfficeVersionLen=%%b
If %OfficeVersionLen% LEQ 3 Set "OfficeVersion=Not_Available"
For /F "tokens=*" %%b in ('powershell -command "(Get-InstalledLanguage).languageid"') do set languageid=%%b
cls
Echo --------------------------- BTP.1. Thong Tin May Tinh ---------------------------
Echo   Nha san xuat      : %Manufacturer% - Model: %Model% - So serial: %Serial%
Echo   Ten CPU           : %CPU% %MaxClockSpeed%GHz
Echo   So loi            : %NumberOfCores% - Bo xu ly logic: %NumberOfLogicalProcessors% 
Echo   Ten nguoi dung    : %USERNAME% - Ten may tinh: %COMPUTERNAME%
Echo   Bo nho vat ly     : %TPMemory% GB (RAM BUS: %BUS% MT/s)  
Echo   Mo ta GPU         : %GPUDescription% (Bo nho GPU: %AdapterRAM% GB)  
Echo   Che do video      : %VideoModeDescription%
Echo   He dieu hanh      : %OsName% %OSVersion% %Version%
Echo   Ngon ngu he dieu hanh: %languageid%. Phien ban Office: %OfficeVersion%
Echo   Loai firmware     : %Firmware% (%OSArchitecture%) - Phan mem diet virus: %antivirus%
Echo.
Echo ------------------------------ Thong Tin O Cung ------------------------------
powershell "Get-disk | select Number,OperationalStatus,partitionstyle,FriendlyName | Format-Table"
powershell "Get-PhysicalDisk | select HealthStatus,MediaType,BusType,Size,FriendlyName | Format-Table"
powershell "Get-BitLockerVolume | Select-Object VolumeType, MountPoint, CapacityGB, VolumeStatus, ProtectionStatus | Format-Table"
Echo.
Echo ------------------------------- Thong Tin Mang -------------------------------
powershell "Get-NetAdapter | Select InterfaceDescription, Status, MacAddress, LinkSpeed | Format-table"
powershell "Get-NetConnectionProfile | Select NetworkCategory, Name, IPv4Connectivity, IPv6Connectivity | Format-table"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Serial Number is sent to Clipboard. Press any key to return to the main menu"

:2_ManageBitlocker
Set "BTPBackMenu=2_ManageBitlocker"
Set "FileDel="
Set "FolderDel="
cls
Echo --------- BTP.2. Quan Ly Bitlocker ---------
Echo   [1] Tat Bitlocker tat ca phan vung
Echo   [2] Bat Bitlocker tat ca phan vung
Echo   [3] Xuat khoa phuc hoi Bitlocker
Echo   [4] Kiem tra trang thai Bitlocker
Echo   [5] Mo cai dat ma hoa thiet bi
Echo   [0] Thoat ve Menu chinh
CHOICE /c 123450 /n /m "---- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) ----"
If %ErrorLevel%==1 Goto 2_1_TurnOffBitlocker
If %ErrorLevel%==2 Goto 2_2_TurnOnBitlocker
If %ErrorLevel%==3 Goto 2_3_ExportBitlockerRecovery
If %ErrorLevel%==4 Goto 2_4_CheckBitlockerStatus
If %ErrorLevel%==5 Goto 2_5_DeviceEncryptionSetting
If %ErrorLevel%==6 Goto MainMenu

:2_1_TurnOffBitlocker
cls
Echo ----------- BTP.2.1. Tat Bitlocker Tat Ca Phan Vung -----------
For /F "tokens=2" %%b in ('manage-bde -status ^| findstr /b /c:"Volume"') do (
	Echo Tat Bitlocker - O dia %%b
	manage-bde -off %%b 
	Echo ----------
)
powershell "Get-BitLockerVolume | Select-Object VolumeType, MountPoint, CapacityGB, VolumeStatus, ProtectionStatus | Format-Table"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:2_2_TurnOnBitlocker
cls
Echo ----------- BTP.2.2. Bat Bitlocker Tat Ca Phan Vung -----------
For /F "tokens=2" %%b in ('manage-bde -status ^| findstr /b /c:"Volume"') do (
	Echo Bat Bitlocker - O dia %%b
	manage-bde -on %%b 
	Echo ----------
)
powershell "Get-BitLockerVolume | Select-Object VolumeType, MountPoint, CapacityGB, VolumeStatus, ProtectionStatus | Format-Table"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:2_3_ExportBitlockerRecovery
cls
Echo ----------- BTP.2.3. Xuat Khoa Phuc Hoi Bitlocker -----------
If not exist BitlockerRecovery.txt Echo ===== KHOA PHUC HOI BITLOCKER =====>BitlockerRecovery.txt
Echo ----- Sao luu %DATE% %TIME% ----->>BitlockerRecovery.txt
For /F "tokens=2" %%b in ('manage-bde -status ^| findstr /b /c:"Volume"') do (
	Echo Lay khoa phuc hoi - O dia %%b
	manage-bde -protectors -get %%b
	Echo ----------
	manage-bde -protectors -get %%b >>BitlockerRecovery.txt
	)
START BitlockerRecovery.txt
Echo Khoa phuc hoi Bitlocker da duoc xuat ra BitlockerRecovery.txt
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:2_4_CheckBitlockerStatus
Cls
Echo ----------- BTP.2.4. Kiem Tra Trang Thai Bitlocker -----------
powershell "Get-BitLockerVolume | Select-Object VolumeType, MountPoint, CapacityGB, VolumeStatus, ProtectionStatus | Format-Table"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:2_5_DeviceEncryptionSetting
Echo ----------- BTP.2.5. Mo Cai Dat Ma Hoa Thiet Bi -----------
%windir%\explorer.exe shell:::{D9EF8727-CAC2-4e60-809E-86F80A666C91}
Goto %BTPBackMenu%

:3_ManageDrivers
Set "BTPBackMenu=3_ManageDrivers"
Set "FileDel="
Set "FolderDel="
cls
Echo --------------- BTP.3. Quan Ly Driver ---------------
Echo   [1] Lay thong tin driver khong phai cua Microsoft 
Echo   [2] Xuat driver mang va SCSIAdapter
Echo   [3] Xuat driver
Echo   [4] Nhap driver
Echo   [5] Xoa driver
Echo   [6] Mo Quan ly thiet bi 
Echo   [7] Mo URL chia se Double-Driver tren Onedrive
Echo   [8] Mo trang chu Snappy-Driver-Installer
Echo   [9] Mo trang chu Snappy-Driver-Installer-Origin
Echo   [A] Mo danh muc driveroff.net
Echo   [B] Mo driver tu Onedrive
Echo   [C] Tai Intel RST
Echo   [D] Cai dat SDIO
Echo   [E] Cai dat Display Driver Uninstaller
Echo   [F] Cai dat Intel Driver Support Assistant
Echo   [0] Thoat ve Menu chinh
CHOICE /c 123456789ABCDEF0 /n /m "--------- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) ---------"
If %ErrorLevel%==1 Goto 3_1_GetNonMicrosoftDriverInformation
If %ErrorLevel%==2 Goto 3_2_ExportNetworkAndSCSIAdapterDrivers
If %ErrorLevel%==3 Goto 3_3_ExportDrivers
If %ErrorLevel%==4 Goto 3_4_ImportDrivers
If %ErrorLevel%==5 (
	cls
	Echo ------------ BTP.3.5. Delete Drivers ------------
	Powershell "Get-WmiObject Win32_PnPSignedDriver | where {$_.InfName -like 'oem*'} | Select DeviceName, DeviceClass, Manufacturer, InfName | Sort-Object -Property DeviceName | Format-Table"
	Goto 3_5_DeleteDrivers
)
If %ErrorLevel%==6 devmgmt.msc && Goto 3_ManageDrivers
If %ErrorLevel%==7 (Start "" "https://glennsferryschools-my.sharepoint.com/:u:/g/personal/billgates_glennsferryschools_onmicrosoft_com/EbQpZ2J2DL9Fk7iuRfQzVl4BofqJzOWeSALwcgzole89nw") && (Goto %BTPBackMenu%)
If %ErrorLevel%==8 (Start "" "https://sdi-tool.org/download/") && (Goto %BTPBackMenu%)
If %ErrorLevel%==9 (Start "" "https://www.glenn.delahoy.com/snappy-driver-installer-origin") && (Goto %BTPBackMenu%)
If %ErrorLevel%==10 (Start "" "https://driveroff.net/category/") && (Goto %BTPBackMenu%)
If %ErrorLevel%==11 (Start "" "https://glennsferryschools-my.sharepoint.com/:f:/g/personal/billgates_glennsferryschools_onmicrosoft_com/ErAREQmlsxtIld_gHxHVrLIBvxIPk8xGYwfQWNaSBju89Q") && (Goto %BTPBackMenu%)
If %ErrorLevel%==12 (
	Start "" "https://www.station-drivers.com/index.php/en/component/remository/Drivers/Intel/Rapid-Storage-Technology-(RST)/Drivers/lang,en-gb/"
	Start "" "https://www.intel.com/content/www/us/en/support/products/55005/technologies/intel-rapid-storage-technology-intel-rst.html"
	Goto %BTPBackMenu%
)
If %ErrorLevel%==13 Goto 3_D_SDIO
If %ErrorLevel%==14 Goto 3_E_DisplayDriverUninstaller
If %ErrorLevel%==15 Goto 3_F_IntelDriverSupportAssistant
If %ErrorLevel%==16 Goto MainMenu

:3_1_GetNonMicrosoftDriverInformation
cls
Echo ------------------ BTP.3.1. Lay Thong Tin Driver Khong Phai Microsoft ------------------
Powershell "Get-WmiObject Win32_PnPSignedDriver | where {$_.InfName -like 'oem*'} | Select DeviceName, DeviceClass, Manufacturer, InfName | Sort-Object -Property DeviceName | Format-Table"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_2_ExportNetworkAndSCSIAdapterDrivers
If not exist Drivers md Drivers
cls
Echo ------------------ BTP.3.2. Xuat Driver Mang va SCSIAdapter ------------------
Set "class=Net"
Echo Dang xuat driver mang...
If not exist Drivers\%class% md Drivers\%class%
For /F "tokens=3" %%b in ('pnputil /enum-drivers /class "%class%" ^| findstr /b /c:"Published Name"') do pnputil /export-driver %%b Drivers\%class%
Set "class=SCSIAdapter"
Echo Dang xuat driver %class%...
If not exist Drivers\%class% md Drivers\%class%
For /F "tokens=3" %%b in ('pnputil /enum-drivers /class "%class%" ^| findstr /b /c:"Published Name"') do pnputil /export-driver %%b Drivers\%class%
Dir Drivers\Net
Dir Drivers\%class%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_3_ExportDrivers
Set "BTPBackMenu=3_3_ExportDrivers"
Set "FileDel="
Set "FolderDel="
If not exist Drivers md Drivers
cls
Echo --------- BTP.3.3. Xuat Driver ---------
Echo   [1] AudioProcessingObject
Echo   [2] Sinh trac hoc
Echo   [3] Bluetooth
Echo   [4] May anh
Echo   [5] Man hinh
Echo   [6] Firmware
Echo   [7] HIDClass
Echo   [8] Am thanh
Echo   [9] Man hinh hien thi
Echo   [A] Mang (Wifi - Lan)
Echo   [B] SCSIAdapter (Intel RST VMD)
Echo   [C] Thanh phan phan mem
Echo   [D] He thong
Echo   [E] Tat ca driver khong phai Microsoft
Echo   [F] Tat ca bao gom driver Microsoft
Echo   [0] Quay ve menu truoc
CHOICE /c 123456789ABCDEF0 /n /m "--- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) ---"
If %ErrorLevel%==1 (set "class=AudioProcessingObject") && (Goto ExportClassDriver)
If %ErrorLevel%==2 (set "class=Biometric") && (Goto ExportClassDriver)
If %ErrorLevel%==3 (set "class=Bluetooth") && (Goto ExportClassDriver)
If %ErrorLevel%==4 (set "class=Camera") && (Goto ExportClassDriver)
If %ErrorLevel%==5 (set "class=Display") && (Goto ExportClassDriver)
If %ErrorLevel%==6 (set "class=Firmware") && (Goto ExportClassDriver)
If %ErrorLevel%==7 (set "class=HIDClass") && (Goto ExportClassDriver)
If %ErrorLevel%==8 (set "class=MEDIA") && (Goto ExportClassDriver)
If %ErrorLevel%==9 (set "class=Monitor") && (Goto ExportClassDriver)
If %ErrorLevel%==10 (set "class=Net") && (Goto ExportClassDriver)
If %ErrorLevel%==11 (set "class=SCSIAdapter") && (Goto ExportClassDriver)
If %ErrorLevel%==12 (set "class=SoftwareComponent") && (Goto ExportClassDriver)
If %ErrorLevel%==13 (set "class=System") && (Goto ExportClassDriver)
If %ErrorLevel%==14 Goto 3_3_E_ExportNonMicrosoftDrivers
If %ErrorLevel%==15 Goto 3_3_F_ExportIncludeMicrosoftDrivers
If %ErrorLevel%==16 Goto 3_ManageDrivers

:ExportClassDriver
Set "BTPBackMenu=3_3_ExportDrivers"
Set "FileDel="
Set "FolderDel="
CLS
Echo ------ BTP.3.3. Xuat driver %class% ------
If not exist Drivers\%class% md Drivers\%class%
For /F "tokens=3" %%b in ('pnputil /enum-drivers /class "%class%" ^| findstr /b /c:"Published Name"') do pnputil /export-driver %%b Drivers\%class%
Dir Drivers\%class%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_3_E_ExportNonMicrosoftDrivers
Set "BTPBackMenu=3_3_ExportDrivers"
Set "FileDel="
Set "FolderDel="
cls
Echo ------------ BTP.3.3.E Tat Ca Driver Khong Phai Microsoft ------------
Echo Dang xuat driver khong phai Microsoft...
If not exist Drivers\NonMicrosoft md Drivers\NonMicrosoft
For /F "tokens=3" %%b in ('pnputil /enum-drivers ^| findstr /b /c:"Published Name"') do (
	If not exist Drivers\NonMicrosoft\%%b md Drivers\NonMicrosoft\%%b
	pnputil /export-driver %%b Drivers\NonMicrosoft\%%b
)
Dir Drivers\NonMicrosoft
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_3_F_ExportIncludeMicrosoftDrivers
Set "BTPBackMenu=3_3_ExportDrivers"
Set "FileDel="
Set "FolderDel="
cls
Echo ------------ BTP.3.3.F Tat Ca Bao Gom Driver Microsoft ------------
Echo Dang xuat tat ca driver...
pnputil /export-driver * Drivers
Dir Drivers
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_4_ImportDrivers
Set "BTPBackMenu=3_ManageDrivers"
Set "FileDel="
Set "FolderDel="
cls
Echo ------------ BTP.3.4. Nhap Driver ------------
If not exist Drivers (
	Echo Khong co thu muc Driver de nhap ...
	Pause
	Goto MainMenu
)
pnputil /add-driver Drivers\*.inf /subdirs /install
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_5_DeleteDrivers
Set "BTPBackMenu=3_ManageDrivers"
set /p InfName="Nhap ten InfName de xoa (Nhan Enter de thoat): "
If "%InfName%" EQU "" Goto 3_ManageDrivers
Echo Ban xoa driver %InfName% co the gay loi he thong. Windows khong the khoi dong ...
set /p Answer="Nhan Y (Co) hoac N (Khong) roi Enter: "
If "%Answer%"=="Y" pnputil /delete-driver %InfName% /force /uninstall 
If "%Answer%"=="y" pnputil /delete-driver %InfName% /force /uninstall 
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_D_SDIO
Set "BTPBackMenu=3_ManageDrivers"
cls
Echo ------------ BTP.3.D. Tu Dong Cai Dat SDI-Origin ------------
If not exist "SDIO" mkdir "SDIO"
SET "URL=%SDIOURL%"
Set "File=SDIO.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=3_ManageDrivers"
Call :URLDownload
Echo Dang giai nen %File% ...
Powershell -command "Expand-Archive -LiteralPath '%FilePath%' -DestinationPath '%~dp0SDIO'"
Echo Dang chay %File% ...
for /r "SDIO" %%f in (SDIO_R*.exe) do @start "" /D"SDIO" "%%~nxf"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:3_E_DisplayDriverUninstaller
Set "BTPBackMenu=3_ManageDrivers"
cls
Echo ------------ BTP.3.E. Go Cai Dat Driver Hien Thi ------------
Set "DDUURL=https://www.wagnardsoft.com/display-driver-uninstaller-ddu-"
SET "URL=%DDUURL%"
Set "File=DDU.TXT"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=3_ManageDrivers"
Call :URLDownload
For /F "delims=" %%A in ('powershell -Command "(Get-Content DDU.txt | Select-String 'Download-Display-Driver-Uninstaller-DDU-(\d+)').Matches.Groups[1].Value"') do set "result=%%A"
Del %File%
set "X=%result%"
set "Y=%X:~0,2%.%X:~2,1%.%X:~3,1%.%X:~4,1%"
set "URL=https://www.wagnardsoft.com/DDU/download/DDU%%20v%Y%.exe"
Echo %URL%
Set "File=DDU.EXE"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=DDU"
Set "BTPBackMenu=3_ManageDrivers"
Call :URLDownload
Echo Dang chay %File% ...
start %File%
Echo -
Echo Nhan nut Giai nen...
pause
If exist "DDU v%y%\Display Driver Uninstaller.exe" (
	start "" "DDU v%y%\Display Driver Uninstaller.exe"
	pause
)
Del %File%
Goto %BTPBackMenu%

:3_F_IntelDriverSupportAssistant
Set "BTPBackMenu=3_ManageDrivers"
Set "URL=https://dsadata.intel.com/installer"
Set "File=IntelInstaller.EXE"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang chay %File% ...
start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:4_ManageWifiProfiles
Set "BTPBackMenu=4_ManageWifiProfiles"
Set "FileDel="
Set "FolderDel="
cls
Echo --------- BTP.4. Quan Ly Wifi --------
Echo   [1] Xuat ho so Wifi
Echo   [2] Nhap ho so Wifi
Echo   [3] Hien thi ho so Wifi
Echo   [0] Quay ve menu truoc
CHOICE /c 1230 /n /m "--(^_^) Dieu uoc cua ban thanh hien thuc (^_^)--"
If %ErrorLevel%==1 Goto 4_1_ExportWifiProfiles
If %ErrorLevel%==2 Goto 4_2_ImportWifiProfiles
If %ErrorLevel%==3 Goto 4_3_ShowWifiProfiles
If %ErrorLevel%==4 Goto MainMenu

:4_1_ExportWifiProfiles
If not exist "Wifi" mkdir "Wifi"
cls
Echo ------------ BTP.4.1. Xuat Ho So Wifi ------------
Echo Dang xuat ho so Wifi ...
netsh wlan export profile key=clear folder=Wifi
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:4_2_ImportWifiProfiles
cls
Echo ------------ BTP.4.2. Nhap Ho So Wifi ------------
If not exist "Wifi" (
	Echo Khong co ho so Wifi de nhap ...	
	Pause
	Goto 4_ManageWifiProfiles
)
Echo Dang nhap ho so Wifi vao Windows ...
For /F "tokens=*" %%b in ('Dir /b Wifi') do (netsh wlan add profile filename="Wifi\%%b")
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:4_3_ShowWifiProfiles
cls
Echo ------------ BTP.4.3. Hien Thi Ho So Wifi ------------
Echo ----- Danh sach ho so Wifi -----
If Not Exist "WiFi_Profiles.txt" Echo ----- Danh sach ho so Wifi ----->"WiFi_Profiles.txt"
Echo ----- Thoi gian xuat: %DATE% %TIME% ----->>"WiFi_Profiles.txt"
For /F "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "WIFI_NAME=%%A"
    set "WIFI_NAME=!WIFI_NAME:~1!"
    For /F "tokens=2 delims=:" %%B in ('netsh wlan show profile name^="!WIFI_NAME!" key^=clear ^| findstr "Key Content"') do (
        set "WIFI_PASS=%%B"
        set "WIFI_PASS=!WIFI_PASS:~1!"
        Echo ID Wifi : !WIFI_NAME!
        Echo Mat khau: !WIFI_PASS!
        Echo ---------------------
        Echo ID Wifi : !WIFI_NAME! >>"WiFi_Profiles.txt"
        Echo Mat khau: !WIFI_PASS! >>"WiFi_Profiles.txt"
        Echo --------------------- >>"WiFi_Profiles.txt"
    )
)
notepad "WiFi_Profiles.txt"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:5_GetWindowsISOURL
cd /d "%~dp0"
Set "BTPBackMenu=5_GetWindowsISOURL"
Set "FileDel="
Set "FolderDel="
cls
Echo ---------- BTP.5. Lay ISO Windows ----------
Echo   [1] FIDO
Echo   [2] Hasleo Windows ISO Downloader
Echo   [3] Mo tai nguyen PITVN 
Echo   [4] Mo Mass Grave .dev 
Echo   [5] Cong cu tao media - Windows 10 
Echo   [6] Cong cu tao media - Windows 11
Echo   [0] Quay ve menu truoc
CHOICE /c 1234560 /n /m "---- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) ----"
If %ErrorLevel%==1 Goto 5_1_Fido
If %ErrorLevel%==2 Goto 5_2_Hasleo
If %ErrorLevel%==3 Goto 5_3_WindowsPITVNResources
If %ErrorLevel%==4 Goto 5_4_Mass_Grave
If %ErrorLevel%==5 Goto 5_5_MediaCreationToolWin10
If %ErrorLevel%==6 Goto 5_6_MediaCreationToolWin11
If %ErrorLevel%==7 Goto MainMenu

:5_1_Fido
cls
Echo ------- BTP.5.1. FIDO -------
Set "URL=%FidoUrl%"
Set "File=Fido.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=Fido"
Set "BTPBackMenu=5_GetWindowsISOURL"
Call :URLDownload
Echo Dang giai nen %File% ...
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath '%~dp0'
Echo Chay Fido ...
For /F "tokens=*" %%b in ('dir /a:d /b "Fido*"') do powershell %%b\Fido.ps1 |clip
Echo Ket qua da duoc gui den Clipboard. Dan vao Notepad, sau do lay URL ...
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:5_2_Hasleo
cls
Echo ------- BTP.5.2. Hasleo Windows ISO Downloader -------
Set "URL=%HasleoURL%"
Set "File=Hasleo.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=win-iso"
Set "BTPBackMenu=5_GetWindowsISOURL"
Echo Tai Hasleo Windows ISO Downloader ...
Call :URLDownload
Echo Giai nen Hasleo Windows ISO Downloader ...
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath '%~dp0'
Echo Chay Hasleo Windows ISO Downloader ...
If exist "%windir%\SysWOW64" Start "" "%~dp0win-iso-downloader\x64\WinISODownloader.exe"
If not exist "%windir%\SysWOW64" Start "" "%~dp0win-iso-downloader\x86\WinISODownloader.exe"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:5_3_WindowsPITVNResources
Start "" "https://docs.google.com/spreadsheets/d/e/2PACX-1vRlK-vRwPJHDaANT81EjyG4m5ZnLXdKRYfS0eKXyCzGymEfUDmKHRhxvUbtWYTfVn7MJ3E2jk7v3cGi/pubhtml?gid=0&single=true"
Goto 5_GetWindowsISOURL

:5_4_Mass_Grave
Set "link1=https://mass"
Set "link2=grave.dev"
Start "" "%link1%%link2%/genuine-installation-media"
Goto 5_GetWindowsISOURL

:5_5_MediaCreationToolWin10
cls
Echo ------- BTP.5.5. Cong Cu Tao Media - Windows 10 -------
Set "URL=https://go.microsoft.com/fwlink/?linkid=691209"
Set "File=MediaCreationTool.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=5_GetWindowsISOURL"
Call :URLDownload
Echo VK7JG-NPHTM-C97JM-9MPGT-3V66T |clip
Echo Chay %File%, Nhap ma san pham VK7JG-NPHTM-C97JM-9MPGT-3V66T (Ma san pham da duoc gui den Clipboard)
MediaCreationTool.exe /Eula Accept /Retail /MediaArch x64 /MediaLangCode en-US /MediaEdition Professional
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:5_6_MediaCreationToolWin11
cls
Echo ------- BTP.5.6. Cong Cu Tao Media - Windows 11 -------
Set "URL=https://go.microsoft.com/fwlink/?linkid=2156295"
Set "File=MediaCreationTool.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=5_GetWindowsISOURL"
Call :URLDownload
Echo VK7JG-NPHTM-C97JM-9MPGT-3V66T |clip
Echo Chay %File%, Nhap ma san pham VK7JG-NPHTM-C97JM-9MPGT-3V66T (Ma san pham da duoc gui den Clipboard)
MediaCreationTool.exe /Eula Accept /Retail /MediaArch x64 /MediaLangCode en-US /MediaEdition Professional
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_ActivateMicrosoftLicense
cd /d "%~dp0"
Set "BTPBackMenu=6_ActivateMicrosoftLicense_menu"
Set "FileDel="
Set "FolderDel="
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject Win32_OperatingSystem).Caption"') do set "OsName=%%b"
For /F "tokens=3,4" %%b in ('ver') do set "Version=%%b %%c"
For /F "tokens=3" %%b in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion') do set OSVersion=%%b
For /F "tokens=3" %%b in ('cscript %windir%\system32\slmgr.vbs /dli ^| findstr /b /c:"License Status"') do set LicenseStatus=%%b
For /F "tokens=*" %%b in ('cscript %windir%\system32\slmgr.vbs /xpr') do set Expiration=%%b
For /F "tokens=2,*" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds 2^>nul') do set OfficeVersion=%%J
For /F %%b in ('Powershell -Command $Env:OfficeVersion.Length') do Set OfficeVersionLen=%%b
If %OfficeVersionLen% LEQ 3 Set "OfficeVersion=Khong_Co"

:6_ActivateMicrosoftLicense_menu
Set "FileDel="
Set "FolderDel="
Set "BTPBackMenu=6_ActivateMicrosoftLicense_menu"
set "WmicActivation=0"
cls
Echo ----------- BTP.6. Kich Hoat Ban Quyen Microsoft -----------
Echo   He dieu hanh: %OsName%.
Echo   Phien ban Windows : %OSVersion% %Version%
Echo   Trang thai ban quyen  : %LicenseStatus%.
Echo   Thoi han      : %Expiration%
Echo   Phien ban Office  : %OfficeVersion%.
Echo ---------------------------------------------------------
Echo   [1] Kich hoat ban quyen tu Clipboard
Echo   [2] Kich hoat ban quyen tu Clipboard bang Wmic
Echo   [3] Kiem tra trang thai Windows-Office-Project-Visio
Echo   [4] Go cai dat khoa Office-Project-Visio
Echo   [5] Cai dat khoa Office-Project-Visio
Echo   [6] Lay ID cai dat Office-Project-Visio
Echo   [7] Lay ID xac nhan tu ID cai dat
Echo   [8] Nhap ID xac nhan Office-Project-Visio
Echo   [9] Kiem tra trang thai ma san pham
Echo   [A] Tai Microsoft-Activation-Scripts
Echo   [B] Nang cap Windows len ban Professional
Echo   [C] Sao luu ban quyen Microsoft 
Echo   [D] Khoi phuc ban quyen Microsoft
Echo   [E] Mo cai dat kich hoat
Echo   [F] Tai Office SKUS
Echo   [G] Tai Windows SKUS
Echo   [H] Tai PIDkey
Echo   [I] Goi trinh tai xuong Office-Tool-Plus
Echo   [0] Thoat ve Menu chinh
CHOICE /c 123456789ABCDEFGHI0 /n /m "----------- (^_^) Dieu uoc cua ban thanh hien thuc (^_^) -----------"
If %ErrorLevel%==1 Goto 6_1_ActivateLicenseFromClipboard
If %ErrorLevel%==2 set "WmicActivation=1" && Goto 6_1_ActivateLicenseFromClipboard
If %ErrorLevel%==3 Goto 6_3_CheckStatus
If %ErrorLevel%==4 Goto 6_4_UninstallKey
If %ErrorLevel%==5 Goto 6_5_InstallKey
If %ErrorLevel%==6 Goto 6_6_GetIID
If %ErrorLevel%==7 Goto 6_7_GetCID
If %ErrorLevel%==8 Goto 6_8_EnterCID
If %ErrorLevel%==9 Goto 6_9_CheckKey
If %ErrorLevel%==10 Goto 6_A_DownloadMAS
If %ErrorLevel%==11 Goto 6_B_UpgradeToPro
If %ErrorLevel%==12 Goto 6_C_BackupMicrosoftLicense 
If %ErrorLevel%==13 Goto 6_D_RestoreMicrosoftLicense
If %ErrorLevel%==14 (Start ms-settings:activation) && (Goto %BTPBackMenu%)
If %ErrorLevel%==15 (Start "" "%OfficeSKUS%") && (Goto %BTPBackMenu%)
If %ErrorLevel%==16 (Start "" "%WindowsSKUS%") && (Goto %BTPBackMenu%)
If %ErrorLevel%==17 (Start "" "%pidkeyURL%") && (Goto %BTPBackMenu%)
If %ErrorLevel%==18 Goto 6_I_OfficeToolPlusDownloader
If %ErrorLevel%==19 Goto 6_0_ExitMainMenu

:CheckProductKey
Set "Status=Hop_le"
For /F %%b in ('Powershell -Command $Env:k1.Length') do Set KeyLen=%%b
If "%KeyLen%" NEQ "29" Set "Status=Khong_hop_le"
For /f "delims=" %%A in ('powershell -Command "& {if ('%k1%' -match '^[A-Za-z0-9-]+$') {echo Status=Hop_le} else {echo Status=Khong_hop_le}}"') do set %%A
set h1=%k1:~5,1%
set h2=%k1:~11,1%
set h3=%k1:~17,1%
set h4=%k1:~23,1%
If "%h1%%h2%%h3%%h4%" NEQ "----" Set "Status=Khong_hop_le"
Echo Ma san pham la %Status%.
If %Status% EQU Khong_hop_le (
	For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
	call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
)
Goto :EOF

:BlockedKey
Echo Ma san pham bi chan boi Microsoft ...
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_1_ActivateLicenseFromClipboard
cls
Echo ---------- BTP.6.1. Kiem Tra Ban Quyen ----------
Echo --- Lay ma san pham tu Clipboard 
For /F "tokens=*" %%b in ('powershell -command "get-clipboard"') do set k1=%%b
Echo --- Xoa Clipboard 
For /F tokens^=2* %%i in ('sc query^|find "Clipboard"')do >nul cd.|clip & net stop "%%i %%j" && net start "%%i %%j"
Echo --- Kiem tra ma san pham 
Call :CheckProductKey
For /F "tokens=*" %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/pidms_api?keys=%k1%&justgetdescription=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set CheckKey=%%b
SET CheckKey1=%CheckKey:"=_%
For /F "tokens=12 delims=," %%b in ("%CheckKey1%") do set Keyerr=%%b
If "%Keyerr%" EQU "_errorcode_:_0xC004C060_" Goto BlockedKey
If "%Keyerr%" EQU "_errorcode_:_0xC004C003_" Goto BlockedKey
For /F "tokens=11 delims=," %%b in ("%CheckKey1%") do set Keyerr=%%b
If "%Keyerr%" EQU "_blocked_:1" Goto BlockedKey
For /F "tokens=6 delims=," %%b in ("%CheckKey1%") do set CheckKey2=%%b
For /F "tokens=2 delims=:" %%b in ("%CheckKey2%") do set prd=%%b
For /F "tokens=2 delims=_" %%b in ("%prd%") do set Kind=%%b
set CheckOffVer=%prd:~7,2%
set "OffVer=Licenses16"
If "%CheckOffVer%" == "14" set "OffVer=Licenses"
If "%CheckOffVer%" == "15" set "OffVer=Licenses15"
set prd1=%prd:~1,3%
set prd2=%prd:~1,6%
set prd3=%prd:~1,4%
Echo --- Loai: %prd% 
If "%prd3%" == "null" (
	Echo Ma san pham khong xac dinh ...
	For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
	call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
)
If "%WmicActivation%"=="1" Goto Wmic_Activation
If "%prd1%" == "Win" Goto ActivateWindows
If "%prd2%" == "Office" Goto ActivateOffice
Goto %BTPBackMenu%

:Wmic_Activation
Echo ---------- BTP.6.2. Kich Hoat Ban Quyen Tu Clipboard Bang Wmic ----------
for %%a in (4,5,6) do (
	If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
	If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
Echo --- Kiem tra trang thai WMIC
If not exist "%windir%\System32\wbem\WMIC.exe" (
	Echo WMIC bi tat 
	Echo Dang them WMIC vao Windows ...
	DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
) Else (Echo WMIC san dung)
If "%prd2%" == "Office" (
	Echo --- Cai dat Office Skus %prd%
	For /F "tokens=3" %%b in ('cscript ospp.vbs /inpkey:%k1% ^| findstr /b /c:"ERROR CODE"') do set err=%%b
	If "%err%" == "0xC004F069" For /F %%x in ('dir /b ..\root\%OffVer%\%Kind%*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\%OffVer%\%%x"
)
Echo --- Cai dat ban quyen %prd%
Echo --- Nhap ma san pham
wmic path SoftwareLicensingService where (Version is not null) call InstallProductKey ProductKey='%k1%'
For /F "tokens=5 delims=-" %%a in ("%k1%") do set partialkey=%%a
Echo --- Lay IID
For /F "tokens=2 delims==" %%a in ('"wmic path SoftwareLicensingProduct where (PartialProductKey='%partialkey%') get OfflineInstallationId /value"') do set IID=%%a
Echo --- Lay CID
For /F "tokens=9 delims=," %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/cidms_api?iids=%IID%&justforcheck=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set ACID=%%b
set CID=%ACID:~27,48%
Echo --- Nhap CID
wmic path SoftwareLicensingProduct where (PartialProductKey='%partialkey%') call DepositOfflineConfirmationId InstallationID='%IID%' ConfirmationId='%CID%'
Echo --- Dang kich hoat
wmic path SoftwareLicensingProduct where (PartialProductKey='%partialkey%') call Activate
Echo --- Xuat ket qua
wmic path SoftwareLicensingProduct where (PartialProductKey='%partialkey%') get PartialProductKey,Name,LicenseStatus,GracePeriodRemaining,Description /value>k3.txt
Echo %prd%>>k3.txt & Echo IID:%IID%>>k3.txt & Echo CID:%CID%>>k3.txt & Echo %DATE%_%TIME%>>k3.txt 
start k3.txt
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:ActivateWindows
Echo ---------- BTP.6.1. Kich Hoat Ban Quyen Tu Clipboard ----------
Echo --- Dang kich hoat Windows %prd%
cd /d "%windir%\system32"
Echo --- Nhap ma san pham
cscript slmgr.vbs /ipk %k1% >nul
Echo --- Lay IID
For /F "tokens=3" %%b in ('cscript slmgr.vbs /dti ^| findstr /b /c:"Installation"') do set IID=%%b
Echo --- Lay CID
For /F "tokens=9 delims=," %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/cidms_api?iids=%IID%&justforcheck=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set ACID=%%b
set CID=%ACID:~27,48%
Echo --- Nhap CID
cscript slmgr.vbs /atp %CID%
Echo --- Dang kich hoat
cscript slmgr.vbs /ato
Echo --- Xuat ket qua
Echo %prd%>k2.txt & Echo IID:%IID% >>k2.txt & Echo CID:%CID% >>k2.txt & Echo %DATE%_%TIME% >> k2.txt  & ver>>k2.txt & cscript slmgr.vbs /dli >>k2.txt & cscript slmgr.vbs /xpr >>k2.txt & start k2.txt 
start ms-settings:activation
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:ActivateOffice
Echo ---------- BTP.6.1. Kich Hoat Ban Quyen Tu Clipboard ----------
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
Echo --- Dang kich hoat %prd%
Echo --- Nhap ma san pham
For /F "tokens=3" %%b in ('cscript ospp.vbs /inpkey:%k1% ^| findstr /b /c:"ERROR CODE"') do set err=%%b
If "%err%" == "0xC004F069" (
	Echo --- Cai dat Skus %prd%
	For /F %%x in ('dir /b ..\root\%OffVer%\%Kind%*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\%OffVer%\%%x"
	cscript ospp.vbs /inpkey:%k1%
)
Echo --- Lay IID
For /F "tokens=8" %%b in ('cscript ospp.vbs /dinstid ^| findstr /c:"%kind%"') do set IID=%%b
Echo --- Lay CID
For /F "tokens=9 delims=," %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/cidms_api?iids=%IID%&justforcheck=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set ACID=%%b
set CID=%ACID:~27,48%
Echo --- Nhap CID
cscript ospp.vbs /actcid:%CID%
Echo --- Dang kich hoat
cscript ospp.vbs /act
Echo --- Xuat ket qua
Echo %prd%>k1.txt & Echo IID:%IID%>>k1.txt & Echo CID:%CID%>>k1.txt & Echo %DATE%_%TIME% >> k1.txt & cscript ospp.vbs /dstatus >>k1.txt & start k1.txt
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_3_CheckStatus
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
cls
Echo ---------- BTP.6.3. Kiem Tra Trang Thai Windows-Office-Project-Visio ----------
cscript %windir%\system32\slmgr.vbs /dli & cscript %windir%\system32\slmgr.vbs /xpr & cscript ospp.vbs /dstatus
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_4_UninstallKey
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
cls
Echo ---------- BTP.6.4. Go Cai Dat Khoa Office-Project-Visio ----------
cscript ospp.vbs /dstatus 
Goto 6_4_loop1

:6_4_loop1
set "uninstallkey="
set /p "uninstallkey=Go cai dat ma san pham (Nhan Enter de thoat):"
If "%uninstallkey%" EQU "" Goto %BTPBackMenu%
cscript ospp.vbs /unpkey:%uninstallkey%
goto 6_4_loop1

:6_5_InstallKey
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
cls
Echo ---------- BTP.6.5. Cai Dat Khoa Office-Project-Visio ----------
set /p "install=Nhap ma san pham cua ban (Nhan Enter de thoat):"
If "%install%" EQU "" Goto %BTPBackMenu%
cscript ospp.vbs /inpkey:%install%
cscript ospp.vbs /dinstid
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_6_GetIID
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
cls
Echo ---------- BTP.6.6. Lay Ma Cai Dat Office-Project-Visio ----------
cscript ospp.vbs /dinstid
cscript ospp.vbs /dinstid>"%~dp0iid.txt"
start %~dp0iid.txt
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_7_GetCID
set "iid="
cls
Echo ---------- BTP.6.7. Lay CID tu IID ----------
set /p "IID=Nhap Ma Cai Dat (Khong Nhap Gi De Thoat):"
If "%IID%" EQU "" Goto %BTPBackMenu%
for /f "delims=" %%A in ('powershell -Command "& {if ('%IID%' -match '^[0-9]+$') {echo result=Valid} else {echo result=InValid}}"') do set %%A
For /F %%b in ('Powershell -Command $Env:IID.Length') do Set "IIDLen=%%b"
If %IIDLen% LSS 60 Set "result=InValid"
If %result%==InValid (
	Echo Ma Cai Dat la %result%.
	For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
	call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
)
For /F "tokens=9 delims=," %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/cidms_api?iids=%iid%&justforcheck=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set ACID=%%b
set CID=%ACID:~27,48%
For /F %%b in ('Powershell -Command $Env:CID.Length') do Set CIDLen=%%b
If %CIDLen% LSS 40 Set "CID=Khong_Co"
Echo Ma Xac Nhan: %CID%
Echo %CID%|clip
Echo Ket qua da duoc gui vao Clipboard.
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_8_EnterCID
set "CID="
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
cls
Echo ---------- BTP.6.8. Nhap Ma Xac Nhan Office-Project-Visio ----------
set /p "CID=Nhap Ma Xac Nhan (Khong Nhap Gi De Thoat):"
If "%CID%" EQU "" Goto %BTPBackMenu%
cscript ospp.vbs /actcid:%CID%
cscript ospp.vbs /act 
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_9_CheckKey
set "k1="
cls
Echo ---------- BTP.6.9. Kiem Tra Trang Thai Khoa San Pham ----------
set /p "k1=Nhap Khoa (Khong Nhap Gi De Thoat):"
If "%k1%" EQU "" Goto %BTPBackMenu%
Call :CheckProductKey
For /F "tokens=*" %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://pidkey.com/ajax/pidms_api?keys=%k1%&justgetdescription=0&apikey=%apikey%');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set CheckKey=%%b
SET CheckKey1=%CheckKey:"=_%
For /F "tokens=5,6,7,8,9,10,11,12,13,14,15,16,17,18,19 delims=," %%b in ("%CheckKey1%") do (
Echo %%b
Echo %%c
Echo %%d
Echo %%e
Echo %%f
Echo %%g
Echo %%h
Echo %%i
Echo %%k
Echo %%l
Echo %%m
Echo %%n
)
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_A_DownloadMAS
cls
Echo ---------- BTP.6.A. Tai Microsoft-Activation-Scripts ----------
Echo --- Cach 1: Tai xuong - Giai nen file Rar (Mat khau: PITVNcommunity) - Chay MAS_AIO.cmd ...
Start "" "https://glennsferryschools-my.sharepoint.com/:u:/g/personal/billgates_glennsferryschools_onmicrosoft_com/ESZxg41KKxpDh59Rnwm2xHYBMYYZhU8gJ5MOM1CwFEYBbw"
Set "link1=Powershell iex (irm https://get.activ" 
Set "link2=ated.win)"
Echo %link1%%link2%|clip 
start cmd
Echo --- Cach 2: Ban co the Dan (Ctrl+V) vao cua so CMD moi de chay MAS truc tiep.
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_B_UpgradeToPro
cls
Echo ---------- BTP.6.B. Nang Cap Windows Len Ban Professional ----------
Echo --- Kiem tra phien ban
For /F "tokens=*" %%b in ('POWERSHELL -command "(Get-WmiObject Win32_OperatingSystem).Caption"') do set "OsName=%%b"
echo %OsName% | find /I " Pro" >nul 2>&1
If "%ErrorLevel%" EQU "0" (
	Echo Phien ban Windows hien tai cua ban la Professional.
	For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
	call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
)
For /F "tokens=3,4" %%b in ('ver') do set "Version=%%b %%c"
Echo Phien ban he dieu hanh: %OsName% %Version%
For /F "tokens=4" %%b in ('POWERSHELL -command "(Get-WmiObject Win32_OperatingSystem).Caption"') do set "Edition=%%b"
If "%Edition%" EQU "Pro" (
	Echo Phien ban Windows hien tai cua ban la Professional.
	For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
	call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
)
Echo --- Nang cap Windows len phien ban Professional
cd %windir%\system32
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_C_BackupMicrosoftLicense
cls
Echo ---------- BTP.6.C. Sao Luu Giay Phep Microsoft ----------
Echo --- Tao ban sao luu giay phep ---
If not exist "%~dp0Backup" md "%~dp0Backup"
xcopy "%windir%\System32\spp\store" "%~dp0Backup" /e /h /q
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_D_RestoreMicrosoftLicense
cls
Echo ---------- BTP.6.D. Khoi Phuc Giay Phep Microsoft ----------
set OutDir=Backup
If not exist "%OutDir%" Goto restore0
Echo --- Dung mot so dich vu de khoi phuc kich hoat ---
net stop sppsvc>nul 2>nul 
net stop osppsvc>nul 2>nul
For /F "tokens=6 delims=[.] " %%a in ('ver') do set ver1=%%a
Echo --- Khoi phuc file giay phep Windows va Office ---	
If %ver1% LEQ 7601 (
	XCOPY %OutDir%\SoftwareProtectionPlatform\* %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform /s /i /y
	goto restore1
)
If %ver1% LEQ 4 (
	XCOPY %OutDir%\* %Windir%\System32\spp\store /s /i /y
	XCOPY %OutDir%\OfficeSoftwareProtectionPlatform\* %ProgramData%\Microsoft\OfficeSoftwareProtectionPlatform  /s /i /y 
	goto restore1
) 
XCOPY %OutDir%\* %Windir%\System32\spp\store /s /i /y
goto restore1

:restore0
Echo Khong co thu muc sao luu ...
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:restore1
Echo --- Khoi phuc giay phep Microsoft ---
Echo Dung dong cua so nay. Vui long doi (Mat nhieu thoi gian) ...
sc config sppsvc start= auto >nul 2>nul& net start sppsvc >nul 2>nul
sc config osppsvc  start= auto >nul 2>nul& net start osppsvc >nul 2>nul
sc config wuauserv start= auto >nul 2>nul& net start wuauserv >nul 2>nul
sc config LicenseManager start= auto >nul 2>nul& net start LicenseManager >nul 2>nul
cscript %windir%\system32\slmgr.vbs -rilc >nul 2>nul
cscript %windir%\system32\slmgr.vbs -dli >nul 2>nul
cscript %windir%\system32\slmgr.vbs -ato 
for %%a in (4,5,6) do (
If exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a")
)
Echo --- Lay trang thai giay phep Microsoft ---
cscript %windir%\system32\slmgr.vbs /dli & cscript %windir%\system32\slmgr.vbs /xpr & cscript ospp.vbs /dstatus
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_I_OfficeToolPlusDownloader
cls
Echo ---------- BTP.6.I. Goi Trinh Tai Office-Tool-Plus ----------
Set "link1=Powershell iex (irm https://www.officetool" 
Set "link2=.plus)"
Start %link1%%link2% 
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:6_0_ExitMainMenu
cd /d "%~dp0"
Goto MainMenu

:7_PITVNResources
start "" "https://docs.google.com/spreadsheets/u/2/d/e/2PACX-1vRlK-vRwPJHDaANT81EjyG4m5ZnLXdKRYfS0eKXyCzGymEfUDmKHRhxvUbtWYTfVn7MJ3E2jk7v3cGi/pubhtml"
Goto MainMenu

:8_ProductKey
Set "BTPBackMenu=MainMenu"
Set "FileDel="
Set "FolderDel="
Cls
Echo ---------- BTP.8. Lay Khoa San Pham Tu Mainboard ----------
For /F "tokens=*" %%a in ('powershell "(Get-WmiObject SoftwareLicensingService).OA3xOriginalProductKey"') do (set "ProductKey=%%a")
For /F "tokens=*" %%a in ('powershell "(Get-WmiObject SoftwareLicensingService).OA3xOriginalProductKeyDescription"') do (set "Description=%%a")
For /F "tokens=*" %%a in ('powershell "(Get-WmiObject SoftwareLicensingService).OA3xOriginalProductKeyPkPn"') do (set "PkPn=%%a")
For /F %%b in ('Powershell -Command $Env:ProductKey.Length') do Set ProductKeyLen=%%b
If %ProductKeyLen% LSS 5 (
	set "ProductKey=Khong_Co"
	set "Description=Khong_Co"
	set "PkPn=Khong_Co"
)
Echo   Khoa San Pham : %ProductKey%
Echo   Mo Ta         : %Description% 
Echo   Loai         : %PkPn% 
Echo   (Khoa San Pham da duoc gui vao clipboard)
Echo %ProductKey%|clip
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:SoftwareStatus
reg query "%link1%\%findstring%" /s >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "%link2%\%findstring%" /s >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Goto :EOF

:RufusCheck
Set "RufusStatus=Khong_Ton_Tai"
for /r C:\ %%F in (*rufus*) do (
	Set "RufusStatus=Da_Cai"
	Goto :EoF
)
Goto :EoF

:9_DownloadAndInstall_Begin
cls
Echo --------------------------- BTP.9. Tai va Cai Dat ---------------------------
Echo   [1] Kiem tra trang thai phan mem
Echo   [2] Khong kiem tra trang thai phan mem
Echo   [0] Thoat ve Menu Chinh                               
CHOICE /c 120 /n /m "------------------------ (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ------------------------"
If %ErrorLevel%==1 Goto 9_1_CheckSoftware
If %ErrorLevel%==2 Goto 9_2_NotCheckSoftware
If %ErrorLevel%==3 Goto MainMenu

:9_1_CheckSoftware
echo ----- Kiem tra trang thai 7Zip
Set "link1=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=7-Zip"
Call :SoftwareStatus
Set "Zip7Status=%Result%"
echo ----- Kiem tra trang thai AnyDesk
Set "link1=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=AnyDesk"
Call :SoftwareStatus
Set "AnyDeskStatus=%Result%"
echo ----- Kiem tra trang thai AdvancedIP
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Advanced Scanner">nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Advanced Scanner">nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "AdvancedIPStatus=%Result%"
echo ----- Kiem tra trang thai EVKey
tasklist | findstr /i "EVkey*" >nul 2>&1
If %ErrorLevel%==0 (Set "EVKeyStatus=Da_Cai") Else (Set "EVKeyStatus=Khong_Ton_Tai")
echo ----- Kiem tra trang thai FDM
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Free Download">nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Free Download">nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "FDMStatus=Da_Cai") Else (Set "FDMStatus=Khong_Ton_Tai")
echo ----- Kiem tra trang thai HttpToolkit
dir "%LOCALAPPDATA%\programs\httptoolkit" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Toolkit">nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Toolkit">nul 2>&1
If %ErrorLevel%==0 (Set "c3=1") ELSE (Set "c3=0")
If "%c1%%c2%%c3%" NEQ "000" (Set "HttpToolkitStatus=Da_Cai") Else (Set "HttpToolkitStatus=Khong_Ton_Tai")
echo ----- Kiem tra trang thai HWinfo
Set "link1=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=HWiNFO"
Call :SoftwareStatus
Set "HWinfoStatus=%Result%"
echo ----- Kiem tra trang thai IDM
Set "link1=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=Internet Download Manager"
Call :SoftwareStatus
Set "IDMStatus=%Result%"
echo ----- Kiem tra trang thai OBSStudio
Set "link1=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=OBS Studio"
Call :SoftwareStatus
Set "OBSStudioStatus=%Result%"
echo ----- Kiem tra trang thai OpenHashTab
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "OpenHashTab" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "OpenHashTab" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "OpenHashTabStatus=%Result%"
echo ----- Kiem tra trang thai RevoUninstaller
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Revo Uninstaller" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Revo Uninstaller" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else ( WXSet "Result=Khong_Ton_Tai")
Set "RevoUninstallerStatus=%Result%"
echo ----- Kiem tra trang thai KLite
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "K-Lite" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "K-Lite" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "KLiteStatus=%Result%"
echo ----- Kiem tra trang thai TeamViewer
Set "link1=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=TeamViewer"
Call :SoftwareStatus
Set "TeamViewerStatus=%Result%"
echo ----- Kiem tra trang thai Telegram
if exist "C:\Users\%USERNAME%\AppData\Roaming\Telegram Desktop\Telegram.exe" (Set "c1=1") ELSE (Set "c1=0")
if exist "C:\Program Files\Telegram Desktop\Telegram.exe" (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "TelegramStatus=%Result%"
echo ----- Kiem tra trang thai UltraViewer
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "UltraViewer" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "UltraViewer" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "UltraViewerStatus=%Result%"
echo ----- Kiem tra trang thai Unikey
tasklist | findstr /i "Unikey*" >nul 2>&1
If %ErrorLevel%==0 (Set "UnikeyStatus=Da_Cai") Else (Set "UnikeyStatus=Khong_Ton_Tai")
echo ----- Kiem tra trang thai WindowsStore
for /f "tokens=*" %%A in ('powershell -Command "if (Get-AppxPackage *Microsoft.WindowsStore*) { echo WindowsStoreStatus=Da_Cai } else { echo WindowsStoreStatus=Khong_Ton_Tai }"') do Set %%A
echo ----- Kiem tra trang thai WinRAR
Set "link1=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Set "link2=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
Set "findstring=WinRAR archiver"
Call :SoftwareStatus
Set "WinRARStatus=%Result%"
echo ----- Kiem tra trang thai Zalo
if exist "C:\Program Files\Zalo\Zalo.exe" (Set "c1=1") ELSE (Set "c1=0")
if exist "C:\Program Files (x86)\Zalo\Zalo.exe" (Set "c2=1") ELSE (Set "c2=0")
if exist "%LOCALAPPDATA%\Programs\Zalo\Zalo.exe" (Set "c3=1") ELSE (Set "c3=0")
If "%c1%%c2%%c3%" NEQ "000" (Set "ZaloStatus=Da_Cai") Else (Set "ZaloStatus=Khong_Ton_Tai")
Goto 9_DownloadAndInstall

:9_2_NotCheckSoftware
for %%a in (Zip7Status AnyDeskStatus AdvancedIPStatus EVKeyStatus FDMStatus HttpToolkitStatus HWinfoStatus ^
IDMStatus OBSStudioStatus OpenHashTabStatus RevoUninstallerStatus KLiteStatus TeamViewerStatus TelegramStatus ^
UltraViewerStatus UnikeyStatus WindowsStoreStatus WinRARStatus ZaloStatus) do set "%%a=Khong_Kiem_Tra"
Goto 9_DownloadAndInstall

:9_DownloadAndInstall
cd /d "%~dp0"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel="
Set "FolderDel="
cls
Echo --------------------------- BTP.9. Tai va Cai Dat ---------------------------
Echo   [1] 7-Zip (%Zip7Status%)                      [G] Open Hash Tab (%OpenHashTabStatus%)
Echo   [2] Trinh Gia Lap Android                     [H] Mo URL WinPE AVLboot
Echo   [3] Phan Mem Diet Virus                       [I] May Tinh Tu Xa
Echo   [4] Anydesk (%AnyDeskStatus%)                 [J] Revo Uninstaller (%RevoUninstallerStatus%)
Echo   [5] Advanced IP Scanner (%AdvancedIPStatus%)  [K] Rufus
Echo   [6] DotNet Framework 3.5, 4.6, 4.7, 4.8       [L] Standard K-Lite (%KLiteStatus%)
Echo   [7] EVKey (%EVKeyStatus%)                     [M] Store cho Windows (%WindowsStoreStatus%)
Echo   [8] Free Download Manager (%FDMStatus%)       [N] Teamviewer (%TeamViewerStatus%)
Echo   [9] Http Toolkit (%HttpToolkitStatus%)        [O] Telegram (%TelegramStatus%)
Echo   [A] HWinfo (%HWinfoStatus%)                   [P] UltraViewer (%UltraViewerStatus%)
Echo   [B] Internet Download Manager (%IDMStatus%)   [Q] Unikey (%UnikeyStatus%)
Echo   [C] Microsoft Office 2016-2019-2021-2024-365  [R] VPN
Echo   [D] Microsoft Visual C++ Redistributable      [S] Trinh Duyet Web
Echo   [E] OBSstudio (%OBSStudioStatus%)             [T] Winrar (%WinRARStatus%)
Echo   [F] Office Tool - Yerong                      [U] Zalo (%ZaloStatus%)
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 123456789ABCDEFGHIJKLMNOPQRSTU0 /n /m "------------------------ (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ------------------------"
If %ErrorLevel%==1 Goto 9_1_7Zip
If %ErrorLevel%==2 Goto 9_2_AndroidEmulator_Begin
If %ErrorLevel%==3 Goto 9_3_Antivirus
If %ErrorLevel%==4 Goto 9_4_Anydesk 
If %ErrorLevel%==5 Goto 9_5_AdvancedIPScanner
If %ErrorLevel%==6 Goto 9_6_NetFramework_Begin
If %ErrorLevel%==7 Goto 9_7_EVKey
If %ErrorLevel%==8 Goto 9_8_FreeDownloadManager 
If %ErrorLevel%==9 Goto 9_9_HttpToolkit
If %ErrorLevel%==10 Goto 9_A_HwInfo
If %ErrorLevel%==11 Goto 9_B_IDM
If %ErrorLevel%==12 Goto 9_C_InstallOffice
If %ErrorLevel%==13 Goto 9_D_VisualC
If %ErrorLevel%==14 Goto 9_E_OBSstudio
If %ErrorLevel%==15 Goto 9_F_OfficeToolYerong
If %ErrorLevel%==16 Goto 9_G_OpenHashTab
If %ErrorLevel%==17 (Start "" "%BTPboot%") && (Goto 9_DownloadAndInstall)
If %ErrorLevel%==18 Goto 9_I_RemoteDesktop
If %ErrorLevel%==19 Goto 9_J_RevoUninstaller   
If %ErrorLevel%==20 Goto 9_K_Rufus
If %ErrorLevel%==21 Goto 9_L_StandardKLiteCodecPack  
If %ErrorLevel%==22 Goto 9_M_StoreForWindodws 
If %ErrorLevel%==23 Goto 9_N_TeamViewer  
If %ErrorLevel%==24 Goto 9_O_Telegram
If %ErrorLevel%==25 Goto 9_P_UltraViewer 
If %ErrorLevel%==26 Goto 9_Q_Unikey 
If %ErrorLevel%==27 Goto 9_R_VPN  
If %ErrorLevel%==28 Goto 9_S_WebsiteBrowser  
If %ErrorLevel%==29 Goto 9_T_Winrar
If %ErrorLevel%==30 Goto 9_U_Zalo
If %ErrorLevel%==31 Goto MainMenu

:9_1_7Zip
CLS
Echo -------------- BTP.9.1. 7-Zip --------------
If EXIST "%Windir%\SysWOW64" (Set "URL=%zip64%") ELSE (SET "URL=%zip86%")
Set "File=zip7.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=9_DownloadAndInstall"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:AndroidEmulatorStatus
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /I "%findstring%" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "%findstring%" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Goto :EOF

:9_2_AndroidEmulator_Begin

:: Check AndroidStudioStatus
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Android Studio" >nul 2>&1
If %ErrorLevel%==0 (Set "c1=1") ELSE (Set "c1=0")
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Android Studio" >nul 2>&1
If %ErrorLevel%==0 (Set "c2=1") ELSE (Set "c2=0")
If "%c1%%c2%" NEQ "00" (Set "Result=Da_Cai") Else (Set "Result=Khong_Ton_Tai")
Set "AndroidStudioStatus=%Result%"

:: Check BlueStacksStatus
set "findstring=BlueStacks"
Call :AndroidEmulatorStatus
Set "BlueStacksStatus=%Result%"

:: Check GameLoopStatus
set "findstring=GameLoop"
Call :AndroidEmulatorStatus
Set "GameLoopStatus=%Result%"

:: Check GenymobileStatus
set "findstring=Genymotion"
Call :AndroidEmulatorStatus
Set "GenymobileStatus=%Result%"

:: Check LDPlayerStatus
set "findstring=LDPlayer"
Call :AndroidEmulatorStatus
Set "LDPlayerStatus=%Result%"

:: Check MEmuPlayerStatus
set "findstring=LDPlayer"
Call :AndroidEmulatorStatus
Set "MEmuPlayerStatus=%Result%"
If exist "%ProgramFiles%\Microvirt\MEmu\MEmu.exe" Set "MEmuPlayerStatus=Da_Cai"
If exist "%ProgramFiles(x86)%\Microvirt\MEmu\MEmu.exe" Set "MEmuPlayerStatus=Da_Cai"
If exist "D:\Program Files\Microvirt\MEmu\MEmu.exe" Set "MEmuPlayerStatus=Da_Cai"
If exist "E:\Program Files\Microvirt\MEmu\MEmu.exe" Set "MEmuPlayerStatus=Da_Cai"
If exist "F:\Program Files\Microvirt\MEmu\MEmu.exe" Set "MEmuPlayerStatus=Da_Cai"

:: Check MuMuPlayerStatus
set "findstring=MuMu"
Call :AndroidEmulatorStatus
Set "MuMuPlayerStatus=%Result%"

:: Check NoxPlayerStatus
set "findstring=Nox"
Call :AndroidEmulatorStatus
Set "NoxPlayerStatus=%Result%"

:9_2_AndroidEmulator
Set "BTPBackMenu=9_2_AndroidEmulator"
Set "FileDel="
Set "FolderDel="
cls
Echo ------- BTP.9.2. Trinh Gia Lap Android -------
Echo   [1] Android Studio (%AndroidStudioStatus%)
Echo   [2] BlueStacks (%BlueStacksStatus%)
Echo   [3] GameLoop (%GameLoopStatus%)
Echo   [4] Genymotion (%GenymobileStatus%)
Echo   [5] LDPlayer (%LDPlayerStatus%)
Echo   [6] MEmuPlayer (%MEmuPlayerStatus%)
Echo   [7] MuMuPlayer (%MuMuPlayerStatus%)
Echo   [8] NoxPlayer (%NoxPlayerStatus%)
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 123456780 /n /m "--- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ---"
If %ErrorLevel%==1 Goto 9_2_1_AndroidStudio
If %ErrorLevel%==2 Goto 9_2_2_BlueStacks
If %ErrorLevel%==3 Goto 9_2_3_GameLoop
If %ErrorLevel%==4 Goto 9_2_4_Genymotion
If %ErrorLevel%==5 Goto 9_2_5_LDPlayer
If %ErrorLevel%==6 Goto 9_2_6_MEmuPlayer
If %ErrorLevel%==7 Goto 9_2_7_MuMuPlayer
If %ErrorLevel%==8 Goto 9_2_8_NoxPlayer
If %ErrorLevel%==9 Goto 9_DownloadAndInstall

:9_2_1_AndroidStudio
CLS
Echo -------------- BTP.9.2.1. Android Studio --------------
Set "URL=https://r4---sn-a5meknde.gvt1.com/edgedl/android/studio/install/2024.3.1.13/android-studio-2024.3.1.13-windows.exe"
Set "File=AndroidStudio.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_2_BlueStacks
CLS
Echo -------------- BTP.9.2.2. BlueStacks --------------
Set "URL=https://cloud.bluestacks.com/api/getdownloadnow"
Set "File=BlueStacksSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_3_GameLoop
CLS
Echo -------------- BTP.9.2.3. GameLoop --------------
Set "URL=https://down.gameloop.com/channel/3/26460/GLP_installer_900223150_market.exe"
netsh interface ip set dns name="Ethernet" static 168.95.1.1
netsh interface ip add dns name="Ethernet" 168.95.192.1 index=2
netsh interface ip set dns name="Wi-Fi" static 168.95.1.1
netsh interface ip add dns name="Wi-Fi" 168.95.192.1 index=2
Set "File=GLPinstaller.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
netsh interface ip set dns name="Wi-Fi" dhcp
netsh interface ip set dns name="Ethernet" dhcp
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_4_Genymotion
CLS
Echo -------------- BTP.9.2.4. Genymotion --------------
Set "URL=https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-vbox.exe"
Set "File=genymotion.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_5_LDPlayer
CLS
Echo -------------- BTP.9.2.5. LDPlayer --------------
Set "URL=https://res.ldrescdn.com/download/LDPlayer9.exe?n=LDPlayer9_vn_1003_ld.exe"
Set "File=LDPlayer9.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_6_MEmuPlayer
CLS
Echo -------------- BTP.9.2.6. MEmuPlayer --------------
Set "URL=https://www.memuplay.com/download-new.php?from=official_release_download"
Set "File=MEmuSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_7_MuMuPlayer
CLS
Echo -------------- BTP.9.2.7. MuMuPlayer --------------
Set "URL=https://a11.gdl.netease.com/MuMuInstaller_3.1.7.0_gw-overseas12_all_1712735105.exe"
Set "File=MuMuInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_2_AndroidEmulator"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_2_8_NoxPlayer
CLS
Echo -------------- BTP.9.2.8. NoxPlayer --------------
Set "URL=https://res06.bignox.com/full/20241125/357b7f166cf94cd18f37d9a6f24ad08c.exe?filename=nox_setup_v7.0.6.2_full_intl.exe"
Set "File=NoxPlayerSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_2_AndroidEmulator"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_3_Antivirus
Set "BTPBackMenu=9_3_Antivirus"
Set "FileDel="
Set "FolderDel="
cls
Echo ----------- BTP.9.3. Phan Mem Diet Virus -----------
Echo   [1] Eset Essential 
Echo   [2] Eset Premium 
Echo   [3] Eset Small Business Security
Echo   [4] Malwarebytes Phien Ban 4
Echo   [5] Malwarebytes Phien Ban 5
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 123450 /n /m "--- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ---"
If %ErrorLevel%==1 Goto 9_3_1_EsetEssential
If %ErrorLevel%==2 Goto 9_3_2_EsetPremium 
If %ErrorLevel%==3 Goto 9_3_3_EsetSmallBusinessSecurity
If %ErrorLevel%==4 Goto 9_3_4_Malwarebytes4
If %ErrorLevel%==5 Goto 9_3_5_Malwarebytes5
If %ErrorLevel%==6 Goto 9_DownloadAndInstall

:9_3_1_EsetEssential
CLS
Echo -------------- BTP.3.1. Eset Essential --------------
Set "URL=https://download.eset.com/com/eset/tools/installers/live_eis/latest/eset_internet_security_live_installer.exe"
Set "File=EsetInternetSecurityInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_Antivirus"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_3_2_EsetPremium
CLS
Echo -------------- BTP.3.2. Eset Premium --------------
Set "URL=https://download.eset.com/com/eset/tools/installers/live_essp/latest/eset_smart_security_premium_live_installer.exe"
Set "File=EsetSmartSecurityInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_Antivirus"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_3_3_EsetSmallBusinessSecurity
CLS
Echo -------------- BTP.3.3. Eset Small Business Security --------------
Set "URL=https://download.eset.com/com/eset/tools/installers/live_esbs/latest/eset_small_business_security_live_installer.exe"
Set "File=EsetSmartBusinessSecurityInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_Antivirus"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_3_4_Malwarebytes4
CLS
Echo -------------- BTP.3.4. Malwarebytes Phien Ban 4 --------------
Set "URL=https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/offline/MBSetup.exe"
Set "File=MBSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_Antivirus"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_3_5_Malwarebytes5
CLS
Echo -------------- BTP.3.5. Malwarebytes Phien Ban 5 --------------
Set "URL=https://data-cdn.mbamupdates.com/web/mb5-setup-consumer/MBSetup.exe"
Set "File=MBSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_Antivirus"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_4_Anydesk
CLS
Echo -------------- BTP.9.4. Anydesk --------------
Set "URL=%AnydeskURL%"
Set "File=Anydesk.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_5_AdvancedIPScanner
CLS
Echo -------------- BTP.9.5. Advanced IP Scanner --------------
Set "URL=%AdvancedIPScannerURL%"
Set "File=AdvancedIPScanner.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_6_NetFramework_Begin
Reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5" /v SP >nul 2>&1
If %ErrorLevel%==0 (Set "status350=Da_Cai") Else (Set "status350=Khong_Ton_Tai")
For /f "tokens=3" %%v in ('reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v Version') do set NET_VERSION=%%v
Reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v Version >nul 2>&1
If %ErrorLevel% NEQ 0 set "NET_VERSION=Khong_Ton_Tai"

:9_6_NetFramework
Set "BTPBackMenu=9_6_NetFramework"
Set "FileDel="
Set "FolderDel="
cls
Echo ------------ BTP.9.6. DotNET Framework ------------
Echo   [1] .NET Framework 3.5 SP1 (%status350%)
Echo   Phien ban .NET Framework hien tai: %NET_VERSION%
Echo   [2] .NET Framework 4.6.2 truc tuyen
Echo   [3] .NET Framework 4.6.2 ngoai tuyen
Echo   [4] .NET Framework 4.7 truc tuyen
Echo   [5] .NET Framework 4.7 ngoai tuyen
Echo   [6] .NET Framework 4.7.1 truc tuyen
Echo   [7] .NET Framework 4.7.1 ngoai tuyen
Echo   [8] .NET Framework 4.7.2 truc tuyen
Echo   [9] .NET Framework 4.7.2 ngoai tuyen
Echo   [A] .NET Framework 4.8 truc tuyen
Echo   [B] .NET Framework 4.8 ngoai tuyen
Echo   [C] .NET Framework 4.8.1 truc tuyen
Echo   [D] .NET Framework 4.8.1 ngoai tuyen
Echo   [E] Mo lien ket tai xuong
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 123456789ABCDE0 /n /m "-------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) --------"
If %ErrorLevel%==1 Goto 9_6_1_35SP1
If %ErrorLevel%==2 Goto 9_6_2_Online462
If %ErrorLevel%==3 Goto 9_6_3_Offline462
If %ErrorLevel%==4 Goto 9_6_4_Online47
If %ErrorLevel%==5 Goto 9_6_5_Offline47
If %ErrorLevel%==6 Goto 9_6_6_Online471
If %ErrorLevel%==7 Goto 9_6_7_Offline471
If %ErrorLevel%==8 Goto 9_6_8_Online472
If %ErrorLevel%==9 Goto 9_6_9_Offline472
If %ErrorLevel%==10 Goto 9_6_A_Online48
If %ErrorLevel%==11 Goto 9_6_B_Offline48
If %ErrorLevel%==12 Goto 9_6_C_Online481
If %ErrorLevel%==13 Goto 9_6_D_Offline481
If %ErrorLevel%==14 Goto 9_6_E_OpenDownloadLink
If %ErrorLevel%==15 Goto 9_DownloadAndInstall

:Process
Set "FilePath=%cd%\%File%"
Set "FileDel=% CHFile%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"
Goto :EOF

:9_6_1_35SP1
CLS
Echo ------- BTP.9.6.1. .NET Framework 3.5 SP1 -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2186537"
Set "File=dotnet350.exe"
Call :Process

:9_6_2_Online462
CLS
Echo ------- BTP.9.6.2. .NET Framework 4.6.2 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=780596"
Set "File=dotnet462online.exe"
Call :Process

:9_6_3_Offline462
CLS
Echo ------- BTP.9.6.3. .NET Framework 4.6.2 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2099468"
Set "File=dotnet462offline.exe"
Call :Process

:9_6_4_Online47
CLS
Echo ------- BTP.9.6.4. .NET Framework 4.7 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=825298"
Set "File=dotnet470online.exe"
Call :Process

:9_6_5_Offline47
CLS
Echo ------- BTP.9.6.5. .NET Framework 4.7 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2099385"
Set "File=dotnet470offline.exe"
Call :Process

:9_6_6_Online471
CLS
Echo ------- BTP.9.6.6. .NET Framework 4.7.1 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=852092"
Set "File=dotnet471online.exe"
Call :Process

:9_6_7_Offline471
CLS
Echo ------- BTP.9.6.7. .NET Framework 4.7.1 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2099383"
Set "File=dotnet471offline.exe"
Call :Process

:9_6_8_Online472
CLS
Echo ------- BTP.9.6.8. .NET Framework 4.7.2 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=863262"
Set "File=dotnet472online.exe"
Call :Process

:9_6_9_Offline472
CLS
Echo ------- BTP.9.6.9. .NET Framework 4.7.2 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=863265"
Set "File=dotnet472offline.exe"
Call :Process

:9_6_A_Online48
CLS
Echo ------- BTP.9.6.A. .NET Framework 4.8 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2085155"
Set "File=dotnet480online.exe"
Call :Process

:9_6_B_Offline48
CLS
Echo ------- BTP.9.6.B. .NET Framework 4.8 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2088631"
Set "File=dotnet480offline.exe"
Call :Process

:9_6_C_Online481
CLS
Echo ------- BTP.9.6.C. .NET Framework 4.8.1 truc tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2203304"
Set "File=dotnet481online.exe"
Call :Process

:9_6_D_Offline481
CLS
Echo ------- BTP.9.6.D. .NET Framework 4.8.1 ngoai tuyen -------
Set "URL=https://go.microsoft.com/fwlink/?LinkId=2203305"
Set "File=dotnet481offline.exe"
Call :Process

:9_6_E_OpenDownloadLink
Start "" "https://dotnet.microsoft.com/en-us/download/dotnet-framework"
Goto P4_NetFramwork

:9_7_EVKey
CLS
Echo -------------- BTP.9.7. EVKey --------------
Set "URL=%EVKeyURL%"
Set "File=EVKey.zip"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Giai nen EVKey.zip ...
If not exist "C:\EVKey" md "C:\EVKey"
If not exist "C:\EVKey\EVKey*.exe" (Powershell -command Expand-Archive -LiteralPath '%~dp0EVKey.zip' -DestinationPath "C:\EVKey")
Echo Chay EVKey ...
If EXIST "C:\EVKey\EVKey64.exe" (Start C:\EVKey\EVKey64.exe) ELSE (Start C:\EVKey\EVKey32.exe)
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_8_FreeDownloadManager
CLS
Echo -------------- BTP.9.8. Free Download Manager --------------
If EXIST "%Windir%\SysWOW64" (Set "URL=%freedownloadmanager64%") ELSE (SET "URL=%freedownloadmanager86%")
Set "File=FreeDownloadManager.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_9_HttpToolkit
CLS
Echo -------------- BTP.9.9. Http Toolkit --------------
Set "URL=%HttpToolkitURL%"
Set "File=HttpToolkit.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_A_HwInfo
CLS
Echo -------------- BTP.9.A. HWInfo --------------
Set "URL=%HwInfoURL%"
Set "File=HwInfo.zip"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel=hwinfo"
Call :URLDownload
Echo Giai nen HwInfo ...
If not exist "%~dp0hwinfo" mkdir "%~dp0hwinfo"
Powershell -command "Expand-Archive -LiteralPath '%FilePath%' -DestinationPath '%~dp0HwInfo'"
Echo Chay HwInfo ...
If exist "%windir%\SysWOW64" (Start %~dp0HwInfo\HWiNFO64.exe) else (Start %~dp0HwInfo\HWiNFO32.exe)
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_B_IDM
Set "BTPBackMenu=9_B_IDM"
Set "FileDel="
Set "FolderDel="
cls
Echo ------------- BTP.9.B. Internet Download Manager -------------
Echo                       Trang thai: %IDMStatus%
Echo   [1] Cai dat phien ban moi nhat Internet Download Manager
Echo   [2] Tai IAS de kich hoat Internet Download Manager
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 120 /n /m "------------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) -------------"
If %ErrorLevel%==1 Goto 9_B_1_InstallIDM
If %ErrorLevel%==2 Goto 9_B_2_DownloadIAS
If %ErrorLevel%==3 Goto 9_DownloadAndInstall

:9_B_1_InstallIDM
cls
Echo ----- BTP.9.B.1. Cai dat phien ban moi nhat IDM -----
Set "URL=https://www.internetdownloadmanager.com/download.html"
Set "File=download.html"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Lay phien ban moi nhat IDM ...
findstr /C:"https://mirror2.internetdownloadmanager.com/idman" DOWNLOAD.HTML > link.txt
For /F "tokens=3 delims==&" %%A in ('findstr /C:"filename=" link.txt') do set B=%%A
For /F "delims=?" %%i in (%B%") do set "URL=%%i"
DEL DOWNLOAD.HTML
DEL link.txt
Set "File=idm.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_B_2_DownloadIAS
cls
Echo ----- BTP.9.B.2. Tai IAS de kich hoat IDM -----
Set "Link1=https://gitla"
Set "Link2=b.com/sh4mim/IDM-Activation-Script/-/raw/main/IAS.cmd"
Set "URL=%Link1%%Link2%"
Set "File=IAS.cmd"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_C_InstallOffice
cd /d "%~dp0"
cls
Echo ------- BTP.9.C. Trien khai Microsoft Office 2016, 2019, 2021, 2024, 365 -------
Echo --- Lay thong tin
For /F "tokens=2,*" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds 2^>nul') do set OfficeVersion=%%J
For /F %%b in ('Powershell -Command $Env:OfficeVersion.Length') do Set OfficeVersionLen=%%b

for /f "tokens=2,* delims= " %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds ^| find "ProductReleaseIds"') do (
	for /f "tokens=1 delims=," %%C in ("%%B") do Set "ProductID=%%C"
)
For /F %%b in ('Powershell -Command "$Env:ProductID.Length"') do Set "ProductIDLen=%%b"
If %ProductIDLen% LSS 5 (Set "ProductID=Khong_Co") 

:: --- Get the ExcludedApps list from registry
for /f "tokens=1,2,* delims= " %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" ^| find "ExcludedApps"') do set ExcludedApps=%%C
:: --- List of all Office apps
set "AllApps=word excel powerpoint access outlook onenote publisher teams onedrive lync groove bing"
:: --- Initialize result variable
set "result="
:: --- Compare lists and store installed apps
for %%A in (%AllApps%) do (
    echo %ExcludedApps% | findstr /i /c:"%%A" >nul || set "result=!result!, %%A"
)
:: --- Remove leading comma and space
set "InstalledApps=%result:~2%"
If %OfficeVersionLen% LSS 5 (
	Set "OfficeVersion=Khong_Co"
	Set "InstalledApps=Khong_Co"
)
Echo --- Tai Cong cu Trien khai Office
If exist "setup.exe" Goto :9_C_InstallOffice_2
If exist "officedeploymenttool.exe" Goto :9_C_InstallOffice_1
set "URL=https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_18526-20146.exe"
set "File=officedeploymenttool.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Echo --- Tai %File% 
Call :URLDownload

:9_C_InstallOffice_1
%FilePath% /quiet /extract:"%cd%"

Echo --- Kiem tra xem setup.exe co san hay khong
If not exist "setup.exe" (
	Echo Loi: Khong the giai nen...
	pause
	Goto 9_DownloadAndInstall
)
del "%File%"
del "configuration*"

:9_C_InstallOffice_2
If "%Processor_Architecture%"=="x86" Set "Architecture=32-bit"
If "%Processor_Architecture%"=="AMD64" Set "Architecture=64-bit"
If "%Processor_Architecture%"=="ARM64" Set "Architecture=64-bit"
Set "on=(Co)"
Set "off=(Khong) "
For /F "tokens=*" %%b in ('powershell -command "(Get-InstalledLanguage).LanguageID"') do set "LanguageID=%%b"

:: Getting Version, Apps, Update Channel, Language
If "%ProductID%" EQU "Khong_Co" Goto 9_C_G_Default
echo %InstalledApps% | find "word" >nul && Set "opt1=%on%" || Set "opt1=%off%"
echo %InstalledApps% | find "excel" >nul && Set "opt2=%on%" || Set "opt2=%off%"
echo %InstalledApps% | find "powerpoint" >nul && Set "opt3=%on%" || Set "opt3=%off%"
echo %InstalledApps% | find "access" >nul && Set "opt4=%on%" || Set "opt4=%off%"
echo %InstalledApps% | find "outlook" >nul && Set "opt5=%on%" || Set "opt5=%off%"
echo %InstalledApps% | find "onenote" >nul && Set "opt6=%on%" || Set "opt6=%off%"
echo %InstalledApps% | find "publisher" >nul && Set "opt7=%on%" || Set "opt7=%off%"
echo %InstalledApps% | find "teams" >nul && Set "opt8=%on%" || Set "opt8=%off%"
echo %InstalledApps% | find "onedrive" >nul && Set "opt9=%on%" || Set "opt9=%off%"
echo %InstalledApps% | find "bing" >nul && Set "optA=%on%" || Set "optA=%off%"
for %%L in (B C D E) do set "opt%%L=%off%"
set "optF=%on%"
Set "optP=%ProductID%"
If "%optP%" EQU "O365ProPlusRetail" (
	Set "optV=365"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	Set "optU=Current"
)
If "%optP%" EQU "O365BusinessRetail" (
	Set "optV=365"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	Set "optU=Current"
)
If "%optP%" EQU "ProPlus2024Volume" (
	Set "optV=2024"
	Set "Project=ProjectPro2024Volume"
	Set "Visio=VisioPro2024Volume"
	Set "optU=PerpetualVL2024"
)
If "%optP%" EQU "ProPlus2024Retail" (
	Set "optV=2024"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	Set "optU=Current"
)
If "%optP%" EQU "ProPlus2021Volume" (
	Set "optV=2021"
	Set "Project=ProjectPro2021Volume"
	Set "Visio=VisioPro2021Volume"
	Set "optU=PerpetualVL2021"
)
If "%optP%" EQU "ProPlus2021Retail" (
	Set "optV=2021"
	Set "Project=ProjectPro2021Retail"
	Set "Visio=VisioPro2021Retail"
	Set "optU=Current"
)
If "%optP%" EQU "ProPlus2019Volume" (
	Set "optV=2019"
	Set "Project=ProjectPro2019Volume"
	Set "Visio=VisioPro2019Volume"
	Set "optU=PerpetualVL2019"
)
If "%optP%" EQU "ProPlus2019Retail" (
	Set "optV=2019"
	Set "Project=ProjectPro2019Retail"
	Set "Visio=VisioPro2019Retail"
	Set "optU=Current"
)
If "%optP%" EQU "ProPlusRetail" (
	Set "optV=2016"
	Set "Project=ProjectProRetail"
	Set "Visio=VisioProRetail"
	Set "optU=Current"
)
If "%Architecture%"=="64-bit" (
	Set "optI=64-bit"
	Set "OfficeClientEdition=64"
)
If "%Architecture%"=="32-bit" (
	Set "optI=32-bit"
	Set "OfficeClientEdition=32"
)
Set "optL=%LanguageID%"
Set "optT=Install_Online"

:InstallOfficeMENU
Set "OCS=BTPconfig.xml"
CLS
Echo ---------- BTP.9.C. Microsoft Office 2016, 2019, 2021, 2024, 365 ----------
Echo     Kien truc he dieu hanh: %Architecture%. Ma ngon ngu he dieu hanh: %LanguageID%. 
Echo     Phien ban hien tai: %OfficeVersion%.
Echo     Ung dung da cai: %InstalledApps%.
Echo ---------------------------------------------------------------------------
<NUL Set/P=[V] Phien ban Office : & (Call :EchoColor "%optV%" %ContrastColor%) & Echo  .
<NUL Set/P=[P] Ma san pham     : & (Call :EchoColor "%optP%" %ContrastColor%) & Echo  .
<NUL Set/P=[U] Kenh cap nhat   : & (Call :EchoColor "%optU%" %ContrastColor%) & Echo  .
<NUL Set/P=[I] Kien truc       : & (Call :EchoColor "%optI%" %ContrastColor%) & Echo  .
<NUL Set/P=[L] Ngon ngu Office : & (Call :EchoColor "%optL%" %ContrastColor%) & Echo  .
<NUL Set/P=[T] Loai trien khai : & (If "%optT%"=="Uninstall" (Call :EchoColor "%optT%" 5e) Else (Call :EchoColor "%optT%"  %ContrastColor%) ) & Echo  .
<NUL Set/P=[1] & (If "%opt1%"=="%on%" (Call :EchoColor "%opt1%"  %ContrastColor%)  Else (<NUL Set/P="%opt1%")) & <NUL Set/P=Microsoft Word.             [2] & (If "%opt2%"=="%on%" (Call :EchoColor "%opt2%"  %ContrastColor%)  Else (<NUL Set/P="%opt2%")) & Echo Microsoft Excel.
<NUL Set/P=[3] & (If "%opt3%"=="%on%" (Call :EchoColor "%opt3%"  %ContrastColor%)  Else (<NUL Set/P="%opt3%")) & <NUL Set/P=Microsoft PowerPoint.       [4] & (If "%opt4%"=="%on%" (Call :EchoColor "%opt4%"  %ContrastColor%)  Else (<NUL Set/P="%opt4%")) & Echo Microsoft Access.
<NUL Set/P=[5] & (If "%opt5%"=="%on%" (Call :EchoColor "%opt5%"  %ContrastColor%)  Else (<NUL Set/P="%opt5%")) & <NUL Set/P=Microsoft Outlook.          [6] & (If "%opt6%"=="%on%" (Call :EchoColor "%opt6%"  %ContrastColor%)  Else (<NUL Set/P="%opt6%")) & Echo Microsoft OneNote.
<NUL Set/P=[7] & (If "%opt7%"=="%on%" (Call :EchoColor "%opt7%"  %ContrastColor%)  Else (<NUL Set/P="%opt7%")) & <NUL Set/P=Microsoft Publisher.        [8] & (If "%opt8%"=="%on%" (Call :EchoColor "%opt8%"  %ContrastColor%)  Else (<NUL Set/P="%opt8%")) & Echo Microsoft Teams.
<NUL Set/P=[9] & (If "%opt9%"=="%on%" (Call :EchoColor "%opt9%"  %ContrastColor%)  Else (<NUL Set/P="%opt9%")) & <NUL Set/P=Microsoft OneDrive.         [A] & (If "%optA%"=="%on%" (Call :EchoColor "%optA%"  %ContrastColor%)  Else (<NUL Set/P="%optA%")) & Echo Microsoft Bing.
<NUL Set/P=[B] & (If "%optB%"=="%on%" (Call :EchoColor "%optB%"  %ContrastColor%)  Else (<NUL Set/P="%optB%")) & <NUL Set/P=Cong cu hieu chinh Microsoft.   [C] & (If "%optC%"=="%on%" (Call :EchoColor "%optC%"  %ContrastColor%)  Else (<NUL Set/P="%optC%")) & Echo %Project%.
<NUL Set/P=[D] & (If "%optD%"=="%on%" (Call :EchoColor "%optD%"  %ContrastColor%)  Else (<NUL Set/P="%optD%")) & <NUL Set/P=Tao loi tat tren Desktop. [E] & (If "%optE%"=="%on%" (Call :EchoColor "%optE%"  %ContrastColor%)  Else (<NUL Set/P="%optE%")) & Echo %Visio%.
<NUL Set/P=[F] & (If "%optF%"=="%on%" (Call :EchoColor "%optF%"  %ContrastColor%)  Else (<NUL Set/P="%optF%")) & Echo Xoa tat ca ung dung khac.          [G] Ap dung cau hinh khuyen nghi.
Echo [Y] Ap dung (Co) cho tat ca tuy chon.      [N] Ap dung (Khong) cho tat ca tuy chon.
Echo [M] Gui va trien khai.                      [R] Xoa tat ca Visio va Project.    
Echo [0] Thoat ve Menu Truoc.                    [X] Xoa tat ca Office-Visio-Project.
CHOICE /c 123456789ABCDEFGVPUILTYNMRX0 /n /m "-------------------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) --------------------"
If %ErrorLevel%==1 (If "%opt1%"=="%on%" (Set "opt1=%off%") Else (Set "opt1=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==2 (If "%opt2%"=="%on%" (Set "opt2=%off%") Else (Set "opt2=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==3 (If "%opt3%"=="%on%" (Set "opt3=%off%") Else (Set "opt3=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==4 (If "%opt4%"=="%on%" (Set "opt4=%off%") Else (Set "opt4=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==5 (If "%opt5%"=="%on%" (Set "opt5=%off%") Else (Set "opt5=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==6 (If "%opt6%"=="%on%" (Set "opt6=%off%") Else (Set "opt6=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==7 (If "%opt7%"=="%on%" (Set "opt7=%off%") Else (Set "opt7=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==8 (If "%opt8%"=="%on%" (Set "opt8=%off%") Else (Set "opt8=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==9 (If "%opt9%"=="%on%" (Set "opt9=%off%") Else (Set "opt9=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==10 (If "%optA%"=="%on%" (Set "optA=%off%") Else (Set "optA=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==11 (If "%optB%"=="%on%" (Set "optB=%off%") Else (Set "optB=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==12 (If "%optC%"=="%on%" (Set "optC=%off%") Else (Set "optC=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==13 (If "%optD%"=="%on%" (Set "optD=%off%") Else (Set "optD=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==14 (If "%optE%"=="%on%" (Set "optE=%off%") Else (Set "optE=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==15 (If "%optF%"=="%on%" (Set "optF=%off%") Else (Set "optF=%on%")) & Goto InstallOfficeMENU
If %ErrorLevel%==16 Goto 9_C_G_Default
If %ErrorLevel%==17 Goto 9_C_V_OfficeVersion
If %ErrorLevel%==18 Goto 9_C_P_ProductID
If %ErrorLevel%==19 Goto 9_C_U_UpdateChannel
If %ErrorLevel%==20 Goto 9_C_I_Architecture
If %ErrorLevel%==21 Goto 9_C_L_OfficeLanguage
If %ErrorLevel%==22 Goto 9_C_T_DeploymentType 
If %ErrorLevel%==23 Goto 9_C_Y_ApplyYesToAll
If %ErrorLevel%==24 Goto 9_C_N_ApplyNoToAll
If %ErrorLevel%==25 Goto 9_C_M_SubmitAndContinue
If %ErrorLevel%==26 Goto 9_C_R_RemoveAllVisioProject
If %ErrorLevel%==27 Goto 9_C_X_RemoveAll
If %ErrorLevel%==28 Goto 9_C_0_Exit

:9_C_G_Default
for /L %%i in (1,1,3) do set opt%%i=%on%
for /L %%i in (4,1,9) do set opt%%i=%off%
for %%L in (A B C D E) do set opt%%L=%off%
set "optF=%on%"
Set "optL=%LanguageID%"
Set "optT=Cai_Truc_Tuyen"
Set "optV=2024"
Set "optP=ProPlus2024Retail"
Set "Project=ProjectPro2024Retail"
Set "Visio=VisioPro2024Retail"
Set "optU=Current"
If "%Architecture%"=="64-bit" (
	Set "optI=64-bit"
	Set "OfficeClientEdition=64"
)
If "%Architecture%"=="32-bit" (
	Set "optI=32-bit"
	Set "OfficeClientEdition=32"
)
GoTo InstallOfficeMENU

:9_C_X_RemoveAll
CHOICE /c 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ /n /m "--- Xoa tat ca Office, Visio, Project ngay lap tuc. Ban co chac chan (Y cho Co, N cho Khong) ? "
If %ErrorLevel% NEQ 35 Goto InstallOfficeMENU
If %ErrorLevel% EQU 35 Echo --- Dang xoa tat ca
 >%OCS% Echo ^<Configuration^>
>>%OCS% Echo   ^<Remove All="true" /^>
>>%OCS% Echo ^</Configuration^>
START "" /B "setup.exe" /configure "%OCS%"
Pause
GoTo InstallOfficeMENU

:9_C_R_RemoveAllVisioProject
CHOICE /c 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ /n /m "--- Xoa tat ca phien ban Visio va Project ngay lap tuc. Ban co chac chan (Y cho Co, N cho Khong) ? "
If %ErrorLevel% NEQ 35 Goto InstallOfficeMENU
If %ErrorLevel% EQU 35 Echo --- Dang xoa Visio va Project
 >%OCS% Echo ^<Configuration^>
>>%OCS% Echo   ^<Remove All="false"^>
>>%OCS% Echo     ^<Product ID="VisioProRetail" /^>
>>%OCS% Echo     ^<Product ID="VisioStdRetail" /^>
>>%OCS% Echo     ^<Product ID="VisioPro2024Retail" /^>
>>%OCS% Echo     ^<Product ID="VisioStd2024Retail" /^>
>>%OCS% Echo     ^<Product ID="VisioPro2019Retail" /^>
>>%OCS% Echo     ^<Product ID="VisioStd2019Retail" /^>
>>%OCS% Echo     ^<Product ID="VisioPro2016Retail" /^>
>>%OCS% Echo     ^<Product ID="VisioStd2016Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectProRetail" /^>
>>%OCS% Echo     ^<Product ID="ProjectStdRetail" /^>
>>%OCS% Echo     ^<Product ID="ProjectPro2024Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectStd2024Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectPro2019Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectStd2019Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectPro2016Retail" /^>
>>%OCS% Echo     ^<Product ID="ProjectStd2016Retail" /^>
>>%OCS% Echo   ^</Remove^>
>>%OCS% Echo ^</Configuration^>
START "" /B "setup.exe" /configure "%OCS%"
Pause
Goto InstallOfficeMENU

:EchoColor (Text, Color)
  MkDir "%Temp%\_%1" 1>NUL
  PushD "%Temp%\_%1"
  For /F %%a in ('Echo PROMPT $H ^| "CMD"') do Set "bs=%%a"
  <NUL Set /P="_" >"%1"
  FindStr /l /i /b /p /a:%2 /s /c:"_" "%1"
  <NUL Set /P=%bs%%bs%
  PushD "%~dp0"
  RmDir /s /q "%Temp%\_%1"
GoTo :EOF

:9_C_V_OfficeVersion
If "%optV%"=="365" (
	Set "optV=2024"
	Set "optP=ProPlus2024Volume"
	Set "optU=PerpetualVL2024"
	Set "Project=ProjectPro2024Volume"
	Set "Visio=VisioPro2024Volume"
	GoTo InstallOfficeMENU
)
If "%optV%"=="2024" (
	Set "optV=2021"
	Set "optP=ProPlus2021Volume"
	Set "optU=PerpetualVL2021"
	Set "Project=ProjectPro2021Volume"
	Set "Visio=VisioPro2021Volume"
	GoTo InstallOfficeMENU
)
If "%optV%"=="2021" (
	Set "optV=2019"
	Set "optP=ProPlus2019Volume"
	Set "optU=PerpetualVL2019"
	Set "Project=ProjectPro2019Volume"
	Set "Visio=VisioPro2019Volume"
	GoTo InstallOfficeMENU
)
If "%optV%"=="2019" (
	Set "optV=2016"
	Set "optP=ProPlusRetail"
	Set "optU=Current"
	Set "Project=ProjectProRetail"
	Set "Visio=VisioProRetail"
	GoTo InstallOfficeMENU
)
If "%optV%"=="2016" (
	Set "optV=365"
	Set "optP=O365ProPlusRetail"
	Set "optU=Current"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	GoTo InstallOfficeMENU
)

:9_C_P_ProductID
If "%optP%"=="O365ProPlusRetail" (
	Set "optP=O365BusinessRetail"
	Set "optU=Current"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	GoTo InstallOfficeMENU
)
If "%optP%"=="O365BusinessRetail" (
	Set "optP=O365ProPlusRetail"
	Set "optU=Current"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2024Volume" (
	Set "optP=ProPlus2024Retail"
	Set "optU=Current"
	Set "Project=ProjectPro2024Retail"
	Set "Visio=VisioPro2024Retail"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2024Retail" (
	Set "optP=ProPlus2024Volume"
	Set "optU=PerpetualVL2024"
	Set "Project=ProjectPro2024Volume"
	Set "Visio=VisioPro2024Volume"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2021Volume" (
	Set "optP=ProPlus2021Retail"
	Set "optU=Current"
	Set "Project=ProjectPro2021Retail"
	Set "Visio=VisioPro2021Retail"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2021Retail" (
	Set "optP=ProPlus2021Volume"
	Set "optU=PerpetualVL2021"
	Set "Project=ProjectPro2021Volume"
	Set "Visio=VisioPro2021Volume"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2019Volume" (
	Set "optP=ProPlus2019Retail"
	Set "optU=Current"
	Set "Project=ProjectPro2019Retail"
	Set "Visio=VisioPro2019Retail"
	GoTo InstallOfficeMENU
)
If "%optP%"=="ProPlus2019Retail" (
	Set "optP=ProPlus2019Volume"
	Set "optU=PerpetualVL2019"
	Set "Project=ProjectPro2019Volume"
	Set "Visio=VisioPro2019Volume"
	GoTo InstallOfficeMENU
)

:9_C_U_UpdateChannel
If "%optU%"=="Current" (
	Set "optU=BetaChannel"
	GoTo InstallOfficeMENU
)
If "%optU%"=="BetaChannel" (
	Set "optU=Current"
	GoTo InstallOfficeMENU
)

:9_C_I_Architecture
If "%optI%"=="64-bit" (
	Set "optI=32-bit"
	Set "OfficeClientEdition=32"
	GoTo InstallOfficeMENU
)
If "%optI%"=="32-bit" (
	Set "optI=64-bit"
	Set "OfficeClientEdition=64"
	GoTo InstallOfficeMENU
)

:9_C_L_OfficeLanguage
If "%optL%"=="en-US" (
	Set "optL=vi-VN"
	GoTo InstallOfficeMENU
)
If "%optL%"=="vi-VN" (
	Set "optL=%LanguageID%"
	GoTo InstallOfficeMENU
)
If "%optL%"=="%LanguageID%" (
	Set "optL=en-US"
	GoTo InstallOfficeMENU
)

:9_C_T_DeploymentType
If "%optT%"=="Install_Online" (
	Set "optT=Download_Install"
	GoTo InstallOfficeMENU
)
If "%optT%"=="Download_Install" (
	Set "optT=Install_Online"
	GoTo InstallOfficeMENU
)

:9_C_Y_ApplyYesToAll
for /L %%i in (1,1,9) do set opt%%i=%on%
for %%L in (A B C D E F) do set opt%%L=%on%
GoTo InstallOfficeMENU

:9_C_N_ApplyNoToAll
for /L %%i in (1,1,9) do set opt%%i=%off%
for %%L in (A B C D E F) do set opt%%L=%off%
GoTo InstallOfficeMENU

:9_C_M_SubmitAndContinue
cd /d "%~dp0"
If "%opt1%-%opt2%-%opt3%-%opt4%-%opt5%-%opt6%-%opt7%-%opt8%-%opt9%-%optA%-%optB%-%optC%-%optE%"=="%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%-%off%" (
	Echo Khong co tuy chon nao duoc chon ...
	Pause
 	GoTo InstallOfficeMENU
)
                                     >%OCS% Echo ^<Configuration^>
If "%optT%"=="Install_Online"       >>%OCS% Echo   ^<Add OfficeClientEdition="%OfficeClientEdition%" Channel="%optU%"^>
If "%optT%"=="Download_Install"     >>%OCS% Echo   ^<Add OfficeClientEdition="%OfficeClientEdition%" Channel="%optU%" MigrateArch="TRUE" SourcePath="%~dp0"^>
                                    >>%OCS% Echo     ^<Product ID="%optP%"^>
                                    >>%OCS% Echo       ^<Language ID="%optL%" Fallback="en-US" /^>
If "%opt1%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Word" /^>
If "%opt2%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Excel" /^>
If "%opt3%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="PowerPoint" /^>
If "%opt4%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Access" /^>
If "%opt5%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Outlook" /^>
If "%opt6%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="OneNote" /^>
If "%opt7%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Publisher" /^>
If "%opt8%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Teams" /^>
If "%opt9%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="OneDrive" /^>
                                    >>%OCS% Echo       ^<ExcludeApp ID="Lync" /^>
                                    >>%OCS% Echo       ^<ExcludeApp ID="Groove" /^>
If "%optA%"=="%off%"                >>%OCS% Echo       ^<ExcludeApp ID="Bing" /^>
                                    >>%OCS% Echo     ^</Product^>
If "%optB%"=="%on%"                 >>%OCS% Echo     ^<Product ID="ProofingTools"^>
If "%optB%"=="%on%"                 >>%OCS% Echo       ^<Language ID="%optL%" Fallback="en-US" /^>
If "%optB%"=="%on%"                 >>%OCS% Echo     ^</Product^>
If "%optC%"=="%on%"                 >>%OCS% Echo     ^<Product ID="%Project%"^>
If "%optC%"=="%on%"                 >>%OCS% Echo       ^<Language ID="%optL%" Fallback="en-US" /^>
If "%optC%"=="%on%"                 >>%OCS% Echo     ^</Product^>
If "%optE%"=="%on%"                 >>%OCS% Echo     ^<Product ID="%Visio%"^>
If "%optE%"=="%on%"                 >>%OCS% Echo       ^<Language ID="%optL%" Fallback="en-US" /^>
If "%optE%"=="%on%"                 >>%OCS% Echo     ^</Product^>
                                    >>%OCS% Echo     ^<Product ID="LanguagePack"^>
                                    >>%OCS% Echo       ^<Language ID="%optL%" /^>
                                    >>%OCS% Echo     ^</Product^>
                                    >>%OCS% Echo   ^</Add^>
                                    >>%OCS% Echo   ^<Updates Enabled="TRUE" /^>
                                    >>%OCS% Echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
                                    >>%OCS% Echo   ^<Property Name="ForceAppShutdown" Value="TRUE" /^>
If "%optD%"=="%on%"                 >>%OCS% Echo   ^<Extend CreateShortcuts="true" /^>
If "%optF%"=="%on%"                 >>%OCS% Echo   ^<Remove All="true" /^>
                                    >>%OCS% Echo ^</Configuration^>
If "%optT%"=="Install_Online" (
	START "" /B "setup.exe" /configure "%OCS%"
	Pause
	Goto InstallOfficeMENU
)
If "%optT%"=="Download_Install" (
	START "" /B "setup.exe" /download "%OCS%"
	Pause
	Goto InstallOfficeMENU
)
Goto InstallOfficeMENU

:9_C_0_Exit
RmDir /s /q ".\Office" 2>NUL
DEL /f ".\office2024.xml" 2>NUL
DEL /f ".\setup.exe" 2>NUL
Goto 9_DownloadAndInstall

:9_D_VisualC
Set "BTPBackMenu=9_D_VisualC"
Set "FileDel="
Set "FolderDel="
cls
Echo ---------- BTP.9.D. Visual C++ Redistributable ----------
Echo   [1] Ho tro Visual Studio 2015, 2017, 2019, 2022
Echo   [2] Ho tro Visual Studio 2013
Echo   [3] Ho tro Visual Studio 2012
Echo   [4] Ho tro Visual Studio 2010
Echo   [5] Ho tro Visual Studio 2008
Echo   [6] Ho tro Visual Studio 2005
Echo   [7] Mo lien ket tai xuong
Echo   [8] Cai dat tat ca phien ban Visual C++ Redistributable
Echo   [9] Kiem tra trang thai Visual C++ Redistributable 
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 1234567890 /n /m "----------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) -----------"
If %ErrorLevel%==1 Goto 9_D_1_VisualStudio2022
If %ErrorLevel%==2 Goto 9_D_2_VisualStudio2013
If %ErrorLevel%==3 Goto 9_D_3_VisualStudio2012
If %ErrorLevel%==4 Goto 9_D_4_VisualStudio2010
If %ErrorLevel%==5 Goto 9_D_5_VisualStudio2008
If %ErrorLevel%==6 Goto 9_D_6_VisualStudio2005
If %ErrorLevel%==7 Goto 9_D_7_OpenDownloadLink 
If %ErrorLevel%==8 Goto 9_D_8_InstallAll
If %ErrorLevel%==9 Goto 9_D_9_CheckStatus
If %ErrorLevel%==10 Goto 9_DownloadAndInstall

:9_D_9_CheckStatus
cls
Echo ------------ BTP.9.D.9. Cac phien ban Visual C++ Redistributable da cai dat ------------
powershell "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like 'Microsoft Visual C++*' } | Select-Object Name, Version | Sort Name"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_D_1_VisualStudio2022
CLS
Echo ------------  BTP.9.D.1. Ho tro Visual Studio 2015, 2017, 2019, 2022 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2022_x64.exe" "https://aka.ms/vs/17/release/vc_redist.x64.exe"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x86.exe" -OutFile "%~dp0vcredist_2022_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "%~dp0vcredist_2022_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2022_x86.exe /passive /norestart
start /wait vcredist_2022_x64.exe /passive /norestart
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_2_VisualStudio2013
CLS
Echo ------------ BTP.9.D.2. Ho tro Visual Studio 2013 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	aria2c -x 16 -s 16 -o "vcredist_2013_x64.exe" "https://aka.ms/highdpimfc2013x64enu"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x86enu" -OutFile "%~dp0vcredist_2013_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x64enu" -OutFile "%~dp0vcredist_2013_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
Start /wait vcredist_2013_x86.exe /passive /norestart
start /wait vcredist_2013_x64.exe /passive /norestart
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_3_VisualStudio2012
CLS
Echo ------------ BTP.9.D.3. Ho tro Visual Studio 2012 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2012_x64.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -OutFile "%~dp0vcredist_2012_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -OutFile "%~dp0vcredist_2012_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2012_x86.exe /passive /norestart
start /wait vcredist_2012_x64.exe /passive /norestart
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_4_VisualStudio2010
CLS
Echo ------------ BTP.9.D.4. Ho tro Visual Studio 2010 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2010_x64.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -OutFile "%~dp0vcredist_2010_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -OutFile "%~dp0vcredist_2010_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2010_x86.exe /passive /norestart
start /wait vcredist_2010_x64.exe /passive /norestart
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_5_VisualStudio2008
CLS
Echo ------------ BTP.9.D.5. Ho tro Visual Studio 2008 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2008_x64.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -OutFile "%~dp0vcredist_2008_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -OutFile "%~dp0vcredist_2008_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2008_x86.exe /qb
start /wait vcredist_2008_x64.exe /qb
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_6_VisualStudio2005
CLS
Echo ------------ BTP.9.D.6. Ho tro Visual Studio 2005 ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	aria2c -x 16 -s 16 -o "vcredist_2005_x64.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -OutFile "%~dp0vcredist_2005_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -OutFile "%~dp0vcredist_2005_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2005_x86.exe /q
start /wait vcredist_2005_x64.exe /q
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_D_7_OpenDownloadLink 
Start "" "https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170&wt.mc_id=studentamb_203301#latest-microsoft-visual-c-redistributable-version"
Goto %BTPBackMenu% 

:9_D_8_InstallAll
CLS
Echo ------------ BTP.9.D.8. Cai dat tat ca phien ban Visual C++ Redistributable ------------
Del vcredist*
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "vcredist_2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2022_x64.exe" "https://aka.ms/vs/17/release/vc_redist.x64.exe"
	aria2c -x 16 -s 16 -o "vcredist_2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	aria2c -x 16 -s 16 -o "vcredist_2013_x64.exe" "https://aka.ms/highdpimfc2013x64enu"
	aria2c -x 16 -s 16 -o "vcredist_2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2012_x64.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
	aria2c -x 16 -s 16 -o "vcredist_2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2010_x64.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
	aria2c -x 16 -s 16 -o "vcredist_2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	aria2c -x 16 -s 16 -o "vcredist_2008_x64.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
	aria2c -x 16 -s 16 -o "vcredist_2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	aria2c -x 16 -s 16 -o "vcredist_2005_x64.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
) else (
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x86.exe" -OutFile "%~dp0\vcredist_2022_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "%~dp0\vcredist_2022_x64.exe"
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x86enu" -OutFile "%~dp0\vcredist_2013_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x64enu" -OutFile "%~dp0\vcredist_2013_x64.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -OutFile "%~dp0\vcredist_2012_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -OutFile "%~dp0\vcredist_2012_x64.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -OutFile "%~dp0\vcredist_2010_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -OutFile "%~dp0\vcredist_2010_x64.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -OutFile "%~dp0\vcredist_2008_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -OutFile "%~dp0\vcredist_2008_x64.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -OutFile "%~dp0\vcredist_2005_x86.exe"
	Powershell -command Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -OutFile "%~dp0\vcredist_2005_x64.exe"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	Goto %BTPBackMenu% 
)
start /wait vcredist_2022_x86.exe /passive /norestart
start /wait vcredist_2022_x64.exe /passive /norestart
start /wait vcredist_2013_x86.exe /passive /norestart
start /wait vcredist_2013_x64.exe /passive /norestart
start /wait vcredist_2012_x86.exe /passive /norestart
start /wait vcredist_2012_x64.exe /passive /norestart
start /wait vcredist_2010_x86.exe /passive /norestart
start /wait vcredist_2010_x64.exe /passive /norestart
start /wait vcredist_2008_x86.exe /qb
start /wait vcredist_2008_x64.exe /qb
start /wait vcredist_2008_x86.exe /qb
start /wait vcredist_2008_x64.exe /qb
start /wait vcredist_2005_x86.exe /q
start /wait vcredist_2005_x64.exe /q
Pause
Del vcredist*
Goto %BTPBackMenu% 

:9_E_OBSstudio
CLS
Echo -------------- BTP.9.E. OBS Studio --------------
Set "URL=%OBSURL%"
Set "File=OBSInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat OBS Studio ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_F_OfficeToolYerong
cls
Echo -------------- BTP.9.F. Office Tool (Yerong) --------------
If exist "%windir%\SysWOW64" Set "URL=%off_x64%"
If not exist "%windir%\SysWOW64" Set "URL=%off_x86%"
Set "File=OfficeTool.zip"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel=Office"
Call :URLDownload
Echo Dang giai nen %File% ...
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath %~dp0
Echo Mo huong dan Office Tool ...
Start "" "https://docs.google.com/document/u/3/d/e/2PACX-1vRgk8OqddgTZISRHIe6irhm2fcgRDxPA8m-hc-FpOzLIhWGNYlul85ZTtJEFS5L5YrMCKCFTCzAghYC/pub"
Echo Chay Office Tool Plus ...
@start "" /D"%~dp0Office Tool" "Office Tool Plus.exe"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_G_OpenHashTab
CLS
Echo -------------- BTP.9.G. Open Hash Tab --------------
Set "URL=%OpenHashTabURL%"
Set "File=OpenHashTab.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
@start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_I_RemoteDesktop
CLS
Echo -------------- BTP.9.I. Remote Desktop --------------
Set "URL=%RemoteDesktopURL%"
Set "File=RemoteDesktop.msi"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_J_RevoUninstaller
CLS
Echo -------------- BTP.9.J. Revo Uninstaller --------------
If not exist "%ProgramData%\VS Revo Group" md "%ProgramData%\VS Revo Group"
If not exist "%ProgramData%\VS Revo Group\Revo Uninstaller Pro" md "%ProgramData%\VS Revo Group\Revo Uninstaller Pro"
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "RevoUninProSetup.exe" "%RevoUninstallerURL%"
	aria2c -x 16 -s 16 -o "revouninstallerpro5.lic" "%RevoLicURL%"
) else (
	Powershell -command "Invoke-WebRequest -Uri '%RevoUninstallerURL%' -OutFile '%~dp0RevoUninProSetup.exe'"
	Powershell -command "Invoke-WebRequest -Uri '%RevoLicURL%' -OutFile '%~dp0revouninstallerpro5.lic'"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	GOTO 9_DownloadAndInstall
)
xcopy "%~dp0revouninstallerpro5.lic" "%ProgramData%\VS Revo Group\Revo Uninstaller Pro" /e /h /q
Echo Dang cai dat Revo Uninstaller ...
Start %~dp0RevoUninProSetup.exe
PAUSE
Del %~dp0RevoUninProSetup.exe
Del %~dp0revouninstallerpro5.lic
GOTO 9_DownloadAndInstall

:9_K_Rufus
CLS
Echo -------------- BTP.9.K. Rufus --------------
Set "URL=%RufusURL%"
Set "File=Rufus.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_L_StandardKLiteCodecPack 
CLS
Echo -------------- BTP.9.L. Standard KLite Codec Pack --------------
Set "URL=%KLiteCodecURL%"
Set "File=KLite.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_StoreForWindodws
Set "BTPBackMenu=9_M_StoreForWindodws"
Set "FileDel="
Set "FolderDel="
for /f "tokens=*" %%A in ('powershell -Command "if (Get-AppxPackage *Microsoft.WindowsStore*) { echo WindowsStoreStatus=Installed } else { echo WindowsStoreStatus=Not_Exist }"') do Set %%A
cls
Echo -------- BTP.9.M. Store For Windodws --------
Echo   Trang thai Windows Store: %WindowsStoreStatus%
Echo   [1] Them Store vao LTSB 2016 tu dong
Echo   [2] Them Store vao LTSB 2016 thu cong
Echo   [3] Them Store vao LTSC 2019 tu dong
Echo   [4] Them Store vao LTSC 2019 thu cong
Echo   [5] Them Store vao LTSC 2021 tu dong
Echo   [6] Them Store vao LTSC 2021 thu cong
Echo   [7] Them Store vao LTSC 2024 tu dong
Echo   [8] Them Store vao LTSC 2024 thu cong
Echo   [9] Xoa Store khoi Windows 10 - 11
Echo   [A] Them Store vao Windows 10 - 11
Echo   [0] Thoat ve Menu Truoc
CHOICE /c 123456789A0 /n /m "----- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) -----"
 If %ErrorLevel%==1 Goto 9_M_1_AddStoreToLTSB2016Auto 
 If %ErrorLevel%==2 Goto 9_M_2_AddStoreToLTSB2016Manual
 If %ErrorLevel%==3 Goto 9_M_3_AddStoreToLTSC2019Auto
 If %ErrorLevel%==4 Goto 9_M_4_AddStoreToLTSC2019Manual
 If %ErrorLevel%==5 Goto 9_M_5_AddStoreToLTSC2021Auto
 If %ErrorLevel%==6 Goto 9_M_6_AddStoreToLTSC2021Manual
 If %ErrorLevel%==7 Goto 9_M_7_AddStoreToLTSC2024Auto
 If %ErrorLevel%==8 Goto 9_M_8_AddStoreToLTSC2024Manual
 If %ErrorLevel%==9 Goto 9_M_9_RemoveStore
If %ErrorLevel%==10 Goto 9_M_A_AddStore
If %ErrorLevel%==11 Goto 9_DownloadAndInstall

:9_M_A_AddStore
CLS
Echo ---------- BTP.9.M.A. Them Store ----------
powershell -ExecutionPolicy Unrestricted -Command "& {Get-AppxPackage -allusers *WindowsStore* | Reset-AppxPackage}"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_9_RemoveStore
CLS
Echo ---------- BTP.9.M.9. Xoa Store ----------
powershell -Command "Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_1_AddStoreToLTSB2016Auto
CLS
Echo ---------- BTP.9.M.1. Them Store vao LTSB 2016 tu dong ----------
Set "URL=https://github.com/kkkgo/LTSB-Add-MicrosoftStore/archive/refs/tags/2016.zip"
Set "File=2016.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=LTSB"
Call :URLDownload
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath %~dp0
for /d %%A in (LTSB*) do @start "" /D"%%A" "Add-Store.cmd"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_2_AddStoreToLTSB2016Manual
CLS
Echo ---------- BTP.9.M.2. Them Store vao LTSB 2016 thu cong ----------
START https://github.com/kkkgo/LTSB-Add-MicrosoftStore/releases
Echo https://github.com/kkkgo/LTSB-Add-MicrosoftStore/archive/refs/tags/2016.zip|clip
Echo Lien ket tai xuong da duoc gui vao Clipboard. Tai xuong, giai nen, chay Add-Store.cmd
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_3_AddStoreToLTSC2019Auto
CLS
Echo ---------- BTP.9.M.3. Them Store vao LTSC 2019 tu dong ----------
Set "URL=https://github.com/kkkgo/LTSC-Add-MicrosoftStore/archive/refs/tags/2019.zip"
Set "File=2019.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=LTSC"
Call :URLDownload
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath %~dp0
for /d %%A in (LTSC*) do @start "" /D"%%A" "Add-Store.cmd"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_4_AddStoreToLTSC2019Manual
CLS
Echo ---------- BTP.9.M.4. Them Store vao LTSC 2019 thu cong ----------
START https://github.com/kkkgo/LTSC-Add-MicrosoftStore/releases
Echo https://github.com/kkkgo/LTSC-Add-MicrosoftStore/archive/refs/tags/2019.zip|clip
Echo Lien ket tai xuong da duoc gui vao Clipboard. Tai xuong, giai nen, chay Add-Store.cmd
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_5_AddStoreToLTSC2021Auto
CLS
Echo ---------- BTP.9.M.5. Them Store vao LTSC 2021 tu dong ----------
Set "URL=https://github.com/kr0tchet/LTSC-Add-MicrosoftStore-2021/archive/refs/heads/master.zip"
Set "File=2021.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=LTSC"
Call :URLDownload
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath %~dp0
For /d %%A in (LTSC*) do @start "" /D"%%A" "Add-Store.cmd"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_6_AddStoreToLTSC2021Manual
CLS
Echo ---------- BTP.9.M.6. Them Store vao LTSC 2021 thu cong ----------
START https://github.com/megakarlach/LTSC-Add-MicrosoftStore-2021
Echo https://github.com/kr0tchet/LTSC-Add-MicrosoftStore-2021/archive/refs/heads/master.zip|clip
Echo Lien ket tai xuong da duoc gui vao Clipboard. Tai xuong, giai nen, chay Add-Store.cmd
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_7_AddStoreToLTSC2024Auto
CLS
Echo ---------- BTP.9.M.7. Them Store vao LTSC 2024 tu dong ----------
Set "URL=https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/LTSC-Add-MicrosoftStore-24H2.zip"
Set "File=2024.zip"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel=LTSC"
Call :URLDownload
Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath %~dp0
for /d %%A in (LTSC*) do @start "" /D"%%A" "Add-Store.cmd"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_M_8_AddStoreToLTSC2024Manual
CLS
Echo ---------- BTP.9.M.8. Them Store vao LTSC 2024 thu cong ----------
START https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/tag/LTSC-Add-MicrosoftStore-24H2
Echo https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/LTSC-Add-MicrosoftStore-24H2.zip|clip
Echo Lien ket tai xuong da duoc gui vao Clipboard. Tai xuong, giai nen, chay Add-Store.cmd
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_N_TeamViewer
CLS
Echo -------------- BTP.9.N. Team Viewer --------------
If exist "%windir%\SysWOW64" (SET "URL=%TeamViewer64%") ELSE (SET "URL=%TeamViewer86%")
Set "File=TeamViewerSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_O_Telegram
CLS
Echo -------------- BTP.9.O. Telegram --------------
If EXIST "%Windir%\SysWOW64" (Set "URL=https://telegram.org/dl/desktop/win64") ELSE (SET "URL=https://telegram.org/dl/desktop/win")
Set "File=TelegramSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_P_UltraViewer
CLS
Echo -------------- BTP.9.P. Ultra Viewer --------------
Set "URL=%UltraViewerURL%"
Set "File=UltraViewerSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Powershell -command Invoke-WebRequest -Uri "%URL%" -OutFile "%FilePath%"
Echo Chay %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_Q_Unikey
CLS
Echo -------------- BTP.9.Q. Unikey --------------
If EXIST "%Windir%\SysWOW64" (Set "URL=%Unikey64URL%") ELSE (SET "URL=%Unikey86URL%")
Set "File=unikey.zip"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Giai nen unikey.zip ...
If not exist "%windir%\Unikey" md "%windir%\Unikey"
If not exist "%windir%\Unikey\UnikeyNT.exe" (Powershell -command Expand-Archive -LiteralPath '%FilePath%' -DestinationPath "%windir%\Unikey")
Echo Chay %File% ...
Start "" "%windir%\Unikey\UnikeyNT.exe"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_VPN
Set "BTPBackMenu=9_R_VPN"
Set "FileDel="
Set "FolderDel="
cls
Echo ---------- BTP.9.R. VPN ----------
Echo   [1] CyberGhost 
Echo   [2] ExpressVPN 
Echo   [3] Hotspot Shield 
Echo   [4] IPVanish 
Echo   [5] NordVPN 
Echo   [6] PrivadoVPN 
Echo   [7] Private Internet Access 
Echo   [8] ProtonVPN 
Echo   [9] PureVPN 
Echo   [A] StrongVPN 
Echo   [B] Surfshark 
Echo   [C] TunnelBear  
Echo   [D] VeePN
Echo   [E] VyprVPN 
Echo   [F] Windscribe 
Echo   [G] ZoogVPN
Echo   [0] Thoat ve Menu Truoc                          
CHOICE /c 123456789ABCDEFG0 /n /m "---- (^_^) Dieu Uoc Cua Ban (^_^) ----"
 If %ErrorLevel%==1 Goto 9_R_1_CyberGhost
 If %ErrorLevel%==2 Goto 9_R_2_ExpressVPN
 If %ErrorLevel%==3 Goto 9_R_3_HotspotShield
 If %ErrorLevel%==4 Goto 9_R_4_IPVanish
 If %ErrorLevel%==5 Goto 9_R_5_NordVPN
 If %ErrorLevel%==6 Goto 9_R_6_PrivadoVPN
 If %ErrorLevel%==7 Goto 9_R_7_PrivateInternetAccess
 If %ErrorLevel%==8 Goto 9_R_8_ProtonVPN
 If %ErrorLevel%==9 Goto 9_R_9_PureVPN
If %ErrorLevel%==10 Goto 9_R_A_StrongVPN
If %ErrorLevel%==11 Goto 9_R_B_Surfshark
If %ErrorLevel%==12 Goto 9_R_C_TunnelBear
If %ErrorLevel%==13 Goto 9_R_D_VeePN
If %ErrorLevel%==14 Goto 9_R_E_VyprVPN
If %ErrorLevel%==15 Goto 9_R_F_Windscribe
If %ErrorLevel%==16 Goto 9_R_G_ZoogVPN
If %ErrorLevel%==17 Goto 9_DownloadAndInstall

:9_R_1_CyberGhost
cls
Echo -------------- BTP.9.R.1. CyberGhost --------------
Set "URL=https://download.cyberghostvpn.com/windows/CyberGhostVPNSetup.exe"
Set "File=CyberGhostSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_2_ExpressVPN
cls
Echo -------------- BTP.9.R.2. ExpressVPN --------------
Set "URL=https://www.expressvpn.com/clients/windows/expressvpn_windows_12.98.0.2_release.exe"
Set "File=ExpressVpnSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_3_HotspotShield
cls
Echo -------------- BTP.9.R.3. Hotspot Shield --------------
Set "URL=https://control.kochava.com/v1/cpi/click?campaign_id=kohotspot-shield-2oo5a11d43d86192b9&network_id=5798&device_id=device_id&site_id=1&aftr=%7B%22vh%22%3A%22ext53e731b0-0631-11f0-a561-1d14a8afbcd4%22%2C%22referrer%22%3A%22https%3A%2F%2Fsupport.hotspotshield.com%2F%22%2C%22af_medium%22%3A%22serp%22%2C%22af_source%22%3A%22bing%22%2C%22af_campaign%22%3A%22seo-organic%22%7D&aftr_source=%2Fapp%2Fhotspotshield&al_token=ijxX8lvA"
Set "URL=https://d26wo1m3adcxu5.cloudfront.net/HSS-773-ALTijxX8lvA.exe?ko_click_id=ko_ffeb67dd296e42348"
Set "File=ExpressVpnSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_4_IPVanish
cls
Echo -------------- BTP.9.R.4. IPVanish --------------
Set "URL=https://www.ipvanish.com/software/setup-prod-v2/ipvanish-setup.exe"
Set "File=ipvanishsetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_5_NordVPN
cls
Echo -------------- BTP.9.R.5. NordVPN --------------
Set "URL=https://downloads.nordcdn.com/apps/windows/NordVPN/latest/NordInstaller.exe"
Set "File=NordInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_6_PrivadoVPN
cls
Echo -------------- BTP.9.R.6. PrivadoVPN --------------
Set "URL=https://privadovpn.com/apps/win/Setup_PrivadoVPN_latest.exe"
Set "File=PrivadoVPN.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_7_PrivateInternetAccess
cls
Echo -------------- BTP.9.R.7. Private Internet Access --------------
Set "URL=https://installers.privateinternetaccess.com/download/pia-windows-x64-3.6.1-08339.exe"
Set "File=PIAsetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_8_ProtonVPN
cls
Echo -------------- BTP.9.R.8. Proton VPN --------------
Set "URL=https://vpn.protondownload.com/download/ProtonVPN_v3.5.3_x64.exe"
Set "File=ProtonVPN.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_9_PureVPN
cls
Echo -------------- BTP.9.R.9. PureVPN --------------
Set "URL=https://dzglif4kkvz04.cloudfront.net/windows-2.0/packages/production/purevpn_setup.exe"
Set "File=purevpnsetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Set "BTPBackMenu=9_R_VPN"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_A_StrongVPN
cls
Echo -------------- BTP.9.R.A. StrongVPN --------------
Set "URL=https://static.colomovers.com/win/StrongVPN-latest.exe"
Set "File=StrongVPN.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_B_Surfshark
cls
Echo -------------- BTP.9.R.B. Surfshark --------------
Set "URL=https://downloads.surfshark.com/windows/latest/SurfsharkSetup.exe"
Set "File=SurfsharkSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_C_TunnelBear
cls
Echo -------------- BTP.9.R.C. TunnelBear --------------
Set "URL=https://tunnelbear.s3.amazonaws.com/downloads/pc/TunnelBear-Installer.exe"
Set "File=TunnelBear.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_D_VeePN
cls
Echo -------------- BTP.9.R.D. VeePN --------------
Set "URL=https://download.veepn.com/windows/VeePNInstaller.exe"
Set "File=VeePNInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_E_VyprVPN
cls
Echo -------------- BTP.9.R.E. VyprVPN --------------
Set "URL=https://downloads.vyprvpn.com/downloads/vyprvpn/desktop/windows/production/5.2.3.0/VyprVPN-5.2.3-installer.exe"
Set "File=VyprVPNInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_F_Windscribe
cls
Echo -------------- BTP.9.R.F. Windscribe --------------
Set "URL=https://windscribe.com/install/desktop/windows"
Set "File=Windscribe.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_R_G_ZoogVPN
cls
Echo -------------- BTP.9.R.G. ZoogVPN --------------
Set "URL=https://zoogvpn.com/downloads/desktop/windows/zoogvpn-v5.4.0.exe"
Set "File=zoogvpn.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_WebsiteBrowser
Set "FileDel="
Set "FolderDel="
Set "BTPBackMenu=9_S_WebsiteBrowser"
CLS
Echo ------- BTP.9.S. Trinh duyet Web -------
Echo   [1] Google Chrome
Echo   [2] Mozilla Firefox
Echo   [3] Brave 
Echo   [4] Coccoc 
Echo   [5] Microsoft Edge 
Echo   [6] Opera 
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 1234560 /n /m "--- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ---"
If %ErrorLevel%==1 Goto 9_S_1_GoogleChrome
If %ErrorLevel%==2 Goto 9_S_2_MozillaFirefox
If %ErrorLevel%==3 Goto 9_S_3_Brave
If %ErrorLevel%==4 Goto 9_S_4_Coccoc
If %ErrorLevel%==5 Goto 9_S_5_MicrosoftEdge
If %ErrorLevel%==6 Goto 9_S_6_Opera
If %ErrorLevel%==7 Goto 9_DownloadAndInstall

:9_S_1_GoogleChrome
CLS
Echo -------------- BTP.9.S.1 Google Chrome --------------
Set "URL=http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
Set "File=ChromeInstaller.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Call :URLDownload
Echo Dang cai dat %File% ...
%File% /silent /install
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Google Chrome*.lnk" "%AllUsersProfile%\Desktop"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_2_MozillaFirefox
CLS
Echo -------------- BTP.9.S.2. Mozilla Firefox --------------
Set "URL32=https://download.mozilla.org/?product=firefox-latest-ssl&os=win&lang=en-US"
Set "URL64=https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
If "%PROCESSOR_ARCHITECTURE%" EQU "x86" (SET "URL=%URL32%") Else (SET "URL=%URL64%")
Set "File=FirefoxSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
%File% -ms -ma
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Firefox*.lnk" "%AllUsersProfile%\Desktop"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_3_Brave
CLS
Echo -------------- BTP.9.S.3. Brave Browser --------------
Set "URL=https://referrals.brave.com/latest/BraveBrowserSetup.exe"
Set "File=BraveBrowserSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Brave*.lnk" "%AllUsersProfile%\Desktop"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_4_CocCoc
CLS
Echo -------------- BTP.9.S.4. CocCoc --------------
Set "URL=https://files.coccoc.com/browser/download/vi?plat=win"
Set "File=CocCocSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_5_MicrosoftEdge
CLS
Echo -------------- BTP.9.S.5. Microsoft Edge --------------
Set "URL=https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=en&brand=M100"
Set "File=MicrosoftEdgeSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_S_6_Opera
CLS
Echo -------------- BTP.9.S.6. Opera --------------
Set "URL=https://net.geo.opera.com/opera/stable/windows"
Set "File=OperaSetup.exe"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "BTPBackMenu=9_S_WebsiteBrowser"
Call :URLDownload
Echo Dang cai dat %File% ...
Start %File%
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:9_T_Winrar
CLS
Echo -------------- BTP.9.T. Winrar --------------
Set "URL=%WinrarURL%"
Set "File=winrar.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Dang cai dat %File% ...
Echo Du lieu dang ky RAR>rarreg.key
Echo PITVN>>rarreg.key
Echo Cong dong PITVN>>rarreg.key
Echo UID=5aa63b8a672358293772>>rarreg.key
Echo 641221225037725832e8886919730128dca6f27a78014744a9033d>>rarreg.key
Echo a93bb7f60acb9f6802f160ee145036bd6364b56873af282c39d7b8>>rarreg.key
Echo 71db23962ff3386eb16859182fabf97a7c12fea7c95e4c575a9270>>rarreg.key
Echo 8081e9679fbeceb80c7ec112805195b6716016ff78c6e633b08387>>rarreg.key
Echo 54717b04027ffe3b9a315c97c869436f077ec56a7e014987837445>>rarreg.key
Echo 9419199aca97c006b31cb34710b0b712c11b0844c308fbe260fd04>>rarreg.key
Echo 037ef0e4a78f9e36b5b3bbeaed780b6a44a84d9a2d921750704113>>rarreg.key
Start %File%
PAUSE
Del %~dp0winrar.exe
Del %~dp0rarreg.key
GOTO 9_DownloadAndInstall

:9_U_Zalo
CLS
Echo -------------- BTP.9.U. Zalo --------------
Set "URL=%ZaloURL%"
Set "File=ZaloSetup.exe"
Set "FilePath=%cd%\%File%"
Set "BTPBackMenu=9_DownloadAndInstall"
Set "FileDel=%File%"
Set "FolderDel="
Powershell -command Invoke-WebRequest -Uri "%URL%" -OutFile "%FilePath%"
Echo Dang cai dat %File% ...
Start %File%
Pause
Del %File%
GOTO 9_DownloadAndInstall

:A_AboutSetting
start ms-settings:about
Goto MainMenu

:B_AddRemovePrograms
start ms-settings:appsfeatures
Goto MainMenu

:C_ClassicContextMenu
If %WinVer% LSS 22000 (
	Echo Tuy chon nay chi co san cho Windows 11 ...
	Pause
	Goto MainMenu
)
set "te=a"
set "Status=OFF"
For /F "delims=\ tokens=6" %%b in ('reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"') do set "te=%%b"
If "%te%" EQU "InprocServer32" Set "Status=ON"
cls
Echo --------- BTP.C. Menu Ngucanh Cotruyen ---------
Echo    Trang thai Menu Ngucanh Cotruyen: %Status%
Echo   [1] Tat Menu Ngucanh Cotruyen
Echo   [2] Bat Menu Ngucanh Cotruyen
Echo   [3] Khoi dong lai Explorer
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 1230 /n /m "------ (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ------"
If %ErrorLevel%==1 (
	reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
	Goto C_ClassicContextMenu
)
If %ErrorLevel%==2 (
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
	Goto C_ClassicContextMenu
)
If %ErrorLevel%==3 (
	taskkill /f /im explorer.exe
	start explorer.exe
	Goto C_ClassicContextMenu
)
If %ErrorLevel%==0 Goto MainMenu
Goto MainMenu

:D_DesktopIconSetting
rundll32 shell32.dll,Control_RunDLL desk.cpl,,0
Goto MainMenu

:E_DiskManagement 
diskmgmt.msc
Goto MainMenu

:F_FileExplorerOptions
rundll32.exe shell32.dll,Options_RunDLL 7
Goto MainMenu

:G_TaskbarSetting
If %winver% Lss 22000 (Goto G_TaskbarSetting_win10) else (Goto G_TaskbarSetting_win11)

:G_TaskbarSetting_win10
Set "BTPBackMenu=G_TaskbarSetting_win10"
cls
Echo ----------- BTP.G. Cai dat Thanh Tacvu -----------
Echo   [1] Tat Tin tuc va So thich
Echo   [2] Bat Tin tuc va So thich
Echo   [3] Hien tat ca Bieu tuong tren Thanh Tacvu
Echo   [4] An tat ca Bieu tuong tren Thanh Tacvu
Echo   [5] Chi hien Bieu tuong Tim kiem tren Thanh Tacvu
Echo   [6] Hien hop Tim kiem day du tren Thanh Tacvu
Echo   [7] An hoan toan hop Tim kiem tren Thanh Tacvu
Echo   [8] Go ghim Store khoi Thanh Tacvu
Echo   [9] Mo Cai dat Thanh Tacvu
Echo   [R] Khoi dong lai Explorer
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 123456789R0 /n /m "-------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) --------"
If %ErrorLevel%==1 Goto G_1_win10_TurnOffNews
If %ErrorLevel%==2 Goto G_2_win10_TurnOnNews
If %ErrorLevel%==3 Goto G_3_win10_ShowAllIcons
If %ErrorLevel%==4 Goto G_4_win10_HideAllIcons
If %ErrorLevel%==5 Goto G_5_win10_OnlySearchIcon
If %ErrorLevel%==6 Goto G_6_win10_ShowFullSearchBox
If %ErrorLevel%==7 Goto G_7_win10_HideSearchBox
If %ErrorLevel%==8 Goto G_8_win10_UnpinStore
If %ErrorLevel%==9 Goto G_9_win10_OpenTaskbarSetting
If %ErrorLevel%==10 Goto G_R_ResetExplorer
If %ErrorLevel%==11 Goto MainMenu

:G_1_win10_TurnOffNews
Echo ----------- BTP.G.1. Tat Tin tuc va So thich -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
Goto %BTPBackMenu%

:G_2_win10_TurnOnNews
Echo ----------- BTP.G.2. Bat Tin tuc va So thich -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 0 /f
Goto %BTPBackMenu%

:G_3_win10_ShowAllIcons
Echo ----------- BTP.G.3. Hien tat ca Bieu tuong tren Thanh Tacvu -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 0 /f
Goto %BTPBackMenu%

:G_4_win10_HideAllIcons
Echo ----------- BTP.G.4. An tat ca Bieu tuong tren Thanh Tacvu -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 1 /f
Goto %BTPBackMenu%

:G_5_win10_OnlySearchIcon
Echo ----------- BTP.G.5. Chi hien Bieu tuong Tim kiem tren Thanh Tacvu -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f
Goto %BTPBackMenu%

:G_6_win10_ShowFullSearchBox
Echo ----------- BTP.G.6. Hien hop Tim kiem day du tren Thanh Tacvu -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 2 /f
Goto %BTPBackMenu%

:G_7_win10_HideSearchBox
Echo ----------- BTP.G.7. An hoan toan hop Tim kiem tren Thanh Tacvu -----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
Goto %BTPBackMenu%

:G_8_win10_UnpinStore
Echo ----------- BTP.G.8. Go ghim Store khoi Thanh Tacvu -----------
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v NoPinningStoreToTaskbar /t REG_DWORD /d 1 /f
Goto %BTPBackMenu%

:G_9_win10_OpenTaskbarSetting
Echo ----------- BTP.G.9. Mo Cai dat Thanh Tacvu -----------
start ms-settings:taskbar
Goto %BTPBackMenu%

:G_R_ResetExplorer
Echo ----------- BTP.G.R. Khoi dong lai Explorer -----------
taskkill /F /IM explorer.exe
start explorer
Goto %BTPBackMenu%

:G_TaskbarSetting_win11
Set "BTPBackMenu=G_TaskbarSetting_win11"
cls
Echo ---------- BTP.G. Cai dat Thanh Tacvu ----------
Echo   [1] Can le trai cho Thanh Tacvu
Echo   [2] Can giua cho Thanh Tacvu
Echo   [3] Tat Tin tuc va So thich
Echo   [4] Bat Tin tuc va So thich
Echo   [5] Hien tat ca Bieu tuong tren Thanh Tacvu
Echo   [6] An tat ca Bieu tuong tren Thanh Tacvu
Echo   [7] Chi hien Bieu tuong Tim kiem tren Thanh Tacvu
Echo   [8] Go ghim Store khoi Thanh Tacvu
Echo   [9] Dat Ngay ngan thanh yyyy-MM-dd
Echo   [A] Dat Gio ngan thanh hh:mm tt
Echo   [B] Tu dong dat Mui gio
Echo   [C] Dat Mui gio thu cong
Echo   [D] Dat Mui gio GMT+7
Echo   [E] Dong bo Gio ngay lap tuc
Echo   [F] Mo Cai dat Thanh Tacvu
Echo   [R] Khoi dong lai Explorer
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 123456789ABCDEFR0 /n /m "----- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) -----"
If %ErrorLevel%==1 Goto G_1_SetLeftAlign
If %ErrorLevel%==2 Goto G_2_SetCenterAlign
If %ErrorLevel%==3 Goto G_3_TurnOffNews
If %ErrorLevel%==4 Goto G_4_TurnOnNews
If %ErrorLevel%==5 Goto G_5_ShowAllIcons
If %ErrorLevel%==6 Goto G_6_HideAllIcons
If %ErrorLevel%==7 Goto G_7_OnlySearchIconOnTaskbar
If %ErrorLevel%==8 Goto G_8_UnpinStore
If %ErrorLevel%==9 Goto G_9_SetShortDate
If %ErrorLevel%==10 Goto G_A_SetShortTime
If %ErrorLevel%==11 Goto G_B_SetTimeZoneAutomatically
If %ErrorLevel%==12 Goto G_C_SetTimeZoneManually
If %ErrorLevel%==13 Goto G_D_SetTimeZoneGMT7
If %ErrorLevel%==14 Goto G_E_SyncTimeImmediately
If %ErrorLevel%==15 Goto G_F_OpenTaskbarSetting
If %ErrorLevel%==16 Goto G_R_ResetExplorer
If %ErrorLevel%==17 Goto MainMenu

:G_1_SetLeftAlign
Echo ----------- BTP.G.1. Can le trai cho Thanh Tacvu -----------
reg add hkcu\software\microsoft\windows\currentversion\explorer\advanced /v TaskbarAl /t REG_DWORD /f /d 0
Goto %BTPBackMenu%

:G_2_SetCenterAlign
Echo ----------- BTP.G.2. Can giua cho Thanh Tacvu -----------
reg add hkcu\software\microsoft\windows\currentversion\explorer\advanced /v TaskbarAl /t REG_DWORD /f /d 1
Goto %BTPBackMenu%

:G_3_TurnOffNews
Echo ----------- BTP.G.3. Tat Tin tuc va So thich -----------
reg add "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Goto %BTPBackMenu%

:G_4_TurnOnNews
Echo ----------- BTP.G.4. Bat Tin tuc va So thich -----------
reg add "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "1" /f
Goto %BTPBackMenu%

:G_5_ShowAllIcons
Echo ----------- BTP.G.5. Hien tat ca Bieu tuong tren Thanh Tacvu -----------
For /F "Delims=\ tokens=4" %%b in ('reg query "HKEY_CURRENT_USER\Control Panel\NotifyIconSettings" ^| findstr /b /c:"HKEY_CURRENT_USER"') do (reg add "HKEY_CURRENT_USER\Control Panel\NotifyIconSettings\%%b" /v "IsPromoted" /t REG_DWORD /f /d 1) 
Goto %BTPBackMenu%

:G_6_HideAllIcons
Echo ----------- BTP.G.6. An tat ca Bieu tuong tren Thanh Tacvu -----------
For /F "Delims=\ tokens=4" %%b in ('reg query "HKEY_CURRENT_USER\Control Panel\NotifyIconSettings" ^| findstr /b /c:"HKEY_CURRENT_USER"') do (reg add "HKEY_CURRENT_USER\Control Panel\NotifyIconSettings\%%b" /v "IsPromoted" /t REG_DWORD /f /d 0) 
Echo An tat ca Bieu tuong tren Thanh Tacvu thanh cong ...
Goto %BTPBackMenu%

:G_7_OnlySearchIconOnTaskbar
Echo ----------- BTP.G.7. Chi hien Bieu tuong Tim kiem tren Thanh Tacvu -----------
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f
Goto %BTPBackMenu%

:G_8_UnpinStore
Echo ----------- BTP.G.8. Go ghim Store khoi Thanh Tacvu -----------
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v NoPinningStoreToTaskbar /t REG_DWORD /d 1 /f
Goto %BTPBackMenu%

:G_9_SetShortDate
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate /t REG_SZ /d yyyy-MM-dd /f
Goto %BTPBackMenu%

:G_A_SetShortTime
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortTime /t REG_SZ /d "hh:mm tt" /f
Goto %BTPBackMenu%

:G_B_SetTimeZoneAutomatically
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 2 /f
Goto %BTPBackMenu%

:G_C_SetTimeZoneManually
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 4 /f
Goto %BTPBackMenu%

:G_D_SetTimeZoneGMT7
tzutil /s "SE Asia Standard Time"
Goto %BTPBackMenu%

:G_E_SyncTimeImmediately
Echo ----------- BTP.G.E. Dong bo Gio ngay lap tuc -----------
net start w32time
w32tm /resync
net stop w32time
pause
Goto %BTPBackMenu%

:G_F_OpenTaskbarSetting
CLS
Echo ----------- BTP.G.9. Mo Cai dat Thanh Tacvu -----------
start ms-settings:taskbar
Goto %BTPBackMenu%

:G_R_ResetExplorer
Echo ----------- BTP.G.R. Khoi dong lai Explorer (Ap dung Cai dat) -----------
taskkill /f /im explorer.exe
start explorer.exe
Goto %BTPBackMenu%

:I_WindowsFeatures 
rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2
Goto MainMenu

:J_WindowsSecurity
cls
Echo ----------- BTP.J. Cai dat Bao mat Windows -----------
Echo   [1] Tat Kiem soat Tai khoan Nguoi dung (UAC)
Echo   [2] Bat Kiem soat Tai khoan Nguoi dung (UAC)
Echo   [3] Tat SmartScreen trong Internet Explorer
Echo   [4] Bat SmartScreen trong Internet Explorer
Echo   [5] Tat SmartScreen trong Edge
Echo   [6] Bat SmartScreen trong Edge
Echo   [7] Tat SmartScreen tren Tep AppHost Explorer
Echo   [8] Bat SmartScreen tren Tep AppHost Explorer
Echo   [A] Tat SmartScreen tren Windows Defender
Echo   [B] Bat SmartScreen tren Windows Defender
Echo   [C] Tat tat ca cai dat SmartScreen
Echo   [D] Bat tat ca cai dat SmartScreen
Echo   [E] Tai xuong Ung dung Tat Defender
Echo   [F] Khoi dong lai Windows de Ap dung Cai dat Moi
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 12345678ABCDEF0 /n /m "---------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ----------"
If %ErrorLevel%==1 Goto J_1_DisableUserAccountControl
If %ErrorLevel%==2 Goto J_2_EnableUserAccountControl
If %ErrorLevel%==3 Goto J_3_DisableSmartScreenInternetExplorer
If %ErrorLevel%==4 Goto J_4_EnableSmartScreenInternetExplorer
If %ErrorLevel%==5 Goto J_5_DisableSmartScreenEdge
If %ErrorLevel%==6 Goto J_6_EnableSmartScreenEdge
If %ErrorLevel%==7 Goto J_7_DisableSmartScreenAppHostExplorer
If %ErrorLevel%==8 Goto J_8_EnableSmartScreenAppHostExplorer
If %ErrorLevel%==9 Goto J_B_DisableSmartScreenOnWindowsDefender
If %ErrorLevel%==10 Goto J_B_EnableSmartScreenOnWindowsDefender
If %ErrorLevel%==11 Goto J_C_DisableAllSmartScreen
If %ErrorLevel%==12 Goto J_D_EnableAllSmartScreen
If %ErrorLevel%==13 Goto J_E_DownloadDisableDefenderApp
If %ErrorLevel%==14 Goto J_F_RestartWindows
If %ErrorLevel%==15 Goto MainMenu

:J_1_DisableUserAccountControl
CLS
Echo ----------- BTP.J.1. Tat Kiem soat Tai khoan Nguoi dung (UAC) -----------
Echo Tat Kiem soat Tai khoan Nguoi dung ...
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
PAUSE
Goto J_WindowsSecurity

:J_2_EnableUserAccountControl
CLS
Echo ----------- BTP.J.2. Bat Kiem soat Tai khoan Nguoi dung (UAC) -----------
Echo Bat Kiem soat Tai khoan Nguoi dung ...
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
PAUSE
Goto J_WindowsSecurity

:J_3_DisableSmartScreenInternetExplorer
CLS
Echo ----------- BTP.J.3. Tat SmartScreen trong Internet Explorer -----------
Echo Tat SmartScreen trong Internet Explorer
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
PAUSE
Goto J_WindowsSecurity

:J_4_EnableSmartScreenInternetExplorer
CLS
Echo ----------- BTP.J.4. Bat SmartScreen trong Internet Explorer -----------
Echo Bat SmartScreen trong Internet Explorer
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Warn" /f
PAUSE
Goto J_WindowsSecurity

:J_5_DisableSmartScreenEdge
CLS
Echo ----------- BTP.J.5. Tat SmartScreen trong Edge -----------
Echo Tat SmartScreen trong Edge
reg.exe ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\ Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
PAUSE
Goto J_WindowsSecurity

:J_6_EnableSmartScreenEdge
CLS
Echo ----------- BTP.J.6. Bat SmartScreen trong Edge -----------
Echo Bat SmartScreen trong Edge
reg.exe ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\ Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 1  /f
PAUSE
Goto J_WindowsSecurity

:J_7_DisableSmartScreenAppHostExplorer 
CLS
Echo ----------- BTP.J.7. Tat SmartScreen tren Tep AppHost Explorer -----------
Echo Tat SmartScreen tren Tep AppHost Explorer
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
PAUSE
Goto J_WindowsSecurity

:J_8_EnableSmartScreenAppHostExplorer
CLS
Echo ----------- BTP.J.8. Bat SmartScreen tren Tep AppHost Explorer -----------
Echo Bat SmartScreen tren Tep AppHost Explorer
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
PAUSE
Goto J_WindowsSecurity

:J_B_DisableSmartScreenOnWindowsDefender
CLS
Echo ----------- BTP.J.A. Tat SmartScreen tren Windows Defender -----------
Echo Tat SmartScreen tren Tep Windows Defender
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
PAUSE
Goto J_WindowsSecurity

:J_B_EnableSmartScreenOnWindowsDefender
CLS
Echo ----------- BTP.J.B. Bat SmartScreen tren Windows Defender -----------
Echo Bat SmartScreen tren Tep Windows Defender
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 1 /f
PAUSE
Goto J_WindowsSecurity

:J_C_DisableAllSmartScreen
CLS
Echo ----------- BTP.J.C. Tat tat ca cai dat SmartScreen -----------
Echo Tat tat ca cai dat SmartScreen
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
reg.exe ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\ Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
PAUSE
Goto J_WindowsSecurity

:J_D_EnableAllSmartScreen
CLS
Echo ----------- BTP.J.D. Bat tat ca cai dat SmartScreen -----------
Echo Bat tat ca cai dat SmartScreen
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Warn" /f
reg.exe ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\ Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 1 /f
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 1 /f
PAUSE
Goto J_WindowsSecurity

:J_E_DownloadDisableDefenderApp
CLS
Echo ----------- BTP.J.E. Tai xuong Ung dung Tat Defender -----------
Echo Tai xuong Ung dung Tat Defender. Mat khau giai nen: sordum
Start https://www.sordum.org/downloads/?st-defender-control
PAUSE
Goto J_WindowsSecurity

:J_F_RestartWindows
CLS
Echo ----------- BTP.J.F. Khoi dong lai Windows de Ap dung Cai dat Moi -----------
Echo Khoi dong lai May tinh ...
Shutdown /r /c "De ap dung cai dat moi" && Exit
Goto J_WindowsSecurity

:K_WindowsUpdate
cls
Echo ----------- BTP.K. Cai dat Cap nhat Windows -----------
Echo   [1] Tat Cap nhat Windows
Echo   [2] Bat Cap nhat Windows
Echo   [3] Tat "Lay cac ban cap nhat moi nhat ..."
Echo   [4] Bat "Lay cac ban cap nhat moi nhat ..."
Echo   [5] Tai xuong Ung dung Tat Cap nhat Windows
Echo   [6] Mo Cai dat Cap nhat Windows
Echo   [7] Khoi dong lai Windows
Echo   [0] Thoat ve Menu Chinh
CHOICE /c 12345670 /n /m "--------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) ---------"
If %ErrorLevel%==1 (
	CLS
	Echo ----------- BTP.K.1. Tat Cap nhat Windows -----------
	Echo Tat Cap nhat Windows ...
	Sc config wuauserv start= disabled
	net stop wuauserv
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f
	PAUSE
	Goto K_WindowsUpdate
)
If %ErrorLevel%==2 (
	CLS
	Echo ----------- BTP.K.2. Bat Cap nhat Windows -----------
	Echo Bat Cap nhat Windows ...
	sc config wuauserv start= auto
	net start wuauserv
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 0 /f
	PAUSE
	Goto K_WindowsUpdate
)
If %ErrorLevel%==3 (
	CLS
	Echo ----------- BTP.K.3. Tat "Lay cac ban cap nhat moi nhat ..." -----------
	Echo Tat "Lay cac ban cap nhat moi nhat ngay khi chung co san" ...
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v IsContinuousInnovationOptedIn /t REG_DWORD /d 0 /f
	PAUSE
	Goto K_WindowsUpdate
)
If %ErrorLevel%==4 (
	CLS
	Echo ----------- BTP.K.4. Bat "Lay cac ban cap nhat moi nhat ..." -----------
	Echo Bat "Lay cac ban cap nhat moi nhat ngay khi chung co san"
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v IsContinuousInnovationOptedIn /t REG_DWORD /d 1 /f
	PAUSE
	Goto K_WindowsUpdate
)
If %ErrorLevel%==5 (
	CLS
	Echo ----------- BTP.K.5. Tai xuong Ung dung Tat Cap nhat Windows -----------
	Echo Tai xuong Ung dung Chan Cap nhat Windows...
	Start https://www.sordum.org/downloads/?st-windows-update-blocker
	PAUSE
	Goto K_WindowsUpdate
)
If %ErrorLevel%==6 (
	CLS
	Echo ----------- BTP.K.6. Mo Cai dat Cap nhat Windows -----------
	start ms-settings:windowsupdate
	Goto K_WindowsUpdate
)
If %ErrorLevel%==7 (
	CLS
	Echo ----------- BTP.K.7. Khoi dong lai Windows de Ap dung Cai dat Moi -----------
	Echo Khoi dong lai May tinh ...
	Shutdown /r /c "De ap dung cai dat moi" && Exit
	Goto K_WindowsUpdate
)
If %ErrorLevel%==8 Goto MainMenu
Goto MainMenu

:L_OtherSettings
Set "BTPBackMenu=L_OtherSettings"
Set "FileDel="
Set "FolderDel="
cls
Echo -------------------------------- BTP.L. Cai dat Khac --------------------------------
Echo   [1] Sao luu Desktop, Tai lieu, Tai xuong...        [E] Mo Cai dat Ung dung Khoi dong
Echo   [2] Bao cao Pin                                    [F] Mo Cai dat Luu tru
Echo   [3] Xoa Lich su Trinh duyet                        [G] Mo Thong tin He thong
Echo   [4] Tao autounattend.xml Truc tuyen                [H] Mo Khac phuc Su co
Echo   [5] Tao autounattend.xml bang UnattendedWinstall   [I] Mo Kiem soat Tai khoan Nguoi dung
Echo   [6] Tao Loi tat Office den Desktop                 [J] Mo Phien ban Windows
Echo   [7] Xoa Tep Tam thoi                               [K] Doi ten May tinh
Echo   [8] Tat Internet Explorer                          [L] Khoi dong lai Explorer
Echo   [9] Lam rong Thung rac                             [M] Dat lai Mang
Echo   [A] Bat Che do Toi                                 [N] Chay Don dep Dia
Echo   [B] Bat Cong cu WMIC                               [O] Dat Mau chuan cho Excel, Word
Echo   [C] Mo Quan ly May tinh                            [P] Go cai dat Goi ung dung
Echo   [D] Mo Giam sat Tai nguyen                         [Q] Go cai dat Ung dung Xbox
Echo   [0] Thoat ve Menu Chinh                            
CHOICE /c 123456789ABCDEFGHIJKLMNOPQ0 /n /m "-------------------------- (^_^) Dieu Uoc Cua Ban Thanh Hien Thuc (^_^) --------------------------"
If %ErrorLevel%==1 Goto L1_Backup
If %ErrorLevel%==2 Goto L2_BatteryReport
If %ErrorLevel%==3 Goto L3_ClearBrowserHistory
If %ErrorLevel%==4 Goto L4_CreateAutounattendOnline
If %ErrorLevel%==5 Goto L5_UnattendedWinstall
If %ErrorLevel%==6 Goto L6_CreateOfficeShortcuts
If %ErrorLevel%==7 Goto L7_DeleteTempFiles
If %ErrorLevel%==8 Goto L8_DisableInternetExplorer
If %ErrorLevel%==9 Goto L9_EmptyRecycleBin
If %ErrorLevel%==10 Goto LA_EnableDarkMode
If %ErrorLevel%==11 Goto LB_EnableWMIC
If %ErrorLevel%==12 (compmgmt.msc) && (Goto L_OtherSettings)
If %ErrorLevel%==13 (resmon.exe) && (Goto L_OtherSettings)
If %ErrorLevel%==14 (Start ms-settings:startupapps) && (Goto L_OtherSettings)
If %ErrorLevel%==15 (Start ms-settings:storagesense) && (Goto L_OtherSettings)
If %ErrorLevel%==16 (Msinfo32) && (Goto L_OtherSettings)
If %ErrorLevel%==17 (Start ms-settings:troubleshoot) && (Goto L_OtherSettings)
If %ErrorLevel%==18 (UserAccountControlSettings.exe) && (Goto L_OtherSettings)
If %ErrorLevel%==19 (winver.exe) && (Goto L_OtherSettings)
If %ErrorLevel%==20 Goto LK_RenameComputerName
If %ErrorLevel%==21 Goto LL_ResetExplorer
If %ErrorLevel%==22 Goto LM_ResetNetwork
If %ErrorLevel%==23 Goto LN_RunDiskCleanUp
If %ErrorLevel%==24 Goto LO_SetTemplate
If %ErrorLevel%==25 Goto LP_UninstallAppPackages_Begin
If %ErrorLevel%==26 Goto LQ_UninstallXboxApps
If %ErrorLevel%==27 Goto MainMenu

:L1_Backup
CLS
Echo -------- BTP.L.1. Sao luu Desktop, Tai lieu, Tai xuong, Nhac, Hinh anh, Video --------
If not exist "%~dp0DATA" md "%~dp0DATA"
If not exist "%~dp0DATA\Desktop" md "%~dp0DATA\Desktop"
If not exist "%~dp0DATA\Documents" md "%~dp0DATA\Documents"
If not exist "%~dp0DATA\Downloads" md "%~dp0DATA\Downloads"
If not exist "%~dp0DATA\Music" md "%~dp0DATA\Music"
If not exist "%~dp0DATA\Pictures" md "%~dp0DATA\Pictures"
If not exist "%~dp0DATA\Videos" md "%~dp0DATA\Videos"
xcopy "%USERPROFILE%\Desktop" "%~dp0DATA\Desktop" /e /h /q
xcopy "%USERPROFILE%\Documents" "%~dp0DATA\Documents" /e /h /q
xcopy "%USERPROFILE%\Downloads" "%~dp0DATA\Downloads" /e /h /q
xcopy "%USERPROFILE%\Music" "%~dp0DATA\Music" /e /h /q
xcopy "%USERPROFILE%\Pictures" "%~dp0DATA\Pictures" /e /h /q
xcopy "%USERPROFILE%\Videos" "%~dp0DATA\Videos" /e /h /q
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L2_BatteryReport
CLS
Echo -------- BTP.L.2. Bao cao Pin --------
If exist "BatteryReport.html" del "BatteryReport.html" 
powercfg /batteryreport /output "%~dp0BatteryReport.html"
start "" "%~dp0BatteryReport.html"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L3_ClearBrowserHistory
CLS
Echo -------- BTP.L.3. Xoa Lich su Trinh duyet (Chrome, Edge, Firefox, Coccoc) --------
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\History"
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cookies"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\History"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cookies"
del /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*.default\places.sqlite"
del /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*"
del /q /s "%LocalAppData%\Coccoc\Browser\User Data\Default\History"
del /q /s "%LocalAppData%\Coccoc\Browser\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\Coccoc\Browser\User Data\Default\Cookies"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L4_CreateAutounattendOnline
Start "" "https://schneegans.de/windows/unattend-generator/"
Goto %BTPBackMenu%

:L5_UnattendedWinstall
CLS
Echo -------- BTP.L.5. Tao autounattend.xml bang UnattendedWinstall --------
SET "URL=%WIMUtilURL%"
Set "File=WIMUtil.ps1"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
Echo Chay %File% ...
powershell .\%File%
powershell -ExecutionPolicy Bypass -File "%FilePath%"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L6_CreateOfficeShortcuts
CLS
Echo -------- BTP.L.6. Tao Loi tat Office --------
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Power*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Visio*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Project*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Access*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Onedrive*.lnk" "%AllUsersProfile%\Desktop"
COPY /Y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Teams*.lnk" "%AllUsersProfile%\Desktop"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L7_DeleteTempFiles
CLS
Echo -------- BTP.L.7. Xoa Tep Tam thoi --------
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L8_DisableInternetExplorer
CLS
Echo -------- BTP.L.8. Tat Internet Explorer --------
dism /online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0.
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Internet Explorer" /v "SystemComponent" /t REG_DWORD /d 1 /f
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:L9_EmptyRecycleBin
CLS
Echo -------- BTP.L.9. Lam rong Thung rac --------
PowerShell -ExecutionPolicy Unrestricted -Command "$bin = (New-Object -ComObject Shell.Application).NameSpace(10); $bin.items() | ForEach {; Write-Host "^""Xoa $($_.Name) khoi Thung rac"^""; Remove-Item $_.Path -Recurse -Force; }"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LA_EnableDarkMode
CLS
Echo -------- BTP.L.A. Bat Che do Toi --------
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f
If %WinVer% GEQ 22000 (
	reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\Windows\img19.jpg" /f
	RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
)
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LB_EnableWMIC
CLS
Echo -------- BTP.L.B. Bat Cong cu WMIC --------
Echo Kiem tra WMIC ...
If not exist "%windir%\System32\wbem\WMIC.exe" (
	Echo WMIC dang bi Tat
	Echo Them WMIC vao Windows ...
	DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
) Else (Echo WMIC san co)
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LK_RenameComputerName
cls
Echo -------- BTP.L.K. Doi ten May tinh --------
Echo Ten May tinh Hien tai: %COMPUTERNAME%
Echo Khong nhap gi de khong doi Ten May tinh...
Powershell Rename-Computer
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LL_ResetExplorer
CLS
Echo -------- BTP.L.L. Khoi dong lai Explorer --------
taskkill /f /im explorer.exe
start explorer.exe
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LM_ResetNetwork
CLS
Echo -------- BTP.L.M. Dat lai Mang --------
ipconfig /flushdns
ipconfig /release
ipconfig /renew
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LN_RunDiskCleanUp
CLS
Echo -------- BTP.L.N. Chay Don dep Dia --------
cleanmgr /verylowdisk /sagerun:5
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LO_SetTemplate
CLS
Echo -------- BTP.L.O. Dat Mau chuan Cho Excel, Word --------
Echo Dat Mau chuan cho Microsoft Excel ...
Echo + Phong chu    : Times New Roman
Echo + Co chu       : 14
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Excel\Options" /v Font /t REG_SZ /d "Times New Roman,14" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Excel\Options" /v DefFontName /t REG_SZ /d "Times New Roman" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Excel\Options" /v DefFontSize /t REG_DWORD /d 14 /f
Echo --------
Echo Dat Mau chuan cho Microsoft Word ...
Echo + Phong chu        : Times New Roman
Echo + Co chu           : 14
Echo + Can le           : Can deu
Echo + Le trang         : 1
Echo + Kich thuoc trang : A4
Echo + Khoang truoc     : 6
Echo + Khoang sau       : 0
Echo + Dau dong         : 0.5cm
SET "URL=%NormalURL%"
Set "File=Normal.dotm"
Set "FilePath=%cd%\%File%"
Set "FileDel=%File%"
Set "FolderDel="
Call :URLDownload
If exist "%AppData%\Microsoft\Templates" xcopy "%~dp0Normal.dotm" "%AppData%\Microsoft\Templates" /e /h /r /y
Echo --------
Echo Dong Word, Excel. Mo lai chung de ap dung Mau chuan moi ...
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:LP_UninstallAppPackages_Begin
cls
Echo -------- BTP.L.P. Go cai dat Goi ung dung --------
PowerShell "Get-AppxPackage | Select PackageFullName | Sort PackageFullName"
Goto LP_UninstallAppPackages

:LP_UninstallAppPackages
Set "Package="
set /p "Package=Nhap PackageFullName (Khong nhap gi de Thoat):"
If "%Package%" EQU "" Goto L_OtherSettings
PowerShell "Remove-AppxPackage %Package%"
Goto LP_UninstallAppPackages

:LQ_UninstallXboxApps
CLS
Echo -------- BTP.L.Q. Go cai dat Ung dung Xbox --------
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxGamingOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.GamingApp" | Remove-AppxPackage"
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & Echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
call :BTP %ContrastColor% "Nhan phim bat ky de quay ve menu truoc"

:H_Help
start "" "https://docs.google.com/document/d/e/2PACX-1vTp0D3Xg-xphHKA5-XSoYEdEQX_1384fVhmgwaovSXs5EjEVn7vazioQywpkTTq6ewcd8sR1DaaO_GJ/pub"
Goto MainMenu

:0_Exit
powershell "(Get-WmiObject SoftwareLicensingService).OA3xOriginalProductKey"|CLIP
:: Delete BTP
:: del "%~f0"
Exit

:BTP
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
pause >nul
If "%FileDel%" NEQ "" Del "%FileDel%"
If "%FolderDel%" NEQ "" (
	For /d %%A in (%FolderDel%*) do rmdir /s /q "%%A"
)
cls
Goto %BTPBackMenu%

:URLDownload
If exist "%File%" Del "%File%"
Echo Dang tai xuong %File% ...
WHERE aria2c >nul 2>nul
If %ErrorLevel%==0 (
	aria2c -x 16 -s 16 -o "%File%" "%URL%"
) else (
	Powershell -command Invoke-WebRequest -Uri "%URL%" -OutFile "%FilePath%"
)
If %ErrorLevel% NEQ 0 (
	Echo Loi: Tai xuong khong thanh cong ...
	Pause
	GOTO %ErrorMenu%
)
GoTo :EOF
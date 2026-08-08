Imports System.Collections.Generic

' ================================================================================
' Synonyms.vb - HỖ TRỢ 3 HƯỚNG: MIX↔WISE, WISE↔PRO, MIX↔PRO
' ================================================================================
Public Module Synonyms

    Public ReadOnly TableSynonyms As New Dictionary(Of String, String())(StringComparer.OrdinalIgnoreCase)
    Public ReadOnly ColumnAliases As New Dictionary(Of String, String())(StringComparer.OrdinalIgnoreCase)

    Private _initialized As Boolean = False

    Private Sub AddOrReplace(dict As Dictionary(Of String, String()), key As String, ParamArray vals() As String)
        If dict.ContainsKey(key) Then
            dict(key) = vals
        Else
            dict.Add(key, vals)
        End If
    End Sub

    Public Sub Init()
        If _initialized Then Return
        _initialized = True

        TableSynonyms.Clear()
        ColumnAliases.Clear()

        ' =========================================================================
        '                       BẢNG - ƯU TIÊN TÊN WISE TRƯỚC
        ' =========================================================================

        ' UserInfo (WISE/MIX) ↔ NHANVIEN (PRO)
        AddOrReplace(TableSynonyms, "USERINFO",
            "UserInfo", "NHANVIEN")
        AddOrReplace(TableSynonyms, "NHANVIEN",
            "UserInfo", "NHANVIEN")

        ' RelationDept (WISE/MIX) ↔ PHONGBAN (PRO)
        AddOrReplace(TableSynonyms, "RELATIONDEPT",
            "RelationDept", "Departments", "PHONGBAN")

        ' Departments (WISE/MIX) ↔ PHONGBAN (PRO)
        AddOrReplace(TableSynonyms, "DEPARTMENTS",
            "Departments", "RelationDept", "PHONGBAN")

        ' PHONGBAN (PRO) ↔ nguồn WISE
        AddOrReplace(TableSynonyms, "PHONGBAN",
            "RelationDept", "Departments", "PHONGBAN")

        ' Template (cả 3 hệ thống đều dùng tên này)
        AddOrReplace(TableSynonyms, "TEMPLATE",
            "Template", "TEMPLATE")

        ' Face (chỉ MIX có)
        AddOrReplace(TableSynonyms, "FACE",
            "Face", "Faces")

        ' CheckInOut
        AddOrReplace(TableSynonyms, "CHECKINOUT",
            "CheckInOut")

        ' Machines (WISE/MIX) ↔ MAYCHAMCONG (PRO)
        AddOrReplace(TableSynonyms, "MACHINES",
            "Machines", "MAYCHAMCONG")
        AddOrReplace(TableSynonyms, "MAYCHAMCONG",
            "Machines", "MAYCHAMCONG")

        ' Company
        AddOrReplace(TableSynonyms, "COMPANY",
            "Company", "CONGTY")
        AddOrReplace(TableSynonyms, "CONGTY",
            "Company", "CONGTY")

        ' SchClass (WISE/MIX) ↔ CALAMVIEC (PRO)
        AddOrReplace(TableSynonyms, "SCHCLASS",
            "SchClass", "CALAMVIEC")
        AddOrReplace(TableSynonyms, "CALAMVIEC",
            "SchClass", "CALAMVIEC")

        ' UserTempSch (WISE/MIX) ↔ LICHTRINHCHOCALAMVIEC (PRO)
        AddOrReplace(TableSynonyms, "USERTEMPSCH",
            "UserTempSch", "LICHTRINHCHOCALAMVIEC")
        AddOrReplace(TableSynonyms, "LICHTRINHCHOCALAMVIEC",
            "UserTempSch", "LICHTRINHCHOCALAMVIEC")

        ' Commands
        AddOrReplace(TableSynonyms, "COMMANDS",
            "Commands")

        ' =========================================================================
        '                       CỘT - MAPPING CHI TIẾT (TÊN WISE TRƯỚC)
        ' =========================================================================

        ' ===== USERINFO (WISE/MIX) ↔ NHANVIEN (PRO) =====

        ' MaChamCong (PRO) - ƯU TIÊN BadgeNumber (mã thẻ thật)
        AddOrReplace(ColumnAliases, "MACHAMCONG",
    "BadgeNumber", "UserEnrollNumber", "MaChamCong")

        ' UserEnrollNumber (WISE/MIX Number) - cho TEMPLATE
        AddOrReplace(ColumnAliases, "USERENROLLNUMBER",
    "UserEnrollNumber", "BadgeNumber", "MaChamCong", "MaChamCor")

        ' BadgeNumber (WISE/MIX) ↔ MaChamCong (PRO)
        AddOrReplace(ColumnAliases, "BADGENUMBER",
    "BadgeNumber", "UserEnrollNumber", "MaChamCong")

        ' UserFullName (WISE/MIX) ↔ TenNhanVien (PRO)
        AddOrReplace(ColumnAliases, "USERFULLNAME",
            "UserFullName", "TenNhanVien", "Name")
        AddOrReplace(ColumnAliases, "TENNHANVIEN",
            "UserFullName", "TenNhanVien")

        ' UserIDC (WISE/MIX Number - dept ID) ↔ MaPhongBan (PRO Text!)
        AddOrReplace(ColumnAliases, "USERIDC",
            "UserIDC", "MaPhongBan")
        AddOrReplace(ColumnAliases, "MAPHONGBAN",
            "DeptCode", "MaPhongBan", "UserIDC")

        ' UserCardNo (WISE/MIX) ↔ MaThe (PRO)
        AddOrReplace(ColumnAliases, "USERCARDNO",
            "UserCardNo", "MaThe", "Card")
        AddOrReplace(ColumnAliases, "MATHE",
            "UserCardNo", "MaThe")

        ' UserHireDay (WISE/MIX) ↔ NgayVaoLamViec (PRO)
        AddOrReplace(ColumnAliases, "USERHIREDAY",
            "UserHireDay", "NgayVaoLamViec")
        AddOrReplace(ColumnAliases, "NGAYVAOLAMVIEC",
            "UserHireDay", "NgayVaoLamViec")

        ' UserEnabled (WISE/MIX) ↔ UserEnable (PRO)
        AddOrReplace(ColumnAliases, "USERENABLED",
            "UserEnabled", "UserEnable")
        AddOrReplace(ColumnAliases, "USERENABLE",
            "UserEnabled", "UserEnable")

        ' UserSex (WISE/MIX) ↔ GioiTinh (PRO)
        AddOrReplace(ColumnAliases, "USERSEX",
            "UserSex", "GioiTinh", "Gender")
        AddOrReplace(ColumnAliases, "GIOITINH",
            "UserSex", "GioiTinh")

        ' UserBirthDay (WISE/MIX) ↔ NgaySinh (PRO)
        AddOrReplace(ColumnAliases, "USERBIRTHDAY",
            "UserBirthDay", "NgaySinh")
        AddOrReplace(ColumnAliases, "NGAYSINH",
            "UserBirthDay", "NgaySinh")

        ' UserBirthPlace (WISE/MIX) ↔ NoiSinh (PRO)
        AddOrReplace(ColumnAliases, "USERBIRTHPLACE",
            "UserBirthPlace", "NoiSinh")
        AddOrReplace(ColumnAliases, "NOISINH",
            "UserBirthPlace", "NoiSinh")

        ' UserPW (WISE/MIX) ↔ UserPassWord (PRO)
        AddOrReplace(ColumnAliases, "USERPW",
            "UserPW", "UserPassWord", "Password")
        AddOrReplace(ColumnAliases, "USERPASSWORD",
            "UserPW", "UserPassWord")

        ' UserPrivilege (WISE/MIX) ↔ PhanQuyen (PRO)
        AddOrReplace(ColumnAliases, "USERPRIVILEGE",
            "UserPrivilege", "PhanQuyen", "UserPrivileg")
        AddOrReplace(ColumnAliases, "PHANQUYEN",
            "UserPrivilege", "PhanQuyen")

        ' UserIDTitle (WISE/MIX) ↔ ChucVu (PRO)
        AddOrReplace(ColumnAliases, "USERIDTITLE",
            "UserIDTitle", "ChucVu")
        AddOrReplace(ColumnAliases, "CHUCVU",
            "UserIDTitle", "ChucVu")

        ' CMND
        AddOrReplace(ColumnAliases, "USERIDCARD",
            "UserIDCard", "CMND")
        AddOrReplace(ColumnAliases, "CMND",
            "UserIDCard", "CMND")

        ' Email
        AddOrReplace(ColumnAliases, "USEREMAIL",
            "UserEmail", "Email")
        AddOrReplace(ColumnAliases, "EMAIL",
            "UserEmail", "Email")

        ' Phone
        AddOrReplace(ColumnAliases, "USERPHONENUMBER",
            "UserPhoneNumber", "DienThoaiLienHe")
        AddOrReplace(ColumnAliases, "DIENTHOAILIENTHE",
            "UserPhoneNumber", "DienThoaiLienHe")

        ' MaNhanVien (PRO) - riêng biệt
        AddOrReplace(ColumnAliases, "MANHANVIEN",
            "BadgeNumber", "UserFullCode", "MaNhanVien")

        ' TenChamCong (PRO)
        AddOrReplace(ColumnAliases, "TENCHAMCONG",
            "UserEnrollName", "TenChamCong")

        ' ===== RELATIONDEPT (WISE/MIX) ↔ PHONGBAN (PRO) =====

        ' Description (WISE/MIX) ↔ TenPhongBan (PRO)
        AddOrReplace(ColumnAliases, "DESCRIPTION",
            "Description", "TenPhongBan", "DeptName")
        AddOrReplace(ColumnAliases, "TENPHONGBAN",
            "Description", "TenPhongBan")

        ' DeptCode (WISE/MIX) ↔ MaPhongBan (PRO)
        AddOrReplace(ColumnAliases, "DEPTCODE",
            "DeptCode", "MaPhongBan")

        ' MaCongTy, MaKhuVuc (PRO)
        AddOrReplace(ColumnAliases, "MACONGTY",
            "MaCongTy")

        AddOrReplace(ColumnAliases, "MAKHUVUC",
            "MaKhuVuc")

        ' SoTienSanLuong (PRO)
        AddOrReplace(ColumnAliases, "SOTIENSANLUONG",
            "SoTienSanLuong")

        ' ===== TEMPLATE =====

        ' UserEnrollNumber (WISE/MIX Number) ↔ EnrollNumber (PRO Number) / MaChamCong (PRO Text)
        ' Đã có mapping ở trên

        ' FingerID (cả 3 hệ thống)
        AddOrReplace(ColumnAliases, "FINGERID",
            "FingerID", "FingerNumber")

        ' FingerTemplate (cả 3 hệ thống)
        AddOrReplace(ColumnAliases, "FINGERTEMPLATE",
            "FingerTemplate", "FPData")

        ' TempLength (WISE/MIX) ↔ FingerVersion (PRO)
        AddOrReplace(ColumnAliases, "TEMPLENGTH",
            "TempLength", "FingerVersion")
        AddOrReplace(ColumnAliases, "FINGERVERSION",
            "TempLength", "FingerVersion")

        ' Flag (cả 3 hệ thống)
        AddOrReplace(ColumnAliases, "FLAG",
            "Flag")

        ' EMachineNumber (PRO)
        AddOrReplace(ColumnAliases, "EMACHINENUMBER",
            "EMachineNumber")

        ' Privilige (PRO typo)
        AddOrReplace(ColumnAliases, "PRIVILIGE",
            "Privilige", "Privilege")

        ' enPassword (PRO)
        AddOrReplace(ColumnAliases, "ENPASSWORD",
            "enPassword", "Password")

        ' EnrollName (PRO)
        AddOrReplace(ColumnAliases, "ENROLLNAME",
            "EnrollName")

        ' ===== FACE (chỉ MIX) =====

        AddOrReplace(ColumnAliases, "FACEID",
            "FaceID")

        AddOrReplace(ColumnAliases, "FACETEMPLATE",
            "FaceTemplate")

        ' ===== CHECKINOUT =====

        ' TimeStr (WISE/MIX) ↔ GioCham (PRO)
        AddOrReplace(ColumnAliases, "TIMESTR",
            "TimeStr", "GioCham")
        AddOrReplace(ColumnAliases, "GIOCHAM",
            "TimeStr", "GioCham")

        ' TimeDate (WISE/MIX) ↔ NgayCham (PRO)
        AddOrReplace(ColumnAliases, "TIMEDATE",
            "TimeDate", "NgayCham")
        AddOrReplace(ColumnAliases, "NGAYCHAM",
            "TimeDate", "NgayCham")

        ' OriginType, NewType (WISE/MIX) ↔ KieuCham (PRO - nếu có)
        AddOrReplace(ColumnAliases, "ORIGINTYPE",
            "OriginType", "KieuCham")
        AddOrReplace(ColumnAliases, "KIEUCHAM",
            "OriginType", "NewType", "KieuCham")

        AddOrReplace(ColumnAliases, "NEWTYPE",
            "NewType", "KieuCham")

        ' Source (WISE/MIX) ↔ NguonCham (PRO)
        AddOrReplace(ColumnAliases, "SOURCE",
            "Source", "NguonCham")
        AddOrReplace(ColumnAliases, "NGUONCHAM",
            "Source", "NguonCham")

        ' MachineNo (WISE/MIX) ↔ MaSoMay (PRO - nếu có)
        AddOrReplace(ColumnAliases, "MACHINENO",
            "MachineNo", "MaSoMay")
        AddOrReplace(ColumnAliases, "MASOMAY",
            "MachineNo", "MaSoMay")

        ' TenMay (PRO)
        AddOrReplace(ColumnAliases, "TENMAY",
            "TenMay", "MachineName")

        ' MaNguoiDung (PRO)
        AddOrReplace(ColumnAliases, "MANGUOIDUNG",
            "MaNguoiDung")

        ' WorkCode
        AddOrReplace(ColumnAliases, "WORKCODE",
            "WorkCode")

        ' ===== MACHINES (WISE/MIX) ↔ MAYCHAMCONG (PRO) =====

        ' MachineID (WISE/MIX) ↔ MaMCC (PRO)
        AddOrReplace(ColumnAliases, "MACHINEID",
            "MachineID", "MaMCC", "IDMCC")
        AddOrReplace(ColumnAliases, "MAMCC",
            "MachineID", "MaMCC")
        AddOrReplace(ColumnAliases, "IDMCC",
            "MachineID", "IDMCC")

        ' MachineName (WISE/MIX) ↔ TenMCC (PRO)
        AddOrReplace(ColumnAliases, "MACHINENAME",
            "MachineName", "TenMCC")
        AddOrReplace(ColumnAliases, "TENMCC",
            "MachineName", "TenMCC")

        ' CommType (WISE/MIX) ↔ KieuKetNoi (PRO)
        AddOrReplace(ColumnAliases, "COMMTYPE",
            "CommType", "KieuKetNoi")
        AddOrReplace(ColumnAliases, "KIEUKETNOI",
            "CommType", "KieuKetNoi")

        ' COMPort (WISE/MIX) ↔ CongCOM (PRO)
        AddOrReplace(ColumnAliases, "COMPORT",
            "COMPort", "CongCOM")
        AddOrReplace(ColumnAliases, "CONGCOM",
            "COMPort", "CongCOM")

        ' BaudRate (WISE/MIX) ↔ TocDoTruyen (PRO)
        AddOrReplace(ColumnAliases, "BAUDRATE",
            "BaudRate", "TocDoTruyen")
        AddOrReplace(ColumnAliases, "TOCDOTRUYEN",
            "BaudRate", "TocDoTruyen")

        ' IPAddress (WISE/MIX) ↔ DiaChiIP (PRO)
        AddOrReplace(ColumnAliases, "IPADDRESS",
            "IPAddress", "DiaChiIP", "IP")
        AddOrReplace(ColumnAliases, "DIACHIIP",
            "IPAddress", "DiaChiIP")

        ' TCPPort (WISE/MIX) ↔ Port (PRO)
        AddOrReplace(ColumnAliases, "TCPPORT",
            "TCPPort", "Port")
        AddOrReplace(ColumnAliases, "PORT",
            "TCPPort", "Port")

        ' SerialNumber (WISE/MIX) ↔ Serial (PRO)
        AddOrReplace(ColumnAliases, "SERIALNUMBER",
            "SerialNumber", "Serial", "SoDangKy")
        AddOrReplace(ColumnAliases, "SERIAL",
            "SerialNumber", "Serial")
        AddOrReplace(ColumnAliases, "SODANGKY",
            "SerialNumber", "SoDangKy")

        ' DomainName, IsDomain, ActiveKey, CommKey (WISE/MIX)
        AddOrReplace(ColumnAliases, "DOMAINNAME",
            "DomainName", "DiaChiWeb")
        AddOrReplace(ColumnAliases, "DIACHIWEB",
            "DomainName", "DiaChiWeb")

        AddOrReplace(ColumnAliases, "ISDOMAIN",
            "IsDomain")

        AddOrReplace(ColumnAliases, "ACTIVEKEY",
            "ActiveKey")

        AddOrReplace(ColumnAliases, "COMMKEY",
            "CommKey")

        AddOrReplace(ColumnAliases, "LASTRECORDDATE",
            "LastRecordDate", "NgayDangKyMien")
        AddOrReplace(ColumnAliases, "NGAYDANGKYMIEN",
            "LastRecordDate", "NgayDangKyMien")

        AddOrReplace(ColumnAliases, "COLORCODE",
            "ColorCode", "TrangThai")
        AddOrReplace(ColumnAliases, "TRANGTHAI",
            "ColorCode", "TrangThai")

    End Sub

End Module

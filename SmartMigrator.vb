Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Linq

Public Module SmartMigrator

    ' Thứ tự ưu tiên: RelationDept/PHONGBAN trước, UserInfo/NHANVIEN sau
    Private ReadOnly PlanOrder As String() = {
        "RELATIONDEPT", "DEPARTMENTS", "PHONGBAN",
        "USERINFO", "NHANVIEN", "TEMPLATE", "FACE", "FACES",
        "SCHCLASS", "CALAMVIEC", "USERTEMPSCH", "LICHTRINHCHOCALAMVIEC",
        "MACHINES", "MAYCHAMCONG", "COMPANY", "CONGTY",
        "CHECKINOUT", "COMMANDS"
    }

    Public Class ColMapEntry
        Public Property Source As String
        Public Property Dest As String
        Public Property ProviderType As Integer
        Public Property IsNullable As Boolean
        Public Property IsString As Boolean
        Public Property IsNumeric As Boolean
        Public Property IsDate As Boolean
        Public Property DestMaxLen As Integer
    End Class

    Public Function PrepareDestFromTemplate(destTemplate As String, outFolder As String) As String
        Directory.CreateDirectory(outFolder)
        Dim name = Path.GetFileNameWithoutExtension(destTemplate)
        Dim ts = Date.Now.ToString("yyyyMMdd_HHmmss")
        Dim destWork = Path.Combine(outFolder, name & "_MIG_" & ts & ".mdb")
        File.Copy(destTemplate, destWork, True)
        Return destWork
    End Function

    Private Sub EnsureSeed(dst As OleDbConnection, lg As LogVN)
        Try
            Using cmd As New OleDbCommand("SELECT COUNT(*) FROM [Company]", dst)
                Dim c = Convert.ToInt32(cmd.ExecuteScalar())
                If c = 0 Then
                    Using ins As New OleDbCommand("INSERT INTO [Company] ([CompanyName]) VALUES (?)", dst)
                        ins.Parameters.AddWithValue("@p1", "Company")
                        ins.ExecuteNonQuery()
                        lg.Info("Đã seed Company.")
                    End Using
                End If
            End Using
        Catch
        End Try
    End Sub

    ' Phát hiện hướng chuyển
    Private Function DetectDirection(srcCn As OleDbConnection, dstCn As OleDbConnection, lg As LogVN) As String
        Dim srcTables = AccessHelpers.ListUserTables(srcCn)
        Dim dstTables = AccessHelpers.ListUserTables(dstCn)

        Dim srcHasUserInfo = srcTables.Any(Function(t) t.Equals("UserInfo", StringComparison.OrdinalIgnoreCase))
        Dim srcHasNhanVien = srcTables.Any(Function(t) t.Equals("NHANVIEN", StringComparison.OrdinalIgnoreCase))
        Dim srcHasFace = srcTables.Any(Function(t) t.Equals("Face", StringComparison.OrdinalIgnoreCase) OrElse t.Equals("Faces", StringComparison.OrdinalIgnoreCase))

        Dim dstHasUserInfo = dstTables.Any(Function(t) t.Equals("UserInfo", StringComparison.OrdinalIgnoreCase))
        Dim dstHasNhanVien = dstTables.Any(Function(t) t.Equals("NHANVIEN", StringComparison.OrdinalIgnoreCase))

        Dim direction As String = "UNKNOWN"

        If srcHasUserInfo AndAlso srcHasFace AndAlso dstHasUserInfo Then
            direction = "MIX_TO_WISE"
        ElseIf srcHasUserInfo AndAlso srcHasFace AndAlso dstHasNhanVien Then
            direction = "MIX_TO_PRO"
        ElseIf srcHasUserInfo AndAlso Not srcHasFace AndAlso dstHasNhanVien Then
            direction = "WISE_TO_PRO"
        ElseIf srcHasUserInfo AndAlso Not srcHasFace AndAlso dstHasUserInfo Then
            direction = "WISE_TO_WISE"
        ElseIf srcHasNhanVien AndAlso dstHasUserInfo Then
            direction = "PRO_TO_WISE" ' BỎ - không hỗ trợ
        End If

        lg.Info("🔄 Hướng: " & direction)
        Return direction
    End Function

    Private Function ResolveSourceTable(srcCn As OleDbConnection, dstCn As OleDbConnection, destTable As String, lg As LogVN) As String
        Dim srcTables = AccessHelpers.ListUserTables(srcCn)
        If srcTables Is Nothing OrElse srcTables.Count = 0 Then Return Nothing

        If Synonyms.TableSynonyms.ContainsKey(destTable) Then
            For Each aliasName In Synonyms.TableSynonyms(destTable)
                For Each srcT In srcTables
                    If String.Equals(srcT, aliasName, StringComparison.OrdinalIgnoreCase) Then
                        lg.Info("  ✓ [" & srcT & "] → [" & destTable & "]")
                        Return srcT
                    End If
                Next
            Next
        End If

        For Each srcT In srcTables
            If String.Equals(srcT, destTable, StringComparison.OrdinalIgnoreCase) Then
                lg.Info("  ✓ [" & srcT & "] → [" & destTable & "]")
                Return srcT
            End If
        Next

        Return Nothing
    End Function

    ' ===== CHUYỂN RELATIONDEPT (WISE/MIX) → PHONGBAN (PRO) =====
    Private Function CopyRelationDept_ToPro(src As OleDbConnection, dst As OleDbConnection,
                                            srcTable As String, destTable As String,
                                            lg As LogVN) As Integer
        lg.Info("  🏢 [" & srcTable & "] (cây) → [" & destTable & "] (phẳng)")

        Dim inserted As Integer = 0

        Try
            Dim depts As New List(Of Tuple(Of String, String))
            Using cmd As New OleDbCommand("SELECT [DeptCode], [Description] FROM [" & srcTable & "] WHERE [DeptCode] <> 'root' AND [DeptCode] IS NOT NULL", src)
                Using rdr = cmd.ExecuteReader()
                    While rdr.Read()
                        Dim code = If(IsDBNull(rdr(0)), "", rdr(0).ToString().Trim())
                        Dim desc = If(IsDBNull(rdr(1)), "", rdr(1).ToString().Trim())
                        If Not String.IsNullOrEmpty(code) Then
                            depts.Add(Tuple.Create(code, desc))
                        End If
                    End While
                End Using
            End Using

            lg.Info("    → " & depts.Count.ToString() & " phòng ban")

            For Each dept In depts
                Try
                    Using ins As New OleDbCommand(
                        "INSERT INTO [" & destTable & "] ([MaPhongBan], [MaCongTy], [MaKhuVuc], [TenPhongBan], [SoTienSanLuong]) VALUES (?, ?, ?, ?, ?)", dst)
                        ins.Parameters.AddWithValue("@1", dept.Item1)
                        ins.Parameters.AddWithValue("@2", "CT00001")
                        ins.Parameters.AddWithValue("@3", "KV00001")
                        ins.Parameters.AddWithValue("@4", dept.Item2)
                        ins.Parameters.AddWithValue("@5", "S001")
                        ins.ExecuteNonQuery()
                        inserted += 1
                    End Using
                Catch ex As Exception
                    If Not ex.Message.ToLower().Contains("duplicate") Then
                        lg.Info("      ✗ [" & dept.Item1 & "]: " & ex.Message)
                    End If
                End Try
            Next

            lg.Info("    ✓ " & inserted.ToString() & " phòng")

        Catch ex As Exception
            lg.Info("  ✗ LỖI: " & ex.Message)
        End Try

        Return inserted
    End Function

    ' ===== CHUYỂN PHONGBAN (PRO) → RELATIONDEPT (WISE/MIX) =====
    Private Function CopyPhongBan_ToWise(src As OleDbConnection, dst As OleDbConnection,
                                         srcTable As String, destTable As String,
                                         lg As LogVN) As Integer
        lg.Info("  🏢 [" & srcTable & "] (phẳng) → [" & destTable & "] (cây)")

        Dim inserted As Integer = 0

        Try
            ' Tạo root
            Dim rootId As Integer = 0
            Using cmd As New OleDbCommand("SELECT [ID] FROM [" & destTable & "] WHERE [DeptCode] = 'root'", dst)
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    rootId = Convert.ToInt32(result)
                Else
                    Using ins As New OleDbCommand(
                        "INSERT INTO [" & destTable & "] ([Description], [DeptCode], [Level], [RelationID], [TempID]) VALUES (?, ?, ?, ?, ?)", dst)
                        ins.Parameters.AddWithValue("@1", "Root")
                        ins.Parameters.AddWithValue("@2", "root")
                        ins.Parameters.AddWithValue("@3", 1)
                        ins.Parameters.AddWithValue("@4", 0)
                        ins.Parameters.AddWithValue("@5", 0)
                        ins.ExecuteNonQuery()
                    End Using
                    Using cmd2 As New OleDbCommand("SELECT @@IDENTITY", dst)
                        rootId = Convert.ToInt32(cmd2.ExecuteScalar())
                    End Using
                    inserted += 1
                End If
            End Using

            ' Đọc phòng ban
            Dim depts As New List(Of Tuple(Of String, String))
            Using cmd As New OleDbCommand("SELECT [MaPhongBan], [TenPhongBan] FROM [" & srcTable & "]", src)
                Using rdr = cmd.ExecuteReader()
                    While rdr.Read()
                        Dim code = If(IsDBNull(rdr(0)), "", rdr(0).ToString().Trim())
                        Dim name = If(IsDBNull(rdr(1)), "", rdr(1).ToString().Trim())
                        If Not String.IsNullOrEmpty(code) Then
                            depts.Add(Tuple.Create(code, name))
                        End If
                    End While
                End Using
            End Using

            lg.Info("    → " & depts.Count.ToString() & " phòng ban")

            For Each dept In depts
                Try
                    Using ins As New OleDbCommand(
                        "INSERT INTO [" & destTable & "] ([Description], [DeptCode], [Level], [RelationID], [TempID]) VALUES (?, ?, ?, ?, ?)", dst)
                        ins.Parameters.AddWithValue("@1", dept.Item2)
                        ins.Parameters.AddWithValue("@2", dept.Item1)
                        ins.Parameters.AddWithValue("@3", 2)
                        ins.Parameters.AddWithValue("@4", rootId)
                        ins.Parameters.AddWithValue("@5", 0)
                        ins.ExecuteNonQuery()
                        inserted += 1
                    End Using
                Catch ex As Exception
                    If Not ex.Message.ToLower().Contains("duplicate") Then
                        lg.Info("      ✗ [" & dept.Item1 & "]: " & ex.Message)
                    End If
                End Try
            Next

            lg.Info("    ✓ " & inserted.ToString() & " phòng")

        Catch ex As Exception
            lg.Info("  ✗ LỖI: " & ex.Message)
        End Try

        Return inserted
    End Function

    Private Function BuildColumnMap(srcCn As OleDbConnection, srcTable As String,
                                    destCn As OleDbConnection, destTable As String,
                                    lg As LogVN, direction As String) As List(Of ColMapEntry)

        Dim srcCols = AccessHelpers.GetColumns(srcCn, srcTable)
        Dim srcColsUpper As New HashSet(Of String)(srcCols.Select(Function(c) c.ToUpperInvariant()))
        Dim destSchema = AccessHelpers.GetSchemaTable(destCn, destTable)

        Dim pairs As New List(Of ColMapEntry)
        Dim mapDetails As New List(Of String)

        For Each r As DataRow In destSchema.Rows
            Dim dCol = r("ColumnName").ToString()

            Dim isAuto As Boolean = False
            If destSchema.Columns.Contains("IsAutoIncrement") AndAlso Not IsDBNull(r("IsAutoIncrement")) Then
                isAuto = CBool(r("IsAutoIncrement"))
            End If
            If isAuto Then Continue For

            Dim provType As Integer = 0
            If destSchema.Columns.Contains("ProviderType") AndAlso Not IsDBNull(r("ProviderType")) Then
                provType = CInt(r("ProviderType"))
            End If

            Dim allowNull As Boolean = True
            If destSchema.Columns.Contains("AllowDBNull") AndAlso Not IsDBNull(r("AllowDBNull")) Then
                allowNull = CBool(r("AllowDBNull"))
            End If

            Dim maxLen As Integer = 0
            If destSchema.Columns.Contains("ColumnSize") AndAlso Not IsDBNull(r("ColumnSize")) Then
                Try : maxLen = Convert.ToInt32(r("ColumnSize")) : Catch : maxLen = 0 : End Try
            End If

            Dim isStr As Boolean = False, isNum As Boolean = False, isDt As Boolean = False
            Try
                Select Case CType(provType, OleDbType)
                    Case OleDbType.VarChar, OleDbType.VarWChar, OleDbType.WChar, OleDbType.LongVarChar, OleDbType.LongVarWChar, OleDbType.Char
                        isStr = True
                    Case OleDbType.SmallInt, OleDbType.Integer, OleDbType.BigInt, OleDbType.UnsignedTinyInt, OleDbType.Numeric, OleDbType.Decimal, OleDbType.Double, OleDbType.Single
                        isNum = True
                    Case OleDbType.DBDate, OleDbType.Date, OleDbType.DBTime, OleDbType.DBTimeStamp
                        isDt = True
                End Select
            Catch
            End Try

            Dim match As String = Nothing
            Dim matchMethod As String = ""

            If Synonyms.ColumnAliases.ContainsKey(dCol) Then
                For Each al In Synonyms.ColumnAliases(dCol)
                    Dim alUpper = al.ToUpperInvariant()
                    If srcColsUpper.Contains(alUpper) Then
                        For Each sCol In srcCols
                            If sCol.ToUpperInvariant() = alUpper Then
                                match = sCol
                                matchMethod = "alias"
                                Exit For
                            End If
                        Next
                        If match IsNot Nothing Then Exit For
                    End If
                Next
            End If

            If match Is Nothing Then
                Dim dColUpper = dCol.ToUpperInvariant()
                If srcColsUpper.Contains(dColUpper) Then
                    For Each sCol In srcCols
                        If sCol.ToUpperInvariant() = dColUpper Then
                            match = sCol
                            matchMethod = "exact"
                            Exit For
                        End If
                    Next
                End If
            End If

            If match IsNot Nothing Then
                pairs.Add(New ColMapEntry With {
                    .Source = match,
                    .Dest = dCol,
                    .ProviderType = provType,
                    .IsNullable = allowNull,
                    .IsString = isStr,
                    .IsNumeric = isNum,
                    .IsDate = isDt,
                    .DestMaxLen = maxLen
                })
                mapDetails.Add("    [" & match & "] → [" & dCol & "]")
            End If
        Next

        If pairs.Count > 0 Then
            lg.Info("  Map " & pairs.Count.ToString() & " cột:")
            For Each detail In mapDetails
                lg.Info(detail)
            Next
        End If

        Return pairs
    End Function

    Private Function JoinParams(count As Integer) As String
        Dim s As String = ""
        For i As Integer = 0 To count - 1
            If i > 0 Then s &= ","
            s &= "?"
        Next
        Return s
    End Function

    Private Function JoinCols(pairs As List(Of ColMapEntry), itemIndex As Integer) As String
        Dim s As String = ""
        For i As Integer = 0 To pairs.Count - 1
            If i > 0 Then s &= ","
            Dim v As String = If(itemIndex = 1, pairs(i).Source, pairs(i).Dest)
            s &= "[" & v & "]"
        Next
        Return s
    End Function

    Private Function CountRows(cn As OleDbConnection, tableName As String) As Integer
        Using cmd As New OleDbCommand("SELECT COUNT(*) FROM [" & tableName & "]", cn)
            Return Convert.ToInt32(cmd.ExecuteScalar())
        End Using
    End Function

    Private Function IsLogTable(tbl As String) As Boolean
        If String.IsNullOrEmpty(tbl) Then Return False
        Dim t = tbl.ToUpperInvariant()
        Dim exact() As String = {"CHECKINOUT", "EDITINOUTLOG", "EDITINOUT", "DELINOUT", "DELINOUTLOG", "INOUT", "INOUTARR"}
        If exact.Any(Function(x) String.Equals(t, x, StringComparison.OrdinalIgnoreCase)) Then Return True
        If t.Contains("CHECKINOUT") Then Return True
        If t.Contains("INOUT") AndAlso (t.Contains("LOG") OrElse t.Contains("EDIT") OrElse t.Contains("DEL")) Then Return True
        Return False
    End Function

    Private Function CopyOneTable(src As OleDbConnection, dst As OleDbConnection, destTable As String,
                                  lg As LogVN, dryRun As Boolean, isCancel As Func(Of Boolean),
                                  progressCb As Action(Of Integer, String),
                                  tableIndex As Integer, totalTables As Integer,
                                  direction As String) _
                                  As Tuple(Of Integer, String, Boolean)

        lg.Info("▶ [" & destTable & "]")

        Dim srcTable = ResolveSourceTable(src, dst, destTable, lg)
        If String.IsNullOrEmpty(srcTable) Then
            lg.Info("  ✗ Không tìm thấy nguồn")
            Return Tuple.Create(0, "Không tìm thấy nguồn", False)
        End If

        ' ===== XỬ LÝ ĐẶC BIỆT: PHÒNG BAN (chỉ khi chuyển đổi giữa các định dạng khác nhau) =====
        ' Chuyển từ WISE/MIX sang PRO: RelationDept → PHONGBAN
        If (direction = "WISE_TO_PRO" OrElse direction = "MIX_TO_PRO") AndAlso (destTable.Equals("PHONGBAN", StringComparison.OrdinalIgnoreCase)) Then
            If dryRun Then Return Tuple.Create(0, "", False)
            Dim ins = CopyRelationDept_ToPro(src, dst, srcTable, destTable, lg)
            Return Tuple.Create(ins, "", False)
        End If

        ' Chuyển từ PRO sang WISE/MIX: PHONGBAN → RelationDept (hiện không hỗ trợ PRO_TO_WISE)
        If direction = "PRO_TO_MIX" AndAlso (destTable.Equals("RelationDept", StringComparison.OrdinalIgnoreCase)) Then
            If dryRun Then Return Tuple.Create(0, "", False)
            Dim ins = CopyPhongBan_ToWise(src, dst, srcTable, destTable, lg)
            Return Tuple.Create(ins, "", False)
        End If

        ' ===== XỬ LÝ FACE (chỉ khi nguồn có) =====
        If destTable.Equals("Face", StringComparison.OrdinalIgnoreCase) OrElse destTable.Equals("Faces", StringComparison.OrdinalIgnoreCase) Then
            ' Kiểm tra nguồn có Face không
            Dim srcTables = AccessHelpers.ListUserTables(src)
            Dim hasFace = srcTables.Any(Function(t) t.Equals("Face", StringComparison.OrdinalIgnoreCase) OrElse t.Equals("Faces", StringComparison.OrdinalIgnoreCase))
            If Not hasFace Then
                lg.Info("  → Bỏ qua Face (nguồn không có)")
                Return Tuple.Create(0, "Nguồn không có Face", False)
            End If
        End If

        ' ===== XỬ LÝ BÌNH THƯỜNG =====
        Dim map = BuildColumnMap(src, srcTable, dst, destTable, lg, direction)
        If map.Count = 0 Then
            lg.Info("  ✗ Không có cột tương ứng")
            Return Tuple.Create(0, "Không có cột tương ứng", False)
        End If

        Dim totalRows As Integer = CountRows(src, srcTable)
        lg.Info("  Nguồn: " & totalRows.ToString() & " bản ghi")

        If dryRun Then Return Tuple.Create(0, "", False)

        Dim inserted As Integer = 0
        Dim batchSize As Integer = 5000
        Dim selectList = JoinCols(map, 1)
        Dim insertCols = JoinCols(map, 2)
        Dim paramList = JoinParams(map.Count)

        Dim selSql = "SELECT " & selectList & " FROM [" & srcTable & "]"
        Dim insSql = "INSERT INTO [" & destTable & "] (" & insertCols & ") VALUES (" & paramList & ")"

        Using cmdSel As New OleDbCommand(selSql, src)
            Using rdr = cmdSel.ExecuteReader(CommandBehavior.SequentialAccess)
                Dim processed As Integer = 0
                Dim tx As OleDbTransaction = Nothing

                Try
                    tx = dst.BeginTransaction()

                    Using cmdIns As New OleDbCommand(insSql, dst, tx)
                        cmdIns.Parameters.Clear()
                        For i = 0 To map.Count - 1
                            Dim p As New OleDbParameter()
                            If map(i).ProviderType <> 0 Then
                                Try : p.OleDbType = CType(map(i).ProviderType, OleDbType) : Catch : End Try
                            End If
                            If map(i).IsString AndAlso map(i).DestMaxLen > 0 Then
                                Try : p.Size = map(i).DestMaxLen : Catch : End Try
                            End If
                            cmdIns.Parameters.Add(p)
                        Next

                        While rdr.Read()
                            If Not ReferenceEquals(isCancel, Nothing) AndAlso isCancel() Then
                                tx.Commit() : tx = Nothing
                                Return Tuple.Create(inserted, "Canceled", True)
                            End If

                            For i = 0 To map.Count - 1
                                Dim val = rdr.GetValue(i)

                                ' CHUYỂN ĐỔI KIỂU DỮ LIỆU (Text ↔ Number)
                                Dim outVal As Object = val

                                If val Is Nothing OrElse val Is DBNull.Value Then
                                    If Not map(i).IsNullable Then
                                        If map(i).IsString Then
                                            outVal = ""
                                        ElseIf map(i).IsNumeric Then
                                            outVal = 0
                                        ElseIf map(i).IsDate Then
                                            outVal = New DateTime(1900, 1, 1)
                                        Else
                                            outVal = DBNull.Value
                                        End If
                                    Else
                                        outVal = DBNull.Value
                                    End If
                                Else
                                    Try
                                        If map(i).IsString Then
                                            ' Number → Text
                                            Dim s As String = Convert.ToString(val)
                                            If map(i).DestMaxLen > 0 AndAlso s IsNot Nothing AndAlso s.Length > map(i).DestMaxLen Then
                                                s = s.Substring(0, map(i).DestMaxLen)
                                            End If
                                            outVal = s
                                        ElseIf map(i).IsNumeric Then
                                            ' Text → Number hoặc Number → Number
                                            Dim dblVal As Double
                                            If Double.TryParse(Convert.ToString(val), dblVal) Then
                                                outVal = dblVal
                                            Else
                                                outVal = If(map(i).IsNullable, DBNull.Value, CObj(0))
                                            End If
                                        ElseIf map(i).IsDate Then
                                            Dim dtVal As Date
                                            If Date.TryParse(Convert.ToString(val), dtVal) Then
                                                outVal = dtVal
                                            Else
                                                outVal = If(map(i).IsNullable, DBNull.Value, CObj(New Date(1900, 1, 1)))
                                            End If
                                        Else
                                            outVal = val
                                        End If
                                    Catch
                                        If map(i).IsString Then
                                            outVal = If(map(i).IsNullable, DBNull.Value, CObj(""))
                                        ElseIf map(i).IsNumeric Then
                                            outVal = If(map(i).IsNullable, DBNull.Value, CObj(0))
                                        ElseIf map(i).IsDate Then
                                            outVal = If(map(i).IsNullable, DBNull.Value, CObj(New Date(1900, 1, 1)))
                                        Else
                                            outVal = If(map(i).IsNullable, DBNull.Value, CObj(""))
                                        End If
                                    End Try
                                End If

                                cmdIns.Parameters(i).Value = outVal
                            Next

                            Try
                                cmdIns.ExecuteNonQuery()
                                inserted += 1
                            Catch ex As Exception
                                Dim m = ex.Message.ToLowerInvariant()
                                If Not (m.Contains("duplicate") OrElse m.Contains("index") OrElse m.Contains("primary key") OrElse m.Contains("unique")) Then
                                    Throw
                                End If
                            End Try

                            processed += 1

                            If (processed Mod batchSize = 0) Then
                                tx.Commit()
                                tx = dst.BeginTransaction()
                                cmdIns.Transaction = tx
                            End If
                        End While
                    End Using

                    If tx IsNot Nothing Then tx.Commit()
                    tx = Nothing

                Catch ex As Exception
                    Try
                        If tx IsNot Nothing Then tx.Rollback()
                    Catch
                    End Try
                    lg.Info("  ✗ LỖI: " & ex.Message)
                    Throw
                Finally
                    Try
                        If tx IsNot Nothing Then tx.Dispose()
                    Catch
                    End Try
                End Try
            End Using
        End Using

        lg.Info("  ✓ " & inserted.ToString() & "/" & totalRows.ToString())
        Return Tuple.Create(inserted, "", False)
    End Function

    Private Sub FixNullStrings(dst As OleDbConnection, table As String, ParamArray cols() As String)
        For Each c In cols
            Try
                Using cmd As New OleDbCommand("UPDATE [" & table & "] SET [" & c & "] = '' WHERE [" & c & "] IS NULL", dst)
                    cmd.ExecuteNonQuery()
                End Using
            Catch
            End Try
        Next
    End Sub

    ' CHUẨN HÓA CHO WISE/MIX
    Private Sub NormalizeForWise(dst As OleDbConnection, lg As LogVN)
        Try
            lg.Info("  → Fix nulls...")
            FixNullStrings(dst, "UserInfo", "BadgeNumber", "UserFullName", "UserCardNo")

            lg.Info("  → Map UserIDC (MaPhongBan → RelationDept.ID)...")

            Dim deptMap As New Dictionary(Of String, Integer)(StringComparer.OrdinalIgnoreCase)
            Using cmd As New OleDbCommand("SELECT [ID], [DeptCode] FROM [RelationDept] WHERE [DeptCode] <> 'root'", dst)
                Using rdr = cmd.ExecuteReader()
                    While rdr.Read()
                        Dim id = Convert.ToInt32(rdr(0))
                        Dim code = rdr(1).ToString().Trim()
                        If Not String.IsNullOrEmpty(code) Then deptMap(code) = id
                    End While
                End Using
            End Using

            If deptMap.Count = 0 Then
                lg.Info("    ⚠ Không có phòng! Set UserIDC = 1")
                Using cmd As New OleDbCommand("UPDATE [UserInfo] SET [UserIDC] = 1", dst)
                    cmd.ExecuteNonQuery()
                End Using
                Return
            End If

            Dim updated As Integer = 0
            Dim userList As New List(Of Tuple(Of Integer, String))

            Using cmd As New OleDbCommand("SELECT [UserEnrollNumber], [UserIDC] FROM [UserInfo]", dst)
                Using rdr = cmd.ExecuteReader()
                    While rdr.Read()
                        Dim enrollNum = If(IsDBNull(rdr(0)), 0, Convert.ToInt32(rdr(0)))
                        Dim userIDC_Old = If(IsDBNull(rdr(1)), "", rdr(1).ToString().Trim())
                        If enrollNum > 0 AndAlso Not String.IsNullOrEmpty(userIDC_Old) Then
                            userList.Add(Tuple.Create(enrollNum, userIDC_Old))
                        End If
                    End While
                End Using
            End Using

            For Each user In userList
                If deptMap.ContainsKey(user.Item2) Then
                    Dim newDeptID = deptMap(user.Item2)
                    Using cmd As New OleDbCommand("UPDATE [UserInfo] SET [UserIDC] = ? WHERE [UserEnrollNumber] = ?", dst)
                        cmd.Parameters.AddWithValue("@1", newDeptID)
                        cmd.Parameters.AddWithValue("@2", user.Item1)
                        If cmd.ExecuteNonQuery() > 0 Then updated += 1
                    End Using
                End If
            Next

            lg.Info("    ✓ Map " & updated.ToString() & " nhân viên")

            Using cmd As New OleDbCommand("UPDATE [UserInfo] SET [UserIDC] = 1 WHERE [UserIDC] IS NULL OR [UserIDC] = 0", dst)
                cmd.ExecuteNonQuery()
            End Using

            Using cmd As New OleDbCommand("UPDATE [UserInfo] SET [UserEnabled] = -1 WHERE [UserEnabled] IS NULL OR [UserEnabled] = 0", dst)
                cmd.ExecuteNonQuery()
            End Using

            lg.Info("  ✓ Chuẩn hóa WISE xong")

        Catch ex As Exception
            lg.Info("  ✗ Lỗi: " & ex.Message)
        End Try
    End Sub

    ' CHUẨN HÓA CHO PRO
    Private Sub NormalizeForPro(dst As OleDbConnection, lg As LogVN)
        Try
            FixNullStrings(dst, "NHANVIEN", "MaChamCong", "TenNhanVien", "MaThe")

            Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [MaPhongBan] = 'PB00001' WHERE [MaPhongBan] IS NULL OR [MaPhongBan] = ''", dst)
                Dim affected = cmd.ExecuteNonQuery()
                If affected > 0 Then lg.Info("    → Gán MaPhongBan cho " & affected.ToString() & " nhân viên")
            End Using

            Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [UserEnable] = -1 WHERE [UserEnable] IS NULL OR [UserEnable] = 0", dst)
                Dim affected = cmd.ExecuteNonQuery()
                If affected > 0 Then lg.Info("    → Kích hoạt " & affected.ToString() & " nhân viên")
            End Using

            lg.Info("  ✓ Chuẩn hóa PRO xong")

        Catch ex As Exception
            lg.Info("  ✗ Lỗi: " & ex.Message)
        End Try
    End Sub

    Public Sub MigrateAll(sourceMdb As String, destTemplate As String, outFolder As String,
                          progressCb As Action(Of Integer, String),
                          ByRef outDestWork As String, ByRef outLog As String,
                          Optional overridePass As String = Nothing,
                          Optional dryRun As Boolean = False,
                          Optional isCancel As Func(Of Boolean) = Nothing,
                          Optional logEnabled As Boolean = True)

        Synonyms.Init()

        Dim logPath = Path.Combine(outFolder, "BaoCao_" & Date.Now.ToString("yyyyMMdd_HHmmss") & ".txt")
        Dim lg As New LogVN(logPath) : outLog = logPath

        lg.Info("=" & New String("="c, 70))
        lg.Info("    CHUYỂN DỮ LIỆU ACCESS (MIX/WISE/PRO)")
        lg.Info("=" & New String("="c, 70))
        lg.Info("Nguồn: " & sourceMdb)
        lg.Info("Đích: " & destTemplate)
        lg.Info("")

        outDestWork = PrepareDestFromTemplate(destTemplate, outFolder)
        lg.Info("✓ File đích: " & outDestWork)
        lg.Info("")

        Using src = AccessHelpers.OpenOleDb(sourceMdb, overridePass)
            Using dst = AccessHelpers.OpenOleDb(outDestWork)

                Dim direction = DetectDirection(src, dst, lg)
                lg.Info("")

                ' BỎ PRO → WISE
                If direction = "PRO_TO_WISE" Then
                    lg.Info("⚠ KHÔNG HỖ TRỢ PRO → WISE")
                    lg.Info("Vui lòng chuyển: MIX/WISE → PRO")
                    Return
                End If

                EnsureSeed(dst, lg)

                Dim allSrc = AccessHelpers.ListUserTables(src)
                lg.Info("Nguồn: " & allSrc.Count.ToString() & " bảng")
                lg.Info("")

                Dim destTables = AccessHelpers.ListUserTables(dst)
                Dim wanted As New List(Of String)

                For Each tplan In PlanOrder
                    For Each d In destTables
                        If String.Equals(d, tplan, StringComparison.OrdinalIgnoreCase) Then
                            wanted.Add(d) : Exit For
                        End If
                    Next
                Next

                For Each d In destTables
                    If Not wanted.Any(Function(w) String.Equals(w, d, StringComparison.OrdinalIgnoreCase)) Then
                        wanted.Add(d)
                    End If
                Next

                If Not logEnabled Then
                    wanted = wanted.Where(Function(t) Not IsLogTable(t)).ToList()
                End If

                wanted = wanted.Where(Function(t) Not t.Equals("WSchedules", StringComparison.OrdinalIgnoreCase)).ToList()

                lg.Info("Xử lý " & wanted.Count.ToString() & " bảng")
                lg.Info("")

                Dim total = Math.Max(1, wanted.Count)
                Dim idx As Integer = 0
                Dim okList As New List(Of String)
                Dim failList As New List(Of String)

                For Each t In wanted
                    idx += 1

                    If Not ReferenceEquals(isCancel, Nothing) AndAlso isCancel() Then
                        lg.Info("⚠ HỦY")
                        Exit For
                    End If

                    Try
                        Dim res = CopyOneTable(src, dst, t, lg, dryRun, isCancel, progressCb, idx - 1, total, direction)
                        If res.Item3 Then Exit For

                        If dryRun Then Continue For

                        If res.Item1 > 0 Then
                            okList.Add("✓ " & t & ": " & res.Item1.ToString())
                        Else
                            failList.Add("✗ " & t & ": " & If(String.IsNullOrEmpty(res.Item2), "Lỗi", res.Item2))
                        End If
                    Catch ex As Exception
                        failList.Add("✗ " & t & ": " & ex.Message)
                    End Try

                    lg.Info("")
                Next

                If Not dryRun Then
                    lg.Info("=" & New String("="c, 70))
                    lg.Info("    CHUẨN HÓA")
                    lg.Info("=" & New String("="c, 70))

                    If direction.Contains("TO_WISE") Then
                        NormalizeForWise(dst, lg)
                    ElseIf direction.Contains("TO_PRO") Then
                        NormalizeForPro(dst, lg)
                    End If

                    lg.Info("")
                End If

                lg.Info("=" & New String("="c, 70))
                lg.Info("    KẾT QUẢ")
                lg.Info("=" & New String("="c, 70))
                lg.Info("")

                lg.Info("THÀNH CÔNG (" & okList.Count.ToString() & "):")
                If okList.Count = 0 Then lg.Info("  (không có)") Else okList.ForEach(Sub(s) lg.Info("  " & s))
                lg.Info("")

                lg.Info("THẤT BẠI (" & failList.Count.ToString() & "):")
                If failList.Count = 0 Then lg.Info("  (không có)") Else failList.ForEach(Sub(s) lg.Info("  " & s))
                lg.Info("")

                lg.Info("=" & New String("="c, 70))
                lg.Info("✓ XONG")
                lg.Info("=" & New String("="c, 70))
            End Using
        End Using
    End Sub

End Module

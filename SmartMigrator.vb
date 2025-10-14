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
        Public Property IsBoolean As Boolean
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
                    Dim companyCols = AccessHelpers.GetColumns(dst, "Company")
                    Dim hasCompName = companyCols.Any(Function(col) col.Equals("CompName", StringComparison.OrdinalIgnoreCase))
                    Dim hasCompanyName = companyCols.Any(Function(col) col.Equals("CompanyName", StringComparison.OrdinalIgnoreCase))

                    Dim insertSql As String
                    Dim paramValue As String
                    If hasCompName Then
                        insertSql = "INSERT INTO [Company] ([CompName]) VALUES (?)"
                        paramValue = "Company"
                    ElseIf hasCompanyName Then
                        insertSql = "INSERT INTO [Company] ([CompanyName]) VALUES (?)"
                        paramValue = "Company"
                    Else
                        insertSql = "INSERT INTO [Company] ([" & companyCols(0) & "]) VALUES (?)"
                        paramValue = "Company"
                    End If

                    Using ins As New OleDbCommand(insertSql, dst)
                        ins.Parameters.AddWithValue("@p1", paramValue)
                        ins.ExecuteNonQuery()
                        lg.Info("Đã seed Company với cột: " & If(hasCompName, "CompName", If(hasCompanyName, "CompanyName", companyCols(0))))
                    End Using
                End If
            End Using
        Catch ex As Exception
            lg.Info("Không thể seed Company: " & ex.Message)
        End Try
    End Sub

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
            direction = "PRO_TO_WISE"
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
                    Dim dcols = AccessHelpers.GetColumns(dst, destTable)
                    Dim dschema = AccessHelpers.GetSchemaTable(dst, destTable)
                    Dim sizeMa As Integer = 0, sizeTen As Integer = 0
                    If dschema IsNot Nothing Then
                        For Each r As DataRow In dschema.Rows
                            Dim cn = r("ColumnName").ToString()
                            If String.Equals(cn, "MaPhongBan", StringComparison.OrdinalIgnoreCase) OrElse String.Equals(cn, "DeptCode", StringComparison.OrdinalIgnoreCase) Then
                                If dschema.Columns.Contains("ColumnSize") AndAlso Not IsDBNull(r("ColumnSize")) Then sizeMa = Math.Max(sizeMa, Convert.ToInt32(r("ColumnSize")))
                            End If
                            If String.Equals(cn, "TenPhongBan", StringComparison.OrdinalIgnoreCase) OrElse String.Equals(cn, "Description", StringComparison.OrdinalIgnoreCase) Then
                                If dschema.Columns.Contains("ColumnSize") AndAlso Not IsDBNull(r("ColumnSize")) Then sizeTen = Math.Max(sizeTen, Convert.ToInt32(r("ColumnSize")))
                            End If
                        Next
                    End If
                    Dim codeVal As String = dept.Item1
                    Dim nameVal As String = dept.Item2
                    If sizeMa > 0 AndAlso codeVal IsNot Nothing AndAlso codeVal.Length > sizeMa Then codeVal = codeVal.Substring(0, sizeMa)
                    If sizeTen > 0 AndAlso nameVal IsNot Nothing AndAlso nameVal.Length > sizeTen Then nameVal = nameVal.Substring(0, sizeTen)
                    Dim names As New List(Of String)
                    Dim vals As New List(Of Object)
                    If dcols.Any(Function(c) c.Equals("MaPhongBan", StringComparison.OrdinalIgnoreCase)) Then
                        names.Add("MaPhongBan") : vals.Add(codeVal)
                    Else
                        names.Add("DeptCode") : vals.Add(codeVal)
                    End If
                    If dcols.Any(Function(c) c.Equals("TenPhongBan", StringComparison.OrdinalIgnoreCase)) Then
                        names.Add("TenPhongBan") : vals.Add(nameVal)
                    ElseIf dcols.Any(Function(c) c.Equals("Description", StringComparison.OrdinalIgnoreCase)) Then
                        names.Add("Description") : vals.Add(nameVal)
                    End If
                    Dim sql As String = "INSERT INTO [" & destTable & "] (" & String.Join(",", names.Select(Function(n) "[" & n & "]")) & ") VALUES (" & String.Join(",", Enumerable.Repeat("?", names.Count)) & ")"
                    Using ins As New OleDbCommand(sql, dst)
                        For Each v In vals : ins.Parameters.AddWithValue("@p", v) : Next
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
            Dim rootId As Integer = 0
            Using cmd As New OleDbCommand("SELECT [ID] FROM [" & destTable & "] WHERE [DeptCode] = 'root'", dst)
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    rootId = Convert.ToInt32(result)
                Else
                    Dim destCols = AccessHelpers.GetColumns(dst, destTable)
                    Dim hasLevel = destCols.Any(Function(c) c.Equals("Level", StringComparison.OrdinalIgnoreCase))
                    Dim hasRelationID = destCols.Any(Function(c) c.Equals("RelationID", StringComparison.OrdinalIgnoreCase))
                    Dim hasTempID = destCols.Any(Function(c) c.Equals("TempID", StringComparison.OrdinalIgnoreCase))

                    Dim insertSql As String
                    If hasLevel AndAlso hasRelationID AndAlso hasTempID Then
                        insertSql = "INSERT INTO [" & destTable & "] ([Description], [DeptCode], [Level], [RelationID], [TempID]) VALUES (?, ?, ?, ?, ?)"
                    ElseIf hasLevel AndAlso hasRelationID Then
                        insertSql = "INSERT INTO [" & destTable & "] ([Description], [DeptCode], [Level], [RelationID]) VALUES (?, ?, ?, ?)"
                    Else
                        insertSql = "INSERT INTO [" & destTable & "] ([Description], [DeptCode]) VALUES (?, ?)"
                    End If

                    Using ins As New OleDbCommand(insertSql, dst)
                        ins.Parameters.AddWithValue("@1", "Root")
                        ins.Parameters.AddWithValue("@2", "root")
                        If hasLevel Then ins.Parameters.AddWithValue("@3", 1)
                        If hasRelationID Then ins.Parameters.AddWithValue("@4", 0)
                        If hasTempID Then ins.Parameters.AddWithValue("@5", 0)
                        ins.ExecuteNonQuery()
                    End Using
                    Using cmd2 As New OleDbCommand("SELECT @@IDENTITY", dst)
                        rootId = Convert.ToInt32(cmd2.ExecuteScalar())
                    End Using
                    inserted += 1
                End If
            End Using

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

            Dim isStr As Boolean = False, isNum As Boolean = False, isDt As Boolean = False, isBool As Boolean = False
            Try
                Select Case CType(provType, OleDbType)
                    Case OleDbType.VarChar, OleDbType.VarWChar, OleDbType.WChar, OleDbType.LongVarChar, OleDbType.LongVarWChar, OleDbType.Char
                        isStr = True
                    Case OleDbType.SmallInt, OleDbType.Integer, OleDbType.BigInt, OleDbType.UnsignedTinyInt, OleDbType.Numeric, OleDbType.Decimal, OleDbType.Double, OleDbType.Single
                        isNum = True
                    Case OleDbType.DBDate, OleDbType.Date, OleDbType.DBTime, OleDbType.DBTimeStamp
                        isDt = True
                    Case OleDbType.Boolean
                        isBool = True
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
                    .IsBoolean = isBool,
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
        If Not ReferenceEquals(progressCb, Nothing) AndAlso totalTables > 0 Then progressCb.Invoke(CInt((tableIndex * 100.0) / Math.Max(1, totalTables)), "Đang xử lý bảng: [" & destTable & "]")

        Dim srcTable = ResolveSourceTable(src, dst, destTable, lg)
        If String.IsNullOrEmpty(srcTable) Then
            lg.Info("  ✗ Không tìm thấy nguồn")
            Return Tuple.Create(0, "Không tìm thấy nguồn", False)
        End If

        ' ===== XỬ LÝ ĐẶC BIỆT: PHÒNG BAN =====
        If direction.Contains("TO_PRO") AndAlso (destTable.Equals("PHONGBAN", StringComparison.OrdinalIgnoreCase)) Then
            If dryRun Then Return Tuple.Create(0, "", False)
            Dim ins = CopyRelationDept_ToPro(src, dst, srcTable, destTable, lg)
            Return Tuple.Create(ins, "", False)
        End If

        If direction.Contains("TO_WISE") AndAlso (destTable.Equals("RelationDept", StringComparison.OrdinalIgnoreCase)) Then
            If dryRun Then Return Tuple.Create(0, "", False)
            Dim ins = CopyPhongBan_ToWise(src, dst, srcTable, destTable, lg)
            Return Tuple.Create(ins, "", False)
        End If

        ' ===== XỬ LÝ FACE (chỉ khi nguồn có) =====
        If destTable.Equals("Face", StringComparison.OrdinalIgnoreCase) OrElse destTable.Equals("Faces", StringComparison.OrdinalIgnoreCase) Then
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
        Dim batchSize As Integer = If(totalRows > 50000, 1000, If(totalRows > 10000, 2500, 5000))
        Dim selectList = JoinCols(map, 1)
        Dim insertCols = JoinCols(map, 2)
        Dim paramList = JoinParams(map.Count)

        lg.Info("  Batch size: " & batchSize.ToString() & " (tối ưu cho " & totalRows.ToString() & " bản ghi)")

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
                                Dim outVal As Object = val

                                If val Is Nothing OrElse val Is DBNull.Value Then
                                    If Not map(i).IsNullable Then
                                        If map(i).IsString Then
                                            outVal = ""
                                        ElseIf map(i).IsNumeric Then
                                            outVal = 0
                                        ElseIf map(i).IsDate Then
                                            outVal = New DateTime(1900, 1, 1)
                                        ElseIf map(i).IsBoolean Then
                                            outVal = False
                                        Else
                                            outVal = DBNull.Value
                                        End If
                                    Else
                                        outVal = DBNull.Value
                                    End If
                                Else
                                    Try
                                        If map(i).IsString Then
                                            Dim s As String = Convert.ToString(val)
                                            If map(i).DestMaxLen > 0 AndAlso s IsNot Nothing AndAlso s.Length > map(i).DestMaxLen Then
                                                s = s.Substring(0, map(i).DestMaxLen)
                                            End If
                                            outVal = s
                                        ElseIf map(i).IsNumeric Then
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
                                        ElseIf map(i).IsBoolean Then
                                            ' Convert String/Number → Boolean
                                            Dim boolVal As Boolean = False
                                            If TypeOf val Is Boolean Then
                                                boolVal = CBool(val)
                                            ElseIf TypeOf val Is String Then
                                                Dim strVal = val.ToString().Trim().ToLowerInvariant()
                                                If strVal = "true" OrElse strVal = "1" OrElse strVal = "-1" OrElse strVal = "yes" Then
                                                    boolVal = True
                                                End If
                                            ElseIf IsNumeric(val) Then
                                                boolVal = (Convert.ToInt32(val) <> 0)
                                            End If
                                            outVal = boolVal
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
                                        ElseIf map(i).IsBoolean Then
                                            outVal = If(map(i).IsNullable, DBNull.Value, CObj(False))
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
                                    lg.Info("      ⚠ Lỗi insert bản ghi " & processed.ToString() & ": " & ex.Message)
                                    If processed <= 5 Then
                                        Throw
                                    End If
                                End If
                            End Try

                            processed += 1

                            Dim stepN As Integer = Math.Max(1, totalRows \ 50)
                            If (processed Mod stepN = 0) OrElse processed = totalRows Then
                                Dim pct As Integer = CInt(Math.Round(processed * 100.0 / Math.Max(1, totalRows)))
                                progressCb?.Invoke(pct, "Đang chạy [" & destTable & "]... " & processed.ToString() & "/" & totalRows.ToString())
                            End If

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

    ' CHUẨN HÓA CHO PRO - FIX: Map MaPhongBan từ UserIDC
    Private Sub NormalizeForPro(dst As OleDbConnection, lg As LogVN)
        Try
            lg.Info("  → Fix nulls...")
            FixNullStrings(dst, "NHANVIEN", "MaChamCong", "TenNhanVien", "MaThe")

            lg.Info("  → Map MaPhongBan từ UserIDC...")

            ' Đọc map: ID → MaPhongBan từ PHONGBAN
            Dim deptMap As New Dictionary(Of String, String)(StringComparer.OrdinalIgnoreCase)
            Try
                Using cmd As New OleDbCommand("SELECT [MaPhongBan] FROM [PHONGBAN] WHERE [MaPhongBan] IS NOT NULL ORDER BY [MaPhongBan]", dst)
                    Using rdr = cmd.ExecuteReader()
                        Dim idx As Integer = 1
                        While rdr.Read()
                            If Not IsDBNull(rdr(0)) Then
                                Dim code = rdr(0).ToString().Trim()
                                If Not String.IsNullOrEmpty(code) Then
                                    ' Map theo thứ tự: 1→danghiv, 2→NNN, 5→Vanphon, 14→Tapvu, 15→Xuong
                                    deptMap(idx.ToString()) = code
                                    idx += 1
                                End If
                            End If
                        End While
                    End Using
                End Using
                lg.Info("    → Đọc được " & deptMap.Count.ToString() & " phòng ban")
            Catch ex As Exception
                lg.Info("    ⚠ Không đọc được PHONGBAN: " & ex.Message)
            End Try

            ' Nếu không có phòng ban, dùng default
            Dim defaultDept As String = If(deptMap.Count > 0, deptMap.Values.First(), "danghiv")

            ' Update MaPhongBan: convert từ ID (number as text) sang Text
            Dim updated As Integer = 0
            Dim failCount As Integer = 0

            Try
                ' Đọc danh sách nhân viên với MaPhongBan hiện tại
                Dim userList As New List(Of Tuple(Of String, String))
                Using cmd As New OleDbCommand("SELECT [MaChamCong], [MaPhongBan] FROM [NHANVIEN]", dst)
                    Using rdr = cmd.ExecuteReader()
                        While rdr.Read()
                            Dim mcc = If(IsDBNull(rdr(0)), "", rdr(0).ToString().Trim())
                            Dim mpb = If(IsDBNull(rdr(1)), "", rdr(1).ToString().Trim())
                            If Not String.IsNullOrEmpty(mcc) Then
                                userList.Add(Tuple.Create(mcc, mpb))
                            End If
                        End While
                    End Using
                End Using

                lg.Info("    → Đọc được " & userList.Count.ToString() & " nhân viên")

                ' Update từng nhân viên
                For Each user In userList
                    Dim newDept As String = defaultDept

                    ' Nếu MaPhongBan là số (1, 2, 14...), convert sang text
                    If deptMap.ContainsKey(user.Item2) Then
                        newDept = deptMap(user.Item2)

                        Try
                            Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [MaPhongBan] = ? WHERE [MaChamCong] = ?", dst)
                                cmd.Parameters.AddWithValue("@1", newDept)
                                cmd.Parameters.AddWithValue("@2", user.Item1)
                                If cmd.ExecuteNonQuery() > 0 Then updated += 1
                            End Using
                        Catch ex As Exception
                            failCount += 1
                            If failCount <= 3 Then lg.Info("    ⚠ Lỗi update MaPhongBan cho " & user.Item1 & ": " & ex.Message)
                        End Try
                    ElseIf String.IsNullOrEmpty(user.Item2) OrElse user.Item2 = "0" Then
                        ' NULL hoặc 0 → gán default
                        Try
                            Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [MaPhongBan] = ? WHERE [MaChamCong] = ?", dst)
                                cmd.Parameters.AddWithValue("@1", newDept)
                                cmd.Parameters.AddWithValue("@2", user.Item1)
                                If cmd.ExecuteNonQuery() > 0 Then updated += 1
                            End Using
                        Catch ex As Exception
                            failCount += 1
                        End Try
                    End If
                Next

                If updated > 0 Then lg.Info("    → Đã map " & updated.ToString() & " nhân viên vào phòng ban")

            Catch ex As Exception
                lg.Info("    ⚠ Lỗi update MaPhongBan: " & ex.Message)
            End Try

            ' Kích hoạt nhân viên - Xử lý cả Text và Number
            Try
                Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [UserEnable] = -1 WHERE [UserEnable] IS NULL OR [UserEnable] = 0", dst)
                    Dim affected = cmd.ExecuteNonQuery()
                    If affected > 0 Then lg.Info("    → Kích hoạt " & affected.ToString() & " nhân viên")
                End Using
            Catch ex As Exception
                Try
                    Using cmd As New OleDbCommand("UPDATE [NHANVIEN] SET [UserEnable] = '-1' WHERE [UserEnable] IS NULL OR [UserEnable] = '' OR [UserEnable] = '0'", dst)
                        Dim affected = cmd.ExecuteNonQuery()
                        If affected > 0 Then lg.Info("    → Kích hoạt " & affected.ToString() & " nhân viên (text mode)")
                    End Using
                Catch ex2 As Exception
                    lg.Info("    ⚠ Không update được UserEnable: " & ex2.Message)
                End Try
            End Try

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
        progressCb?.Invoke(0, "Bắt đầu chuyển dữ liệu...")

        outDestWork = PrepareDestFromTemplate(destTemplate, outFolder)
        lg.Info("✓ File đích: " & outDestWork)
        lg.Info("")

        Using src = AccessHelpers.OpenOleDb(sourceMdb, overridePass)
            Using dst = AccessHelpers.OpenOleDb(outDestWork)

                Dim direction = DetectDirection(src, dst, lg)
                lg.Info("")

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

                        ' ✅ SỬA LỖI: Bảng có 0 bản ghi KHÔNG phải là lỗi nếu không có thông báo lỗi
                        ' Success nếu: có bản ghi HOẶC (0 bản ghi + không có lỗi)
                        If res.Item1 > 0 OrElse (res.Item1 = 0 AndAlso String.IsNullOrEmpty(res.Item2)) Then
                            okList.Add("✓ " & t & ": " & res.Item1.ToString())
                        Else
                            ' Chỉ fail khi có thông báo lỗi thực sự
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

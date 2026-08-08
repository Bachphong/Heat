# Fix Summary: WISE_TO_WISE Migration Error

## Problem
When migrating from WISE to WISE (same format), the application was incorrectly using the `CopyPhongBan_ToWise` function for the `RelationDept` table. This function expects PRO format data (columns: `MaPhongBan`, `TenPhongBan`) but was receiving WISE format data (columns: `DeptCode`, `Description`), causing the error:

```
✗ LỖI: No value given for one or more required parameters.
```

## Root Cause
The condition in `CopyOneTable` function was:

```vb
If direction.Contains("TO_WISE") AndAlso (destTable.Equals("RelationDept", ...)) Then
    Dim ins = CopyPhongBan_ToWise(src, dst, srcTable, destTable, lg)
```

This triggered for **any** direction containing "TO_WISE", including:
- ✅ PRO_TO_WISE (correct - but not supported)
- ✅ PRO_TO_MIX (if it existed)
- ❌ **WISE_TO_WISE** (incorrect - both source and dest are WISE format!)
- ❌ **MIX_TO_WISE** (incorrect - both use same RelationDept structure!)

## Solution
Changed the conditions to be **exact matches** for cross-format conversions only:

### Before (Lines 406-416):
```vb
' ===== XỬ LÝ ĐẶC BIỆT: PHÒNG BAN =====
If direction.Contains("TO_PRO") AndAlso (destTable.Equals("PHONGBAN", ...)) Then
    Dim ins = CopyRelationDept_ToPro(src, dst, srcTable, destTable, lg)
    Return Tuple.Create(ins, "", False)
End If

If direction.Contains("TO_WISE") AndAlso (destTable.Equals("RelationDept", ...)) Then
    Dim ins = CopyPhongBan_ToWise(src, dst, srcTable, destTable, lg)
    Return Tuple.Create(ins, "", False)
End If
```

### After (Lines 406-421):
```vb
' ===== XỬ LÝ ĐẶC BIỆT: PHÒNG BAN (chỉ khi chuyển đổi giữa các định dạng khác nhau) =====
' Chuyển từ WISE/MIX sang PRO: RelationDept → PHONGBAN
If (direction = "WISE_TO_PRO" OrElse direction = "MIX_TO_PRO") AndAlso (destTable.Equals("PHONGBAN", ...)) Then
    Dim ins = CopyRelationDept_ToPro(src, dst, srcTable, destTable, lg)
    Return Tuple.Create(ins, "", False)
End If

' Chuyển từ PRO sang WISE/MIX: PHONGBAN → RelationDept (hiện không hỗ trợ PRO_TO_WISE)
If direction = "PRO_TO_MIX" AndAlso (destTable.Equals("RelationDept", ...)) Then
    Dim ins = CopyPhongBan_ToWise(src, dst, srcTable, destTable, lg)
    Return Tuple.Create(ins, "", False)
End If
```

## Impact
Now the special conversion functions are only used when **actually converting between different formats**:

| Direction | RelationDept Table | PHONGBAN Table | Behavior |
|-----------|-------------------|----------------|----------|
| WISE_TO_WISE | ✅ Normal column mapping | N/A | ✅ Fixed |
| MIX_TO_WISE | ✅ Normal column mapping | N/A | ✅ Works |
| WISE_TO_PRO | N/A | ✅ Special conversion | ✅ Works |
| MIX_TO_PRO | N/A | ✅ Special conversion | ✅ Works |
| PRO_TO_MIX | ✅ Special conversion | N/A | ✅ Works |

## Testing
The fix should resolve the error when running WISE_TO_WISE migrations. The RelationDept table will now be copied using normal column mapping (direct copy of matching columns).

## Files Changed
- `SmartMigrator.vb` - Lines 406-421 (CopyOneTable function)

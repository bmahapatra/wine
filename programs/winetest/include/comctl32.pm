package comctl32;

use strict;

require Exporter;

use wine;
use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA = qw(Exporter);
@EXPORT = qw();
@EXPORT_OK = qw();

my $module_declarations = {
    "MenuHelp" => ["void",  ["long", "long", "long", "long", "long", "long", "ptr"]],
    "ShowHideMenuCtl" => ["long",  ["long", "long", "ptr"]],
    "GetEffectiveClientRect" => ["void",  ["long", "ptr", "ptr"]],
    "DrawStatusTextA" => ["void",  ["long", "ptr", "str", "long"]],
    "CreateStatusWindowA" => ["long",  ["long", "str", "long", "long"]],
    "CreateToolbar" => ["long",  ["long", "long", "long", "long", "long", "long", "ptr", "long"]],
    "CreateMappedBitmap" => ["long",  ["long", "long", "long", "ptr", "long"]],
    "DPA_LoadStream" => ["long",  ["ptr", "ptr", "ptr", "long"]],
    "DPA_SaveStream" => ["long",  ["long", "ptr", "ptr", "long"]],
    "DPA_Merge" => ["long",  ["long", "long", "long", "ptr", "ptr", "long"]],
    "MakeDragList" => ["long",  ["long"]],
    "LBItemFromPt" => ["long",  ["long", "long", "long", "long"]],
    "DrawInsert" => ["void",  ["long", "long", "long"]],
    "CreateUpDownControl" => ["long",  ["long", "long", "long", "long", "long", "long", "long", "long", "long", "long", "long", "long"]],
    "InitCommonControls" => ["void",  []],
    "Alloc" => ["ptr",  ["long"]],
    "ReAlloc" => ["ptr",  ["ptr", "long"]],
    "Free" => ["long",  ["ptr"]],
    "GetSize" => ["long",  ["ptr"]],
    "CreateMRUListA" => ["long",  ["ptr"]],
    "FreeMRUList" => ["long",  ["long"]],
    "AddMRUStringA" => ["long",  ["long", "str"]],
    "EnumMRUListA" => ["long",  ["long", "long", "ptr", "long"]],
    "FindMRUStringA" => ["long",  ["long", "str", "ptr"]],
    "DelMRUString" => ["long",  ["long", "long"]],
    "CreateMRUListLazyA" => ["long",  ["ptr", "long", "long", "long"]],
    "AddMRUData" => ["long",  ["long", "ptr", "long"]],
    "FindMRUData" => ["long",  ["long", "ptr", "long", "ptr"]],
    "Str_GetPtrA" => ["long",  ["str", "str", "long"]],
    "Str_SetPtrA" => ["long",  ["ptr", "str"]],
    "Str_GetPtrW" => ["long",  ["wstr", "wstr", "long"]],
    "Str_SetPtrW" => ["long",  ["ptr", "wstr"]],
    "DSA_Create" => ["long",  ["long", "long"]],
    "DSA_Destroy" => ["long",  ["long"]],
    "DSA_GetItem" => ["long",  ["long", "long", "ptr"]],
    "DSA_GetItemPtr" => ["ptr",  ["long", "long"]],
    "DSA_InsertItem" => ["long",  ["long", "long", "ptr"]],
    "DSA_SetItem" => ["long",  ["long", "long", "ptr"]],
    "DSA_DeleteItem" => ["long",  ["long", "long"]],
    "DSA_DeleteAllItems" => ["long",  ["long"]],
    "DPA_Create" => ["long",  ["long"]],
    "DPA_Destroy" => ["long",  ["long"]],
    "DPA_Grow" => ["long",  ["long", "long"]],
    "DPA_Clone" => ["long",  ["long", "long"]],
    "DPA_GetPtr" => ["ptr",  ["long", "long"]],
    "DPA_GetPtrIndex" => ["long",  ["long", "ptr"]],
    "DPA_InsertPtr" => ["long",  ["long", "long", "ptr"]],
    "DPA_SetPtr" => ["long",  ["long", "long", "ptr"]],
    "DPA_DeletePtr" => ["ptr",  ["long", "long"]],
    "DPA_DeleteAllPtrs" => ["long",  ["long"]],
    "DPA_Sort" => ["long",  ["long", "ptr", "long"]],
    "DPA_Search" => ["long",  ["long", "ptr", "long", "ptr", "long", "long"]],
    "DPA_CreateEx" => ["long",  ["long", "long"]],
    "SendNotify" => ["long",  ["long", "long", "long", "ptr"]],
    "SendNotifyEx" => ["long",  ["long", "long", "long", "ptr", "long"]],
    "StrChrA" => ["str",  ["str", "long"]],
    "StrRChrA" => ["str",  ["str", "str", "long"]],
    "StrCmpNA" => ["long",  ["str", "str", "long"]],
    "StrCmpNIA" => ["long",  ["str", "str", "long"]],
    "StrStrA" => ["str",  ["str", "str"]],
    "StrStrIA" => ["str",  ["str", "str"]],
    "StrCSpnA" => ["long",  ["str", "str"]],
    "StrToIntA" => ["long",  ["str"]],
    "StrChrW" => ["wstr",  ["wstr", "long"]],
    "StrRChrW" => ["wstr",  ["wstr", "wstr", "long"]],
    "StrCmpNW" => ["long",  ["wstr", "wstr", "long"]],
    "StrCmpNIW" => ["long",  ["wstr", "wstr", "long"]],
    "StrStrW" => ["wstr",  ["wstr", "wstr"]],
    "StrSpnW" => ["long",  ["wstr", "wstr"]],
    "StrToIntW" => ["long",  ["wstr"]],
    "SmoothScrollWindow" => ["long",  ["ptr"]],
    "DPA_EnumCallback" => ["void",  ["long", "ptr", "long"]],
    "DPA_DestroyCallback" => ["long",  ["long", "ptr", "long"]],
    "DSA_EnumCallback" => ["void",  ["long", "ptr", "long"]],
    "DSA_DestroyCallback" => ["long",  ["long", "ptr", "long"]],
    "CreateMRUListW" => ["long",  ["ptr"]],
    "AddMRUStringW" => ["long",  ["long", "wstr"]],
    "FindMRUStringW" => ["long",  ["long", "wstr", "ptr"]],
    "EnumMRUListW" => ["long",  ["long", "long", "ptr", "long"]],
    "CreateMRUListLazyW" => ["long",  ["ptr", "long", "long", "long"]],
    "CreatePropertySheetPage" => ["long",  ["ptr"]],
    "CreatePropertySheetPageA" => ["long",  ["ptr"]],
    "CreatePropertySheetPageW" => ["long",  ["ptr"]],
    "CreateStatusWindow" => ["long",  ["long", "str", "long", "long"]],
    "CreateStatusWindowW" => ["long",  ["long", "wstr", "long", "long"]],
    "CreateToolbarEx" => ["long",  ["long", "long", "long", "long", "long", "long", "ptr", "long", "long", "long", "long", "long", "long"]],
    "DestroyPropertySheetPage" => ["long",  ["long"]],
    "DllGetVersion" => ["long",  ["ptr"]],
    "DllInstall" => ["long",  ["long", "wstr"]],
    "DrawStatusText" => ["void",  ["long", "ptr", "str", "long"]],
    "DrawStatusTextW" => ["void",  ["long", "ptr", "wstr", "long"]],
    "FlatSB_EnableScrollBar" => ["long",  ["long", "long", "long"]],
    "FlatSB_GetScrollInfo" => ["long",  ["long", "long", "ptr"]],
    "FlatSB_GetScrollPos" => ["long",  ["long", "long"]],
    "FlatSB_GetScrollProp" => ["long",  ["long", "long", "ptr"]],
    "FlatSB_GetScrollRange" => ["long",  ["long", "long", "ptr", "ptr"]],
    "FlatSB_SetScrollInfo" => ["long",  ["long", "long", "ptr", "long"]],
    "FlatSB_SetScrollPos" => ["long",  ["long", "long", "long", "long"]],
    "FlatSB_SetScrollProp" => ["long",  ["long", "long", "long", "long"]],
    "FlatSB_ShowScrollBar" => ["long",  ["long", "long", "long"]],
    "GetMUILanguage" => ["long",  []],
    "ImageList_Add" => ["long",  ["long", "long", "long"]],
    "ImageList_AddIcon" => ["long",  ["long", "long"]],
    "ImageList_AddMasked" => ["long",  ["long", "long", "long"]],
    "ImageList_BeginDrag" => ["long",  ["long", "long", "long", "long"]],
    "ImageList_Copy" => ["long",  ["long", "long", "long", "long", "long"]],
    "ImageList_Create" => ["long",  ["long", "long", "long", "long", "long"]],
    "ImageList_Destroy" => ["long",  ["long"]],
    "ImageList_DragEnter" => ["long",  ["long", "long", "long"]],
    "ImageList_DragLeave" => ["long",  ["long"]],
    "ImageList_DragMove" => ["long",  ["long", "long"]],
    "ImageList_DragShowNolock" => ["long",  ["long"]],
    "ImageList_Draw" => ["long",  ["long", "long", "long", "long", "long", "long"]],
    "ImageList_DrawEx" => ["long",  ["long", "long", "long", "long", "long", "long", "long", "long", "long", "long"]],
    "ImageList_DrawIndirect" => ["long",  ["ptr"]],
    "ImageList_Duplicate" => ["long",  ["long"]],
    "ImageList_EndDrag" => ["long",  []],
    "ImageList_GetBkColor" => ["long",  ["long"]],
    "ImageList_GetDragImage" => ["long",  ["ptr", "ptr"]],
    "ImageList_GetFlags" => ["long",  ["long"]],
    "ImageList_GetIcon" => ["long",  ["long", "long", "long"]],
    "ImageList_GetIconSize" => ["long",  ["long", "ptr", "ptr"]],
    "ImageList_GetImageCount" => ["long",  ["long"]],
    "ImageList_GetImageInfo" => ["long",  ["long", "long", "ptr"]],
    "ImageList_GetImageRect" => ["long",  ["long", "long", "ptr"]],
    "ImageList_LoadImage" => ["long",  ["long", "str", "long", "long", "long", "long", "long"]],
    "ImageList_LoadImageA" => ["long",  ["long", "str", "long", "long", "long", "long", "long"]],
    "ImageList_LoadImageW" => ["long",  ["long", "wstr", "long", "long", "long", "long", "long"]],
    "ImageList_Merge" => ["long",  ["long", "long", "long", "long", "long", "long"]],
    "ImageList_Read" => ["long",  ["ptr"]],
    "ImageList_Remove" => ["long",  ["long", "long"]],
    "ImageList_Replace" => ["long",  ["long", "long", "long", "long"]],
    "ImageList_ReplaceIcon" => ["long",  ["long", "long", "long"]],
    "ImageList_SetBkColor" => ["long",  ["long", "long"]],
    "ImageList_SetDragCursorImage" => ["long",  ["long", "long", "long", "long"]],
    "ImageList_SetFilter" => ["long",  ["long", "long", "long"]],
    "ImageList_SetFlags" => ["long",  ["long", "long"]],
    "ImageList_SetIconSize" => ["long",  ["long", "long", "long"]],
    "ImageList_SetImageCount" => ["long",  ["long", "long"]],
    "ImageList_SetOverlayImage" => ["long",  ["long", "long", "long"]],
    "ImageList_Write" => ["long",  ["long", "ptr"]],
    "InitCommonControlsEx" => ["long",  ["ptr"]],
    "InitMUILanguage" => ["void",  ["long"]],
    "InitializeFlatSB" => ["long",  ["long"]],
    "PropertySheet" => ["long",  ["ptr"]],
    "PropertySheetA" => ["long",  ["ptr"]],
    "PropertySheetW" => ["long",  ["ptr"]],
    "UninitializeFlatSB" => ["long",  ["long"]],
    "_TrackMouseEvent" => ["long",  ["ptr"]]
};

&wine::declare("comctl32",%$module_declarations);
push @EXPORT, map { "&" . $_; } sort(keys(%$module_declarations));
1;

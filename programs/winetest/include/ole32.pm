package ole32;

use strict;

require Exporter;

use wine;
use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA = qw(Exporter);
@EXPORT = qw();
@EXPORT_OK = qw();

my $module_declarations = {
    "CLSIDFromProgID" => ["long",  ["str", "ptr"]],
    "CLSIDFromString" => ["long",  ["str", "ptr"]],
    "CoBuildVersion" => ["long",  []],
    "CoCreateFreeThreadedMarshaler" => ["long",  ["ptr", "ptr"]],
    "CoCreateGuid" => ["long",  ["ptr"]],
    "CoCreateInstance" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr"]],
    "CoDisconnectObject" => ["long",  ["ptr", "long"]],
    "CoFileTimeNow" => ["long",  ["ptr"]],
    "CoFreeAllLibraries" => ["void",  []],
    "CoFreeLibrary" => ["void",  ["long"]],
    "CoFreeUnusedLibraries" => ["void",  []],
    "CoGetClassObject" => ["long",  ["ptr", "long", "ptr", "ptr", "ptr"]],
    "CoGetCurrentProcess" => ["long",  []],
    "CoGetMalloc" => ["long",  ["long", "ptr"]],
    "CoGetMarshalSizeMax" => ["long",  ["ptr", "ptr", "ptr", "long", "ptr", "long"]],
    "CoGetPSClsid" => ["long",  ["ptr", "ptr"]],
    "CoGetStandardMarshal" => ["long",  ["ptr", "ptr", "long", "ptr", "long", "ptr"]],
    "CoGetState" => ["long",  ["ptr"]],
    "CoInitialize" => ["long",  ["ptr"]],
    "CoInitializeWOW" => ["long",  ["long", "long"]],
    "CoIsOle1Class" => ["long",  ["ptr"]],
    "CoLoadLibrary" => ["long",  ["str", "long"]],
    "CoLockObjectExternal" => ["long",  ["ptr", "long", "long"]],
    "CoMarshalInterThreadInterfaceInStream" => ["long",  ["ptr", "ptr", "ptr"]],
    "CoMarshalInterface" => ["long",  ["ptr", "ptr", "ptr", "long", "ptr", "long"]],
    "CoRegisterClassObject" => ["long",  ["ptr", "ptr", "long", "long", "ptr"]],
    "CoRegisterMallocSpy" => ["long",  ["ptr"]],
    "CoRegisterMessageFilter" => ["long",  ["ptr", "ptr"]],
    "CoRevokeClassObject" => ["long",  ["long"]],
    "CoRevokeMallocSpy" => ["long",  []],
    "CoSetState" => ["long",  ["ptr"]],
    "CoTaskMemAlloc" => ["ptr",  ["long"]],
    "CoTaskMemFree" => ["void",  ["ptr"]],
    "CoTaskMemRealloc" => ["ptr",  ["ptr", "long"]],
    "CoTreatAsClass" => ["long",  ["ptr", "ptr"]],
    "CoUninitialize" => ["void",  []],
    "CoUnmarshalInterface" => ["long",  ["ptr", "ptr", "ptr"]],
    "CreateAntiMoniker" => ["long",  ["ptr"]],
    "CreateBindCtx" => ["long",  ["long", "ptr"]],
    "CreateDataAdviseHolder" => ["long",  ["ptr"]],
    "CreateDataCache" => ["long",  ["ptr", "ptr", "ptr", "ptr"]],
    "CreateFileMoniker" => ["long",  ["str", "ptr"]],
    "CreateGenericComposite" => ["long",  ["ptr", "ptr", "ptr"]],
    "CreateILockBytesOnHGlobal" => ["long",  ["long", "long", "ptr"]],
    "CreateItemMoniker" => ["long",  ["str", "str", "ptr"]],
    "CreateOleAdviseHolder" => ["long",  ["ptr"]],
    "CreateStreamOnHGlobal" => ["long",  ["long", "long", "ptr"]],
    "DllDebugObjectRPCHook" => ["long",  ["long", "ptr"]],
    "DllGetClassObject" => ["long",  ["ptr", "ptr", "ptr"]],
    "DoDragDrop" => ["long",  ["ptr", "ptr", "long", "ptr"]],
    "GetClassFile" => ["long",  ["str", "ptr"]],
    "GetConvertStg" => ["long",  ["ptr"]],
    "GetHGlobalFromILockBytes" => ["long",  ["ptr", "ptr"]],
    "GetHGlobalFromStream" => ["long",  ["ptr", "ptr"]],
    "GetRunningObjectTable" => ["long",  ["long", "ptr"]],
    "IIDFromString" => ["long",  ["str", "ptr"]],
    "IsAccelerator" => ["long",  ["long", "long", "ptr", "ptr"]],
    "IsEqualGUID" => ["long",  ["ptr", "ptr"]],
    "IsValidInterface" => ["long",  ["ptr"]],
    "MkParseDisplayName" => ["long",  ["ptr", "str", "ptr", "ptr"]],
    "MonikerCommonPrefixWith" => ["long",  ["ptr", "ptr", "ptr"]],
    "OleBuildVersion" => ["long",  []],
    "OleConvertIStorageToOLESTREAM" => ["long",  ["ptr", "ptr"]],
    "OleConvertOLESTREAMToIStorage" => ["long",  ["ptr", "ptr", "ptr"]],
    "OleCreate" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateDefaultHandler" => ["long",  ["ptr", "ptr", "ptr", "ptr"]],
    "OleCreateFromData" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateFromFile" => ["long",  ["ptr", "str", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateLink" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateLinkFromData" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateLinkToFile" => ["long",  ["str", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleCreateMenuDescriptor" => ["long",  ["long", "ptr"]],
    "OleCreateStaticFromData" => ["long",  ["ptr", "ptr", "long", "ptr", "ptr", "ptr", "ptr"]],
    "OleDestroyMenuDescriptor" => ["long",  ["long"]],
    "OleDuplicateData" => ["long",  ["long", "long", "long"]],
    "OleFlushClipboard" => ["long",  ["undef"]],
    "OleGetAutoConvert" => ["long",  ["ptr", "ptr"]],
    "OleGetClipboard" => ["long",  ["ptr"]],
    "OleGetIconOfClass" => ["long",  ["ptr", "str", "long"]],
    "OleInitialize" => ["long",  ["ptr"]],
    "OleInitializeWOW" => ["long",  ["long"]],
    "OleIsCurrentClipboard" => ["long",  ["ptr"]],
    "OleIsRunning" => ["long",  ["ptr"]],
    "OleLoad" => ["long",  ["ptr", "ptr", "ptr", "ptr"]],
    "OleLoadFromStream" => ["long",  ["ptr", "ptr", "ptr"]],
    "OleLockRunning" => ["long",  ["ptr", "long", "long"]],
    "OleQueryCreateFromData" => ["long",  ["ptr"]],
    "OleQueryLinkFromData" => ["long",  ["ptr"]],
    "OleRegEnumFormatEtc" => ["long",  ["ptr", "long", "ptr"]],
    "OleRegEnumVerbs" => ["long",  ["ptr", "ptr"]],
    "OleRegGetMiscStatus" => ["long",  ["ptr", "long", "ptr"]],
    "OleRegGetUserType" => ["long",  ["ptr", "long", "ptr"]],
    "OleRun" => ["long",  ["ptr"]],
    "OleSave" => ["long",  ["ptr", "ptr", "long"]],
    "OleSaveToStream" => ["long",  ["ptr", "ptr"]],
    "OleSetAutoConvert" => ["long",  ["ptr", "ptr"]],
    "OleSetClipboard" => ["long",  ["ptr"]],
    "OleSetContainedObject" => ["long",  ["ptr", "long"]],
    "OleSetMenuDescriptor" => ["long",  ["long", "long", "long", "ptr", "ptr"]],
    "OleTranslateAccelerator" => ["long",  ["ptr", "ptr", "ptr"]],
    "OleUninitialize" => ["void",  []],
    "ProgIDFromCLSID" => ["long",  ["ptr", "ptr"]],
    "ReadClassStg" => ["long",  ["ptr", "ptr"]],
    "ReadClassStm" => ["long",  ["ptr", "ptr"]],
    "ReadFmtUserTypeStg" => ["long",  ["ptr", "ptr", "ptr"]],
    "RegisterDragDrop" => ["long",  ["long", "ptr"]],
    "ReleaseStgMedium" => ["void",  ["ptr"]],
    "RevokeDragDrop" => ["long",  ["long"]],
    "SetConvertStg" => ["long",  ["ptr", "long"]],
    "StgCreateDocfile" => ["long",  ["str", "long", "long", "ptr"]],
    "StgCreateDocfileOnILockBytes" => ["long",  ["ptr", "long", "long", "ptr"]],
    "StgIsStorageFile" => ["long",  ["str"]],
    "StgIsStorageILockBytes" => ["long",  ["ptr"]],
    "StgOpenStorage" => ["long",  ["ptr", "ptr", "long", "ptr", "long", "ptr"]],
    "StgOpenStorageOnILockBytes" => ["long",  ["ptr", "ptr", "long", "ptr", "long", "ptr"]],
    "StgSetTimes" => ["long",  ["ptr", "ptr", "ptr", "ptr"]],
    "StringFromCLSID" => ["long",  ["ptr", "ptr"]],
    "StringFromGUID2" => ["long",  ["ptr", "str", "long"]],
    "StringFromIID" => ["long",  ["ptr", "ptr"]],
    "WriteClassStg" => ["long",  ["ptr", "ptr"]],
    "WriteClassStm" => ["long",  ["ptr", "ptr"]],
    "WriteFmtUserTypeStg" => ["long",  ["ptr", "long", "str"]],
    "CoInitializeEx" => ["long",  ["ptr", "long"]],
    "CoInitializeSecurity" => ["long",  ["ptr", "long", "ptr", "ptr", "long", "long", "ptr", "long", "ptr"]],
    "CoCreateInstanceEx" => ["long",  ["ptr", "ptr", "long", "ptr", "long", "ptr"]],
    "PropVariantClear" => ["long",  ["ptr"]],
    "CoResumeClassObjects" => ["long",  []],
    "CreateErrorInfo" => ["long",  ["ptr"]],
    "DllRegisterServer" => ["long",  ["undef"]],
    "FreePropVariantArray" => ["long",  ["long", "ptr"]],
    "GetErrorInfo" => ["long",  ["long", "ptr"]],
    "PropVariantCopy" => ["long",  ["ptr", "ptr"]],
    "SetErrorInfo" => ["long",  ["long", "ptr"]],
    "DllEntryPoint" => ["long",  ["long", "long", "ptr"]]
};

&wine::declare("ole32",%$module_declarations);
push @EXPORT, map { "&" . $_; } sort(keys(%$module_declarations));
1;

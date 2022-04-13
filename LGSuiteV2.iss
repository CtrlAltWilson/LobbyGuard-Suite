; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LobbyGuard Suite"
#define MyAppVersion "1.2"
#define MyAppPublisher "Raptor Technologies, LLC"
#define MyAppURL "www.LobbyGuard.com"
#define MyAppExeName "MyProg.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{79B03120-B3F0-46D5-B512-7055C3406C97}
AppName=LobbyGuard Suite
AppVersion=1.2
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher=Raptor Technologies, LLC
AppPublisherURL=www.LobbyGuard.com
AppSupportURL=www.RaptorTech.com
AppUpdatesURL=www.RaptorTech.com
CreateAppDir=no
ChangesAssociations=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=LobbyGuard Suite
SetupIconFile=...\Wilson\LobbyGuardSuite\NP8XGScr_400x400.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableWelcomePage=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
WelcomeLabel2= This will install [name] on your computer.%n%nIt is recommended to have the printer and scanner plugged in before continuing.

[Types]
Name: "full"; Description: "LobbyGuard Suite Installation"; Flags: iscustom

[Components]
Name: "LGV5"; Description: "LobbyGuard v5.0"; Types: full
Name: "Updater"; Description: "LobbyGuard Updater"; Types: full
Name: "Dymo"; Description: "Dymo v8.7 Printer Installer"; Types: full
Name: "Logitech"; Description: "Logitech Webcam Installer"; Types: full
Name: "ZebraCore"; Description: "Zebra Core Scanner Driver"; Types: full
Name: "ZebraSDK"; Description: "Zebra Scanner SDK"; Types: full
Name: "VideoCap"; Description: "Video Cap X Installer"; Types: full
Name: "Encoder"; Description: "Microsoft Expression Encoder 4"; Types: full

[Files]
Source: "C:\Users\wngo\Downloads\DLS8Setup8.7.4\DLS8Setup8.7.4.exe"; DestDir: "{tmp}"; Components: Dymo; AfterInstall: RunDymo
Source: "...\LobbyGuard\LobbyGuard Install files\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010\*"; DestDir: "{tmp}\Zebra"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: ZebraCore
Source: "...\LobbyGuard\LobbyGuard Install files\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010.exe"; DestDir: "{tmp}\Zebra"; Components: ZebraCore; AfterInstall: RunZebraCore
Source: "...\LobbyGuard\LobbyGuard Install files\LobbyGuard V5.0Setup.exe"; DestDir: "{tmp}"; Components: LGV5; AfterInstall: RunLGV5
Source: "...\Wilson\LobbyGuardSuite\LobbyGuard_Move_Folder.bat"; DestDir: "{tmp}"; Components: LGV5; AfterInstall: RunLGV5Move
Source: "...\Wilson\LobbyGuardSuite\LobbyGuard_Modify_Pemissions.bat"; DestDir: "{tmp}"; Components: LGV5; AfterInstall: RunLGV5Perms
Source: "...\LobbyGuard\LobbyGuard Install files\Zebra_Scanner_SDK_(64bit)_v3.03.0011.exe"; DestDir: "{tmp}"; Components: ZebraSDK; AfterInstall: RunZebraSDK
Source: "...\LobbyGuard\LobbyGuard Install files\lws280.exe"; DestDir: "{tmp}"; Components: Logitech; AfterInstall: RunLogi
Source: "...\LobbyGuard\LobbyGuard Install files\vcdxstp1.exe"; DestDir: "{tmp}"; Components: VideoCap; AfterInstall: RunVideoCap
Source: "...\LobbyGuard\LobbyGuard Install files\Encoder_en.exe"; DestDir: "{tmp}"; Components: Encoder; AfterInstall: RunEncoder
Source: "...\LobbyGuard\LobbyGuard Install files\Keyboard Deploy.bat"; DestDir: "C:\Program Files\Keyboard"; Flags: ignoreversion; Components: LGV5; AfterInstall: KeyboardDeploy
Source: "...\LobbyGuard\LobbyGuard Install files\[07] Resources\Resources\*"; DestDir: "C:\Program Files\LobbyGuard\Resources"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: LGV5
Source: "...\LobbyGuard\LobbyGuard Install files\LGRegistration\*"; DestDir: "C:\LGRegistration"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: LGV5; AfterInstall: RemoveLGShortcut
Source: "...\Wilson\LobbyGuardSuite\LobbyGuard.Kiosk.lnk"; DestDir: "{userdesktop}"; Flags: ignoreversion; Components: LGV5
Source: "...\LobbyGuard\LobbyGuard Install files\LGUpdater\*"; DestDir: "{userdesktop}\LGUpdater"; Flags: ignoreversion; Components: Updater;

[Run]
Filename: "C:\Program Files (x86)\DYMO\DYMO Label Software\DLS.exe"; Description: Dymo First Run; Flags: postinstall
Filename: "C:\LGRegistration\LobbyGuard.UI.Registration.exe"; Description: LobbyGuard Registration; Flags: runascurrentuser postinstall

[Code]
procedure RemoveLGShortcut;
begin
  DeleteFile(ExpandConstant('{userdesktop}\LobbyGuard Kiosk.lnk'));
end;

procedure KeyboardDeploy;
var
  ResultCode: Integer;
begin
  if not Exec('C:\Program Files\Keyboard\Keyboard Deploy.bat', '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Keyboard Deploy failed!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunLGV5Perms;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\LobbyGuard_Modify_Pemissions.bat'), '', '', SW_HIDE,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('LobbyGuard Permission grant failed!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunLGV5Move;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\LobbyGuard_Move_Folder.bat'), '', '', SW_HIDE,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('LobbyGuard and Keyboard Folder Transfer failed!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunLGV5;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\LobbyGuard V5.0Setup.exe'), '', '', SW_SHOWNORMAL, 
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('LobbyGuard 5.0 installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunLogi;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\lws280.exe'), '-s', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Logitech installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunZebraCore;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\Zebra\Zebra_CoreScanner_Driver_(64bit)_v3.03.0010.exe'), '-s', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Zebra Core installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunZebraSDK;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\Zebra_Scanner_SDK_(64bit)_v3.03.0011.exe'), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Zebra SDK installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunDymo;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\DLS8Setup8.7.4.exe'),'/S /V"/qn /norestart"', '', SW_SHOWNORMAL, 
  ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Dymo installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunVideoCap;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\vcdxstp1.exe'), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Video Cap installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunEncoder;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\Encoder_en.exe'), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Encoder installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""


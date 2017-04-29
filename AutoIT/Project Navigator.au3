#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region
GUICreate("Project Navigator", 371, 326, 221, 192)
$Label1 = GUICtrlCreateLabel("Project Navigator is a small utility for use by the Best Buy DOC team.  Its purpose is to make all project folders quickly and easily accessible.", 16, 0, 330, 33)
$AP = GUICtrlCreateButton("AP FY17", 8, 40, 113, 33)
$APDOC = GUICtrlCreateButton("DOCWeb", 128, 40, 113, 33)
$APFE = GUICtrlCreateButton("Faxes and Emails", 248, 40, 113, 33)
$ALARM = GUICtrlCreateButton("Alarm FY17", 8, 80, 113, 33)
$ALARMDOC = GUICtrlCreateButton("DOCWeb", 128, 80, 113, 33)
$ALARMFE = GUICtrlCreateButton("Faxes and Emails", 248, 80, 113, 33)
$MCSA = GUICtrlCreateButton("MCSA FY17", 8, 120, 113, 33)
$MCSADOC = GUICtrlCreateButton("DOCWeb", 128, 120, 113, 33)
$MCSAFE = GUICtrlCreateButton("Faxes and Emails", 248, 120, 113, 33)
$MDC = GUICtrlCreateButton("MDC Sigpad FY17", 8, 160, 113, 33)
$MDCDOC = GUICtrlCreateButton("DOCWeb", 128, 160, 113, 33)
$MDCFE = GUICtrlCreateButton("Faxes and Emails", 248, 160, 113, 33)
$TRANS4 = GUICtrlCreateButton("Trans4 FY17", 8, 200, 113, 33)
$TRANS4DOC = GUICtrlCreateButton("DOCWeb", 128, 200, 113, 33)
$TRANS4FE = GUICtrlCreateButton("Faxes and Emails", 248, 200, 113, 33)
$PRINT = GUICtrlCreateButton("Printer Refresh FY17", 8, 240, 113, 33)
$PRINTDOC = GUICtrlCreateButton("DOCWeb", 128, 240, 113, 33)
$PRINTFE = GUICtrlCreateButton("Faxes and Emails", 248, 240, 113, 33)
$VMM = GUICtrlCreateButton("VMM FY17", 8, 280, 113, 33)
$VMMDOC = GUICtrlCreateButton("DOCWeb", 128, 280, 113, 33)
$VMMFE = GUICtrlCreateButton("Faxes and Emails", 248, 280, 113, 33)
GUISetState(@SW_SHOW)
#EndRegion

While 1
   $Msg = GUIGetMsg()
   If $MSG=$AP Then Run("explorer.exe " & "N:/Projects/AP_FY17")
   If $MSG=$APDOC Then Run("explorer.exe " & "N:/Projects/AP_FY17/DOCWeb/Uploads"
   If $MSG=$APFE Then Run("explorer.exe " & "N:/Projects/AP_FY17/Faxes and Email"
   If $MSG=$ALARM Then Run("explorer.exe " & "N:/Projects/Alarm_FY17")
   If $MSG=$ALARMDOC Then Run("explorer.exe " & "N:/Projects/Alarm_FY17/DOCWeb/Uploads"
   If $MSG=$ALARMFE Then Run("explorer.exe " & "N:/Projects/Alarm_FY17/Faxes and Email"
   If $MSG=$MCSA Then Run("explorer.exe " & "N:/Projects/MCSA_FY17")
   If $MSG=$MCSADOC Then Run("explorer.exe " & "N:/Projects/MCSA_FY17/DOCWeb/Uploads"
   If $MSG=$MCSAFE Then Run("explorer.exe " & "N:/Projects/MCSA_FY17/Faxes and Email"
   If $MSG=$MDC Then Run("explorer.exe " & "N:/Projects/MDC_Sigpad_FY17")
   If $MSG=$MDCDOC Then Run("explorer.exe " & "N:/Projects/MDC_Sigpad_FY17/DOCWeb/Uploads")
   If $MSG=$MDCFE Then Run("explorer.exe " & "N:/Projects/MDC_Sigpad_FY17/Faxes and Email")
   If $MSG=$TRANS4 Then Run("explorer.exe " & "N:/Projects/Trans4_FY17")
   If $MSG=$TRANS4DOC Then Run("explorer.exe " & "N:/Projects/Trans4_FY17/DOCWeb/Uploads")
   If $MSG=$TRANS4FE Then Run("explorer.exe " & "N:/Projects/Trans4_FY17/Faxes and Email")
   If $MSG=$PRINT Then Run("explorer.exe " & "N:/Projects/PrintRef_FY17")
   If $MSG=$PRINTDOC Then Run("explorer.exe " & "N:/Projects/PrintRef_FY17/DOCWeb/Uploads")
   If $MSG=$PRINTFE Then Run("explorer.exe " & "N:/Projects/PrintRef_FY17/Faxes and Email")
   If $MSG=$VMM Then Run("explorer.exe " & "N:/Projects/VMM_FY17")
   If $MSG=$VMMDOC Then Run("explorer.exe " & "N:/Projects/VMM_FY17/DOCWeb/Uploads"
   If $MSG=$VMMFE Then Run("explorer.exe " & "N:/Projects/VMM_FY17/Faxes and Email"
WEnd
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

; Create GUI
#Region
GUICreate("Extended Clipboard", 410, 248, 263, 153)
$Label1 = GUICtrlCreateLabel('Extended Clipboard is an extension of the built-in Windows clipboard.  Simply copy a string to the clipboard, then press the "Copy" button to import it back to the active Windows clipboard.  Limit 5.', 16, 8, 375, 41)
$Button2 = GUICtrlCreateButton("1. Copy", 8, 56, 75, 25)
$Button3 = GUICtrlCreateButton("2. Copy", 8, 88, 75, 25)
$Button4 = GUICtrlCreateButton("3. Copy", 8, 120, 75, 25)
$Button5 = GUICtrlCreateButton("4. Copy", 8, 152, 75, 25)
$Button6 = GUICtrlCreateButton("5. Copy", 8, 184, 75, 25)
$List1 = GUICtrlCreateList("", 88, 56, 305, 25, BitOR($GUI_SS_DEFAULT_LIST,$LBS_NOINTEGRALHEIGHT))
$List2 = GUICtrlCreateList("", 88, 88, 305, 25, BitOR($GUI_SS_DEFAULT_LIST,$LBS_NOINTEGRALHEIGHT))
$List3 = GUICtrlCreateList("", 88, 120, 305, 25, BitOR($GUI_SS_DEFAULT_LIST,$LBS_NOINTEGRALHEIGHT))
$List4 = GUICtrlCreateList("", 88, 152, 305, 25, BitOR($GUI_SS_DEFAULT_LIST,$LBS_NOINTEGRALHEIGHT))
$List5 = GUICtrlCreateList("", 88, 184, 305, 25, BitOR($GUI_SS_DEFAULT_LIST,$LBS_NOINTEGRALHEIGHT))
$Button1 = GUICtrlCreateButton("Exit", 328, 216, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion

; Create Button actions
While 1
   $Msg = GUIGetMsg()
   IF $MSG=$Button1 Then Exit
   WEnd
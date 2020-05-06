#SingleInstance force
; ##############################################################################
; list of user specific global variables used elsewhere
; ##############################################################################
; Directories
ahk_files = C:\Users\tritenour\OneDrive for Business\ahk_files\
rescorinator_log_dir := A_WorkingDir "\Rescorinator Logs"
index_file = %ahk_files%\Index.txt
index_file2 = %ahk_files%\Index2.txt
folder_dir = \\share\textbook_materials\
script_input_ex_block_folder = %A_Desktop%\scripts\ex_block
script_input_root_folder = %A_Desktop%\scripts\perl_scripts
script_output_root_folder = %A_Desktop%\scripts\script_output
central_stored_hotkeys = \\share\textbook_materials\Exercise Block\AutoHotKey

; Icons
config_sword_icon = C:\AutoHotKey\icons\Sword.ico

; Others
send_to_active := 1 ; Tablinator - just a temp setting until I get a nice menu bar in place. There was issues with some AHKs, so it might be a version issue
already_updated := 0 ; Updatinator
time_to_update := "1:00 AM" ; Updatinator

; #BEGIN InatorUpdate
; #DESCRIPTION : Common sub for ___inator.ahk automatic updates
; #DATE : 11/20/2012
InatorUpdate(which_inator="")
{
    global
    If(StrLen(which_inator) > 0 && StrLen(skip_%which_inator%_update) == 0 && FileExist("\\share\textbook_materials\Exercise Block\Misc\" which_inator ".ahk") && FileExist(ahk_files "\" which_inator ".ahk"))
    {
        FileReadLine, latest_version_string, \\share\textbook_materials\Exercise Block\Misc\%which_inator%.ahk, 1
        FileReadLine, current_version_string, %ahk_files%\%which_inator%.ahk, 1

        if(RegExMatch(latest_version_string, "^;?\s*my_version\s*=\s*\d+\s*$") && RegExMatch(current_version_string, "^;?\s*my_version\s*=\s*\d+\s*$"))
        {
            latest_ver := RegExReplace(latest_version_string, "^;?\s*my_version\s*=\s*(\d+)\s*$", "$1")
            current_ver := RegExReplace(current_version_string, "^;?\s*my_version\s*=\s*(\d+)\s*$", "$1")
          
            if(latest_ver > current_ver)
            {
                FileRead, my_to, \\share\textbook_materials\Exercise Block\Misc\%which_inator%.ahk
                my_to := RegExReplace(my_to, "s)^.*?(;\#(?:START)\#.*?;\#(?:END)\#).*?$", "$1")
                my_to := RegExReplace(my_to, "s)(\$)(\d+)", "$1~$2~")
                FileRead, my_new, %ahk_files%\%which_inator%.ahk

                ; Create a backup copy
                FileCreateDir, %ahk_files%\BAK
                FileDelete, %ahk_files%\BAK\%which_inator%.ahk.bak
                FileAppend, %my_new%, %ahk_files%\BAK\%which_inator%.ahk.bak

                ; Replace changed parts
                my_new := RegExReplace(my_new, "s)^;?\s*(my_version\s*=\s*\d+)(.*?)(;\#(?:START)\#.*?;\#(?:END)\#)(.*?)$", "; my_version = " latest_ver "$2" my_to "$4")
                my_new := RegExReplace(my_new, "s)(\$)~(\d+)~", "$1$2")

                ; Create the new version
                FileDelete, %ahk_files%\%which_inator%.ahk
                FileAppend, %my_new%, %ahk_files%\%which_inator%.ahk

                ; Reload now or avoid checking for the same update
                MsgBox, 4, Update, %which_inator% has been updated. Would you like to reload now?
                IfMsgBox Yes
                {
                    Reload
                }
                skip_%which_inator%_update := 1
            }
        }
    }
    return
} ; #END InatorUpdate

; #BEGIN Paste
; #DESCRIPTION : paste a string instead of send/sendraw for speed purposes
; #DATE : 11/07/2012
Paste(input)
{
      ClipSaved := ClipboardAll
      Clipboard := input 
      ClipWait, 0
      Send ^v
      Sleep 200
      Clipboard := ClipSaved
      ClipWait, 0
      ClipSaved = 
} ; #END Paste

; #BEGIN Copy
; #DESCRIPTION : Copy highlighted text and return the value while restoring the state of the clipboard
; #DATE : 11/07/2012
Copy()
{
    ClipSaved := ClipboardAll
    clipboard = 
    SendInput ^c 
    ClipWait, 0
    mytemp = 
    if(StrLen(clipboard) > 0)
        mytemp := clipboard
    Clipboard := ClipSaved
    ClipWait, 0
    ClipSaved =   
    return mytemp
} ; #END Copy
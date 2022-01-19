
vk1C & g::openGoogle() 
vk1C & s::openSakura()  

vk1C & f::
 IfWInActive,ahk_class EVERYTHING
{
	Send,+!b
}
else
{
 openEverything()  
}
return


/**
 * Everythingを起動_ファイル検索
 *
 * @hotkey F13＋f
 * @target デフォルト
 */
 openEverything()  {  
	Launch_Param("ahk_class EVERYTHING", "C:\Program Files\Everything\Everything.exe", "C:\Program Files\Everything\") 
	WinMove,A, , 0, 0,400,500
	WinSet, AlwaysOnTop,On,A
	WinSet, Transparent, 240, A
}  
/**
 * グーグル検索
 *
 * @hotkey　F13g
 * @target デフォルト
 */
openGoogle()  {  
Launch_Param("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", """C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"" --profile-directory=Default" ,"C:\Program Files (x86)\Google\Chrome\Application")
;WinMove,A, , 1350, 600,570,450
;WinSet, AlwaysOnTop,On,A
;WinSet, Transparent, 240, A
}  

/**
 * sakura
 *
 * @hotkey　F13s
 * @target デフォルト
 */
openSakura()  {  
	Launch_Param("ahk_class TextEditorWindowW151","C:\Program Files (x86)\sakura\sakura.exe -- ""C:\ahk\common_util\workText.txt""","C:\Program Files (x86)\sakura")
	WinMove,A, , 0, 500, 400,550
	return  
}  


 /**
 * CLaunch
 * @hotkey 左[Alt]キー2回
 * @target デフォルト
 */
~lalt up::
    If (A_PriorHotKey == A_ThisHotKey && A_TimeSincePriorHotkey < 300)
    {
        ;直前のキーと今回のキーが同じで300ミリ秒以内の場合、アプリケーション起動
        Run, C:\Program Files\CLaunch\CLaunch.exe, C:\Program Files\CLaunch\
    }
Return

/**
 * For programActivate
 */
Launch(titel, path)  {  
IfWinNotExist %titel%  
{
	Run, %path%  
	WinWait,%titel%,,10
}else  {
	WinActivate, %titel%   
}
return  
}  
Launch_Param(titel, path, param)  {  
IfWinNotExist %titel%
{
	Run, %path%, %param%
	WinWait,%titel%,,10
}else  {
	WinActivate, %titel%
}
return  
} 

/**
 * 変換2click
 */
vk1C::
    If (A_PriorHotKey == A_ThisHotKey && A_TimeSincePriorHotkey < 300)
    {
	if(WinExist("ahk_class #32768")){
		return	;何かのメニュー表示中は出さない
	}
	;eclipse
	IME_SET(0)
	Menu,mainMenu,Add,Eclipse`t&e,eclipse_start
	Menu,mainMenu,Add,A5M2`t&a,A5M2_start
	Menu,mainMenu,Add,WindowMerge`t&w,WindowMerge_start
	Menu,mainMenu,Add,キャンセル`t&Q,menuCancel
	
	Menu,mainMenu,Show
}
return


eclipse_start:
Launch_Param("ahk_class SWT_Window0", "C:\eclipse\eclipse\eclipse.exe","C:\eclipse\eclipse\")  
	;WinMove,A, , 380, 0, 1520,1050
return
A5M2_start:
Launch("ahk_class TfrmSqlEx","C:\\Downloads\a5m2_2.14.5_x64\A5M2.exe")
	;WinMove,A, , 380, 0, 1520,1050
return
WindowMerge_start:
Launch("WinMerge ahk_class WinMergeWindowClassW","C:\Program Files\WinMerge\WinMergeU.exe")
	;WinMove,A, , 380, 0, 1520,1050
return
;you need to write issuer number
;example: Global redmine := "#0001" 
redmine_start:
	StringTrimLeft, sRedmineNumber , redmine, 1
	sRedmineUrl := """C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"" ""http://127.0.0.1/redmine/issues/" . sRedmineNumber . """"
	Run, %sRedmineUrl%
return
menuCancel:
return

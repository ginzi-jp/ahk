
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


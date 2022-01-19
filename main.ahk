#Persistent ;スクリプトを常駐状態にする
#SingleInstance force ;同じスクリプトの複数プロセス実行を禁止
#NoEnv ;変数名を解釈する時環境変数を無視
#InstallKeybdHook ;ホットキーの設定に無条件でキーボードフックを適応
#UseHook ;ホットキーラベルの定義で常にフックを使用
SetWorkingDir, C:\ahk\common_util\
SendMode, Input ;SendコマンドにWindowsAPIのSendInput関数を利用
SetKeyDelay, 30 ;Sendコマンドで1キーごとに挿入される間隔
SetTitleMatchMode, 2 ;対象ウィンドウ検索方法を中間一致に設定
CoordMode, Caret, Screen ;キャレットの取得座標をスクリーン上の絶対位置に指定


/**
 * プログラムグループ
*/
;テキストエディタ
GroupAdd, GroupTextEditor, ahk_exe notepad.exe ;メモ帳
GroupAdd, GroupTextEditor, ahk_exe notepad++.exe ;Notepad++
GroupAdd, GroupTextEditor, ahk_exe sakura.exe ;サクラエディタ
GroupAdd, GroupTextEditor, ahk_exe Code.exe ;Visual Studio Code

;作業スペース
GroupAdd, GroupUsing, ahk_class wndclass_desked_gsk ;vbe
GroupAdd, GroupUsing, ahk_class SWT_Window0 ;eclipse

;ブラウザ
GroupAdd, GroupBrowser, ahk_exe Chrome.exe ;Google Chrome
GroupAdd, GroupBrowser, ahk_exe iexplore.exe ;Internet Explorer

;[F1]ヘルプ起動抑制
GroupAdd, GroupF1Help, ahk_class Progman ;エクスプローラ
GroupAdd, GroupF1Help, ahk_class CabinetWClass ;デスクトップ
GroupAdd, GroupF1Help, ahk_exe OUTLOOK.EXE ;Outlook
GroupAdd, GroupF1Help, ahk_exe WINWORD.EXE ;Word
GroupAdd, GroupF1Help, ahk_exe EXCEL.EXE ;Excel
GroupAdd, GroupF1Help, ahk_exe POWERPNT.EXE ;PowerPoint
GroupAdd, GroupF1Help, ahk_exe MSACCESS.EXE ;Access
GroupAdd, GroupF1Help, ahk_exe WINPROJ.EXE ;Project
GroupAdd, GroupF1Help, ahk_exe ONENOTE.EXE ;OneNote
GroupAdd, GroupF1Help, ahk_exe MSPUB.EXE ;Publisher
GroupAdd, GroupF1Help, ahk_exe INFOPATH.EXE ;InfoPath
GroupAdd, GroupF1Help, ahk_exe Chrome.exe ;Google Chrome
GroupAdd, GroupF1Help, ahk_exe iexplore.exe ;Internet Explorer


;クリップボード更新フラグ]
Global gClipboardChange := False
;ContinueAction関数の実行継続フラグ
global gContinueAction := False


global IS_STOP_B_LOOP:=0

global gKANAFlg := False

#Include C:\ahk\common_util\
#Include mainMenu.ahk
#Include cursor.ahk
#Include Suppression.ahk
#Include IME.ahk

Return


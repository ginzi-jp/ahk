;------------------------------------------------------------------------------
;カーソル移動関連
;------------------------------------------------------------------------------

f13::Return                  ;変換単独はそのまま素通し
vk1D & vk1C::return 


F13 & x::send,{Blind}1
F13 & c::send,{Blind}2
F13 & v::send,{Blind}3
F13 & s::send,{Blind}4
F13 & d::send,{Blind}5
F13 & f::send,{Blind}6
F13 & w::send,{Blind}7
F13 & e::send,{Blind}8
F13 & r::send,{Blind}9
F13 & z::send,{Blind}0


vk1C & @::send,{Blind}{PrintScreen}

vk1C & J:: ;変換 + J = 左カーソルキー
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Left} 
}
else
{
	Send,{Blind}{Left} 
}
return
vk1C & K::   ;変換 + K = 下カーソルキー
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Down} 
}
else
{
	Send,{Blind}{Down} 
}
return
vk1C & I::     ;変換 + I = 上カーソルキー
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Up} 
}
else
{
	Send,{Blind}{Up} 
}
return
vk1C & L::   ;変換 + L = 右カーソルキー	
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Right} 
}
else
{
	Send,{Blind}{Right} 
}
return

vk1C & H:: ;変換 + U = Home
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Home} 
}
else
{
	Send,{Blind}{Home} 
}
return
vk1C & vkBB::   ;変換 + O = End
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{End} 
}
else
{
	Send,{Blind}{End} 
}
return
vk1C & 8:: Send,{Blind}{PgUp}  ;変換 + 9 = PageUp
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{PgUp} 
}
else
{
	Send,{Blind}{PgUp} 
}
return
vk1C & vkBC::Send,{Blind}{PgDn} ;変換 + O = PageDown
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{PgDn} 
}
else
{
	Send,{Blind}{PgDn} 
}
return

; Backspaceの位置修正
vk1C & N::
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Backspace} 
}
else
{
	Send,{Blind}{Backspace}
}
return

vk1C & M::
if GetKeyState("vk1D", "P")
{	
	Send,{Blind}^{Delete}
}
else
{
	Send,{Blind}{Delete}
}
return
vk1C & B::Send,{Home 2}+{End 2}{Backspace}

; Enterの位置修正
vk1C & Space::Send,{Blind}{Enter}

vk1C & p::
if GetKeyState("vk1D", "P")
{	
	send,{Blind}^{Tab}
}
else
{
	send,{Blind}{Tab}
	if GetKeyState("alt", "P")
	{	
		send,{alt up}
	}
}
return		


;かなでカーソル操作
F13 & g::
CoordMode,Mouse,Screen
MouseMove, 2800, 430
return
F13 & Space::
Click , L　
return
F13 & Enter::
Click , R
return
#If !GetKeyState("ctrl", "P")
F13 & i::
MouseMove 0, -10, 0, R　
return
F13 & 8::
MouseMove 0, -160, 0, R
return
F13 & k::
MouseMove 0, 10, 0, R
return
F13 & ,::
MouseMove 0, 160, 0, R
return
F13 & j::
MouseMove -10, 0, 0, R
return
F13 & h::
MouseMove -160, 0, 0, R
return
F13 & l::
MouseMove 10, 0, 0, R
return
F13 & vkBB::
MouseMove 160, 0, 0, R
return
#If
#If GetKeyState("ctrl", "P")
F13 & i::
MouseMove 0, -40, 0, R　
return
F13 & 8::
MouseMove 0, -640, 0, R
return
F13 & k::
MouseMove 0, 40, 0, R
return
F13 & ,::
MouseMove 0, 640, 0, R
return
F13 & j::
MouseMove -40, 0, 0, R
return
F13 & h::
MouseMove -640, 0, 0, R
return
F13 & l::
MouseMove 40, 0, 0, R
return
F13 & vkBB::
MouseMove 640, 0, 0, R
return
#If


vk1C & z::
Send,{LWin down}
Sleep,100
send,1
Sleep,200
while GetKeyState("z", "P")
{
	send,1
	Sleep,500
}
send,{LWin up}
return

vk1C & x::
Send,{LWin down}
Sleep,200
send,2
Sleep,200
while GetKeyState("x", "P")
{
	send,2
	Sleep,500
}
send,{LWin up}
return

#IfWinActive ahk_class ConsoleWindowClass  
^v::Send,!{Space}ep     ; ^V ペースト  
^w::Send,!{Space}c      ; ^W 終了  
^f::Send,!{Space}ef     ; ^F 検索  
^a::Send,!{Space}es     ; ^A 全て選択  
^k::Send,!{Space}ek     ; ^K 選択  
#IfWinActive 



vk1C & y::
Menu,ctMenu,Add," "`t&A,kakko_02
Menu,ctMenu,Add,`% `%`t&S,kakko_05
Menu,ctMenu,Add,' '`t&D,kakko_07
Menu,ctMenu,Add,「 」`t&F,kakko_20
Menu,ctMenu,Add,『 』`t&G,kakko_21
Menu,ctMenu,Add,【　】`t&H,kakko_22
Menu,ctMenu,Add,<　>`t&J,kakko_11
Menu,ctMenu,Add,(　)`t&K,kakko_08
Menu,ctMenu,Add,{　}`t&L,kakko_12
Menu,ctMenu,Add,[　]`t&;,kakko_10
Menu,ctMenu,Add,キャンセル,cmenuCancel
Menu,ctMenu,Show
return

#IfWinActive ahk_class WindowsForms10.Window.8.app.0.2b89eaa_r9_ad1  
^!v::send,%Clipboard%    ; ^V ペースト  
;^w::Send,!{Space}c      ; ^W 終了  
;^f::Send,!{Space}ef     ; ^F 検索  
;^a::Send,!{Space}es     ; ^A 全て選択  
;^k::Send,!{Space}ek     ; ^K 選択  
#IfWinActive 



kakko_02:
PasteKakko("""","""")
return
kakko_05:
PasteKakko("%","%")
return
kakko_07:
PasteKakko("'","'")
return
kakko_08:
PasteKakko("(",")")
return
kakko_10:
PasteKakko("[","]")
return
kakko_11:
PasteKakko("<",">")
return
kakko_12:
PasteKakko("{","}")
return
kakko_20:
PasteKakko("「","」")
return
kakko_21:
PasteKakko("『","』")
return
kakko_22:
PasteKakko("【","】")
return
cmenuCancel:
return

PasteKakko(k1,k2){
	ClipSaved := ClipboardAll
	Clipboard =
	Send,^c
	;ClipWait,1
	Sleep,100
	c1 := Clipboard
	Clipboard =
	Send,+{Left}^c
	;ClipWait,1
	Sleep,100
	cb := Clipboard
	Lc1:=StrLen(c1)
	Lcb:=StrLen(cb)
	if(cb=="`r`n" or cb=="`r" or cb=="`n"){
		Send,+{Right}
		cb := ""
	} else if(cb==c1 and Lcb==Lc1){
		cb := c1
	} else if(Lcb==1){
		if(Lc1==2 and SubStr(c1,2,1)!="`r" and SubStr(c1,2,1)!="`n"){
			Send,+{Right}
			cb := c1
		} else {
			Send,+{Right}
			cb := ""
		}
	} else if(Lc1-Lcb!=1 and Lc1-Lcb>0 and Lcb!=0){
		Send,+^{Right}
		cb := c1
	} else if(Lcb==0 and Lc1!=1){
		cb := ""
	} else {
		Send,+{Right}
		cb := c1
	}
	Clipboard := k1 . cb . k2
	Send,^v
	Sleep,100
	if(cb==""){
		Send,{left}
	}
	Clipboard := ClipSaved
	ClipSaved =
	return
}



vk1D::
If (A_PriorHotKey == A_ThisHotKey && A_TimeSincePriorHotkey < 200 　&& A_TimeSincePriorHotkey > 10)
{
        ;直前のキーと今回のキーが同じで300ミリ秒以内の場合、アプリケーション起動
	Run, C:\clibor\Clibor.exe /vc 1, C:\clibor\
}
Return


;esc変更
vk1C & q::send,{Escape}
vk1C & 1::!F4
;ctrl代替
vk1D & z::send,^{z}
vk1D & y::send,^{y}
vk1D & x::send,^{x}
vk1D & c::send,^{c}
vk1D & v::send,^{v}
vk1D & a::send,^{a}
vk1D & s::send,^{s}
vk1D & f::send,^{f}
vk1D & w::send,^{w}
vk1D & e::send,^{e}
vk1D & r::send,^{r}


vk1c & a::
if IME_GET() = 1
{
	IME_SET(0)		
}
else
{
	IME_SET(1)
}
return
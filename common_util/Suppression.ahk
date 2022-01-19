
/**
 * 上書きモード
 *
 * @hotkey [Insert]長押し
 * @target デフォルト
 */
Insert::
    ;[Insert]キーの押し下げ状態を300ミリ秒待機
    KeyWait, Insert, T0.3

    If (ErrorLevel)
    {
        ;指定時間が経過した場合、{Insert}キーを送信
        Send, {Insert}

        ;上書きモードの状態を取得
        If (GetKeyState("Insert", "T"))
        {
            ;上書きモードオンの場合
            TrayTip, 上書きモード, 上書きモードをオンにしました。, 10, 17
        }
        Else
        {
            ;上書きモードオフの場合
            TrayTip, 上書きモード, 上書きモードをオフにしました。, 10, 17
        }
    }
    Else
    {
        ;指定時間経過前にキーが離された場合、バルーンメッセージを表示
        TrayTip, 上書きモード, 上書きモードを有効にするには[Insert]キーを長押ししてください。, 10, 17
    }

    ;長押し後キーを離した時にホットキーを発動させないようにする
    KeyWait, Insert
Return

/**
 * CapsLockモード
 *
 * @hotkey [Shift]+[CapsLock]長押し
 * @target デフォルト
 */
+CapsLock::
    ;[Shift]+[CapsLock]キーの押し下げ状態を300ミリ秒待機
    KeyWait, Shift, T0.3
    KeyWait, CapsLock, T0.3

    If (ErrorLevel)
    {
        ;指定時間が経過した場合、CapsLockモードの状態を取得
        If (GetKeyState("CapsLock", "T"))
        {
            ;CapsLockモードがオンの場合、オフにしてバルーンメッセージを表示
            SetCapsLockState, Off
            TrayTip, CapsLockモード, CapsLockをオフにしました。, 10, 17
        }
        Else
        {
            ;CapsLockモードがオフの場合、オンにしてバルーンメッセージを表示
            SetCapsLockState, On
            TrayTip, CapsLockモード, CapsLockをオンにしました。, 10, 17
        }
    }
    Else
    {
        ;指定時間経過前にキーが離された場合、バルーンメッセージを表示
        TrayTip, CapsLockモード, CapsLockをオンにするには、[Shift]+[CapsLock]を長押ししてください。, 10, 17
    }

    ;長押し後キーを離した時にホットキーを発動させないようにする
    KeyWait, Shift
    KeyWait, CapsLock
Return

;[START] F1ヘルプ起動抑制
#IfWinActive, ahk_group GroupF1Help

/**
 * ヘルプを表示
 *
 * @hotkey [F1]長押し
 * @target F1ヘルプ起動抑制(エクスプローラ/デスクトップ/Microsoft Office)
 */
F1::
    ;[F1]キーの押し下げ状態を300ミリ秒待機
    KeyWait, F1, T0.3

    If (ErrorLevel)
    {
        ;指定時間が経過した場合、キーをそのまま送信
        Send, {F1}
    }
    Else
    {
        ;指定時間経過前にキーが離された場合、バルーンメッセージを表示
        TrayTip, ヘルプの表示, ヘルプを表示するには[F1]キーを長押ししてください。, 10, 17
    }
    KeyWait, F1
Return

#IfWinActive
;[END] F1ヘルプ起動抑制
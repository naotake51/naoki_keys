;;----------------------------------------------------
;; ウィンドウ状態記憶機能
;;----------------------------------------------------
global arrangement_map

StorageAllWindow(key) {
	window_arrangement := Object()

	;; アクティブウィンドウの記憶
	WinGet active_win_id, ID, A, , ,
	window_arrangement["active_win_id"] := active_win_id

	;; すべてのウィンドウの情報を記憶
	WinGet, win_id_list, List, , , "", ""
	window_number = 1
	Loop, %win_id_list% {
		window_arrangement[window_number] := Object()

		;; ウィンドウのIDを記憶
		win_id := win_id_list%window_number%
		window_arrangement[window_number]["id"] := win_id

		;; ウィンドウのプロセスの名前、パスを記憶
		WinGet, proc_name, ProcessName, ahk_id %win_id%, , ,
		window_arrangement[window_number]["proc_name"] := proc_name
		WinGet, proc_path, ProcessPath, ahk_id %win_id%, , ,
		window_arrangement[window_number]["proc_path"] := proc_path

		;; ウィンドウの最小化、最大化の状態を記憶
		WinGet, minmax, MinMax, ahk_id %win_id%, , ,
		window_arrangement[window_number]["minmax"] := minmax

		;; ウィンドウの位置、サイズを記憶
		WinGetPos, x, y, width, height, ahk_id %win_id%, , ,
		window_arrangement[window_number]["x"] := x
		window_arrangement[window_number]["y"] := y
		window_arrangement[window_number]["width"] := width
		window_arrangement[window_number]["height"] := height

		;;is_visible := DllCall("IsWindowVisible", "UInt", WinExist("ahk_exe sublime_text.exe"))
		;;window_arrangement[window_number]["visible"] := is_visible

		;;MsgBox, %win_id% %x% %y% %width% %height% %minmax% %proc_name%

		window_number := window_number + 1
	}
	window_arrangement.length := win_id_list

  If Not IsObject(arrangement_map) {
    arrangement_map := Object()
  }
	arrangement_map[key] := window_arrangement
}

RestoreAllWindow(key) {
  If Not IsObject(arrangement_map) {
    return
  }
  If Not arrangement_map.HasKey(key) {
    return
  }
  window_arrangement := arrangement_map[key]

	;; すべてのウィンドウを記憶した情報に従って再現する
	window_arrangement_length := window_arrangement.length
	window_number := window_arrangement_length
	Loop, %window_arrangement_length% {

		;; 記憶してあるウィンドウのID
		win_id := window_arrangement[window_number]["id"]

		;; 記憶してあるウィンドウのプロセスの名前、パス
		proc_name := window_arrangement[window_number]["proc_name"]
		proc_path := window_arrangement[window_number]["proc_path"]

		;; 記憶してあるウィンドウの最小化、最大化の状態を反映
		;; WinRestoreはウィンドウサイズを変更する前にする必要がある
		if (window_arrangement[window_number]["minmax"] = -1) {
			WinMinimize, ahk_id %win_id%, , ,
		}
		else if (window_arrangement[window_number]["minmax"] = 0) {
			WinRestore, ahk_id %win_id%, , ,
		}
		else if (window_arrangement[window_number]["minmax"] = 1) {
			WinMaximize, ahk_id %win_id%, , ,
		}

		;; 記憶してあるウィンドウの位置、サイズを反映
		x := window_arrangement[window_number]["x"]
		y := window_arrangement[window_number]["y"]
		width := window_arrangement[window_number]["width"]
		height := window_arrangement[window_number]["height"]
		WinMove, ahk_id %win_id%, , x, y, width, height, ,

		;; ウィンドウを最前面に出す WinSet, Topは環境によって効かないためAlwaysOnTopで代用
		WinSet, AlwaysOnTop, On, ahk_id %win_id%, , ,
		WinSet, AlwaysOnTop, Off, ahk_id %win_id%, , ,

		;;MsgBox, %win_id% %x% %y% %width% %height% %minmax% %proc_name%

		window_number := window_number - 1
	}

	;; 記憶時、アクティブだったウィンドウをアクティブにする
	active_win_id := window_arrangement["active_win_id"]
	WinActivate, ahk_id %active_win_id%, , ,
}

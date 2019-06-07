#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#UseHook
#InstallMouseHook
#InstallKeybdHook

Global userDelay = 60
Global TrashCount = 0

!1::
	TrashCount = 0
	return
	
!2::
	while (1) {
		;ListMenu()
		MenuPrompt := "Add or Remove Menu Items: A or R or N, followed by #"
		InputBox, EditMenu, Enter EditMenu, %MenuPrompt%
		if ErrorLevel
			return
			
		StringLeft, MenuFunc, EditMenu, 1
		if (MenuFunc == "A") {
			;AddMenu(SubStr(EditMenu, 2))
		} else if (MenuFunc == "R") {
			;RemoveMenu(SubStr(EditMenu, 2))
		} else {
			return
		}
	}
	return

!n::
	NamePrompt := "Enter Dish Name"
	InputBox, Name, Enter Name, %NamePrompt%
	StringReplace, Name, Name, %A_Space%,,All
	DishNum := SubStr(Name, 1, 2)
	Name := SubStr(Name, 4)
	
	CmdPrompt := "Enter Dish Name"
	InputBox, Command, Enter Command, %CmdPrompt%
	
	L := StrLen(Command)
	P = 1
	
	Send {raw}if (OCR = "
	Send %Name%{raw}") { `;%DishNum%
	Send {enter}{Tab}
	
	Loop, %L% {
		Cha := SubStr(Command, P, 1)
		if (Cha = " ") {
			Cha = Space
		}
		
		Send {raw}SendInput {%Cha% down}
		Send {enter}Sleep, `%userDelay`%{enter}
		Send {enter}{raw}SendInput {%Cha% up}
		Send {enter}Sleep, `%userDelay`%{enter}
		Send {enter}
		P++
	}
	Send {raw}SendInput {Enter down}
	Send {enter}{raw}SendInput {Enter up}
	Send {enter}return
	Send {enter}
	return

!c::
	WinActivate, Cook, Serve, Delicious! 2!!
	
	MouseMove, 466, 995
	Send, {LWin down}p{LWin up}
	MouseMove, 994, 954, 2
	SendInput, {Click}
	Sleep, 200
	
	OCR = %clipboard%
	StringLeft, WorkCheck, OCR, 4
	
	if (WorkCheck = "Work") {
		WorkType := SubStr(OCR, 13)
		if (WorkType = "(Trash)") {
			SendInput {q down}
			Sleep, %userDelay%
			SendInput {q up}
			Sleep, %userDelay%
			if (TrashCount = 1) {
				Loop, 4 {
					SendInput {w down}
					Sleep, %userDelay%
					SendInput {w up}
					Sleep, %userDelay%
				}
			} else if (TrashCount > 1) {
				Loop, 9 {
					SendInput {w down}
					Sleep, %userDelay%
					SendInput {w up}
					Sleep, %userDelay%
				}
			}
			SendInput {e down}
			Sleep, %userDelay%
			SendInput {e up}
			Sleep, %userDelay%
			TrashCount++
			SendInput {Enter down}
			SendInput {Enter up}
			return
		} else {
			SendInput {q down}
			Sleep, %userDelay%
			SendInput {q up}
			Sleep, %userDelay%
			SendInput {w down}
			Sleep, %userDelay%
			SendInput {w up}
			Sleep, %userDelay%
			SendInput {a down}
			Sleep, %userDelay%
			SendInput {a up}
			Sleep, %userDelay%
			SendInput {Enter down}
			SendInput {Enter up}
			return
		}
	}
	
	;StringLeft, RepNum, OCR, 2
	StringReplace, OCR, OCR, %A_Space%,,All
	OCR := SubStr(OCR, 4)

;==============Salad======================
	
	if (OCR = "CrispTexasGreens") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "CaesarSalad") { ;2
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "CreamyRanch") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "GrilledChickenSalad") { ;4
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "CrispyChickenSalad") { ;5
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%	
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "ThousandIslandSpecial") {
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%	
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "ChoppedPinkSalad") {
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "GardenSalad") {
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "ParmSaladSpecial") { ;O9
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "SimpleSalad") { ;10
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "HouseSalad") { ;11
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "VelvetSalad") { ;12
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheBigSalad") { ;13
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "VeggieLife") { ;14
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}

;==============Omelette======================

	if (OCR = "ClassicOmelette") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "HammySunrise") { ;2
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "ThePepperandtheEgg") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheDoze-CheesySqueezy") { ;4
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "DeluxeOmelette") { ;5
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "UltraVeggieStacker") { ;6
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
;==============Chicken Breast======================
	if (OCR = "ChickenBreast") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		Loop, 6 {
			SendInput {w down}
			Sleep, %userDelay%
			SendInput {w up}
			Sleep, %userDelay%
		}
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	if (OCR = "BreadedChickenBreast") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		Loop, 6 {
			SendInput {w down}
			Sleep, %userDelay%
			SendInput {w up}
			Sleep, %userDelay%
		}
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
;==============Hamburger======================

	if (OCR = "ClassicAmerican") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheRyanDavis") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "FreshStack") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "InternationalBurger") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheMechanic") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheLaurenHiigelburger") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TwistyCow") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "SummerHay") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}

	if (OCR = "BaconCheeseburger") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}

	if (OCR = "PrimeBurger") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheDouble") {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheLumberiack") or (OCR = "TheLumberjack") { ;12
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "Dr.Feel,qood") or (OCR = "Dr.Feelgood") { ;13
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}

	if (OCR = "ParallelPatties") { ;14
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "BurgerTime") { ;15
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheHeartstopper") { ;16
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TripleTower") { ;17
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "StackedPanic") { ;18
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheBeltsmasher") { ;19
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TheDestroyer") { ;20
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {f down}
		Sleep, %userDelay%
		SendInput {f up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
;==============Chili======================

	if (OCR = "TexasChiliBowl") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "ChunkyFireChili") { ;2
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "SunshineRoad") { ;3
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "Rockn’RollBowl") { ;4
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
;==============Breakfast Sandwich======================

	if (OCR = "SausageandCheese") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "EggandHam") { ;2
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "EggDeluxe") { ;3
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "Sausage,EggandCheese") { ;4
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "FrenchHam") { ;5
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "FrenchCheesy") { ;6
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {d down}
		Sleep, %userDelay%
		SendInput {d up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
;==============Hot Dog======================

	if (OCR = "ClassicDog") { ;1
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "WestminsterDog") { ;2
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}

	if (OCR = "ChiliDog") { ;3
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TexasDog") { ;4
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "Rawdawg") { ;5
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "TwistedDog") { ;6
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "SaltyDog") { ;7
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "GreenDog") { ;8
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "CheeseyDog") { ;9
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "FogDog") { ;10
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "DangDog") { ;11
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	
	if (OCR = "PlopDog") { ;12
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {Space down}
		Sleep, %userDelay%
		SendInput {Space up}
		Sleep, %userDelay%
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		SendInput {w down}
		Sleep, %userDelay%
		SendInput {w up}
		Sleep, %userDelay%
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {a down}
		Sleep, %userDelay%
		SendInput {a up}
		Sleep, %userDelay%
		SendInput {s down}
		Sleep, %userDelay%
		SendInput {s up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
		return
	}
	

	return
	
^b::
	QtyPrompt := "Enter number of Orders to process"
	InputBox, Qual, Enter Qual, %QtyPrompt%
	
	WinActivate
	
	if (Qual = 1) {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		Loop, 6 {
			SendInput {w down}
			Sleep, %userDelay%
			SendInput {w up}
			Sleep, %userDelay%
		}
		SendInput {r down}
		Sleep, %userDelay%
		SendInput {r up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
	} else if (Qual = 2) {
		SendInput {q down}
		Sleep, %userDelay%
		SendInput {q up}
		Sleep, %userDelay%
		Loop, 6 {
			SendInput {w down}
			Sleep, %userDelay%
			SendInput {w up}
			Sleep, %userDelay%
		}
		SendInput {e down}
		Sleep, %userDelay%
		SendInput {e up}
		Sleep, %userDelay%
		SendInput {Enter down}
		SendInput {Enter up}
	}
	return
	
FoodCompare(OCR) {
}
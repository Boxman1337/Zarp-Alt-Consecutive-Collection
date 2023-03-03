; Zarp Alt Account Collecting Script ;

; ---------------------------------- ;

; Script used on Gmod ZarpGaming SSRP for the purpose of using multiple accounts to collect different types of items / cash at the same time on the same computer.

; NOTE: Before activating the script, make sure your 4 Garry's Mod instances are the first 4 programs on the Windows taskbar:
; Instance 1: Uranium
; Instance 2: Loot
; Instance 3: Gems / Misc.

; Instance 4: Misc. (unused)
; Main Account: Cash (separate control schema)

; Order of Operations, during every loop:
; 1. Swap to I-1, collect and process Uranium every 9 minutes
; 2. Afterwards, swap to I-2, collect Loot
; 3. Afterwards, swap to I-3, collect Gems
; 4. Afterwards, swap to I-4, do misc. (unused)

; ---------------------------------- ;

SwapToWindow(x) {
	
	SetKeyDelay 30, 50

	; Uses the WindowsKey + Num shortcut to swap windows without having to Alt + Tab
	Send, #%x%

	; Wait for a moment for window to load in
	Sleep, 1000

}

; ---------------------------------- ;

ProcessUranium() {

	; Open F4 Menu
	Send {F4}
	Sleep, 1000

	; Click Actions Tab
	Click, 850, 290
	Sleep, 1000

	; Click Uranium Processor tab
	Click, 840, 670
	Sleep, 1000

	; Click Add Uranium button
	Click, 700, 790
	Sleep, 1000

	; Drag Amount-Slider
	Click, 1015, 535
	Sleep, 1000

	; Click Confirm button
	Click, 960, 560
	Sleep, 1000

	; Click Process Uranium button
	Click, 1060, 790
	Sleep, 1000

	; Press Continue button
	Click, 960, 630
	Sleep, 1000

	; Close F4 menu
	Send {F4}
	Sleep, 1000

}

ClickCollect() {

    ; Clicks the collect button
    Click, 1300, 320
    Sleep, 1000

}

OpenCollector() {

    ; Opens the collector interface
    Send {e}
    Sleep, 1000

}

ExitCollector() {

    ; Clicks the exit button    
    Click 1420, 290
    Sleep, 1000

}

; ---------------------------------- ;

InstanceOne() {

    ; Swap to Instance 1, responsible for collecting and processing Uranium
    SwapToWindow(1)

    ; Collects the Uranium
    ClickCollect()

    ; Closes the collector interface
    ExitCollector()

    ; Starts the Uranium processing
    ProcessUranium()

    ; Opens the collector interface again
    OpenCollector()

}

InstanceTwo() {

    ; Swap to Instance 2, responsible for collecting Loot
    SwapToWindow(2)

    ; Collects Loot
    ClickCollect()

}

InstanceThree() {

    ; Swap to Instance 3, responsible for collecting Gems
    SwapToWindow(3)

    ; Collects Gems
    ClickCollect()

}

InstanceFour() {

	; Swap to Instance 4, currently unused
	SwapToWindow(4)
}

; ---------------------------------- ;

Main() {
	Loop {
		If WinActive("Garry's Mod") {

			InstanceOne()
			InstanceTwo()
			InstanceThree()
			
			; Wait 9 minutes before repeating loop
			Sleep, 540000
		}
	}
}

; ---------------------------------- ;

; Starts the script when backspace is pressed
Backspace::Main()

; Exits the script when Escape is pressed
Esc::ExitApp

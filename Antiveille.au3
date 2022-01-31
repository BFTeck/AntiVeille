#cs ----------------------------------------------------------------------------

    AutoIt Version : 3.3.6.0
    Auteur:         Kevzi-BFteck

    Fonction du Script : script empechant la veille.
    Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>

#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Anti-veille ", 237, 114, 356, 80)
Global $Button1 = GUICtrlCreateButton("Désactiver", 80, 56, 75, 25, $WS_GROUP)
Global $Label1 = GUICtrlCreateLabel("Pour empêcher la veille...", 16, 24, 205, 17)
GUISetState(@SW_SHOW)
#AutoIt3Wrapper_Icon="Veille.ico"
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Fileversion=1.0
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Run_Obfuscator=y
#EndRegion ### END Koda GUI section ###
$running = False
While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
		 Case $Button1
			If $running == False Then
;~ 			   $input = InputBox("time", "Bouger la souris toute les : (60 = 1MIN)") ; Va servir à parametrer le temps
;~ 			   $input = $input*1000
			   $input = 60000
			   AdlibRegister("veille", $input) ;la fonction sera automatiquement lancée tous les $input

			   GUICtrlSetData($Button1, "Wait")
			   GUICtrlSetData($Label1, "Lancement")
			   $running = True
			   GUICtrlSetState($Button1,$GUI_DISABLE)
			   veille() ;appelle de la fonction "veille"
			   GUICtrlSetData($Button1, "Réactiver")
			   GUICtrlSetData($Label1, "Pour relancer la mise en veille")
			   GUICtrlSetState($Button1,$GUI_ENABLE)


			Else
			   $running = False
			   AdlibUnRegister("veille")
			   GUICtrlSetData($Button1, "Désactiver")
			   GUICtrlSetData($Label1, "Pour empêcher la veille...")
			EndIf
    EndSwitch
WEnd



Func veille()
   $pos = MouseGetPos();
   Sleep(10000)
   $pos2 = MouseGetPos();
    ;MouseMove(5, 10, 10)
	If ($pos2[0] == $pos[0]) Then
	   If ($pos2[1] == $pos[1]) Then
			$date= _Now()
			$adate=StringSplit ( $date, " " )
			;$date=$adate[1]
			$time=$adate[2]
			$aheure=StringSplit ( $time, ":" )
			$heure=$aheure[1]
			;$minute=$aheure[2]
			;$seconde=$aheure[3]
			if ($heure > 7 ) And ( $heure < 19 ) And ( $heure <> 13 ) And ( $heure <> 12 ) Then
			   $pos2 = MouseGetPos();
			   MouseMove($pos2[0],$pos2[1]+1,10)
			   MouseMove($pos2[0],$pos2[1],10)
			EndIf
	   EndIf
	EndIf
EndFunc   ;==>veille
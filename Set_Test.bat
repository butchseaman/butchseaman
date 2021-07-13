@ECHO OFF
TITLE "BACK-UP ASSISTANT"
COLOR 7
cd c:\
CLS
:MENU
ECHO.
ECHO................................................
ECHO PRESS 1 or 2 to select your task, or 3 to EXIT.
ECHO................................................
ECHO.
ECHO 1 - Copy File
ECHO 2 - Remove File
ECHO 3 - List Directory Files
ECHO 7 - EXIT
SET /P M=Type 1, 2, or 3, then press ENTER  
IF %M% == 1 GOTO SET1
IF %M% == 2 GOTO SET2
IF %M% == 3 GOTO SET3
IF %M% == 7 GOTO SET7
ECHO.............................................
ECHO Invalid Entry %M% 
ECHO.............................................
PAUSE
CLS
GOTO MENU
:SET1
ECHO Copying Files ...
COPY u:\wes\Unix_Servers.xlsx c:\temp
ECHO.............................................
ECHO Copy Complete
PAUSE
CLS
GOTO MENU
:SET2
ECHO Deleting Files ...
DEL c:\temp\* 
ECHO.............................................
PAUSE
CLS
GOTO MENU
:SET3
ECHO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DIR c:\temp
ECHO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GOTO MENU
:SET7
CLS
ECHO ----------------------------------------------------------------------
ECHO   CLOSE THIS WINDOW       CLOSE THIS WINDOW       CLOSE THIS WINDOW
ECHO ----------------------------------------------------------------------
:END

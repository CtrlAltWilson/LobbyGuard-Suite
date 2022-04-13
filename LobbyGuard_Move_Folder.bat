for /d /r "C:\Program Files (x86)\LobbyGuard" %%i in (*) do if exist "C:\Program Files\LobbyGuard\%%~ni" (dir "%%i" | find "0 File(s)" > NUL & if errorlevel 1 move /y "%%i\*.*" "C:\Program Files\LobbyGuard\%%~ni") else (move /y "%%i" "C:\Program Files\LobbyGuard")
move /y "C:\Program Files (x86)\LobbyGuard\*.*" "C:\Program Files\LobbyGuard"
rd /s /q "C:\Program Files (x86)\LobbyGuard"
for /d /r "C:\Program Files (x86)\Keyboard" %%i in (*) do if exist "C:\Program Files\Keyboard\%%~ni" (dir "%%i" | find "0 File(s)" > NUL & if errorlevel 1 move /y "%%i\*.*" "C:\Program Files\Keyboard\%%~ni") else (move /y "%%i" "C:\Program Files\Keyboard")
move /y "C:\Program Files (x86)\Keyboard\*.*" "C:\Program Files\Keyboard"
rd /s /q "C:\Program Files (x86)\Keyboard"
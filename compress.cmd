del Perlin.exe
zip.exe -r tmp . -i \*.lua \*.bmp \*.txt
move tmp.zip SuperGame.love
copy /b love.exe+SuperGame.love Perlin.exe
del SuperGame.love
rcedit "%dp0Perlin.exe" --set-icon "%dp0assets\icon.ico"
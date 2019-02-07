@echo off

rem Имя исполняемого файла
set main_prog=CallMyPhone.exe
rem Собран в релиз или дебаг?
set release_debug=release
rem Каталог куда собрать комплект
set output_dir=out
rem Путь к mingw32
rem set MinGWPath=c:\Qt\Qt5.10.1\5.10.1\mingw53_32
set MinGWPath=c:\Qt\Qt5.11.0\5.11.0\mingw53_32
set QMLDir=c:\Qt\Qt5.11.0\5.11.0\mingw53_32\qml

mkdir %output_dir%

"%MinGWPath%\bin\windeployqt.exe" --qmldir %QMLDir% --dir %output_dir% --%release_debug% %main_prog%
copy "%MinGWPath%\bin\libgcc_s_dw2-1.dll" .\%output_dir%\
copy "%MinGWPath%\bin\libstdc++-6.dll" .\%output_dir%\
copy "%MinGWPath%\bin\libwinpthread-1.dll" .\%output_dir%\

copy %main_prog% .\%output_dir%\

pause

